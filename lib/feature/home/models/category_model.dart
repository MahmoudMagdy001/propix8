import 'package:equatable/equatable.dart';

class CategoryModel extends Equatable {
  const CategoryModel({
    required this.id,
    required this.name,
    required this.icon,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    id: json['id'] as int,
    name: json['name'] as String? ?? '',
    icon: json['icon'] as String? ?? '',
  );
  final int id;
  final String name;
  final String icon;

  @override
  List<Object?> get props => [id, name, icon];

  static List<CategoryModel> get dummyCategories => List.generate(
    5,
    (index) => CategoryModel(id: index, name: 'Category $index', icon: ''),
  );
}
