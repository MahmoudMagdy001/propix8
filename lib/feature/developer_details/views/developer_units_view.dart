import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:propix8/core/di/locator.dart';
import 'package:propix8/core/utils/context_extensions.dart';
import 'package:propix8/core/utils/responsive_helper.dart';
import 'package:propix8/feature/developer_details/viewmodels/developer_units_cubit.dart';
import 'package:propix8/feature/developer_details/viewmodels/developer_units_state.dart';
import 'package:propix8/feature/developer_details/views/widgets/developer_units_app_bar.dart';
import 'package:propix8/feature/developer_details/views/widgets/developer_units_results.dart';
import 'package:propix8/feature/developer_details/views/widgets/developer_units_view_switcher.dart';
import 'package:propix8/feature/home/viewmodels/home_state.dart';
import 'package:skeletonizer/skeletonizer.dart';

class DeveloperUnitsView extends StatefulWidget {
  const DeveloperUnitsView({required this.developerId, super.key});
  final int developerId;

  @override
  State<DeveloperUnitsView> createState() => _DeveloperUnitsViewState();
}

class _DeveloperUnitsViewState extends State<DeveloperUnitsView> {
  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (context) {
      final cubit = locator<DeveloperUnitsCubit>();
      unawaited(cubit.loadDeveloperUnits(widget.developerId));
      return cubit;
    },
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
      unawaited(context.read<DeveloperUnitsCubit>().loadMoreUnits(widget.developerId));
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
