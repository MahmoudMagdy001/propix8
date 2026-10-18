import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:propix8/core/utils/responsive_helper.dart';
import 'package:propix8/core/widgets/app_sliver_list.dart';
import 'package:propix8/feature/bookings/domain/entities/booking_entity.dart';
import 'package:propix8/feature/bookings/presentation/bloc/booking_bloc.dart';
import 'package:propix8/feature/bookings/presentation/bloc/booking_state.dart';
import 'package:propix8/feature/bookings/presentation/widgets/booking_card.dart';

class BookingsSliverList extends StatelessWidget {
  const BookingsSliverList({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocSelector<
        BookingBloc,
        BookingState,
        ({RequestStatus status, List<BookingEntity> bookings})
      >(
        selector: (state) => (status: state.status, bookings: state.bookings),
        builder: (context, data) {
          final isLoading =
              data.status == RequestStatus.loading && data.bookings.isEmpty;

          return AppSliverList<BookingEntity>(
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

  List<BookingEntity> _getPlaceholders() => List.generate(
    5,
    (index) => BookingEntity(
      id: 0,
      userId: 0,
      user: const BookingUserEntity(
        id: 0,
        name: 'User Name',
        email: 'user@example.com',
      ),
      unit: BookingUnitEntity(
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
        city: const BookingCityEntity(id: 0, name: ''),
        compound: const BookingCompoundEntity(id: 0, name: ''),
        developer: const BookingDeveloperEntity(id: 0, name: ''),
        unitType: const BookingUnitTypeEntity(id: 0, name: ''),
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
