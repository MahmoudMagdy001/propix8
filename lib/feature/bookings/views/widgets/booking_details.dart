import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:propix8/core/utils/context_extensions.dart';
import 'package:propix8/core/utils/date_time_utils.dart';
import 'package:propix8/core/utils/responsive_helper.dart';
import 'package:propix8/feature/bookings/models/booking_model.dart';

class BookingDetails extends StatelessWidget {
  const BookingDetails({required this.booking, super.key});

  final BookingModel booking;

  @override
  Widget build(BuildContext context) => Padding(
    padding: EdgeInsets.all(16.w),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Unit Title
        Text(
          booking.unit.title,
          style: context.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: 8.h),

        // Address
        if (booking.unit.address.isNotEmpty) ...[
          Row(
            children: [
              Icon(Icons.location_on, size: 16.sp, color: Colors.grey),
              SizedBox(width: 4.w),
              Expanded(
                child: Text(
                  booking.unit.address,
                  style: context.textTheme.bodySmall?.copyWith(
                    color: Colors.grey,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
        ],

        // Divider
        Divider(height: 1.h),
        SizedBox(height: 12.h),

        // Booking Info
        _buildInfoRow(context, Icons.person, context.l10n.name, booking.name),
        SizedBox(height: 8.h),
        _buildInfoRow(context, Icons.email, context.l10n.email, booking.email),
        SizedBox(height: 8.h),
        _buildInfoRow(context, Icons.phone, context.l10n.phone, booking.phone),
        SizedBox(height: 8.h),
        _buildInfoRow(
          context,
          Icons.calendar_today,
          booking.status == 'reschedule_admin'
              ? context.l10n.suggestedDate
              : context.l10n.date,
          _formatDate(booking.date, context),
        ),
        SizedBox(height: 8.h),
        _buildInfoRow(
          context,
          Icons.access_time,
          booking.status == 'reschedule_admin'
              ? context.l10n.suggestedTime
              : context.l10n.time,
          DateTimeUtils.formatTimeForDisplay(
            DateTimeUtils.parseApiTime(booking.time),
          ),
        ),

        // Notes (Admin)
        if (booking.notes != null && booking.notes!.isNotEmpty) ...[
          SizedBox(height: 12.h),
          Divider(height: 1.h),
          SizedBox(height: 12.h),
          Text(
            '${context.l10n.adminNotes}:',
            style: context.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4.h),
          Text(booking.notes!, style: context.textTheme.bodySmall),
        ],

        // User Message
        if (booking.userMessage != null && booking.userMessage!.isNotEmpty) ...[
          SizedBox(height: 12.h),
          if (booking.notes == null || booking.notes!.isEmpty)
            Divider(height: 1.h),
          SizedBox(height: 12.h),
          Text(
            '${context.l10n.yourMessage}:',
            style: context.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4.h),
          Text(booking.userMessage!, style: context.textTheme.bodySmall),
        ],
      ],
    ),
  );

  Widget _buildInfoRow(
    BuildContext context,
    IconData icon,
    String label,
    String value,
  ) => Row(
    children: [
      Icon(icon, size: 16.sp, color: Colors.grey),
      SizedBox(width: 8.w),
      Text(
        '$label: ',
        style: context.textTheme.bodySmall?.copyWith(
          color: Colors.grey,
          fontWeight: FontWeight.w500,
        ),
      ),
      Expanded(
        child: Text(
          value,
          style: context.textTheme.bodySmall,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    ],
  );

  String _formatDate(String date, BuildContext context) {
    try {
      final parsedDate = DateTime.parse(date);
      return DateFormat(
        'yyyy/MM/dd',
        context.l10n.localeName,
      ).format(parsedDate);
    } catch (e) {
      return date;
    }
  }
}
