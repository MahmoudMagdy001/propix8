// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'maintenance_service_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MaintenanceServiceDto _$MaintenanceServiceDtoFromJson(
  Map<String, dynamic> json,
) => _MaintenanceServiceDto(
  id: (json['id'] as num?)?.toInt() ?? 0,
  title: json['title'] as String? ?? '',
  category: json['category'] as String? ?? '',
  image: json['image'] as String? ?? '',
  createdAt: json['created_at'] as String? ?? '',
);

Map<String, dynamic> _$MaintenanceServiceDtoToJson(
  _MaintenanceServiceDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'category': instance.category,
  'image': instance.image,
  'created_at': instance.createdAt,
};

_MaintenanceDataDto _$MaintenanceDataDtoFromJson(Map<String, dynamic> json) =>
    _MaintenanceDataDto(
      home:
          (json['home'] as List<dynamic>?)
              ?.map(
                (e) =>
                    MaintenanceServiceDto.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const <MaintenanceServiceDto>[],
      technical:
          (json['technical'] as List<dynamic>?)
              ?.map(
                (e) =>
                    MaintenanceServiceDto.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const <MaintenanceServiceDto>[],
    );

Map<String, dynamic> _$MaintenanceDataDtoToJson(_MaintenanceDataDto instance) =>
    <String, dynamic>{'home': instance.home, 'technical': instance.technical};

_MaintenanceServicesResponseDto _$MaintenanceServicesResponseDtoFromJson(
  Map<String, dynamic> json,
) => _MaintenanceServicesResponseDto(
  status: json['status'] as bool? ?? false,
  message: json['message'] as String? ?? '',
  data: json['data'] == null
      ? const MaintenanceDataDto()
      : MaintenanceDataDto.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$MaintenanceServicesResponseDtoToJson(
  _MaintenanceServicesResponseDto instance,
) => <String, dynamic>{
  'status': instance.status,
  'message': instance.message,
  'data': instance.data,
};

_MaintenanceBookingResponseDto _$MaintenanceBookingResponseDtoFromJson(
  Map<String, dynamic> json,
) => _MaintenanceBookingResponseDto(
  status: json['status'] as bool? ?? false,
  message: json['message'] as String? ?? '',
  data: json['data'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$MaintenanceBookingResponseDtoToJson(
  _MaintenanceBookingResponseDto instance,
) => <String, dynamic>{
  'status': instance.status,
  'message': instance.message,
  'data': instance.data,
};
