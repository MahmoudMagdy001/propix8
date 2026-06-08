import 'package:flutter/material.dart';

import 'package:propix8/core/utils/context_extensions.dart';
import 'package:propix8/core/widgets/app_segmented_toggle.dart';
import 'package:propix8/feature/home/views/filter/viewmodels/filter_state.dart';

class DevelopmentStatusToggle extends StatelessWidget {
  const DevelopmentStatusToggle({
    required this.selectedStatus,
    required this.onStatusChanged,
    super.key,
  });
  final DevelopmentStatus? selectedStatus;
  final ValueChanged<DevelopmentStatus?> onStatusChanged;

  @override
  Widget build(BuildContext context) => AppSegmentedToggle<DevelopmentStatus>(
    values: DevelopmentStatus.values,
    activeValue: selectedStatus,
    onChanged: onStatusChanged,
    labelBuilder: (status) => switch (status) {
      DevelopmentStatus.primary => context.l10n.primary,
      DevelopmentStatus.resale => context.l10n.resale,
    },
  );
}
