import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:propix8/core/utils/context_extensions.dart';
import 'package:propix8/core/utils/responsive_helper.dart';
import 'package:propix8/feature/unit_details/domain/entities/unit_details_entity.dart';
import 'package:propix8/feature/unit_details/presentation/bloc/unit_details_bloc.dart';
import 'package:propix8/feature/unit_details/presentation/bloc/unit_details_state.dart';

class UnitHeader extends StatelessWidget {
  const UnitHeader({super.key});

  @override
  Widget build(
    BuildContext context,
  ) =>
      BlocSelector<UnitDetailsBloc, UnitDetailsState, UnitDetailsEntity?>(
        selector: (state) => state.unit,
        builder: (context, unit) {
          if (unit == null) return const SliverToBoxAdapter(child: SizedBox());

          var offerType = '';
          if (unit.offerType.isNotEmpty) {
            if (unit.offerType.toLowerCase() == 'sale') {
              offerType = context.l10n.sale;
            } else if (unit.offerType.toLowerCase() == 'rent') {
              offerType = context.l10n.rent;
            } else {
              offerType = unit.offerType;
            }
          }
          return SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          unit.title,
                          style: context.textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4.h),
                  Row(
                    children: [
                      Text(
                        unit.price.formatCurrency(
                          isArabic: context.l10n.localeName == 'ar',
                        ),
                        style: context.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: context.colorScheme.primary,
                        ),
                      ),
                      if (offerType.isNotEmpty) ...[
                        Text(
                          ' • ',
                          style: context.textTheme.titleMedium?.copyWith(
                            color: Colors.grey.shade600,
                          ),
                        ),
                        Text(
                          offerType,
                          style: context.textTheme.titleMedium?.copyWith(
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ],
                  ),
                  SizedBox(height: 4.h),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        size: 16.sp,
                        color: Colors.grey.shade600,
                      ),
                      SizedBox(width: 4.w),
                      Expanded(
                        child: Text(
                          unit.address,
                          style: context.textTheme.bodyMedium?.copyWith(
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  Row(
                    children: [
                      if (unit.averageRating > 0) ...[
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              size: 18.sp,
                              color: Colors.amber,
                            ),
                            SizedBox(width: 4.w),
                            Text(
                              unit.averageRating.toStringAsFixed(1),
                              style: context.textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 4.w),
                            Text(
                              '(${unit.reviewsCount} ${context.l10n.reviews})',
                              style: context.textTheme.bodyMedium?.copyWith(
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ],
                  ),
                  SizedBox(height: 16.h),
                  Divider(color: Colors.grey.shade200),
                ],
              ),
            ),
          );
        },
      );
}
