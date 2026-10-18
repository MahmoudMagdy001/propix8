import 'package:freezed_annotation/freezed_annotation.dart';

part 'testimonial_entity.freezed.dart';

@freezed
abstract class TestimonialEntity with _$TestimonialEntity {
  const factory TestimonialEntity({
    required int id,
    required String name,
    required String position,
    required String content,
    required String image,
    required bool status,
    required DateTime createdAt,
    required DateTime updatedAt,
    int? userId,
  }) = _TestimonialEntity;
}
