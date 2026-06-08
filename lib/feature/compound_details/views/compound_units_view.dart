import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:propix8/core/di/locator.dart';
import 'package:propix8/core/utils/context_extensions.dart';
import 'package:propix8/core/utils/responsive_helper.dart';
import 'package:propix8/feature/compound_details/viewmodels/compound_units_cubit.dart';
import 'package:propix8/feature/compound_details/viewmodels/compound_units_state.dart';
import 'package:propix8/feature/compound_details/views/widgets/compound_units_app_bar.dart';
import 'package:propix8/feature/compound_details/views/widgets/compound_units_content.dart';
import 'package:propix8/feature/compound_details/views/widgets/compound_units_view_switcher.dart';
import 'package:propix8/feature/home/viewmodels/home_state.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CompoundUnitsView extends StatelessWidget {
  const CompoundUnitsView({required this.compoundId, super.key});
  final int compoundId;

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (context) =>
        locator<CompoundUnitsCubit>()..loadCompoundUnits(compoundId),
    child: const _CompoundUnitsContent(),
  );
}

class _CompoundUnitsContent extends StatefulWidget {
  const _CompoundUnitsContent();

  @override
  State<_CompoundUnitsContent> createState() => _CompoundUnitsContentState();
}

class _CompoundUnitsContentState extends State<_CompoundUnitsContent> {
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
      final compoundId = context.read<CompoundUnitsCubit>().state.compound?.id;
      if (compoundId != null) {
        context.read<CompoundUnitsCubit>().loadMoreUnits(compoundId);
      }
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  Widget build(
    BuildContext context,
  ) => BlocSelector<CompoundUnitsCubit, CompoundUnitsState, bool>(
    selector: (state) => state.status == HomeRequestStatus.loading,
    builder: (context, isLoading) => Scaffold(
      backgroundColor: context.colorScheme.surface,
      body: Skeletonizer(
        enabled: isLoading,
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            const CompoundUnitsAppBar(),
            const CompoundUnitsViewSwitcher(),
            const CompoundUnitsContent(),
            BlocSelector<CompoundUnitsCubit, CompoundUnitsState, bool>(
              selector: (state) => state.isLoadingMore,
              builder: (context, isLoadingMore) {
                if (isLoadingMore) {
                  return SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                      child: const Center(child: CircularProgressIndicator()),
                    ),
                  );
                }
                return const SliverToBoxAdapter(child: SizedBox(height: 20));
              },
            ),
          ],
        ),
      ),
    ),
  );
}
