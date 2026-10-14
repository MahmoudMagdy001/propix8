import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:propix8/feature/compounds/domain/entities/compound_entity.dart';

part 'compound_model.freezed.dart';
part 'compound_model.g.dart';

@freezed
abstract class CompoundModel with _$CompoundModel {
  const CompoundModel._();

  const factory CompoundModel({
    @Default(0) int id,
    @Default('') String name,
    @Default('') String description,
  }) = _CompoundModel;

  factory CompoundModel.fromJson(Map<String, dynamic> json) =>
      _$CompoundModelFromJson(json);

  factory CompoundModel.fromDomain(CompoundEntity entity) => CompoundModel(
    id: entity.id,
    name: entity.name,
    description: entity.description,
  );

  CompoundEntity toDomain() =>
      CompoundEntity(id: id, name: name, description: description);
}
