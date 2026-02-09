import '../../../core/services/booking_event_service.dart';
import '../models/maintenance_booking_model.dart';
import '../services/maintenance_booking_service.dart';

abstract class MaintenanceBookingRepository {
  Future<MaintenanceBookingsListResponse> getMaintenanceBookings({
    int page = 1,
  });
  Future<bool> deleteMaintenanceBooking(int id);
  Future<bool> updateMaintenanceBooking({
    required int id,
    required String phone,
    required String address,
    required String message,
  });
}

class MaintenanceBookingRepositoryImpl implements MaintenanceBookingRepository {
  MaintenanceBookingRepositoryImpl(this._service, this._bookingEventService);
  final MaintenanceBookingService _service;
  final BookingEventService _bookingEventService;

  @override
  Future<MaintenanceBookingsListResponse> getMaintenanceBookings({
    int page = 1,
  }) async {
    try {
      return await _service.getMaintenanceBookings(page: page);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> deleteMaintenanceBooking(int id) async {
    try {
      final success = await _service.deleteMaintenanceBooking(id);
      if (success) {
        _bookingEventService.notifyBookingChanged();
      }
      return success;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> updateMaintenanceBooking({
    required int id,
    required String phone,
    required String address,
    required String message,
  }) async {
    try {
      return await _service.updateMaintenanceBooking(
        id: id,
        phone: phone,
        address: address,
        message: message,
      );
    } catch (e) {
      rethrow;
    }
  }
}
