import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:propix8/core/utils/responsive_helper.dart';
import 'package:propix8/core/widgets/app_sliver_list.dart';
import 'package:propix8/feature/bookings/models/booking_model.dart';
import 'package:propix8/feature/bookings/viewmodels/booking_cubit.dart';
import 'package:propix8/feature/bookings/viewmodels/booking_state.dart';
import 'package:propix8/feature/bookings/views/widgets/booking_card.dart';

class BookingsSliverList extends StatelessWidget {
  const BookingsSliverList({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocSelector<
        BookingCubit,
        BookingState,
        ({RequestStatus status, List<BookingModel> bookings})
      >(
        selector: (state) => (status: state.status, bookings: state.bookings),
        builder: (context, data) {
          final isLoading =
              data.status == RequestStatus.loading && data.bookings.isEmpty;

          return AppSliverList<BookingModel>(
            isLoading: isLoading,
            items: isLoading ? _getPlaceholders() : data.bookings,
            emptyWidget: const SliverToBoxAdapter(child: SizedBox.shrink()),
            padding: EdgeInsets.only(
              left: 6.w,
              right: 6.w,
              top: 4.h,
              bottom: 15.h,
            ),
            itemBuilder: (context, booking) => Padding(
              padding: EdgeInsets.only(bottom: 6.h),
              child: BookingCard(booking: booking),
            ),
          );
        },
      );

  List<BookingModel> _getPlaceholders() => List.generate(
    5,
    (index) => BookingModel(
      id: 0,
      userId: 0,
      user: const BookingUserModel(
        id: 0,
        name: 'User Name',
        email: 'user@example.com',
      ),
      unit: BookingUnitModel(
        id: 0,
        title: 'Unit Title Placeholder',
        isVisible: true,
        isFavourite: false,
        address: 'Address Placeholder',
        price: 0,
        offerType: 'sale',
        area: 0,
        rooms: 0,
        bathrooms: 0,
        city: const BookingCityModel(id: 0, name: ''),
        compound: const BookingCompoundModel(id: 0, name: ''),
        developer: const BookingDeveloperModel(id: 0, name: ''),
        unitType: const BookingUnitTypeModel(id: 0, name: ''),
        mainImage: 'assets/images/logo.png',
        averageRating: 0,
        reviewsCount: 0,
        createdAt: DateTime.now(),
      ),
      name: 'Customer Name',
      email: 'customer@example.com',
      phone: '0123456789',
      date: '2024-01-01',
      time: '12:00 PM',
      status: 'pending',
      createdAt: '2024-01-01',
      updatedAt: '2024-01-01',
    ),
  );
}
