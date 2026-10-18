import 'package:freezed_annotation/freezed_annotation.dart';

part 'maintenance_service_entity.freezed.dart';

@freezed
abstract class MaintenanceServiceEntity with _$MaintenanceServiceEntity {
  const factory MaintenanceServiceEntity({
    required int id,
    required String title,
    required String category,
    required String image,
    required String createdAt,
  }) = _MaintenanceServiceEntity;
}

@freezed
abstract class MaintenanceServicesDataEntity with _$MaintenanceServicesDataEntity {
  const factory MaintenanceServicesDataEntity({
    required List<MaintenanceServiceEntity> home,
    required List<MaintenanceServiceEntity> technical,
  }) = _MaintenanceServicesDataEntity;
}
