import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:propix8/core/router/app_routes.dart';
import 'package:propix8/core/utils/context_extensions.dart';
import 'package:propix8/core/utils/responsive_helper.dart';
import 'package:propix8/feature/unit_details/models/unit_details_model.dart';
import 'package:propix8/feature/unit_details/viewmodels/unit_details_cubit.dart';
import 'package:propix8/feature/unit_details/viewmodels/unit_details_state.dart';
import 'package:propix8/feature/unit_details/views/widgets/section_header.dart';
import 'package:url_launcher/url_launcher.dart';

class UnitDeveloper extends StatelessWidget {
  const UnitDeveloper({super.key});

  @override
  Widget build(
    BuildContext context,
  ) => BlocSelector<UnitDetailsCubit, UnitDetailsState, DeveloperModel?>(
    selector: (state) => state.unit?.developer,
    builder: (context, developer) {
      if (developer == null) return const SliverToBoxAdapter(child: SizedBox());
      return SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionHeader(title: context.l10n.developer),
            SizedBox(height: 8.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.w),
              child: InkWell(
                onTap: () async {
                  await context.pushNamed(
                    AppRoutes.developerUnits,
                    pathParameters: {'id': developer.id.toString()},
                  );
                },
                borderRadius: BorderRadius.circular(12.r),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16.r),
                  decoration: BoxDecoration(
                    color: context.theme.cardTheme.color,

                    borderRadius: BorderRadius.circular(12.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.r),
                            child: CachedNetworkImage(
                              memCacheHeight: 60 * 3,
                              imageUrl: developer.logo,
                              width: 60.w,
                              height: 60.h,
                              fit: BoxFit.contain,
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.broken_image),
                            ),
                          ),
                          SizedBox(width: 16.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  developer.name,
                                  style: context.textTheme.titleMedium
                                      ?.copyWith(fontWeight: FontWeight.bold),
                                ),
                                if (developer.address.isNotEmpty) ...[
                                  SizedBox(height: 4.h),
                                  Text(
                                    developer.address,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: context.textTheme.labelSmall
                                        ?.copyWith(color: Colors.grey.shade500),
                                  ),
                                ],
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.h),
                      Row(
                        children: [
                          if (developer.phone.isNotEmpty)
                            Expanded(
                              child: OutlinedButton.icon(
                                onPressed: () async {
                                  final launchUri = Uri.parse(
                                    'tel:${developer.phone}',
                                  );
                                  if (await canLaunchUrl(launchUri)) {
                                    await launchUrl(
                                      launchUri,
                                      mode: LaunchMode.externalApplication,
                                    );
                                  }
                                },
                                icon: Icon(Icons.phone_outlined, size: 16.sp),
                                label: Text(context.l10n.phone),
                                style: OutlinedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(vertical: 8.h),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                ),
                              ),
                            ),
                          if (developer.phone.isNotEmpty &&
                              developer.email.isNotEmpty)
                            SizedBox(width: 8.w),
                          if (developer.email.isNotEmpty)
                            Expanded(
                              child: OutlinedButton.icon(
                                onPressed: () async {
                                  final launchUri = Uri.parse(
                                    'mailto:${developer.email}',
                                  );
                                  if (await canLaunchUrl(launchUri)) {
                                    await launchUrl(
                                      launchUri,
                                      mode: LaunchMode.externalApplication,
                                    );
                                  }
                                },
                                icon: Icon(Icons.email_outlined, size: 16.sp),
                                label: Text(context.l10n.email),
                                style: OutlinedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(vertical: 8.h),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
