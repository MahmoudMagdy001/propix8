import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/context_extensions.dart';
import '../../../../core/utils/responsive_helper.dart';
import '../../../../core/widgets/app_modal_sheet.dart';
import '../../models/maintenance_service_model.dart';
import 'maintenance_booking_form.dart';

class ServiceCard extends StatelessWidget {
  const ServiceCard({
    required this.service,
    this.isBooked = false,
    this.onBooked,
    super.key,
  });
  final MaintenanceServiceModel service;
  final bool isBooked;
  final VoidCallback? onBooked;

  @override
  Widget build(BuildContext context) => Container(
    decoration: BoxDecoration(
      color: context.theme.cardTheme.color,
      borderRadius: BorderRadius.circular(12.r),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(12.r)),
            child: CachedNetworkImage(
              memCacheHeight: 100 * 3,
              imageUrl: service.image,
              fit: BoxFit.cover,
              errorWidget: (context, url, error) =>
                  const Icon(Icons.broken_image),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.w),
          child: Column(
            children: [
              Text(
                service.title,
                style: context.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 8.h),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: isBooked
                      ? null
                      : () {
                          showAppModalSheet(
                            context: context,
                            title: context.l10n.bookNow,
                            child: MaintenanceBookingForm(
                              serviceId: service.id,
                              serviceName: service.title,
                              onBookingSuccess: onBooked,
                            ),
                          );
                        },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 8.h),
                  ),
                  child: Text(
                    isBooked
                        ? context.l10n.serviceBooked
                        : context.l10n.bookNow,
                    style: TextStyle(fontSize: 12.sp),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
