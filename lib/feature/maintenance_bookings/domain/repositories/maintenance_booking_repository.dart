import 'package:propix8/core/functional/result.dart';
import 'package:propix8/feature/maintenance_bookings/domain/entities/maintenance_booking_entity.dart';

abstract class MaintenanceBookingRepository {
  ResultFuture<MaintenanceBookingsDataEntity> getMaintenanceBookings({
    int page = 1,
  });

  ResultFuture<bool> deleteMaintenanceBooking(int id);

  ResultFuture<bool> updateMaintenanceBooking({
    required int id,
    required String phone,
    required String address,
    required String message,
  });
}
