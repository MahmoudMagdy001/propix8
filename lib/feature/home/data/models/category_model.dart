import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:propix8/feature/home/domain/entities/category_entity.dart';

part 'category_model.freezed.dart';
part 'category_model.g.dart';

@freezed
abstract class CategoryModel with _$CategoryModel {
  const CategoryModel._();

  const factory CategoryModel({
    @Default(0) int id,
    @Default('') String name,
    @Default('') String icon,
  }) = _CategoryModel;

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  factory CategoryModel.fromDomain(CategoryEntity entity) => CategoryModel(
    id: entity.id,
    name: entity.name,
    icon: entity.icon,
  );

  CategoryEntity toDomain() => CategoryEntity(
    id: id,
    name: name,
    icon: icon,
  );
}
