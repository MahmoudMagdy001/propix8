// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BookingResponseModel _$BookingResponseModelFromJson(
  Map<String, dynamic> json,
) => _BookingResponseModel(
  status: json['status'] as bool? ?? false,
  message: json['message'] as String? ?? '',
  data: json['data'] == null
      ? null
      : BookingDataModel.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$BookingResponseModelToJson(
  _BookingResponseModel instance,
) => <String, dynamic>{
  'status': instance.status,
  'message': instance.message,
  'data': instance.data,
};

_BookingDataModel _$BookingDataModelFromJson(Map<String, dynamic> json) =>
    _BookingDataModel(
      id: json['id'] == null ? 0 : _parseInt(json['id']),
      userId: json['user_id'] == null ? 0 : _parseInt(json['user_id']),
      name: json['name'] as String? ?? '',
      email: json['email'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
      date: json['date'] as String? ?? '',
      time: json['time'] as String? ?? '',
      status: json['status'] as String? ?? '',
      notes: json['notes'] as String? ?? '',
      createdAt: json['created_at'] as String? ?? '',
      unit: json['unit'] == null
          ? null
          : UnitModel.fromJson(json['unit'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BookingDataModelToJson(_BookingDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'date': instance.date,
      'time': instance.time,
      'status': instance.status,
      'notes': instance.notes,
      'created_at': instance.createdAt,
      'unit': instance.unit,
    };
