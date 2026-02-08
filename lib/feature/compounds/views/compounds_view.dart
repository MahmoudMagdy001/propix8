import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:internet_state_manager/internet_state_manager.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/di/locator.dart';
import '../../../../core/router/app_routes.dart';
import '../../../../core/utils/context_extensions.dart';
import '../../../../core/utils/responsive_helper.dart';
import '../../../../core/widgets/custom_back_button.dart';
import '../models/compound_model.dart';
import '../viewmodels/compound_cubit.dart';
import 'widgets/compound_card.dart';

class CompoundsView extends StatelessWidget {
  const CompoundsView({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (context) => locator<CompoundsCubit>()..fetchCompounds(),
    child: const _CompoundsViewContent(),
  );
}

class _CompoundsViewContent extends StatelessWidget {
  const _CompoundsViewContent();

  @override
  Widget build(BuildContext context) => Scaffold(
    body: RefreshIndicator(
      onRefresh: () => context.read<CompoundsCubit>().fetchCompounds(),
      child: InternetStateManager(
        noInternetScreen: const NoInternetScreen(),
        onRestoreInternetConnection: () {
          context.read<CompoundsCubit>().fetchCompounds();
        },
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              leading: const CustomBackButton(),
              title: Text(context.l10n.compounds),
              floating: true,
              snap: true,
            ),
            BlocSelector<
              CompoundsCubit,
              CompoundsState,
              ({CompoundsStatus status, List<CompoundModel> compounds})
            >(
              selector: (state) =>
                  (status: state.status, compounds: state.compounds),
              builder: (context, data) {
                final status = data.status;
                final compounds = data.compounds;

                if (status == CompoundsStatus.failure && compounds.isEmpty) {
                  return _buildErrorState(context);
                }

                if (compounds.isEmpty && status == CompoundsStatus.success) {
                  return _buildEmptyState(context);
                }

                return SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 4.h),
                  sliver: Skeletonizer.sliver(
                    enabled: status == CompoundsStatus.loading,
                    child: SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        final compound = compounds.isEmpty
                            ? CompoundModel(
                                id: 0,
                                name: context.l10n.compound,
                                description: context.l10n.description,
                              )
                            : compounds[index];

                        return CompoundCard(
                          compound: compound,
                          onTap: compounds.isEmpty
                              ? null
                              : () {
                                  context.pushNamed(
                                    AppRoutes.compoundUnits,
                                    pathParameters: {
                                      'id': compound.id.toString(),
                                    },
                                  );
                                },
                        );
                      }, childCount: compounds.isEmpty ? 6 : compounds.length),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    ),
  );

  Widget _buildErrorState(BuildContext context) => SliverFillRemaining(
    hasScrollBody: false,
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, size: 64.sp, color: Colors.grey),
          SizedBox(height: 16.h),
          BlocSelector<CompoundsCubit, CompoundsState, String?>(
            selector: (state) => state.errorMessage,
            builder: (context, message) =>
                Text(message ?? context.l10n.errorOccurred),
          ),
          SizedBox(height: 16.h),
          ElevatedButton(
            onPressed: () => context.read<CompoundsCubit>().fetchCompounds(),
            child: Text(context.l10n.retry),
          ),
        ],
      ),
    ),
  );

  Widget _buildEmptyState(BuildContext context) => SliverFillRemaining(
    hasScrollBody: false,
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.apartment_outlined,
            size: 80.sp,
            color: Colors.grey.withValues(alpha: 0.5),
          ),
          SizedBox(height: 24.h),
          Text(context.l10n.compounds_view_empty),
        ],
      ),
    ),
  );
}
