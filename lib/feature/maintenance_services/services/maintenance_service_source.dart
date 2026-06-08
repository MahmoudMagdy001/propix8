import 'package:propix8/core/network/dio_client.dart';
import 'package:propix8/feature/maintenance_services/models/maintenance_booking_model.dart';
import 'package:propix8/feature/maintenance_services/models/maintenance_service_model.dart';

class MaintenanceServiceSource {
  MaintenanceServiceSource(this._dioClient);
  final DioClient _dioClient;

  Future<MaintenanceServicesResponse> getMaintenanceServices() async {
    try {
      final response = await _dioClient.get('maintenance-services');
      return MaintenanceServicesResponse.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<MaintenanceBookingResponse> bookMaintenance({
    required int maintenanceServiceId,
    required String phone,
    required String address,
    required String message,
  }) async {
    try {
      final response = await _dioClient.post(
        'maintenance/bookings',
        data: {
          'maintenance_service_id': maintenanceServiceId,
          'phone': phone,
          'address': address,
          'message': message,
        },
      );
      return MaintenanceBookingResponse.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
