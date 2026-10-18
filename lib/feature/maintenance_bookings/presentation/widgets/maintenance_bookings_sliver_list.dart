import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:propix8/core/utils/context_extensions.dart';
import 'package:propix8/core/utils/responsive_helper.dart';
import 'package:propix8/core/widgets/app_sliver_list.dart';
import 'package:propix8/feature/maintenance_bookings/domain/entities/maintenance_booking_entity.dart';
import 'package:propix8/feature/maintenance_bookings/presentation/bloc/maintenance_bookings_bloc.dart';
import 'package:propix8/feature/maintenance_bookings/presentation/bloc/maintenance_bookings_state.dart';
import 'package:propix8/feature/maintenance_bookings/presentation/widgets/maintenance_booking_card.dart';
import 'package:propix8/feature/maintenance_services/domain/entities/maintenance_service_entity.dart';

class MaintenanceBookingsSliverList extends StatelessWidget {
  const MaintenanceBookingsSliverList({this.onBookingDeleted, super.key});

  final void Function(int serviceId)? onBookingDeleted;

  @override
  Widget build(BuildContext context) =>
      BlocSelector<
        MaintenanceBookingsBloc,
        MaintenanceBookingsState,
        ({MaintenanceBookingsStatus status, List<MaintenanceBookingEntity> bookings})
      >(
        selector: (state) => (status: state.status, bookings: state.bookings),
        builder: (context, data) {
          final isLoading =
              data.status == MaintenanceBookingsStatus.loading && data.bookings.isEmpty;

          return AppSliverList<MaintenanceBookingEntity>(
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

  List<MaintenanceBookingEntity> _getPlaceholders(BuildContext context) =>
      List.generate(
        5,
        (index) => MaintenanceBookingEntity(
          id: 0,
          service: MaintenanceServiceEntity(
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
