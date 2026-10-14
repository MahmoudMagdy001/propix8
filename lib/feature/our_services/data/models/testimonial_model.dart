import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:propix8/feature/our_services/domain/entities/testimonial_entity.dart';

part 'testimonial_model.freezed.dart';
part 'testimonial_model.g.dart';

@freezed
abstract class TestimonialModel with _$TestimonialModel {
  const TestimonialModel._();

  const factory TestimonialModel({
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    @Default(0) int id,
    @JsonKey(name: 'user_id') int? userId,
    @Default('') String name,
    @Default('') String position,
    @Default('') String content,
    @Default('') String image,
    @Default(false) bool status,
  }) = _TestimonialModel;

  factory TestimonialModel.fromJson(Map<String, dynamic> json) =>
      _$TestimonialModelFromJson(json);

  factory TestimonialModel.fromDomain(TestimonialEntity entity) =>
      TestimonialModel(
        id: entity.id,
        userId: entity.userId,
        name: entity.name,
        position: entity.position,
        content: entity.content,
        image: entity.image,
        status: entity.status,
        createdAt: entity.createdAt,
        updatedAt: entity.updatedAt,
      );

  TestimonialEntity toDomain() => TestimonialEntity(
    id: id,
    userId: userId,
    name: name,
    position: position,
    content: content,
    image: image,
    status: status,
    createdAt: createdAt,
    updatedAt: updatedAt,
  );
}
