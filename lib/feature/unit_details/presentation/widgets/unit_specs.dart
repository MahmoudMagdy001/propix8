import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:propix8/core/utils/context_extensions.dart';
import 'package:propix8/core/utils/responsive_helper.dart';
import 'package:propix8/feature/unit_details/domain/entities/unit_details_entity.dart';
import 'package:propix8/feature/unit_details/presentation/bloc/unit_details_bloc.dart';
import 'package:propix8/feature/unit_details/presentation/bloc/unit_details_state.dart';

class _SpecData {
  const _SpecData({
    required this.value,
    required this.label,
    this.iconAsset,
    this.iconData,
  });
  final String? iconAsset;
  final IconData? iconData;
  final String value;
  final String label;
}

class UnitSpecs extends StatelessWidget {
  const UnitSpecs({super.key});

  @override
  Widget build(
    BuildContext context,
  ) =>
      BlocSelector<UnitDetailsBloc, UnitDetailsState, UnitDetailsEntity?>(
        selector: (state) => state.unit,
        builder: (context, unit) {
          if (unit == null) return const SliverToBoxAdapter(child: SizedBox());

          final specs = <_SpecData>[
            if (unit.area > 0)
              _SpecData(
                iconAsset: 'assets/icons/measure.png',
                value:
                    '${unit.area.toStringAsFixed(0)} ${context.l10n.unit_specs_area_unit}',
                label: context.l10n.unitArea,
              ),
            if (unit.rooms > 0)
              _SpecData(
                iconAsset: 'assets/icons/bedroom.png',
                value: unit.rooms.toString(),
                label: context.l10n.unit_specs_rooms,
              ),
            if (unit.bathrooms > 0)
              _SpecData(
                iconAsset: 'assets/icons/bathroom.png',
                value: unit.bathrooms.toString(),
                label: context.l10n.unit_specs_bathrooms,
              ),
            if (unit.garages > 0)
              _SpecData(
                iconData: Icons.garage_outlined,
                value: unit.garages.toString(),
                label: context.l10n.garages,
              ),
            if (unit.buildYear.isNotEmpty)
              _SpecData(
                iconData: Icons.calendar_today_outlined,
                value: unit.buildYear,
                label: context.l10n.buildYear,
              ),
            if (unit.unitType.name.isNotEmpty)
              _SpecData(
                iconData: Icons.home_work_outlined,
                value: unit.unitType.name,
                label: context.l10n.propertyType,
              ),
          ];

          if (specs.isEmpty) {
            return const SliverToBoxAdapter(child: SizedBox());
          }

          return SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.w),
              child: Column(
                children: [
                  SizedBox(height: 12.h),
                  Row(
                    children: [
                      for (int i = 0; i < specs.length.clamp(0, 4); i++)
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4.w),
                            child: _buildSpecCard(context, specs[i]),
                          ),
                        ),
                    ],
                  ),
                  if (specs.length > 4) ...[
                    SizedBox(height: 8.h),
                    Row(
                      children: [
                        for (int i = 4; i < specs.length; i++)
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 4.w),
                              child: _buildSpecCard(context, specs[i]),
                            ),
                          ),
                        for (int i = 0; i < (8 - specs.length); i++)
                          const Expanded(child: SizedBox()),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          );
        },
      );

  Widget _buildSpecCard(BuildContext context, _SpecData spec) => Container(
        height: 75.h,
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: context.theme.cardTheme.color,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (spec.iconAsset != null)
              Image.asset(
                spec.iconAsset!,
                width: 20.w,
                height: 20.h,
                color: context.colorScheme.primary,
              )
            else if (spec.iconData != null)
              Icon(
                spec.iconData,
                size: 20.sp,
                color: context.colorScheme.primary,
              ),
            SizedBox(height: 4.h),
            Flexible(
              child: Text(
                spec.value,
                style: context.textTheme.labelMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Flexible(
              child: Text(
                spec.label,
                style: context.textTheme.labelSmall?.copyWith(
                  color: Colors.grey.shade600,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      );
}
