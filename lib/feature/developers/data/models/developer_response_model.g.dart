// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'developer_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DeveloperResponseModel _$DeveloperResponseModelFromJson(
  Map<String, dynamic> json,
) => _DeveloperResponseModel(
  status: json['status'] as bool? ?? false,
  message: json['message'] as String? ?? '',
  data:
      (json['data'] as List<dynamic>?)
          ?.map((e) => DeveloperModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$DeveloperResponseModelToJson(
  _DeveloperResponseModel instance,
) => <String, dynamic>{
  'status': instance.status,
  'message': instance.message,
  'data': instance.data,
};
