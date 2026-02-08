import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/responsive_helper.dart';
import '../../viewmodels/home_cubit.dart';
import '../../viewmodels/home_state.dart';

class HomeLoadMoreIndicator extends StatelessWidget {
  const HomeLoadMoreIndicator({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocSelector<HomeCubit, HomeState, HomeRequestStatus>(
        selector: (state) => state.loadMoreStatus,
        builder: (context, status) {
          if (status == HomeRequestStatus.loading) {
            return SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h),
                child: const Center(child: CircularProgressIndicator()),
              ),
            );
          }
          return const SliverToBoxAdapter(child: SizedBox.shrink());
        },
      );
}
