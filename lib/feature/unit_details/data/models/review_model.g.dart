// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReviewModel _$ReviewModelFromJson(Map<String, dynamic> json) => _ReviewModel(
  createdAt: _parseDateTime(json['created_at']),
  id: json['id'] == null ? 0 : _parseInt(json['id']),
  rating: json['rating'] == null ? 0 : _parseInt(json['rating']),
  comment: json['comment'] as String?,
  user: json['user'] == null
      ? const ReviewUser()
      : ReviewUser.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ReviewModelToJson(_ReviewModel instance) =>
    <String, dynamic>{
      'created_at': instance.createdAt.toIso8601String(),
      'id': instance.id,
      'rating': instance.rating,
      'comment': instance.comment,
      'user': instance.user,
    };

_ReviewUser _$ReviewUserFromJson(Map<String, dynamic> json) => _ReviewUser(
  id: json['id'] == null ? 0 : _parseInt(json['id']),
  name: json['name'] as String? ?? '',
  avatar: json['avatar'] as String?,
);

Map<String, dynamic> _$ReviewUserToJson(_ReviewUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'avatar': instance.avatar,
    };
