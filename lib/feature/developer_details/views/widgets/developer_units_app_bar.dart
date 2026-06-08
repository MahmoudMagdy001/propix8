import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:propix8/core/utils/context_extensions.dart';
import 'package:propix8/core/utils/responsive_helper.dart';
import 'package:propix8/core/widgets/custom_back_button.dart';
import 'package:propix8/feature/developer_details/viewmodels/developer_units_cubit.dart';
import 'package:propix8/feature/developer_details/viewmodels/developer_units_state.dart';
import 'package:propix8/feature/developer_details/views/widgets/developer_units_contact_buttons.dart';
import 'package:propix8/feature/home/viewmodels/home_state.dart';

class DeveloperUnitsAppBar extends StatelessWidget {
  const DeveloperUnitsAppBar({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocSelector<
        DeveloperUnitsCubit,
        DeveloperUnitsState,
        ({
          String name,
          String logo,
          String address,
          int propertiesCount,
          String phone,
          String email,
          HomeRequestStatus status,
        })
      >(
        selector: (state) {
          final dev = state.developer;
          return (
            name: dev?.name ?? '......................',
            logo: dev?.logo ?? '',
            address: dev?.address ?? '',
            propertiesCount: dev?.pagination?.total ?? dev?.units.length ?? 0,
            phone: dev?.phone ?? '......................',
            email: dev?.email ?? '......................',
            status: state.status,
          );
        },
        builder: (context, data) {
          final name = data.name;
          final logo = data.logo;
          final address = data.address;
          final propertiesCount = data.propertiesCount;
          final phone = data.phone;
          final email = data.email;

          if (data.status != HomeRequestStatus.loading &&
              data.name == '......................') {
            return const SliverAppBar(
              pinned: true,
              leading: CustomBackButton(),
            );
          }

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

          // Base Height: Status Bar + Logo (100.w) + Name + Property Row (24.h) + Buttons Row (48.h) + Spacings
          var expandedHeight =
              statusBarHeight + 100.w + namePainter.height + 100.h;

          if (address.isNotEmpty) {
            final addressPainter = TextPainter(
              text: TextSpan(
                text: address,
                style: context.textTheme.labelMedium,
              ),
              textDirection: Directionality.of(context),
            )..layout(maxWidth: screenWidth - 64.w);

            expandedHeight += addressPainter.height + 6.h;
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
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 32.w,
                            height: 32.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey.shade50,
                              border: Border.all(color: Colors.grey.shade100),
                            ),
                            child: ClipOval(
                              child: logo.isNotEmpty
                                  ? CachedNetworkImage(
                                      memCacheHeight: 32 * 3,
                                      imageUrl: logo,
                                      errorWidget: (context, url, error) =>
                                          const Icon(Icons.broken_image),
                                      fit: BoxFit.cover,
                                    )
                                  : Container(color: Colors.grey.shade200),
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Flexible(
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
                        ],
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
                          // Expanded Logo
                          SizedBox(
                            width: 100.w,
                            height: 100.w,
                            child: ClipOval(
                              child: CachedNetworkImage(
                                memCacheHeight: 100 * 2,
                                imageUrl: logo,
                                fit: BoxFit.cover,
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.broken_image),
                              ),
                            ),
                          ),
                          SizedBox(height: 6.h),
                          // Expanded Name
                          Text(
                            name,
                            style: context.textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: context.colorScheme.onSurface,
                            ),
                          ),
                          SizedBox(height: 6.h),
                          // Address
                          if (address.isNotEmpty)
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 32.w),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.location_on_outlined,
                                    color: context.colorScheme.primary,
                                  ),
                                  SizedBox(width: 4.w),
                                  Flexible(
                                    child: Text(
                                      address,
                                      textAlign: TextAlign.center,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: context.textTheme.labelMedium
                                          ?.copyWith(
                                            color: context
                                                .colorScheme
                                                .onSurfaceVariant,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          SizedBox(height: 6.h),
                          // Property Count
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
                          SizedBox(height: 12.h),
                          DeveloperUnitsContactButtons(
                            phone: phone,
                            email: email,
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
