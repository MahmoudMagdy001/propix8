import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/context_extensions.dart';
import '../../../../core/utils/responsive_helper.dart';
import '../../models/unit_details_model.dart';
import '../../viewmodels/unit_details_cubit.dart';
import '../../viewmodels/unit_details_state.dart';

class UnitHeader extends StatelessWidget {
  const UnitHeader({super.key});

  @override
  Widget build(
    BuildContext context,
  ) => BlocSelector<UnitDetailsCubit, UnitDetailsState, UnitDetailsModel?>(
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
                  if (unit.pricePerM2 > 0) ...[
                    SizedBox(width: 8.w),
                    Text(
                      '( ${unit.pricePerM2.formatCurrency(isArabic: context.l10n.localeName == 'ar')} / ${context.l10n.meterSquared} )',
                      style: context.textTheme.bodySmall?.copyWith(
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ],
              ),
              SizedBox(height: 8.h),
              Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    size: 18.sp,
                    color: Colors.grey,
                  ),
                  SizedBox(width: 4.w),
                  Expanded(
                    child: Text(
                      unit.address,
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
              if (offerType.isNotEmpty) ...[
                SizedBox(height: 8.h),
                Row(
                  children: [
                    Icon(Icons.info_outline, size: 18.sp, color: Colors.grey),
                    SizedBox(width: 4.w),
                    Text(
                      context.l10n.saleStatusLabel,
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      offerType,
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: context.colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      );
    },
  );
}
