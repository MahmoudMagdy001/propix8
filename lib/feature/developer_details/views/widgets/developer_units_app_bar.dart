import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/context_extensions.dart';
import '../../../../core/utils/responsive_helper.dart';
import '../../../../core/widgets/custom_back_button.dart';
import '../../../home/viewmodels/home_state.dart';
import '../../viewmodels/developer_units_cubit.dart';
import '../../viewmodels/developer_units_state.dart';
import 'developer_units_contact_buttons.dart';

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

          return SliverAppBar(
            expandedHeight: 230.h,
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
                          Text(
                            name,
                            style: context.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: context.colorScheme.onSurface,
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
                      padding: EdgeInsets.only(top: statusBarHeight + 10.h),
                      child: Column(
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
