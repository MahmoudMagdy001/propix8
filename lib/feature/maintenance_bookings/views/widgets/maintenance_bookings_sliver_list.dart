import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:propix8/core/utils/context_extensions.dart';
import 'package:propix8/core/utils/responsive_helper.dart';
import 'package:propix8/core/widgets/app_sliver_list.dart';
import 'package:propix8/feature/maintenance_bookings/models/maintenance_booking_model.dart';
import 'package:propix8/feature/maintenance_bookings/viewmodels/maintenance_bookings_cubit.dart';
import 'package:propix8/feature/maintenance_bookings/viewmodels/maintenance_bookings_state.dart';
import 'package:propix8/feature/maintenance_bookings/views/widgets/maintenance_booking_card.dart';
import 'package:propix8/feature/maintenance_services/models/maintenance_service_model.dart';

class MaintenanceBookingsSliverList extends StatelessWidget {
  const MaintenanceBookingsSliverList({this.onBookingDeleted, super.key});

  /// Called when a booking is deleted, with the service ID of the deleted booking.
  final void Function(int serviceId)? onBookingDeleted;

  @override
  Widget build(BuildContext context) =>
      BlocSelector<
        MaintenanceBookingsCubit,
        MaintenanceBookingsState,
        ({RequestStatus status, List<MaintenanceBookingModel> bookings})
      >(
        selector: (state) => (status: state.status, bookings: state.bookings),
        builder: (context, data) {
          final isLoading =
              data.status == RequestStatus.loading && data.bookings.isEmpty;

          return AppSliverList<MaintenanceBookingModel>(
            isLoading: isLoading,
            items: isLoading ? _getPlaceholders(context) : data.bookings,
            emptyWidget: const SliverToBoxAdapter(child: SizedBox.shrink()),
            padding: EdgeInsets.only(
              left: 6.w,
              right: 6.w,
              top: 4.h,
              bottom: 15.h,
            ),
            itemBuilder: (context, booking) => Padding(
              padding: EdgeInsets.only(bottom: 6.h),
              child: MaintenanceBookingCard(
                booking: booking,
                onDeleted: onBookingDeleted,
              ),
            ),
          );
        },
      );

  List<MaintenanceBookingModel> _getPlaceholders(BuildContext context) =>
      List.generate(
        5,
        (index) => MaintenanceBookingModel(
          id: 0,
          service: MaintenanceServiceModel(
            id: 0,
            title: context.l10n.loading,
            image: 'assets/images/logo.png',
            category: '',
            createdAt: '',
          ),
          address: context.l10n.address,
          phone: '',
          message: context.l10n.message,
          status: 'pending',
          createdAt: DateTime.now().toString(),
        ),
      );
}
