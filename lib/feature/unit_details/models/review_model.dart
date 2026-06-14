import 'package:equatable/equatable.dart';

class ReviewModel extends Equatable {
  const ReviewModel({
    required this.id,
    required this.rating,
    required this.comment,
    required this.createdAt,
    required this.user,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) => ReviewModel(
    id: (json['id'] as int?) ?? 0,
    rating: int.tryParse(json['rating'].toString()) ?? 0,
    comment: json['comment'] as String?,
    createdAt: DateTime.tryParse((json['created_at'] as String?) ?? '') ?? DateTime.now(),
    user: ReviewUser.fromJson(json['user'] as Map<String, dynamic>),
  );

  final int id;
  final int rating;
  final String? comment;
  final DateTime createdAt;
  final ReviewUser user;

  @override
  List<Object?> get props => [id, rating, comment, createdAt, user];
}

class ReviewUser extends Equatable {
  const ReviewUser({required this.id, required this.name, this.avatar});

  factory ReviewUser.fromJson(Map<String, dynamic> json) =>
      ReviewUser(
        id: (json['id'] as int?) ?? 0,
        name: (json['name'] as String?) ?? '',
        avatar: json['avatar'] as String?,
      );

  final int id;
  final String name;
  final String? avatar;

  @override
  List<Object?> get props => [id, name, avatar];
}
