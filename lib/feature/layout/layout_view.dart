import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:propix8/core/di/locator.dart';
import 'package:propix8/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:propix8/feature/auth/presentation/bloc/auth_state.dart';
import 'package:propix8/feature/favorites/presentation/pages/favorites_view.dart';
import 'package:propix8/feature/home/presentation/pages/home_view.dart';
import 'package:propix8/feature/layout/back_exit_overlay_helper.dart';
import 'package:propix8/feature/layout/layout_pop_handler.dart';
import 'package:propix8/feature/layout/main_bottom_nav_bar.dart';
import 'package:propix8/feature/maintenance_services/presentation/bloc/maintenance_services_bloc.dart';
import 'package:propix8/feature/maintenance_services/presentation/bloc/maintenance_services_event.dart';
import 'package:propix8/feature/maintenance_services/presentation/pages/maintenance_services_view.dart';
import 'package:propix8/feature/profile/presentation/bloc/user_profile_bloc.dart';
import 'package:propix8/feature/profile/presentation/bloc/user_profile_event.dart';
import 'package:propix8/feature/profile/presentation/pages/profile_view.dart';

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
      if (index == 3) {
        locator<UserProfileBloc>().add(
          const UserProfileEvent.bookingCountsRefreshed(),
        );
      }
      // Initialize screen if it hasn't been initialized yet
      if (_screens[index] is SizedBox) {
        switch (index) {
          case 1:
            final servicesBloc = locator<MaintenanceServicesBloc>()
              ..add(const MaintenanceServicesEvent.started());
            _screens[1] = BlocProvider.value(
              value: servicesBloc,
              child: MaintenanceServicesView(key: _servicesKey),
            );
            break;
          case 2:
            _screens[2] = FavoritesView(key: _favoritesKey);
            break;
          case 3:
            final bloc = locator<UserProfileBloc>();
            final user = context.read<AuthBloc>().state.user;
            if (user != null) {
              bloc.add(UserProfileEvent.userChanged(user));
            } else if (bloc.state.user == null) {
              bloc.add(const UserProfileEvent.profileLoaded());
            }
            _screens[3] = BlocProvider.value(
              value: bloc,
              child: BlocListener<AuthBloc, AuthState>(
                listenWhen: (previous, current) =>
                    previous.user != current.user,
                listener: (context, state) {
                  if (state.user != null) {
                    context.read<UserProfileBloc>().add(
                          UserProfileEvent.userChanged(state.user!),
                        );
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
