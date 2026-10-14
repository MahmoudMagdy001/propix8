// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ContactRequestModel _$ContactRequestModelFromJson(Map<String, dynamic> json) =>
    _ContactRequestModel(
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      address: json['address'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$ContactRequestModelToJson(
  _ContactRequestModel instance,
) => <String, dynamic>{
  'name': instance.name,
  'email': instance.email,
  'phone': instance.phone,
  'address': instance.address,
  'message': instance.message,
};
