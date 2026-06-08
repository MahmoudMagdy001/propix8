import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:propix8/core/router/app_routes.dart';
import 'package:propix8/core/utils/context_extensions.dart';
import 'package:propix8/core/utils/responsive_helper.dart';
import 'package:propix8/feature/bookings/models/booking_model.dart';
import 'package:propix8/feature/bookings/views/widgets/booking_actions.dart';
import 'package:propix8/feature/bookings/views/widgets/booking_details.dart';
import 'package:propix8/feature/bookings/views/widgets/booking_image.dart';
import 'package:propix8/feature/bookings/views/widgets/booking_status_badge.dart';

class BookingCard extends StatelessWidget {
  const BookingCard({required this.booking, super.key});

  final BookingModel booking;

  @override
  Widget build(BuildContext context) => Material(
    color: context.theme.cardTheme.color,
    borderRadius: BorderRadius.circular(12.r),
    clipBehavior: Clip.antiAlias,
    child: InkWell(
      onTap: () => context.pushNamed(
        AppRoutes.propertyDetails,
        pathParameters: {'id': booking.unit.id.toString()},
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BookingImage(booking: booking),
          BookingDetails(booking: booking),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BookingStatusBadge(status: booking.status),
                BookingActions(booking: booking),
                SizedBox(height: 16.h),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
