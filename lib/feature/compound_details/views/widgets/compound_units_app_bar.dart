import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/context_extensions.dart';
import '../../../../core/utils/responsive_helper.dart';
import '../../../../core/widgets/custom_back_button.dart';
import '../../viewmodels/compound_units_cubit.dart';
import '../../viewmodels/compound_units_state.dart';

class CompoundUnitsAppBar extends StatelessWidget {
  const CompoundUnitsAppBar({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocSelector<
        CompoundUnitsCubit,
        CompoundUnitsState,
        ({String name, String description, int propertiesCount})
      >(
        selector: (state) {
          final comp = state.compound;
          return (
            name: comp?.name ?? '......................',
            description: comp?.description ?? '......................',
            propertiesCount: comp?.pagination?.total ?? comp?.units.length ?? 0,
          );
        },
        builder: (context, data) {
          final name = data.name;
          final description = data.description;
          final propertiesCount = data.propertiesCount;

          var expandedHeight = 70.h;

          if (description.isNotEmpty) {
            final textStyle = context.textTheme.bodyMedium?.copyWith(
              color: context.colorScheme.onSurfaceVariant,
              height: 1.4,
            );
            final textPainter = TextPainter(
              text: TextSpan(text: description, style: textStyle),
              textDirection: TextDirection.rtl,
            )..layout(maxWidth: MediaQuery.of(context).size.width - 40.w);

            final numberOfLines = textPainter.computeLineMetrics().length;
            final descriptionHeight = (numberOfLines * 18.h) + 6.h;
            expandedHeight += descriptionHeight;
          }

          return SliverAppBar(
            expandedHeight: expandedHeight,
            pinned: true,
            elevation: 0,
            backgroundColor: context.colorScheme.surface,
            centerTitle: true,
            leading: const CustomBackButton(),
            flexibleSpace: LayoutBuilder(
              builder: (context, constraints) {
                final top = constraints.biggest.height;
                final statusBarHeight = MediaQuery.of(context).padding.top;
                final collapsedHeight = kToolbarHeight + statusBarHeight;
                final isCollapsed = top <= collapsedHeight + 5;

                return FlexibleSpaceBar(
                  centerTitle: true,
                  titlePadding: EdgeInsets.zero,
                  title: AnimatedOpacity(
                    duration: const Duration(milliseconds: 200),
                    opacity: isCollapsed ? 1.0 : 0.0,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 12.h),
                      child: Text(
                        name,
                        style: context.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: context.colorScheme.onSurface,
                        ),
                      ),
                    ),
                  ),
                  background: AnimatedOpacity(
                    duration: const Duration(milliseconds: 200),
                    opacity: isCollapsed ? 0.0 : 1.0,
                    child: Padding(
                      padding: EdgeInsets.only(top: statusBarHeight + 20.h),
                      child: Column(
                        children: [
                          Text(
                            name,
                            textAlign: TextAlign.center,
                            style: context.textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: context.colorScheme.onSurface,
                            ),
                          ),
                          if (description.isNotEmpty) ...[
                            SizedBox(height: 6.h),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: Text(
                                description,
                                textAlign: TextAlign.center,
                                style: context.textTheme.bodyMedium?.copyWith(
                                  color: context.colorScheme.onSurfaceVariant,
                                  height: 1.4,
                                ),
                              ),
                            ),
                          ],
                          SizedBox(height: 9.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.business_rounded,
                                color: context.colorScheme.primary,
                              ),
                              SizedBox(width: 4.w),
                              Text(
                                context.l10n.propertiesCount(propertiesCount),
                                style: context.textTheme.labelMedium?.copyWith(
                                  color: context.colorScheme.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      );
}
