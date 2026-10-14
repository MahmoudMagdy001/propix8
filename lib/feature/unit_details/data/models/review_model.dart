import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:propix8/feature/unit_details/domain/entities/review_entity.dart';

part 'review_model.freezed.dart';
part 'review_model.g.dart';

int _parseInt(dynamic value) {
  if (value == null) return 0;
  if (value is num) return value.toInt();
  if (value is String) return int.tryParse(value) ?? 0;
  return 0;
}

DateTime _parseDateTime(dynamic value) {
  if (value == null) return DateTime(2025);
  if (value is String) return DateTime.tryParse(value) ?? DateTime(2025);
  return DateTime(2025);
}

@freezed
abstract class ReviewModel with _$ReviewModel {
  const factory ReviewModel({
    @JsonKey(name: 'created_at', fromJson: _parseDateTime)
    required DateTime createdAt,
    @JsonKey(fromJson: _parseInt) @Default(0) int id,
    @JsonKey(fromJson: _parseInt) @Default(0) int rating,
    String? comment,
    @Default(ReviewUser()) ReviewUser user,
  }) = _ReviewModel;

  const ReviewModel._();

  factory ReviewModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewModelFromJson(json);

  ReviewEntity toEntity() => ReviewEntity(
        id: id,
        rating: rating,
        comment: comment,
        createdAt: createdAt,
        user: user.toEntity(),
      );
}

@freezed
abstract class ReviewUser with _$ReviewUser {
  const factory ReviewUser({
    @JsonKey(fromJson: _parseInt) @Default(0) int id,
    @Default('') String name,
    String? avatar,
  }) = _ReviewUser;

  const ReviewUser._();

  factory ReviewUser.fromJson(Map<String, dynamic> json) =>
      _$ReviewUserFromJson(json);

  ReviewUserEntity toEntity() => ReviewUserEntity(
        id: id,
        name: name,
        avatar: avatar,
      );
}
