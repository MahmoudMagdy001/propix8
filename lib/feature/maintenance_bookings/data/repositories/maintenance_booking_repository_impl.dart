import 'package:dio/dio.dart';
import 'package:propix8/core/error/failures.dart';
import 'package:propix8/core/functional/result.dart';
import 'package:propix8/core/services/booking_event_service.dart';
import 'package:propix8/feature/maintenance_bookings/data/datasources/maintenance_booking_remote_data_source.dart';
import 'package:propix8/feature/maintenance_bookings/domain/entities/maintenance_booking_entity.dart';
import 'package:propix8/feature/maintenance_bookings/domain/repositories/maintenance_booking_repository.dart';

class MaintenanceBookingRepositoryImpl implements MaintenanceBookingRepository {
  MaintenanceBookingRepositoryImpl(
    this._remoteDataSource,
    this._bookingEventService,
  );

  final MaintenanceBookingRemoteDataSource _remoteDataSource;
  final BookingEventService _bookingEventService;

  @override
  ResultFuture<MaintenanceBookingsDataEntity> getMaintenanceBookings({
    int page = 1,
  }) async {
    try {
      final response = await _remoteDataSource.getMaintenanceBookings(page: page);
      return Right(response.toEntity());
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Server error occurred', e.response?.statusCode));
    } on Object catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }

  @override
  ResultFuture<bool> deleteMaintenanceBooking(int id) async {
    try {
      final success = await _remoteDataSource.deleteMaintenanceBooking(id);
      if (success) {
        _bookingEventService.notifyBookingChanged();
        return const Right(true);
      }
      return const Left(ServerFailure('Failed to delete booking'));
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Server error occurred', e.response?.statusCode));
    } on Object catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }

  @override
  ResultFuture<bool> updateMaintenanceBooking({
    required int id,
    required String phone,
    required String address,
    required String message,
  }) async {
    try {
      final success = await _remoteDataSource.updateMaintenanceBooking(
        id: id,
        phone: phone,
        address: address,
        message: message,
      );
      if (success) {
        return const Right(true);
      }
      return const Left(ServerFailure('Failed to update booking'));
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Server error occurred', e.response?.statusCode));
    } on Object catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }
}
