import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_state_manager/internet_state_manager.dart';

import '../../../../core/di/locator.dart';
import '../../../../core/utils/context_extensions.dart';
import '../../../core/utils/responsive_helper.dart';
import '../viewmodels/search_cubit.dart';
import 'widgets/search_app_bar.dart';
import 'widgets/search_input_field.dart';
import 'widgets/search_load_more_indicator.dart';
import 'widgets/search_sliver_results.dart';
import 'widgets/search_sliver_status.dart';
import 'widgets/search_view_switcher.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (context) => locator<SearchCubit>(),
    child: const _SearchViewContent(),
  );
}

class _SearchViewContent extends StatefulWidget {
  const _SearchViewContent();

  @override
  State<_SearchViewContent> createState() => _SearchViewContentState();
}

class _SearchViewContentState extends State<_SearchViewContent> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  bool _showFab = false;

  void _onScroll() {
    if (_scrollController.hasClients) {
      if (_scrollController.offset > 200 && !_showFab) {
        setState(() => _showFab = true);
      } else if (_scrollController.offset <= 200 && _showFab) {
        setState(() => _showFab = false);
      }
    }

    if (_isBottom) {
      context.read<SearchCubit>().loadMore();
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  void scrollToTop() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: context.colorScheme.surface,
    body: InternetStateManager(
      noInternetScreen: const NoInternetScreen(),
      onRestoreInternetConnection: () =>
          context.read<SearchCubit>().clearSearch(),
      child: SafeArea(
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            const SearchAppBar(),
            const SearchInputField(),
            const SearchViewSwitcher(),
            const SearchSliverStatus(),
            const SearchSliverResults(),
            const SearchLoadMoreIndicator(),
            SliverToBoxAdapter(child: SizedBox(height: 32.h)),
          ],
        ),
      ),
    ),
    floatingActionButton: _showFab
        ? AnimatedScale(
            scale: _showFab ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 300),
            child: FloatingActionButton(
              mini: true,
              onPressed: scrollToTop,
              backgroundColor: context.colorScheme.primary,
              foregroundColor: context.colorScheme.onPrimary,
              child: const Icon(Icons.keyboard_arrow_up_rounded),
            ),
          )
        : null,
  );
}
