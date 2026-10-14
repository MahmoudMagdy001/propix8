// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'developer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DeveloperModel _$DeveloperModelFromJson(Map<String, dynamic> json) =>
    _DeveloperModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: json['name'] as String? ?? '',
      logo: json['logo'] as String? ?? '',
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      address: json['address'] as String?,
    );

Map<String, dynamic> _$DeveloperModelToJson(_DeveloperModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'logo': instance.logo,
      'email': instance.email,
      'phone': instance.phone,
      'address': instance.address,
    };
