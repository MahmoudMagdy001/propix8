import 'package:propix8/core/functional/result.dart';
import 'package:propix8/feature/maintenance_bookings/domain/repositories/maintenance_booking_repository.dart';

class UpdateMaintenanceBookingParams {
  const UpdateMaintenanceBookingParams({
    required this.id,
    required this.phone,
    required this.address,
    required this.message,
  });

  final int id;
  final String phone;
  final String address;
  final String message;
}

class UpdateMaintenanceBookingUseCase {
  UpdateMaintenanceBookingUseCase(this._repository);

  final MaintenanceBookingRepository _repository;

  ResultFuture<bool> call(UpdateMaintenanceBookingParams params) =>
      _repository.updateMaintenanceBooking(
        id: params.id,
        phone: params.phone,
        address: params.address,
        message: params.message,
      );
}
