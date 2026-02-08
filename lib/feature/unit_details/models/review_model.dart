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
    id: json['id'],
    rating: int.tryParse(json['rating'].toString()) ?? 0,
    comment: json['comment'],
    createdAt: DateTime.tryParse(json['created_at'] ?? '') ?? DateTime.now(),
    user: ReviewUser.fromJson(json['user']),
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
      ReviewUser(id: json['id'], name: json['name'], avatar: json['avatar']);

  final int id;
  final String name;
  final String? avatar;

  @override
  List<Object?> get props => [id, name, avatar];
}
