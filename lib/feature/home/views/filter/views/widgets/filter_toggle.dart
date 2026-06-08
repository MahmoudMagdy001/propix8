import 'package:flutter/material.dart';

import 'package:propix8/core/utils/context_extensions.dart';
import 'package:propix8/core/widgets/app_segmented_toggle.dart';
import 'package:propix8/feature/home/views/filter/viewmodels/filter_state.dart';

class FilterToggle extends StatelessWidget {
  const FilterToggle({
    required this.activeTab,
    required this.onTabChanged,
    super.key,
  });
  final PropertyTab? activeTab;
  final ValueChanged<PropertyTab?> onTabChanged;

  @override
  Widget build(BuildContext context) => AppSegmentedToggle<PropertyTab>(
    values: PropertyTab.values,
    activeValue: activeTab,
    onChanged: onTabChanged,
    labelBuilder: (tab) => switch (tab) {
      PropertyTab.buy => context.l10n.buy,
      PropertyTab.rent => context.l10n.rent,
    },
  );
}
