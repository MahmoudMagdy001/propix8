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
  MaintenanceServiceRepositoryImpl(this._serviceSource);
  final MaintenanceServiceSource _serviceSource;

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
      return await _serviceSource.bookMaintenance(
        maintenanceServiceId: maintenanceServiceId,
        phone: phone,
        address: address,
        message: message,
      );
    } catch (e) {
      rethrow;
    }
  }
}
