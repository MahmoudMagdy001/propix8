import 'package:propix8/core/network/dio_client.dart';
import 'package:propix8/feature/maintenance_bookings/models/maintenance_booking_model.dart';

class MaintenanceBookingService {
  MaintenanceBookingService(this._dioClient);
  final DioClient _dioClient;

  Future<MaintenanceBookingsListResponse> getMaintenanceBookings({
    int page = 1,
  }) async {
    try {
      final response = await _dioClient.get(
        'maintenance/my-bookings',
        queryParameters: {'page': page},
      );
      return MaintenanceBookingsListResponse.fromJson(
          response.data as Map<String, dynamic>);
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> deleteMaintenanceBooking(int id) async {
    try {
      final response = await _dioClient.delete('maintenance/bookings/$id');
      final data = response.data as Map<String, dynamic>;
      return (data['status'] as bool?) ?? false;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> updateMaintenanceBooking({
    required int id,
    required String phone,
    required String address,
    required String message,
  }) async {
    try {
      final response = await _dioClient.post(
        'maintenance/bookings/$id',
        data: {
          '_method': 'PUT',
          'phone': phone,
          'address': address,
          'message': message,
        },
      );
      final data = response.data as Map<String, dynamic>;
      return (data['status'] as bool?) ?? false;
    } catch (e) {
      rethrow;
    }
  }
}
