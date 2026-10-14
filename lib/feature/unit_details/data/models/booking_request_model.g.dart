// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BookingRequestModel _$BookingRequestModelFromJson(Map<String, dynamic> json) =>
    _BookingRequestModel(
      unitId: (json['unit_id'] as num).toInt(),
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      date: json['date'] as String,
      time: json['time'] as String,
      notes: json['notes'] as String? ?? '',
    );

Map<String, dynamic> _$BookingRequestModelToJson(
  _BookingRequestModel instance,
) => <String, dynamic>{
  'unit_id': instance.unitId,
  'name': instance.name,
  'email': instance.email,
  'phone': instance.phone,
  'date': instance.date,
  'time': instance.time,
  'notes': instance.notes,
};
