// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'compound_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CompoundResponseModel _$CompoundResponseModelFromJson(
  Map<String, dynamic> json,
) => _CompoundResponseModel(
  status: json['status'] as bool? ?? false,
  message: json['message'] as String? ?? '',
  data:
      (json['data'] as List<dynamic>?)
          ?.map((e) => CompoundModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$CompoundResponseModelToJson(
  _CompoundResponseModel instance,
) => <String, dynamic>{
  'status': instance.status,
  'message': instance.message,
  'data': instance.data,
};
