import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:propix8/core/models/pagination_model.dart';
import 'package:propix8/feature/maintenance_services/domain/entities/maintenance_service_entity.dart';

part 'maintenance_booking_entity.freezed.dart';

@freezed
abstract class MaintenanceBookingEntity with _$MaintenanceBookingEntity {
  const factory MaintenanceBookingEntity({
    required int id,
    required MaintenanceServiceEntity? service,
    required String phone,
    required String address,
    required String message,
    required String status,
    required String createdAt,
  }) = _MaintenanceBookingEntity;
}

@freezed
abstract class MaintenanceBookingsDataEntity with _$MaintenanceBookingsDataEntity {
  const factory MaintenanceBookingsDataEntity({
    required List<MaintenanceBookingEntity> bookings,
    required PaginationModel? pagination,
  }) = _MaintenanceBookingsDataEntity;
}
