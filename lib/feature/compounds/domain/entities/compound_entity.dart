import 'package:freezed_annotation/freezed_annotation.dart';

part 'compound_entity.freezed.dart';

@freezed
abstract class CompoundEntity with _$CompoundEntity {
  const factory CompoundEntity({
    required int id,
    required String name,
    required String description,
  }) = _CompoundEntity;
}
