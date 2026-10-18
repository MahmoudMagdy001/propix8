import 'package:propix8/core/network/dio_client.dart';
import 'package:propix8/feature/maintenance_bookings/data/models/maintenance_booking_dto.dart';

abstract class MaintenanceBookingRemoteDataSource {
  Future<MaintenanceBookingsListResponseDto> getMaintenanceBookings({
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

class MaintenanceBookingRemoteDataSourceImpl
    implements MaintenanceBookingRemoteDataSource {
  MaintenanceBookingRemoteDataSourceImpl(this._dioClient);

  final DioClient _dioClient;

  @override
  Future<MaintenanceBookingsListResponseDto> getMaintenanceBookings({
    int page = 1,
  }) async {
    final response = await _dioClient.get(
      'maintenance/my-bookings',
      queryParameters: {'page': page},
    );
    return MaintenanceBookingsListResponseDto.fromJson(
      response.data as Map<String, dynamic>,
    );
  }

  @override
  Future<bool> deleteMaintenanceBooking(int id) async {
    final response = await _dioClient.delete('maintenance/bookings/$id');
    final data = response.data as Map<String, dynamic>;
    return (data['status'] as bool?) ?? false;
  }

  @override
  Future<bool> updateMaintenanceBooking({
    required int id,
    required String phone,
    required String address,
    required String message,
  }) async {
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
  }
}
