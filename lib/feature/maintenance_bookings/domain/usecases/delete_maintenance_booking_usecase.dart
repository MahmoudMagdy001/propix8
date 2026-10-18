import 'package:propix8/core/functional/result.dart';
import 'package:propix8/feature/maintenance_bookings/domain/repositories/maintenance_booking_repository.dart';

class DeleteMaintenanceBookingUseCase {
  DeleteMaintenanceBookingUseCase(this._repository);

  final MaintenanceBookingRepository _repository;

  ResultFuture<bool> call(int id) =>
      _repository.deleteMaintenanceBooking(id);
}
