// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'maintenance_booking_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MaintenanceBookingDto _$MaintenanceBookingDtoFromJson(
  Map<String, dynamic> json,
) => _MaintenanceBookingDto(
  id: (json['id'] as num?)?.toInt() ?? 0,
  service: json['service'] == null
      ? null
      : MaintenanceServiceDto.fromJson(json['service'] as Map<String, dynamic>),
  phone: json['phone'] as String? ?? '',
  address: json['address'] as String? ?? '',
  message: json['message'] as String? ?? '',
  status: json['status'] as String? ?? '',
  createdAt: json['created_at'] as String? ?? '',
);

Map<String, dynamic> _$MaintenanceBookingDtoToJson(
  _MaintenanceBookingDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'service': instance.service,
  'phone': instance.phone,
  'address': instance.address,
  'message': instance.message,
  'status': instance.status,
  'created_at': instance.createdAt,
};

_MaintenanceBookingsListResponseDto
_$MaintenanceBookingsListResponseDtoFromJson(Map<String, dynamic> json) =>
    _MaintenanceBookingsListResponseDto(
      status: json['status'] as bool? ?? false,
      message: json['message'] as String? ?? '',
      data:
          (json['data'] as List<dynamic>?)
              ?.map(
                (e) =>
                    MaintenanceBookingDto.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
      pagination: json['pagination'] == null
          ? null
          : PaginationModel.fromJson(
              json['pagination'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$MaintenanceBookingsListResponseDtoToJson(
  _MaintenanceBookingsListResponseDto instance,
) => <String, dynamic>{
  'status': instance.status,
  'message': instance.message,
  'data': instance.data,
  'pagination': instance.pagination,
};
