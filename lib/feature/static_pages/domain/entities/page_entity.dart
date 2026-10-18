import 'package:freezed_annotation/freezed_annotation.dart';

part 'page_entity.freezed.dart';

@freezed
abstract class TeamMemberEntity with _$TeamMemberEntity {
  const factory TeamMemberEntity({
    required String name,
    required String position,
    required String photo,
  }) = _TeamMemberEntity;
}

@freezed
abstract class SectionEntity with _$SectionEntity {
  const factory SectionEntity({
    required String title,
    required List<String> content,
  }) = _SectionEntity;
}

@freezed
abstract class PageEntity with _$PageEntity {
  const factory PageEntity({
    required int id,
    required String slug,
    required String image,
    required String title,
    required String content,
    required List<TeamMemberEntity> teamMembers,
    required List<SectionEntity> sections,
  }) = _PageEntity;
}
