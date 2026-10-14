class TeamMemberEntity {
  const TeamMemberEntity({
    required this.name,
    required this.position,
    required this.photo,
  });

  final String name;
  final String position;
  final String photo;
}

class SectionEntity {
  const SectionEntity({required this.title, required this.content});

  final String title;
  final List<String> content;
}

class PageEntity {
  const PageEntity({
    required this.id,
    required this.slug,
    required this.image,
    required this.title,
    required this.content,
    required this.teamMembers,
    required this.sections,
  });

  final int id;
  final String slug;
  final String image;
  final String title;
  final String content;
  final List<TeamMemberEntity> teamMembers;
  final List<SectionEntity> sections;
}
