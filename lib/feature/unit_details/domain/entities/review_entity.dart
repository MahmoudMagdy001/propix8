import 'package:freezed_annotation/freezed_annotation.dart';

part 'review_entity.freezed.dart';

@freezed
abstract class ReviewEntity with _$ReviewEntity {
  const factory ReviewEntity({
    required int id,
    required int rating,
    required DateTime createdAt,
    required ReviewUserEntity user,
    String? comment,
  }) = _ReviewEntity;
}

@freezed
abstract class ReviewUserEntity with _$ReviewUserEntity {
  const factory ReviewUserEntity({
    required int id,
    required String name,
    String? avatar,
  }) = _ReviewUserEntity;
}
