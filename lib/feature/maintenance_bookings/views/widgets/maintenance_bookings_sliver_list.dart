import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/context_extensions.dart';
import '../../../../core/utils/responsive_helper.dart';
import '../../../../core/widgets/app_sliver_list.dart';
import '../../../maintenance_services/models/maintenance_service_model.dart';
import '../../models/maintenance_booking_model.dart';
import '../../viewmodels/maintenance_bookings_cubit.dart';
import '../../viewmodels/maintenance_bookings_state.dart';
import 'maintenance_booking_card.dart';

class MaintenanceBookingsSliverList extends StatelessWidget {
  const MaintenanceBookingsSliverList({super.key});

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
              child: MaintenanceBookingCard(booking: booking),
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
