import 'package:equatable/equatable.dart';

import 'package:propix8/feature/unit_details/models/unit_details_model.dart';

/// Indicates which value is better in a comparison.
enum ComparisonAdvantage {
  /// Neither value is better (equal or non-comparable).
  none,

  /// The first value (base unit) is better.
  first,

  /// The second value (selected unit) is better.
  second,
}

/// Represents a single comparison attribute between two units.
class ComparisonItem extends Equatable {
  const ComparisonItem({
    required this.label,
    required this.value1,
    required this.value2,
    required this.isDifferent,
    this.advantage = ComparisonAdvantage.none,
    this.icon,
  });

  final String label;
  final String value1;
  final String value2;
  final bool isDifferent;
  final ComparisonAdvantage advantage;
  final String? icon;

  @override
  List<Object?> get props => [
    label,
    value1,
    value2,
    isDifferent,
    advantage,
    icon,
  ];
}

/// Helper class to generate comparison items from two units.
class ComparisonHelper {
  ComparisonHelper._();

  static List<ComparisonItem> generateComparisonItems({
    required UnitDetailsModel baseUnit,
    required UnitDetailsModel selectedUnit,
    required String Function(String) getLocalizedLabel,
    required String Function(String, String) getLocalizedValue,
    required String meterSquared,
    required String currencySymbol,
  }) {
    final items = <ComparisonItem>[
      // Price (lower is better)
      _createNumericItem(
        label: getLocalizedLabel('price'),
        value1: baseUnit.price,
        value2: selectedUnit.price,
        format1: _formatPrice(baseUnit.price, currencySymbol),
        format2: _formatPrice(selectedUnit.price, currencySymbol),
        higherIsBetter: false,
      ),
      // Price per m2 (lower is better)
      _createNumericItem(
        label: getLocalizedLabel('pricePerM2'),
        value1: baseUnit.pricePerM2,
        value2: selectedUnit.pricePerM2,
        format1: _formatPrice(baseUnit.pricePerM2, currencySymbol),
        format2: _formatPrice(selectedUnit.pricePerM2, currencySymbol),
        higherIsBetter: false,
      ),
      // Area (higher is better)
      _createNumericItem(
        label: getLocalizedLabel('area'),
        value1: baseUnit.area,
        value2: selectedUnit.area,
        format1: '${baseUnit.area.toInt()} $meterSquared',
        format2: '${selectedUnit.area.toInt()} $meterSquared',
        higherIsBetter: true,
      ),
    ];

    // Land Area (if available, higher is better)
    if ((baseUnit.landArea ?? 0) > 0 || (selectedUnit.landArea ?? 0) > 0) {
      items.add(
        _createNumericItem(
          label: getLocalizedLabel('landArea'),
          value1: baseUnit.landArea ?? 0,
          value2: selectedUnit.landArea ?? 0,
          format1: '${(baseUnit.landArea ?? 0).toInt()} $meterSquared',
          format2: '${(selectedUnit.landArea ?? 0).toInt()} $meterSquared',
          higherIsBetter: true,
        ),
      );
    }

    // Internal Area (if available, higher is better)
    if ((baseUnit.internalArea ?? 0) > 0 ||
        (selectedUnit.internalArea ?? 0) > 0) {
      items.add(
        _createNumericItem(
          label: getLocalizedLabel('internalArea'),
          value1: baseUnit.internalArea ?? 0,
          value2: selectedUnit.internalArea ?? 0,
          format1: '${(baseUnit.internalArea ?? 0).toInt()} $meterSquared',
          format2: '${(selectedUnit.internalArea ?? 0).toInt()} $meterSquared',
          higherIsBetter: true,
        ),
      );
    }

    // Rooms (higher is better)
    items
      ..add(
        _createNumericItem(
          label: getLocalizedLabel('rooms'),
          value1: baseUnit.rooms.toDouble(),
          value2: selectedUnit.rooms.toDouble(),
          format1: baseUnit.rooms.toString(),
          format2: selectedUnit.rooms.toString(),
          higherIsBetter: true,
        ),
      )
      // Bathrooms (higher is better)
      ..add(
        _createNumericItem(
          label: getLocalizedLabel('bathrooms'),
          value1: baseUnit.bathrooms.toDouble(),
          value2: selectedUnit.bathrooms.toDouble(),
          format1: baseUnit.bathrooms.toString(),
          format2: selectedUnit.bathrooms.toString(),
          higherIsBetter: true,
        ),
      )
      // Garages (higher is better)
      ..add(
        _createNumericItem(
          label: getLocalizedLabel('garages'),
          value1: baseUnit.garages.toDouble(),
          value2: selectedUnit.garages.toDouble(),
          format1: baseUnit.garages.toString(),
          format2: selectedUnit.garages.toString(),
          higherIsBetter: true,
        ),
      )
      // Build Year (higher/newer is better)
      ..add(
        _createNumericItem(
          label: getLocalizedLabel('buildYear'),
          value1: int.tryParse(baseUnit.buildYear) ?? 0,
          value2: int.tryParse(selectedUnit.buildYear) ?? 0,
          format1: baseUnit.buildYear,
          format2: selectedUnit.buildYear,
          higherIsBetter: true,
        ),
      )
      // Unit Type (no advantage)
      ..add(
        ComparisonItem(
          label: getLocalizedLabel('unitType'),
          value1: _ensureNotEmpty(
            getLocalizedValue('unitType', baseUnit.unitType.name),
          ),
          value2: _ensureNotEmpty(
            getLocalizedValue('unitType', selectedUnit.unitType.name),
          ),
          isDifferent: baseUnit.unitType.name != selectedUnit.unitType.name,
        ),
      )
      // Offer Type (no advantage)
      ..add(
        ComparisonItem(
          label: getLocalizedLabel('offerType'),
          value1: _ensureNotEmpty(
            getLocalizedValue('offerType', baseUnit.offerType),
          ),
          value2: _ensureNotEmpty(
            getLocalizedValue('offerType', selectedUnit.offerType),
          ),
          isDifferent: baseUnit.offerType != selectedUnit.offerType,
        ),
      )
      // Unit Status (no advantage)
      ..add(
        ComparisonItem(
          label: getLocalizedLabel('unitStatus'),
          value1: _ensureNotEmpty(
            getLocalizedValue('unitStatus', baseUnit.status),
          ),
          value2: _ensureNotEmpty(
            getLocalizedValue('unitStatus', selectedUnit.status),
          ),
          isDifferent: baseUnit.status != selectedUnit.status,
        ),
      )
      // Development Status (no advantage)
      ..add(
        ComparisonItem(
          label: getLocalizedLabel('developmentStatus'),
          value1: _ensureNotEmpty(
            getLocalizedValue('developmentStatus', baseUnit.developmentStatus),
          ),
          value2: _ensureNotEmpty(
            getLocalizedValue(
              'developmentStatus',
              selectedUnit.developmentStatus,
            ),
          ),
          isDifferent:
              baseUnit.developmentStatus != selectedUnit.developmentStatus,
        ),
      )
      // Compound (no advantage)
      ..add(
        ComparisonItem(
          label: getLocalizedLabel('compound'),
          value1: baseUnit.compound?.name ?? '-',
          value2: selectedUnit.compound?.name ?? '-',
          isDifferent: baseUnit.compound?.id != selectedUnit.compound?.id,
        ),
      )
      // Developer (no advantage)
      ..add(
        ComparisonItem(
          label: getLocalizedLabel('developer'),
          value1: baseUnit.developer?.name ?? '-',
          value2: selectedUnit.developer?.name ?? '-',
          isDifferent: baseUnit.developer?.id != selectedUnit.developer?.id,
        ),
      )
      // Amenities (no advantage)
      ..add(
        ComparisonItem(
          label: getLocalizedLabel('amenities'),
          value1: baseUnit.amenities.map((e) => e.name).join(', ').isEmpty
              ? '-'
              : baseUnit.amenities.map((e) => e.name).join(', '),
          value2: selectedUnit.amenities.map((e) => e.name).join(', ').isEmpty
              ? '-'
              : selectedUnit.amenities.map((e) => e.name).join(', '),
          isDifferent:
              baseUnit.amenities.length != selectedUnit.amenities.length,
        ),
      )
      // Average Rating (higher is better)
      ..add(
        _createNumericItem(
          label: getLocalizedLabel('rating'),
          value1: baseUnit.averageRating,
          value2: selectedUnit.averageRating,
          format1: baseUnit.averageRating.toStringAsFixed(1),
          format2: selectedUnit.averageRating.toStringAsFixed(1),
          higherIsBetter: true,
        ),
      )
      // Reviews Count (higher is better)
      ..add(
        _createNumericItem(
          label: getLocalizedLabel('reviewsCount'),
          value1: baseUnit.reviewsCount.toDouble(),
          value2: selectedUnit.reviewsCount.toDouble(),
          format1: baseUnit.reviewsCount.toString(),
          format2: selectedUnit.reviewsCount.toString(),
          higherIsBetter: true,
        ),
      )
      // City (no advantage)
      ..add(
        ComparisonItem(
          label: getLocalizedLabel('city'),
          value1: _ensureNotEmpty(baseUnit.city.name),
          value2: _ensureNotEmpty(selectedUnit.city.name),
          isDifferent: baseUnit.city.name != selectedUnit.city.name,
        ),
      )
      // Address (no advantage)
      ..add(
        ComparisonItem(
          label: getLocalizedLabel('address'),
          value1: _ensureNotEmpty(baseUnit.address),
          value2: _ensureNotEmpty(selectedUnit.address),
          isDifferent: baseUnit.address != selectedUnit.address,
        ),
      );

    return items;
  }

  /// Creates a numeric comparison item with advantage calculation.
  static ComparisonItem _createNumericItem({
    required String label,
    required num value1,
    required num value2,
    required String format1,
    required String format2,
    required bool higherIsBetter,
  }) {
    var advantage = ComparisonAdvantage.none;

    if (value1 != value2) {
      if (higherIsBetter) {
        advantage = value1 > value2
            ? ComparisonAdvantage.first
            : ComparisonAdvantage.second;
      } else {
        // Lower is better (e.g., price)
        advantage = value1 < value2
            ? ComparisonAdvantage.first
            : ComparisonAdvantage.second;
      }
    }

    return ComparisonItem(
      label: label,
      value1: format1,
      value2: format2,
      isDifferent: value1 != value2,
      advantage: advantage,
    );
  }

  static String _formatPrice(double price, String currency) {
    if (price >= 1000000) {
      return '${(price / 1000000).toStringAsFixed(1)}M $currency';
    } else if (price >= 1000) {
      return '${(price / 1000).toStringAsFixed(0)}K $currency';
    }
    return '${price.toInt()} $currency';
  }

  static String _ensureNotEmpty(String value) {
    if (value.trim().isEmpty) return '-';
    return value;
  }
}
