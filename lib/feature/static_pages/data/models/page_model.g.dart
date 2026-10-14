// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TeamMemberModel _$TeamMemberModelFromJson(Map<String, dynamic> json) =>
    _TeamMemberModel(
      name: json['name'] as String? ?? '',
      position: json['position'] as String? ?? '',
      photo: json['photo'] as String? ?? '',
    );

Map<String, dynamic> _$TeamMemberModelToJson(_TeamMemberModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'position': instance.position,
      'photo': instance.photo,
    };

_SectionModel _$SectionModelFromJson(Map<String, dynamic> json) =>
    _SectionModel(
      title: json['title'] as String? ?? '',
      content:
          (json['content'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$SectionModelToJson(_SectionModel instance) =>
    <String, dynamic>{'title': instance.title, 'content': instance.content};

_PageModel _$PageModelFromJson(Map<String, dynamic> json) => _PageModel(
  id: (json['id'] as num?)?.toInt() ?? 0,
  slug: json['slug'] as String? ?? '',
  image: json['image'] as String? ?? '',
  title: json['title'] as String? ?? '',
  content: json['content'] as String? ?? '',
  teamMembers:
      (json['team_members'] as List<dynamic>?)
          ?.map((e) => TeamMemberModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  sections:
      (json['sections'] as List<dynamic>?)
          ?.map((e) => SectionModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$PageModelToJson(_PageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'slug': instance.slug,
      'image': instance.image,
      'title': instance.title,
      'content': instance.content,
      'team_members': instance.teamMembers,
      'sections': instance.sections,
    };
