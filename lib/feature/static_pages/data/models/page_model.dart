import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:propix8/feature/static_pages/domain/entities/page_entity.dart';

part 'page_model.freezed.dart';
part 'page_model.g.dart';

@freezed
abstract class TeamMemberModel with _$TeamMemberModel {
  const TeamMemberModel._();

  const factory TeamMemberModel({
    @Default('') String name,
    @Default('') String position,
    @Default('') String photo,
  }) = _TeamMemberModel;

  factory TeamMemberModel.fromJson(Map<String, dynamic> json) =>
      _$TeamMemberModelFromJson(json);

  TeamMemberEntity toDomain() =>
      TeamMemberEntity(name: name, position: position, photo: photo);
}

@freezed
abstract class SectionModel with _$SectionModel {
  const SectionModel._();

  const factory SectionModel({
    @Default('') String title,
    @Default([]) List<String> content,
  }) = _SectionModel;

  factory SectionModel.fromJson(Map<String, dynamic> json) =>
      _$SectionModelFromJson(json);

  SectionEntity toDomain() => SectionEntity(title: title, content: content);
}

@freezed
abstract class PageModel with _$PageModel {
  const PageModel._();

  const factory PageModel({
    @Default(0) int id,
    @Default('') String slug,
    @Default('') String image,
    @Default('') String title,
    @Default('') String content,
    @JsonKey(name: 'team_members')
    @Default([])
    List<TeamMemberModel> teamMembers,
    @Default([]) List<SectionModel> sections,
  }) = _PageModel;

  factory PageModel.fromJson(Map<String, dynamic> json) =>
      _$PageModelFromJson(json);

  PageEntity toDomain() => PageEntity(
    id: id,
    slug: slug,
    image: image,
    title: title,
    content: content,
    teamMembers: teamMembers.map((e) => e.toDomain()).toList(),
    sections: sections.map((e) => e.toDomain()).toList(),
  );
}
