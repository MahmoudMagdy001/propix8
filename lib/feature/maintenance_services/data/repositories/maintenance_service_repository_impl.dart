import 'package:dio/dio.dart';
import 'package:propix8/core/error/failures.dart';
import 'package:propix8/core/functional/result.dart';
import 'package:propix8/core/services/booking_event_service.dart';
import 'package:propix8/feature/maintenance_services/data/datasources/maintenance_service_remote_data_source.dart';
import 'package:propix8/feature/maintenance_services/data/models/maintenance_service_dto.dart';
import 'package:propix8/feature/maintenance_services/domain/entities/maintenance_service_entity.dart';
import 'package:propix8/feature/maintenance_services/domain/repositories/maintenance_service_repository.dart';

class MaintenanceServiceRepositoryImpl implements MaintenanceServiceRepository {
  const MaintenanceServiceRepositoryImpl(
    this._remoteDataSource,
    this._bookingEventService,
  );

  final MaintenanceServiceRemoteDataSource _remoteDataSource;
  final BookingEventService _bookingEventService;

  @override
  ResultFuture<MaintenanceServicesDataEntity> getMaintenanceServices() async {
    try {
      final response = await _remoteDataSource.getMaintenanceServices();
      return Right(response.data.toEntity());
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Server error occurred', e.response?.statusCode));
    } on Object catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }

  @override
  ResultFuture<bool> bookMaintenance({
    required int maintenanceServiceId,
    required String phone,
    required String address,
    required String message,
  }) async {
    try {
      final response = await _remoteDataSource.bookMaintenance(
        maintenanceServiceId: maintenanceServiceId,
        phone: phone,
        address: address,
        message: message,
      );
      if (response.status) {
        _bookingEventService.notifyBookingChanged();
        return const Right(true);
      }
      return Left(ServerFailure(response.message));
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Server error occurred', e.response?.statusCode));
    } on Object catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }
}
