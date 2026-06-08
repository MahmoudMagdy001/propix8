import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:propix8/core/utils/context_extensions.dart';
import 'package:propix8/core/utils/responsive_helper.dart';
import 'package:propix8/core/widgets/custom_back_button.dart';
import 'package:propix8/feature/compound_details/viewmodels/compound_units_cubit.dart';
import 'package:propix8/feature/compound_details/viewmodels/compound_units_state.dart';

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

          final statusBarHeight = MediaQuery.paddingOf(context).top;
          final screenWidth = MediaQuery.sizeOf(context).width;

          // Measure Name Height
          final namePainter = TextPainter(
            text: TextSpan(
              text: name,
              style: context.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            textDirection: Directionality.of(context),
          )..layout(maxWidth: screenWidth - 40.w);

          // Base Height: Status Bar + Name + Properties Row (30.h) + Spacings (40.h)
          var expandedHeight = statusBarHeight + namePainter.height + 70.h;

          if (description.isNotEmpty) {
            final descriptionPainter = TextPainter(
              text: TextSpan(
                text: description,
                style: context.textTheme.bodyMedium?.copyWith(height: 1.4),
              ),
              textDirection: Directionality.of(context),
            )..layout(maxWidth: screenWidth - 40.w);

            expandedHeight += descriptionPainter.height + 5.h; // Spacing
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
                final isCollapsed = top <= collapsedHeight + 5.h;

                return FlexibleSpaceBar(
                  centerTitle: true,
                  titlePadding: EdgeInsets.zero,
                  expandedTitleScale: 1.0,
                  title: AnimatedOpacity(
                    duration: const Duration(milliseconds: 200),
                    opacity: isCollapsed ? 1.0 : 0.0,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 12.h),
                      child: Text(
                        name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
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
                      padding: EdgeInsets.only(
                        top: statusBarHeight + 10.h,
                        bottom: 10.h,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
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
                          SizedBox(height: 12.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.business_rounded,
                                color: context.colorScheme.primary,
                                size: 20.w,
                              ),
                              SizedBox(width: 6.w),
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
