import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:propix8/core/di/locator.dart';
import 'package:propix8/core/services/booking_event_service.dart';
import 'package:propix8/feature/auth/models/auth_model.dart';
import 'package:propix8/feature/auth/viewmodels/auth_cubit.dart';
import 'package:propix8/feature/bookings/repositories/booking_repository.dart';
import 'package:propix8/feature/maintenance_bookings/repositories/maintenance_booking_repository.dart';
import 'package:propix8/feature/profile/repositories/user_profile_repository.dart';
import 'package:propix8/feature/profile/viewmodels/user_profile_state.dart';

class UserProfileCubit extends Cubit<UserProfileState> {
  UserProfileCubit(
    this._repository,
    this._bookingRepository,
    this._maintenanceBookingRepository,
    this._bookingEventService,
  ) : super(const UserProfileState()) {
    _bookingSubscription = _bookingEventService.bookingChanged.listen((_) {
      fetchBookingCounts();
    });
  }

  final UserProfileRepository _repository;
  final BookingRepository _bookingRepository;
  final MaintenanceBookingRepository _maintenanceBookingRepository;
  final BookingEventService _bookingEventService;
  StreamSubscription? _bookingSubscription;

  Future<void> loadProfile() async {
    emit(state.copyWith(status: UserProfileStatus.loading));
    final result = await _repository.getProfile();
    if (isClosed) return;
    result.fold(
      (error) => emit(
        state.copyWith(status: UserProfileStatus.failure, errorMessage: error),
      ),
      (user) async {
        locator<AuthCubit>().updateUser(user);
        emit(state.copyWith(status: UserProfileStatus.success, user: user));
        await fetchBookingCounts();
      },
    );
  }

  Future<void> fetchBookingCounts() async {
    try {
      final propertyBookings = await _bookingRepository.getBookings();
      final maintenanceBookings = await _maintenanceBookingRepository
          .getMaintenanceBookings();

      final pCount =
          propertyBookings.pagination?.total ?? propertyBookings.data.length;
      final sCount =
          maintenanceBookings.pagination?.total ??
          maintenanceBookings.data.length;

      emit(
        state.copyWith(
          propertyBookingCount: pCount,
          serviceBookingCount: sCount,
        ),
      );
    } catch (e) {
      // Failed silently
    }
  }

  void setUser(User user) {
    emit(state.copyWith(user: user));
    fetchBookingCounts();
  }

  Future<void> updateProfile(
    Map<String, dynamic> data, {
    String? avatarPath,
  }) async {
    emit(state.copyWith(status: UserProfileStatus.loading));
    final result = await _repository.updateProfile(
      data,
      avatarPath: avatarPath,
    );
    if (isClosed) return;
    result.fold(
      (error) => emit(
        state.copyWith(status: UserProfileStatus.failure, errorMessage: error),
      ),
      (user) {
        locator<AuthCubit>().updateUser(user);
        emit(state.copyWith(status: UserProfileStatus.updated, user: user));
      },
    );
  }

  Future<void> fetchCities() async {
    final result = await _repository.getCities();
    if (isClosed) return;
    result.fold(
      (error) => emit(
        state.copyWith(status: UserProfileStatus.failure, errorMessage: error),
      ),
      (cities) => emit(state.copyWith(cities: cities)),
    );
  }

  Future<void> deleteProfile() async {
    emit(state.copyWith(status: UserProfileStatus.loading));
    final result = await _repository.deleteProfile();
    if (isClosed) return;
    result.fold(
      (error) => emit(
        state.copyWith(status: UserProfileStatus.failure, errorMessage: error),
      ),
      (_) => emit(state.copyWith(status: UserProfileStatus.accountDeleted)),
    );
  }

  @override
  Future<void> close() {
    _bookingSubscription?.cancel();
    return super.close();
  }
}
