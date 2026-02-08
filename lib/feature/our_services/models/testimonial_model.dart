import 'package:equatable/equatable.dart';

class TestimonialModel extends Equatable {
  const TestimonialModel({
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

  factory TestimonialModel.fromJson(Map<String, dynamic> json) =>
      TestimonialModel(
        id: json['id'] as int,
        userId: json['user_id'] as int?,
        name: json['name'] as String,
        position: json['position'] as String,
        content: json['content'] as String,
        image: json['image'] as String,
        status: json['status'] is bool
            ? json['status'] as bool
            : json['status'] == 1,
        createdAt: DateTime.parse(json['created_at'] as String),
        updatedAt: DateTime.parse(json['updated_at'] as String),
      );

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
  List<Object?> get props => [
    id,
    userId,
    name,
    position,
    content,
    image,
    status,
    createdAt,
    updatedAt,
  ];
}
