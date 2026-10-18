import 'package:propix8/core/functional/result.dart';
import 'package:propix8/feature/maintenance_services/domain/entities/maintenance_service_entity.dart';
import 'package:propix8/feature/maintenance_services/domain/repositories/maintenance_service_repository.dart';

class GetMaintenanceServicesUseCase {
  const GetMaintenanceServicesUseCase(this._repository);

  final MaintenanceServiceRepository _repository;

  ResultFuture<MaintenanceServicesDataEntity> call() =>
      _repository.getMaintenanceServices();
}
