import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:propix8/core/utils/context_extensions.dart';
import 'package:propix8/core/utils/responsive_helper.dart';
import 'package:propix8/core/widgets/app_sliver_list.dart';
import 'package:propix8/core/widgets/unit_list_card.dart';
import 'package:propix8/feature/home/models/unit_model.dart';
import 'package:propix8/feature/unit_details/viewmodels/unit_details_cubit.dart';
import 'package:propix8/feature/unit_details/viewmodels/unit_details_state.dart';
import 'package:propix8/feature/unit_details/views/widgets/section_header.dart';

class UnitRelatedSection extends StatelessWidget {
  const UnitRelatedSection({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocSelector<
        UnitDetailsCubit,
        UnitDetailsState,
        ({RequestStatus relatedStatus, List<UnitModel> relatedUnits})
      >(
        selector: (state) => (
          relatedStatus: state.relatedStatus,
          relatedUnits: state.relatedUnits,
        ),
        builder: (context, result) {
          if (result.relatedStatus == RequestStatus.loading) {
            return const SliverToBoxAdapter(
              child: SizedBox(),
            ); // Loaded with main skeleton
          }

          if (result.relatedUnits.isEmpty) {
            return const SliverToBoxAdapter(child: SizedBox());
          }

          return SliverMainAxisGroup(
            slivers: [
              SliverToBoxAdapter(
                child: SectionHeader(title: context.l10n.relatedUnits),
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    SizedBox(height: 12.h),
                    SizedBox(
                      height: 260.h,
                      child: CustomScrollView(
                        scrollDirection: Axis.horizontal,
                        slivers: [
                          AppSliverList<UnitModel>(
                            items: result.relatedUnits,
                            padding: EdgeInsets.symmetric(horizontal: 6.w),
                            separatorBuilder: (context, index) =>
                                SizedBox(width: 8.w),
                            itemBuilder: (context, item) =>
                                UnitListCard(unit: item),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      );
}
