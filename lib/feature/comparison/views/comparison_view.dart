import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internet_state_manager/internet_state_manager.dart';
import 'package:propix8/core/di/locator.dart';
import 'package:propix8/core/utils/context_extensions.dart';
import 'package:propix8/core/widgets/app_network_error_widget.dart';
import 'package:propix8/core/widgets/custom_back_button.dart';
import 'package:propix8/feature/comparison/viewmodels/comparison_cubit.dart';
import 'package:propix8/feature/comparison/viewmodels/comparison_state.dart';
import 'package:propix8/feature/comparison/views/widgets/comparison_header.dart';
import 'package:propix8/feature/comparison/views/widgets/comparison_row.dart';
import 'package:propix8/l10n/app_localizations.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ComparisonView extends StatefulWidget {
  const ComparisonView({
    required this.baseUnitId,
    required this.selectedUnitId,
    super.key,
  });

  final int baseUnitId;
  final int selectedUnitId;

  @override
  State<ComparisonView> createState() => _ComparisonViewState();
}

class _ComparisonViewState extends State<ComparisonView> {
  late final ComparisonCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = locator<ComparisonCubit>();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadComparison();
  }

  void _loadComparison() {
    final l10n = context.l10n;
    unawaited(
      _cubit.loadComparison(
        baseUnitId: widget.baseUnitId,
        selectedUnitId: widget.selectedUnitId,
        getLocalizedLabel: (key) => _getLocalizedLabel(l10n, key),
        getLocalizedValue: (key, value) => _getLocalizedValue(l10n, key, value),
        meterSquared: l10n.meterSquared,
        currencySymbol: l10n.currency_egp,
      ),
    );
  }

  String _getLocalizedLabel(AppLocalizations l10n, String key) {
    switch (key) {
      case 'name':
        return l10n.name;
      case 'price':
        return l10n.priceRange;
      case 'pricePerM2':
        return l10n.pricePerM2;
      case 'area':
        return l10n.unitArea;
      case 'landArea':
        return l10n.landArea;
      case 'internalArea':
        return l10n.internalArea;
      case 'rooms':
        return l10n.rooms;
      case 'bathrooms':
        return l10n.bathrooms;
      case 'garages':
        return l10n.garages;
      case 'buildYear':
        return l10n.buildYear;
      case 'unitType':
        return l10n.propertyType;
      case 'offerType':
        return l10n.saleStatusLabel;
      case 'unitStatus':
        return l10n.unitStatus;
      case 'city':
        return l10n.city;
      case 'address':
        return l10n.address;
      case 'developmentStatus':
        return l10n.developmentStatus;
      case 'compound':
        return l10n.compound;
      case 'developer':
        return l10n.developer;
      case 'amenities':
        return l10n.amenities;
      case 'rating':
        return l10n.rating;
      case 'reviewsCount':
        return l10n.reviews;
      default:
        return key;
    }
  }

  String _getLocalizedValue(AppLocalizations l10n, String key, String value) {
    switch (key) {
      case 'offerType':
        if (value.toLowerCase() == 'sale') return l10n.sale;
        if (value.toLowerCase() == 'rent') return l10n.rent;
        return value;
      case 'unitStatus':
        if (value.toLowerCase() == 'sold') return l10n.status_sold;
        if (value.toLowerCase() == 'rented') return l10n.status_rented;
        if (value.toLowerCase() == 'available' ||
            value.toLowerCase() == 'approved') {
          return l10n.status_available;
        }
        return value;
      case 'developmentStatus':
        if (value.toLowerCase() == 'primary') return l10n.unit_type_primary;
        if (value.toLowerCase() == 'resale') return l10n.unit_type_resale;
        return value;
      default:
        return value;
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return BlocProvider.value(
      value: _cubit,
      child: Scaffold(
        appBar: AppBar(
          leading: const CustomBackButton(),
          title: Text(l10n.comparisonTitle),
          surfaceTintColor: context.colorScheme.surface,
        ),
        body: BlocBuilder<ComparisonCubit, ComparisonState>(
          builder: (context, state) {
            if (state.status == ComparisonStatus.failure) {
              return AppNetworkErrorWidget(
                onRetry: _loadComparison,
                errorMessage: state.errorMessage,
              );
            }

            if (state.status == ComparisonStatus.loading ||
                state.status == ComparisonStatus.initial) {
              return buildLoading(context);
            }

            final baseUnit = state.baseUnit;
            final selectedUnit = state.selectedUnit;

            if (baseUnit == null || selectedUnit == null) {
              return AppNetworkErrorWidget(
                onRetry: _loadComparison,
                errorMessage: l10n.error,
              );
            }

            return InternetStateManager(
              noInternetScreen: const NoInternetScreen(),
              onRestoreInternetConnection: _loadComparison,
              child: Column(
                children: [
                  ComparisonHeader(
                    baseUnit: baseUnit,
                    selectedUnit: selectedUnit,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      padding: EdgeInsets.only(bottom: 24.h),
                      child: Column(
                        children: List.generate(
                          state.comparisonItems.length,
                          (index) => TweenAnimationBuilder<double>(
                            duration: Duration(
                              // ponytail: Clamp the stagger delay so it doesn't become extremely slow
                              milliseconds: 300 + (index * 50).clamp(0, 400),
                            ),
                            tween: Tween(begin: 0.0, end: 1.0),
                            builder: (context, value, child) => Opacity(
                              opacity: value,
                              child: Transform.translate(
                                offset: Offset(0, 20 * (1 - value)),
                                child: child,
                              ),
                            ),
                            child: ComparisonRow(
                              item: state.comparisonItems[index],
                              isEven: index.isEven,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget buildLoading(BuildContext context) => Skeletonizer(
    child: Column(
      children: [
        Container(
          height: 160.h,
          margin: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: context.colorScheme.surfaceContainerLow,
            borderRadius: BorderRadius.circular(16.r),
          ),
        ),
        Expanded(
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 10,
            itemBuilder: (context, index) => Container(
              height: 56.h,
              margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
              decoration: BoxDecoration(
                color: context.colorScheme.surfaceContainerLow,
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
