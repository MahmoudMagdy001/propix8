import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:propix8/core/utils/context_extensions.dart';
import 'package:propix8/feature/compound_details/viewmodels/compound_units_cubit.dart';
import 'package:propix8/feature/compound_details/viewmodels/compound_units_state.dart';

class CompoundUnitsError extends StatelessWidget {
  const CompoundUnitsError({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocSelector<CompoundUnitsCubit, CompoundUnitsState, String?>(
        selector: (state) => state.errorMessage,
        builder: (context, errorMessage) => SliverFillRemaining(
          child: Center(child: Text(errorMessage ?? context.l10n.error)),
        ),
      );
}
