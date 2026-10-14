// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'testimonial_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TestimonialModel _$TestimonialModelFromJson(Map<String, dynamic> json) =>
    _TestimonialModel(
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      id: (json['id'] as num?)?.toInt() ?? 0,
      userId: (json['user_id'] as num?)?.toInt(),
      name: json['name'] as String? ?? '',
      position: json['position'] as String? ?? '',
      content: json['content'] as String? ?? '',
      image: json['image'] as String? ?? '',
      status: json['status'] as bool? ?? false,
    );

Map<String, dynamic> _$TestimonialModelToJson(_TestimonialModel instance) =>
    <String, dynamic>{
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'id': instance.id,
      'user_id': instance.userId,
      'name': instance.name,
      'position': instance.position,
      'content': instance.content,
      'image': instance.image,
      'status': instance.status,
    };
