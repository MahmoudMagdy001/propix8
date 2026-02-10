import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/app_routes.dart';
import '../../../../core/utils/context_extensions.dart';
import '../../../../core/utils/responsive_helper.dart';
import '../../models/unit_details_model.dart';
import '../../viewmodels/unit_details_cubit.dart';
import '../../viewmodels/unit_details_state.dart';
import 'section_header.dart';

class UnitCompound extends StatelessWidget {
  const UnitCompound({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocSelector<UnitDetailsCubit, UnitDetailsState, CompoundModel?>(
        selector: (state) => state.unit?.compound,
        builder: (context, compound) {
          if (compound == null) {
            return const SliverToBoxAdapter(child: SizedBox());
          }
          return SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SectionHeader(title: context.l10n.compound),
                SizedBox(height: 8.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6.w),
                  child: InkWell(
                    onTap: () {
                      context.pushNamed(
                        AppRoutes.compoundUnits,
                        pathParameters: {'id': compound.id.toString()},
                      );
                    },
                    borderRadius: BorderRadius.circular(12.r),
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(16.r),
                      decoration: BoxDecoration(
                        color: context.theme.cardTheme.color,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            compound.name,
                            style: context.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: context.colorScheme.primary,
                            ),
                          ),
                          if (compound.description.isNotEmpty) ...[
                            SizedBox(height: 8.h),
                            Text(
                              compound.description,
                              style: context.textTheme.bodySmall?.copyWith(
                                color: Colors.grey.shade600,
                                height: 1.4,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
}
