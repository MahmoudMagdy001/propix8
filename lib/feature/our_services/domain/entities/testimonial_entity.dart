class TestimonialEntity {
  const TestimonialEntity({
    required this.id,
    required this.name,
    required this.position,
    required this.content,
    required this.image,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    this.userId,
  });

  final int id;
  final int? userId;
  final String name;
  final String position;
  final String content;
  final String image;
  final bool status;
  final DateTime createdAt;
  final DateTime updatedAt;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TestimonialEntity &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          userId == other.userId &&
          name == other.name &&
          position == other.position &&
          content == other.content &&
          image == other.image &&
          status == other.status &&
          createdAt == other.createdAt &&
          updatedAt == other.updatedAt;

  @override
  int get hashCode => Object.hash(
    id,
    userId,
    name,
    position,
    content,
    image,
    status,
    createdAt,
    updatedAt,
  );
}
