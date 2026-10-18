import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:propix8/core/utils/context_extensions.dart';
import 'package:propix8/core/utils/responsive_helper.dart';
import 'package:propix8/core/utils/snackbar_utils.dart';
import 'package:propix8/core/widgets/app_confirmation_dialog.dart';
import 'package:propix8/feature/bookings/domain/entities/booking_entity.dart';
import 'package:propix8/feature/bookings/presentation/bloc/booking_bloc.dart';
import 'package:propix8/feature/bookings/presentation/bloc/booking_event.dart';

class BookingImage extends StatelessWidget {
  const BookingImage({required this.booking, super.key});

  final BookingEntity booking;

  @override
  Widget build(BuildContext context) {
    if (booking.unit.mainImage.isEmpty) return const SizedBox.shrink();

    return Stack(
      children: [
        CachedNetworkImage(
          memCacheHeight: 180 * 3,
          imageUrl: booking.unit.mainImage,
          height: 180.h,
          width: double.infinity,
          fit: BoxFit.cover,
          errorWidget: (context, url, error) => const Icon(Icons.broken_image),
        ),
        Padding(
          padding: EdgeInsets.all(8.r),
          child: Align(
            alignment: AlignmentDirectional.topEnd,
            child: GestureDetector(
              onTap: () => _showDeleteDialog(context),
              child: Container(
                padding: EdgeInsets.all(4.w),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.5),
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.close, color: Colors.white, size: 20.sp),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _showDeleteDialog(BuildContext context) async {
    final confirmed = await showAppConfirmationDialog(
      context,
      title: context.l10n.deleteBooking,
      message: context.l10n.deleteBookingConfirmation,
      confirmText: context.l10n.delete,
      actionType: DialogActionType.destructive,
    );

    if ((confirmed ?? false) && context.mounted) {
      context.read<BookingBloc>().add(
        BookingEvent.bookingDeleted(bookingId: booking.id),
      );
      if (context.mounted) {
        context.showInfoSnackbar(context.l10n.bookingDeletedSuccess);
      }
    }
  }
}
