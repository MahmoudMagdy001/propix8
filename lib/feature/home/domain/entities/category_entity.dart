import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_entity.freezed.dart';

@freezed
abstract class CategoryEntity with _$CategoryEntity {
  const CategoryEntity._();

  const factory CategoryEntity({
    required int id,
    required String name,
    required String icon,
  }) = _CategoryEntity;

  static List<CategoryEntity> get dummyCategories => List.generate(
    5,
    (index) => CategoryEntity(id: index, name: 'Category $index', icon: ''),
  );
}
