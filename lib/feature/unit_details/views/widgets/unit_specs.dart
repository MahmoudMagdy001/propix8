import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:propix8/core/utils/context_extensions.dart';
import 'package:propix8/core/utils/responsive_helper.dart';
import 'package:propix8/feature/unit_details/models/unit_details_model.dart';
import 'package:propix8/feature/unit_details/viewmodels/unit_details_cubit.dart';
import 'package:propix8/feature/unit_details/viewmodels/unit_details_state.dart';
import 'package:propix8/feature/unit_details/views/widgets/section_header.dart';

class UnitSpecs extends StatelessWidget {
  const UnitSpecs({super.key});

  @override
  Widget build(
    BuildContext context,
  ) => BlocSelector<UnitDetailsCubit, UnitDetailsState, UnitDetailsModel?>(
    selector: (state) => state.unit,
    builder: (context, unit) {
      if (unit == null) return const SliverToBoxAdapter(child: SizedBox());

      final specs = <_SpecData>[
        // Area
        if (unit.area > 0)
          _SpecData(
            iconAsset: 'assets/icons/measure.png',
            value:
                '${unit.area.toStringAsFixed(0)} ${context.l10n.unit_specs_area_unit}',
            label: context.l10n.unitArea,
          ),

        // Rooms
        if (unit.rooms > 0)
          _SpecData(
            iconAsset: 'assets/icons/bedroom.png',
            value: unit.rooms.toString(),
            label: context.l10n.unit_specs_rooms,
          ),

        // Bathrooms
        if (unit.bathrooms > 0)
          _SpecData(
            iconAsset: 'assets/icons/bathroom.png',
            value: unit.bathrooms.toString(),
            label: context.l10n.unit_specs_bathrooms,
          ),

        // Garages
        if (unit.garages > 0)
          _SpecData(
            iconData: Icons.garage_outlined,
            value: unit.garages.toString(),
            label: context.l10n.garages,
          ),

        // Build Year
        if (unit.buildYear.isNotEmpty)
          _SpecData(
            iconData: Icons.calendar_today_outlined,
            value: unit.buildYear,
            label: context.l10n.buildYear,
          ),

        // Unit Type
        if (unit.unitType.name.isNotEmpty && unit.unitType.name != 'Unknown')
          _SpecData(
            iconUrl: unit.unitType.icon,
            fallbackIcon: Icons.apartment,
            value: unit.unitType.name,
            label: context.l10n.propertyType,
          ),

        // Land Area
        if ((unit.landArea ?? 0) > 0)
          _SpecData(
            iconData: Icons.landscape_outlined,
            value:
                '${unit.landArea!.toStringAsFixed(0)} ${context.l10n.unit_specs_area_unit}',
            label: context.l10n.landArea,
          ),

        // Internal Area
        if ((unit.internalArea ?? 0) > 0)
          _SpecData(
            iconData: Icons.crop_square,
            value:
                '${unit.internalArea!.toStringAsFixed(0)} ${context.l10n.unit_specs_area_unit}',
            label: context.l10n.internalArea,
          ),

        // Development Status
        if (unit.developmentStatus.isNotEmpty)
          _SpecData(
            iconData: Icons.info_outline,
            value: unit.developmentStatus == 'primary'
                ? context.l10n.unit_type_primary
                : context.l10n.unit_type_resale,
            label: context.l10n.developmentStatus,
          ),

        // Status
        if (unit.status.isNotEmpty)
          _SpecData(
            iconData: switch (unit.status.toLowerCase()) {
              'available' || 'approved' => Icons.check_circle_outline,
              _ => Icons.info_outline,
            },
            value: switch (unit.status.toLowerCase()) {
              'sold' => context.l10n.status_sold,
              'rented' => context.l10n.status_rented,
              'available' || 'approved' => context.l10n.status_available,
              _ => unit.status,
            },
            label: context.l10n.unitStatus,
            color: switch (unit.status.toLowerCase()) {
              'sold' => Colors.red.withValues(alpha: 0.1),
              'rented' => Colors.orange.withValues(alpha: 0.1),
              'available' || 'approved' => Colors.green.withValues(alpha: 0.1),
              _ => null,
            },
            textColor: switch (unit.status.toLowerCase()) {
              'sold' => Colors.red,
              'rented' => Colors.orange,
              'available' || 'approved' => Colors.green,
              _ => null,
            },
          ),
      ];

      if (specs.isEmpty) {
        return const SliverToBoxAdapter(child: SizedBox());
      }

      return SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionHeader(title: context.l10n.propertySpecs),
            SizedBox(height: 12.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.w),
              child: GridView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 4.w,
                  mainAxisSpacing: 4.h,
                  childAspectRatio: 0.85,
                ),
                itemCount: specs.length,
                itemBuilder: (context, index) =>
                    _buildSpecItem(context, specs[index]),
              ),
            ),
          ],
        ),
      );
    },
  );

  Widget _buildSpecItem(BuildContext context, _SpecData spec) {
    Widget iconWidget;

    if (spec.iconAsset != null) {
      iconWidget = Image.asset(
        spec.iconAsset!,
        width: 22.w,
        height: 22.h,
        color: context.colorScheme.primary,
      );
    } else if (spec.iconUrl != null && spec.iconUrl!.isNotEmpty) {
      iconWidget = CachedNetworkImage(
        imageUrl: spec.iconUrl!,
        width: 30.w,
        height: 30.h,
        errorWidget: (context, url, error) => Icon(
          spec.fallbackIcon ?? Icons.error_outline,
          size: 22.sp,
          color: context.colorScheme.primary,
        ),
      );
    } else {
      iconWidget = Icon(
        spec.iconData ?? spec.fallbackIcon ?? Icons.circle,
        size: 22.sp,
        color: spec.textColor ?? context.colorScheme.primary,
      );
    }

    return Container(
      padding: EdgeInsets.all(8.r),
      decoration: BoxDecoration(
        color: spec.color ?? context.theme.cardTheme.color,
        borderRadius: BorderRadius.circular(12.r),
        border: spec.color != null
            ? Border.all(color: spec.textColor!.withValues(alpha: 0.2))
            : null,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            spec.label,
            style: context.textTheme.labelSmall?.copyWith(
              color: Colors.grey.shade600,
              fontSize: 10.sp,
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 4.h),
          iconWidget,
          SizedBox(height: 6.h),
          Text(
            spec.value,
            style: context.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: spec.textColor,
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

class _SpecData {
  _SpecData({
    required this.label,
    required this.value,
    this.iconAsset,
    this.iconData,
    this.iconUrl,
    this.fallbackIcon,
    this.color,
    this.textColor,
  });
  final String label;
  final String value;
  final String? iconAsset;
  final IconData? iconData;
  final String? iconUrl;
  final IconData? fallbackIcon;
  final Color? color;
  final Color? textColor;
}
