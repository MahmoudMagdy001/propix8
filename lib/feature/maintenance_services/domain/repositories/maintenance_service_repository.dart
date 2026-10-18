import 'package:propix8/core/functional/result.dart';
import 'package:propix8/feature/maintenance_services/domain/entities/maintenance_service_entity.dart';

abstract class MaintenanceServiceRepository {
  ResultFuture<MaintenanceServicesDataEntity> getMaintenanceServices();
  ResultFuture<bool> bookMaintenance({
    required int maintenanceServiceId,
    required String phone,
    required String address,
    required String message,
  });
}
