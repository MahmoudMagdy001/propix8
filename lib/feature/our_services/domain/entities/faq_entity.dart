import 'package:freezed_annotation/freezed_annotation.dart';

part 'faq_entity.freezed.dart';

@freezed
abstract class FaqEntity with _$FaqEntity {
  const factory FaqEntity({
    required int id,
    required String question,
    required String answer,
  }) = _FaqEntity;
}
