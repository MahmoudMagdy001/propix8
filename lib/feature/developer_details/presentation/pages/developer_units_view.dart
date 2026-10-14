import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:propix8/core/di/locator.dart';
import 'package:propix8/core/utils/context_extensions.dart';
import 'package:propix8/core/utils/responsive_helper.dart';
import 'package:propix8/feature/developer_details/presentation/bloc/developer_units_bloc.dart';
import 'package:propix8/feature/developer_details/presentation/bloc/developer_units_event.dart';
import 'package:propix8/feature/developer_details/presentation/bloc/developer_units_state.dart';
import 'package:propix8/feature/developer_details/presentation/widgets/developer_units_app_bar.dart';
import 'package:propix8/feature/developer_details/presentation/widgets/developer_units_results.dart';
import 'package:propix8/feature/developer_details/presentation/widgets/developer_units_view_switcher.dart';
import 'package:propix8/feature/home/presentation/bloc/home_state.dart';
import 'package:skeletonizer/skeletonizer.dart';

class DeveloperUnitsView extends StatelessWidget {
  const DeveloperUnitsView({required this.developerId, super.key});
  final int developerId;

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => locator<DeveloperUnitsBloc>()
          ..add(DeveloperUnitsEvent.developerUnitsRequested(developerId)),
        child: _DeveloperUnitsContent(developerId: developerId),
      );
}

class _DeveloperUnitsContent extends StatefulWidget {
  const _DeveloperUnitsContent({required this.developerId});
  final int developerId;

  @override
  State<_DeveloperUnitsContent> createState() => _DeveloperUnitsContentState();
}

class _DeveloperUnitsContentState extends State<_DeveloperUnitsContent> {
  late final ScrollController _scrollController;

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
      context.read<DeveloperUnitsBloc>().add(
            DeveloperUnitsEvent.developerUnitsMoreRequested(widget.developerId),
          );
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
        backgroundColor: context.colors.surface,
        body: BlocSelector<
          DeveloperUnitsBloc,
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
                BlocSelector<DeveloperUnitsBloc, DeveloperUnitsState, bool>(
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
