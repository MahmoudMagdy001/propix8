import 'package:propix8/core/functional/result.dart';
import 'package:propix8/feature/maintenance_bookings/domain/entities/maintenance_booking_entity.dart';
import 'package:propix8/feature/maintenance_bookings/domain/repositories/maintenance_booking_repository.dart';

class GetMaintenanceBookingsUseCase {
  GetMaintenanceBookingsUseCase(this._repository);

  final MaintenanceBookingRepository _repository;

  ResultFuture<MaintenanceBookingsDataEntity> call({int page = 1}) =>
      _repository.getMaintenanceBookings(page: page);
}
