class ReviewEntity {
  const ReviewEntity({
    required this.id,
    required this.rating,
    required this.createdAt,
    required this.user,
    this.comment,
  });

  final int id;
  final int rating;
  final String? comment;
  final DateTime createdAt;
  final ReviewUserEntity user;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReviewEntity &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          rating == other.rating &&
          comment == other.comment &&
          createdAt == other.createdAt &&
          user == other.user;

  @override
  int get hashCode => Object.hash(id, rating, comment, createdAt, user);
}

class ReviewUserEntity {
  const ReviewUserEntity({
    required this.id,
    required this.name,
    this.avatar,
  });

  final int id;
  final String name;
  final String? avatar;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReviewUserEntity &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          avatar == other.avatar;

  @override
  int get hashCode => Object.hash(id, name, avatar);
}
