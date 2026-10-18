import 'package:propix8/core/network/dio_client.dart';
import 'package:propix8/feature/maintenance_services/data/models/maintenance_service_dto.dart';

abstract class MaintenanceServiceRemoteDataSource {
  Future<MaintenanceServicesResponseDto> getMaintenanceServices();
  Future<MaintenanceBookingResponseDto> bookMaintenance({
    required int maintenanceServiceId,
    required String phone,
    required String address,
    required String message,
  });
}

class MaintenanceServiceRemoteDataSourceImpl implements MaintenanceServiceRemoteDataSource {
  const MaintenanceServiceRemoteDataSourceImpl(this._dioClient);

  final DioClient _dioClient;

  @override
  Future<MaintenanceServicesResponseDto> getMaintenanceServices() async {
    final response = await _dioClient.get('maintenance/services');
    return MaintenanceServicesResponseDto.fromJson(
      response.data as Map<String, dynamic>,
    );
  }

  @override
  Future<MaintenanceBookingResponseDto> bookMaintenance({
    required int maintenanceServiceId,
    required String phone,
    required String address,
    required String message,
  }) async {
    final response = await _dioClient.post(
      'maintenance/bookings',
      data: {
        'maintenance_service_id': maintenanceServiceId,
        'phone': phone,
        'address': address,
        'message': message,
      },
    );
    return MaintenanceBookingResponseDto.fromJson(
      response.data as Map<String, dynamic>,
    );
  }
}
