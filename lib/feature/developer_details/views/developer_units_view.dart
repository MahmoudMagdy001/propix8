import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/di/locator.dart';
import '../../../../core/utils/context_extensions.dart';
import '../../../../core/utils/responsive_helper.dart';
import '../../home/viewmodels/home_state.dart';
import '../viewmodels/developer_units_cubit.dart';
import '../viewmodels/developer_units_state.dart';
import 'widgets/developer_units_app_bar.dart';
import 'widgets/developer_units_results.dart';
import 'widgets/developer_units_view_switcher.dart';

class DeveloperUnitsView extends StatefulWidget {
  const DeveloperUnitsView({required this.developerId, super.key});
  final int developerId;

  @override
  State<DeveloperUnitsView> createState() => _DeveloperUnitsViewState();
}

class _DeveloperUnitsViewState extends State<DeveloperUnitsView> {
  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (context) =>
        locator<DeveloperUnitsCubit>()..loadDeveloperUnits(widget.developerId),
    child: _DeveloperUnitsContent(developerId: widget.developerId),
  );
}

class _DeveloperUnitsContent extends StatefulWidget {
  const _DeveloperUnitsContent({required this.developerId});
  final int developerId;

  @override
  State<_DeveloperUnitsContent> createState() => _DeveloperUnitsContentState();
}

class _DeveloperUnitsContentState extends State<_DeveloperUnitsContent> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) {
      context.read<DeveloperUnitsCubit>().loadMoreUnits(widget.developerId);
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: context.colorScheme.surface,
    body:
        BlocSelector<
          DeveloperUnitsCubit,
          DeveloperUnitsState,
          HomeRequestStatus
        >(
          selector: (state) => state.status,
          builder: (context, status) => Skeletonizer(
            enabled: status == HomeRequestStatus.loading,
            child: CustomScrollView(
              controller: _scrollController,
              slivers: [
                const DeveloperUnitsAppBar(),
                const DeveloperUnitsViewSwitcher(),
                const DeveloperUnitsResults(),
                BlocSelector<DeveloperUnitsCubit, DeveloperUnitsState, bool>(
                  selector: (state) => state.isLoadingMore,
                  builder: (context, isLoadingMore) {
                    if (isLoadingMore) {
                      return SliverToBoxAdapter(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 16.h),
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      );
                    }
                    return const SliverToBoxAdapter(
                      child: SizedBox(height: 20),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
  );
}
