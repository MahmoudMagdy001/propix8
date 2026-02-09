import '../../../core/services/booking_event_service.dart';
import '../models/maintenance_booking_model.dart';
import '../models/maintenance_service_model.dart';
import '../services/maintenance_service_source.dart';

abstract class MaintenanceServiceRepository {
  Future<MaintenanceServicesResponse> getMaintenanceServices();
  Future<MaintenanceBookingResponse> bookMaintenance({
    required int maintenanceServiceId,
    required String phone,
    required String address,
    required String message,
  });
}

class MaintenanceServiceRepositoryImpl implements MaintenanceServiceRepository {
  MaintenanceServiceRepositoryImpl(
    this._serviceSource,
    this._bookingEventService,
  );
  final MaintenanceServiceSource _serviceSource;
  final BookingEventService _bookingEventService;

  @override
  Future<MaintenanceServicesResponse> getMaintenanceServices() async {
    try {
      return await _serviceSource.getMaintenanceServices();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<MaintenanceBookingResponse> bookMaintenance({
    required int maintenanceServiceId,
    required String phone,
    required String address,
    required String message,
  }) async {
    try {
      final response = await _serviceSource.bookMaintenance(
        maintenanceServiceId: maintenanceServiceId,
        phone: phone,
        address: address,
        message: message,
      );
      _bookingEventService.notifyBookingChanged();
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
