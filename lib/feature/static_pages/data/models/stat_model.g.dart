// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StatModel _$StatModelFromJson(Map<String, dynamic> json) => _StatModel(
  label: json['label'] as String? ?? '',
  value: json['value'] as String? ?? '',
  icon: json['icon'] as String? ?? '',
);

Map<String, dynamic> _$StatModelToJson(_StatModel instance) =>
    <String, dynamic>{
      'label': instance.label,
      'value': instance.value,
      'icon': instance.icon,
    };
