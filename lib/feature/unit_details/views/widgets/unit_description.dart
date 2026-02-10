import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/context_extensions.dart';
import '../../../../core/utils/responsive_helper.dart';
import '../../viewmodels/unit_details_cubit.dart';
import '../../viewmodels/unit_details_state.dart';
import 'section_header.dart';

class UnitDescription extends StatelessWidget {
  const UnitDescription({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocSelector<UnitDetailsCubit, UnitDetailsState, String>(
        selector: (state) => state.unit?.description ?? '',
        builder: (context, description) {
          if (description.isEmpty) {
            return const SliverToBoxAdapter(child: SizedBox());
          }
          return SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SectionHeader(title: context.l10n.description),
                SizedBox(height: 8.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6.w),
                  child: Text(
                    description,
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: Colors.grey.shade600,
                      height: 1.5,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
}
