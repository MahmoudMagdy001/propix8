import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:propix8/feature/maintenance_services/domain/entities/maintenance_service_entity.dart';

part 'maintenance_service_dto.freezed.dart';
part 'maintenance_service_dto.g.dart';

@freezed
abstract class MaintenanceServiceDto with _$MaintenanceServiceDto {
  const factory MaintenanceServiceDto({
    @Default(0) int id,
    @Default('') String title,
    @Default('') String category,
    @Default('') String image,
    @JsonKey(name: 'created_at') @Default('') String createdAt,
  }) = _MaintenanceServiceDto;

  factory MaintenanceServiceDto.fromJson(Map<String, dynamic> json) =>
      _$MaintenanceServiceDtoFromJson(json);
}

extension MaintenanceServiceDtoX on MaintenanceServiceDto {
  MaintenanceServiceEntity toEntity() => MaintenanceServiceEntity(
        id: id,
        title: title,
        category: category,
        image: image,
        createdAt: createdAt,
      );
}

@freezed
abstract class MaintenanceDataDto with _$MaintenanceDataDto {
  const factory MaintenanceDataDto({
    @Default(<MaintenanceServiceDto>[]) List<MaintenanceServiceDto> home,
    @Default(<MaintenanceServiceDto>[]) List<MaintenanceServiceDto> technical,
  }) = _MaintenanceDataDto;

  factory MaintenanceDataDto.fromJson(Map<String, dynamic> json) =>
      _$MaintenanceDataDtoFromJson(json);
}

extension MaintenanceDataDtoX on MaintenanceDataDto {
  MaintenanceServicesDataEntity toEntity() => MaintenanceServicesDataEntity(
        home: home.map((e) => e.toEntity()).toList(),
        technical: technical.map((e) => e.toEntity()).toList(),
      );
}

@freezed
abstract class MaintenanceServicesResponseDto with _$MaintenanceServicesResponseDto {
  const factory MaintenanceServicesResponseDto({
    @Default(false) bool status,
    @Default('') String message,
    @Default(MaintenanceDataDto()) MaintenanceDataDto data,
  }) = _MaintenanceServicesResponseDto;

  factory MaintenanceServicesResponseDto.fromJson(Map<String, dynamic> json) =>
      _$MaintenanceServicesResponseDtoFromJson(json);
}

@freezed
abstract class MaintenanceBookingResponseDto with _$MaintenanceBookingResponseDto {
  const factory MaintenanceBookingResponseDto({
    @Default(false) bool status,
    @Default('') String message,
    Map<String, dynamic>? data,
  }) = _MaintenanceBookingResponseDto;

  factory MaintenanceBookingResponseDto.fromJson(Map<String, dynamic> json) =>
      _$MaintenanceBookingResponseDtoFromJson(json);
}
