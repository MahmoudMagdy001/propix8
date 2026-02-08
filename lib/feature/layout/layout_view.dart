import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/locator.dart';
import '../auth/viewmodels/auth_cubit.dart';
import '../auth/viewmodels/auth_state.dart';
import '../favorites/views/favorites_view.dart';
import '../home/views/home_view.dart';
import '../maintenance_services/viewmodels/maintenance_services_cubit.dart';
import '../maintenance_services/views/maintenance_services_view.dart';
import '../profile/viewmodels/user_profile_cubit.dart';
import '../profile/views/profile_view.dart';
import 'back_exit_overlay_helper.dart';
import 'layout_pop_handler.dart';
import 'main_bottom_nav_bar.dart';

class LayoutView extends StatefulWidget {
  const LayoutView({super.key});

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

/// The state of LayoutView now uses [BackExitOverlayHelper] to manage back-press logic.
/// Responsibilities are split into [MainBottomNavBar] and [LayoutPopHandler].
class _LayoutViewState extends State<LayoutView> with BackExitOverlayHelper {
  int _selectedIndex = 0;
  final GlobalKey<HomeViewContentState> _homeKey = GlobalKey();
  final GlobalKey<MaintenanceServicesViewState> _servicesKey = GlobalKey();
  final GlobalKey<FavoritesViewState> _favoritesKey = GlobalKey();

  // Lazy initialization of screens
  late final List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    // Initialize with placeholders
    _screens = List<Widget>.filled(4, const SizedBox.shrink());
    // Home is always initialized
    _screens[0] = HomeView(homeKey: _homeKey);
  }

  void _onItemTapped(int index) {
    if (_selectedIndex == index) {
      switch (index) {
        case 0:
          _homeKey.currentState?.scrollToTopOrRefresh();
          return;
        case 1:
          _servicesKey.currentState?.scrollToTopOrRefresh();
          return;
        case 2:
          _favoritesKey.currentState?.scrollToTopOrRefresh();
          return;
      }
    }

    setState(() {
      _selectedIndex = index;
      // Initialize screen if it hasn't been initialized yet
      if (_screens[index] is SizedBox) {
        switch (index) {
          case 1:
            _screens[1] = BlocProvider(
              create: (context) =>
                  locator<MaintenanceServicesCubit>()..getMaintenanceServices(),
              child: MaintenanceServicesView(key: _servicesKey),
            );
            break;
          case 2:
            _screens[2] = FavoritesView(key: _favoritesKey);
            break;
          case 3:
            // Use singleton UserProfileCubit from locator for unified state
            final cubit = locator<UserProfileCubit>();
            final user = context.read<AuthCubit>().state.user;
            if (user != null) {
              cubit.setUser(user);
            } else if (cubit.state.user == null) {
              cubit.loadProfile();
            }
            _screens[3] = BlocProvider.value(
              value: cubit,
              child: BlocListener<AuthCubit, AuthState>(
                listenWhen: (previous, current) =>
                    previous.user != current.user,
                listener: (context, state) {
                  if (state.user != null) {
                    context.read<UserProfileCubit>().setUser(state.user!);
                  }
                },
                child: const ProfileView(),
              ),
            );
            break;
        }
      }
    });
  }

  /// Handles the back navigation logic.
  /// If the user is not on the home tab, it switches to it.
  /// Otherwise, it returns false to trigger the exit overlay/dialog.
  bool _handleBackNavigation() {
    if (_selectedIndex != 0) {
      setState(() {
        _selectedIndex = 0;
      });
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) => LayoutPopHandler(
    onPopInvoked: (didPop, result) async {
      if (didPop) return;

      // Use the mixin's handleBackPress method
      await handleBackPress(onNavigateBack: _handleBackNavigation);
    },
    child: Scaffold(
      body: IndexedStack(index: _selectedIndex, children: _screens),
      bottomNavigationBar: MainBottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    ),
  );
}
