import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:internet_state_manager/internet_state_manager.dart';
import 'package:propix8/core/di/locator.dart';
import 'package:propix8/core/router/app_routes.dart';
import 'package:propix8/core/utils/context_extensions.dart';
import 'package:propix8/core/utils/responsive_helper.dart';
import 'package:propix8/core/widgets/app_elevated_button.dart';
import 'package:propix8/core/widgets/custom_back_button.dart';
import 'package:propix8/feature/developers/models/developer_model.dart';
import 'package:propix8/feature/developers/viewmodels/developer_cubit.dart';
import 'package:propix8/feature/developers/views/widgets/developer_card.dart';
import 'package:skeletonizer/skeletonizer.dart';

class DevelopersView extends StatelessWidget {
  const DevelopersView({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (context) {
      final cubit = locator<DevelopersCubit>();
      unawaited(cubit.fetchDevelopers());
      return cubit;
    },
    child: const _DevelopersViewContent(),
  );
}

class _DevelopersViewContent extends StatelessWidget {
  const _DevelopersViewContent();

  @override
  Widget build(BuildContext context) => Scaffold(
    body: RefreshIndicator(
      onRefresh: () => context.read<DevelopersCubit>().fetchDevelopers(),
      child: InternetStateManager(
        noInternetScreen: const NoInternetScreen(),
        onRestoreInternetConnection: () {
          unawaited(context.read<DevelopersCubit>().fetchDevelopers());
        },
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              leading: const CustomBackButton(),
              title: Text(context.l10n.developers),
              floating: true,
              snap: true,
            ),
            BlocSelector<
              DevelopersCubit,
              DevelopersState,
              ({DevelopersStatus status, List<DeveloperModel> developers})
            >(
              selector: (state) =>
                  (status: state.status, developers: state.developers),
              builder: (context, data) {
                final status = data.status;
                final developers = data.developers;

                if (status == DevelopersStatus.failure && developers.isEmpty) {
                  return _buildErrorState(context);
                }

                if (developers.isEmpty && status == DevelopersStatus.success) {
                  return _buildEmptyState(context);
                }

                return SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 4.h),
                  sliver: Skeletonizer.sliver(
                    enabled: status == DevelopersStatus.loading,
                    child: SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          final developer = developers.isEmpty
                              ? DeveloperModel(
                                  id: 0,
                                  name: context.l10n.name,
                                  logo: '',
                                  address: context.l10n.address,
                                  phone: '',
                                )
                              : developers[index];

                          return DeveloperCard(
                            developer: developer,
                            onTap: developers.isEmpty
                                ? null
                                : () {
                                    unawaited(context.pushNamed(
                                      AppRoutes.developerUnits,
                                      pathParameters: {
                                        'id': developer.id.toString(),
                                      },
                                    ));
                                  },
                          );
                        },
                        childCount: developers.isEmpty ? 6 : developers.length,
                      ),
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
          BlocSelector<DevelopersCubit, DevelopersState, String?>(
            selector: (state) => state.errorMessage,
            builder: (context, message) => Text(message ?? context.l10n.error),
          ),
          SizedBox(height: 16.h),
          AppElevatedButton(
            onPressed: () => context.read<DevelopersCubit>().fetchDevelopers(),
            text: context.l10n.retry,
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
            Icons.engineering_outlined,
            size: 80.sp,
            color: Colors.grey.withValues(alpha: 0.5),
          ),
          SizedBox(height: 24.h),
          Text(context.l10n.noDevelopers),
        ],
      ),
    ),
  );
}
