import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:propix8/feature/our_services/domain/entities/faq_entity.dart';

part 'faq_model.freezed.dart';
part 'faq_model.g.dart';

@freezed
abstract class FaqModel with _$FaqModel {
  const FaqModel._();

  const factory FaqModel({
    @Default(0) int id,
    @Default('') String question,
    @Default('') String answer,
  }) = _FaqModel;

  factory FaqModel.fromJson(Map<String, dynamic> json) =>
      _$FaqModelFromJson(json);

  factory FaqModel.fromDomain(FaqEntity entity) =>
      FaqModel(id: entity.id, question: entity.question, answer: entity.answer);

  FaqEntity toDomain() => FaqEntity(id: id, question: question, answer: answer);
}
