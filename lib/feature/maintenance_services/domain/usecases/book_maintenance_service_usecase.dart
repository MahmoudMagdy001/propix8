import 'package:propix8/core/functional/result.dart';
import 'package:propix8/feature/maintenance_services/domain/repositories/maintenance_service_repository.dart';

class BookMaintenanceServiceUseCase {
  const BookMaintenanceServiceUseCase(this._repository);

  final MaintenanceServiceRepository _repository;

  ResultFuture<bool> call({
    required int maintenanceServiceId,
    required String phone,
    required String address,
    required String message,
  }) =>
      _repository.bookMaintenance(
        maintenanceServiceId: maintenanceServiceId,
        phone: phone,
        address: address,
        message: message,
      );
}
