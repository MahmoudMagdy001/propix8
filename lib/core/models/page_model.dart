import 'package:equatable/equatable.dart';

class TeamMember extends Equatable {
  const TeamMember({
    required this.name,
    required this.position,
    required this.photo,
  });

  factory TeamMember.fromJson(Map<String, dynamic> json) => TeamMember(
    name: json['name'] as String? ?? '',
    position: json['position'] as String? ?? '',
    photo: json['photo'] as String? ?? '',
  );
  final String name;
  final String position;
  final String photo;

  @override
  List<Object?> get props => [name, position, photo];
}

class Section extends Equatable {
  const Section({required this.title, required this.content});

  factory Section.fromJson(Map<String, dynamic> json) => Section(
    title: json['title'] as String? ?? '',
    content:
        (json['content'] as List<dynamic>?)
            ?.map((e) => e.toString())
            .toList() ??
        [],
  );
  final String title;
  final List<String> content;

  @override
  List<Object?> get props => [title, content];
}

class PageModel extends Equatable {
  const PageModel({
    required this.id,
    required this.slug,
    required this.image,
    required this.title,
    required this.content,
    required this.teamMembers,
    required this.sections,
  });

  factory PageModel.fromJson(Map<String, dynamic> json) => PageModel(
    id: json['id'] as int? ?? 0,
    slug: json['slug'] as String? ?? '',
    image: json['image'] as String? ?? '',
    title: json['title'] as String? ?? '',
    content: json['content'] as String? ?? '',
    teamMembers:
        (json['team_members'] as List<dynamic>?)
            ?.map((e) => TeamMember.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    sections:
        (json['sections'] as List<dynamic>?)
            ?.map((e) => Section.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
  );
  final int id;
  final String slug;
  final String image;
  final String title;
  final String content;
  final List<TeamMember> teamMembers;
  final List<Section> sections;

  @override
  List<Object?> get props => [
    id,
    slug,
    image,
    title,
    content,
    teamMembers,
    sections,
  ];
}
