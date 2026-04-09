import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/utils/context_extensions.dart';
import '../../../../../../core/widgets/app_elevated_button.dart';
import '../../../../../core/utils/responsive_helper.dart';
import '../../../../auth/models/city_model.dart';
import '../viewmodels/filter_cubit.dart';
import '../viewmodels/filter_state.dart';
import 'widgets/development_status_toggle.dart';
import 'widgets/filter_counter.dart';
import 'widgets/filter_toggle.dart';
import 'widgets/range_slider_with_input.dart';

class FilterSheetContent extends StatelessWidget {
  const FilterSheetContent({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<FilterCubit>();
    final l10n = context.l10n;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle(context, l10n.propertyType),
          SizedBox(height: 12.h),
          BlocSelector<FilterCubit, FilterState, PropertyTab?>(
            selector: (state) => state.activeTab,
            builder: (context, activeTab) => FilterToggle(
              activeTab: activeTab,
              onTabChanged: cubit.changeTab,
            ),
          ),
          SizedBox(height: 24.h),
          _buildSectionTitle(context, l10n.developmentStatus),
          SizedBox(height: 12.h),
          BlocSelector<FilterCubit, FilterState, DevelopmentStatus?>(
            selector: (state) => state.developmentStatus,
            builder: (context, developmentStatus) => DevelopmentStatusToggle(
              selectedStatus: developmentStatus,
              onStatusChanged: cubit.changeDevelopmentStatus,
            ),
          ),
          SizedBox(height: 24.h),
          _buildSectionTitle(context, l10n.location),
          SizedBox(height: 12.h),
          _LocationDropdown(),
          SizedBox(height: 24.h),
          BlocSelector<FilterCubit, FilterState, (double, double)>(
            selector: (state) => (state.minPrice, state.maxPrice),
            builder: (context, priceRange) => RangeSliderWithInput(
              label: l10n.priceRange,
              min: 0,
              max: 10000000,
              currentMin: priceRange.$1,
              currentMax: priceRange.$2,
              onChanged: cubit.updatePriceRange,
            ),
          ),
          SizedBox(height: 24.h),
          _buildSectionTitle(context, l10n.propertySpecs),
          SizedBox(height: 12.h),
          BlocSelector<FilterCubit, FilterState, int>(
            selector: (state) => state.bedrooms,
            builder: (context, bedrooms) => FilterCounter(
              label: l10n.bedrooms,
              value: bedrooms,
              onChanged: cubit.updateBedrooms,
            ),
          ),
          BlocSelector<FilterCubit, FilterState, int>(
            selector: (state) => state.bathrooms,
            builder: (context, bathrooms) => FilterCounter(
              label: l10n.bathrooms,
              value: bathrooms,
              onChanged: cubit.updateBathrooms,
            ),
          ),
          SizedBox(height: 24.h),
          BlocSelector<FilterCubit, FilterState, (double, double)>(
            selector: (state) => (state.minArea, state.maxArea),
            builder: (context, areaRange) => RangeSliderWithInput(
              label: l10n.unitArea,
              min: 0,
              max: 5000,
              currentMin: areaRange.$1,
              currentMax: areaRange.$2,
              onChanged: cubit.updateAreaRange,
            ),
          ),
          SizedBox(height: 16.h),
          BlocSelector<FilterCubit, FilterState, FilterState>(
            selector: (state) => state,
            builder: (context, state) => AppElevatedButton(
              onPressed: () {
                Navigator.pop(context, state);
              },
              text: l10n.apply,
              width: double.infinity,
              height: 48.h,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) => Text(
    title,
    style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
  );
}

class _LocationDropdown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<FilterCubit>();

    return BlocSelector<
      FilterCubit,
      FilterState,
      ({FilterStatus status, List<City> cities, int? selectedCityId})
    >(
      selector: (state) => (
        status: state.status,
        cities: state.cities,
        selectedCityId: state.selectedCityId,
      ),
      builder: (context, data) {
        if (data.status == FilterStatus.citiesLoading) {
          return Container(
            height: 50.h,
            alignment: Alignment.center,
            child: const CircularProgressIndicator(),
          );
        }

        return Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.r)),
          child: DropdownButtonHideUnderline(
            child: DropdownButtonFormField<int>(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: context.l10n.selectCity,
                hintStyle: context.textTheme.bodyMedium?.copyWith(
                  color: Colors.grey[400],
                ),
                prefixIcon: const Icon(
                  Icons.location_on,
                  color: AppColors.primaryLight,
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 12.h,
                ),
              ),
              initialValue: data.selectedCityId,
              items: data.cities
                  .map(
                    (City city) => DropdownMenuItem<int>(
                      value: city.id,
                      child: Text(city.name),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                if (value != null) {
                  cubit.selectCity(value);
                }
              },
            ),
          ),
        );
      },
    );
  }
}
