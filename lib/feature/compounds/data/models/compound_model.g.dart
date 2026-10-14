// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'compound_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CompoundModel _$CompoundModelFromJson(Map<String, dynamic> json) =>
    _CompoundModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: json['name'] as String? ?? '',
      description: json['description'] as String? ?? '',
    );

Map<String, dynamic> _$CompoundModelToJson(_CompoundModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
    };
