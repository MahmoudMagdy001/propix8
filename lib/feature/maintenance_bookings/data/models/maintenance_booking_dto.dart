import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:propix8/core/models/pagination_model.dart';
import 'package:propix8/feature/maintenance_bookings/domain/entities/maintenance_booking_entity.dart';
import 'package:propix8/feature/maintenance_services/data/models/maintenance_service_dto.dart';

part 'maintenance_booking_dto.freezed.dart';
part 'maintenance_booking_dto.g.dart';

@freezed
abstract class MaintenanceBookingDto with _$MaintenanceBookingDto {
  const factory MaintenanceBookingDto({
    @Default(0) int id,
    MaintenanceServiceDto? service,
    @Default('') String phone,
    @Default('') String address,
    @Default('') String message,
    @Default('') String status,
    @JsonKey(name: 'created_at') @Default('') String createdAt,
  }) = _MaintenanceBookingDto;

  const MaintenanceBookingDto._();

  factory MaintenanceBookingDto.fromJson(Map<String, dynamic> json) =>
      _$MaintenanceBookingDtoFromJson(json);

  MaintenanceBookingEntity toEntity() => MaintenanceBookingEntity(
    id: id,
    service: service?.toEntity(),
    phone: phone,
    address: address,
    message: message,
    status: status,
    createdAt: createdAt,
  );
}

@freezed
abstract class MaintenanceBookingsListResponseDto with _$MaintenanceBookingsListResponseDto {
  const factory MaintenanceBookingsListResponseDto({
    @Default(false) bool status,
    @Default('') String message,
    @Default([]) List<MaintenanceBookingDto> data,
    PaginationModel? pagination,
  }) = _MaintenanceBookingsListResponseDto;

  const MaintenanceBookingsListResponseDto._();

  factory MaintenanceBookingsListResponseDto.fromJson(Map<String, dynamic> json) =>
      _$MaintenanceBookingsListResponseDtoFromJson(json);

  MaintenanceBookingsDataEntity toEntity() => MaintenanceBookingsDataEntity(
    bookings: data.map((e) => e.toEntity()).toList(),
    pagination: pagination,
  );
}
