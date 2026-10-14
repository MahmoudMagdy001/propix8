class CategoryEntity {
  const CategoryEntity({
    required this.id,
    required this.name,
    required this.icon,
  });

  final int id;
  final String name;
  final String icon;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryEntity &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          icon == other.icon;

  @override
  int get hashCode => Object.hash(id, name, icon);

  static List<CategoryEntity> get dummyCategories => List.generate(
    5,
    (index) => CategoryEntity(id: index, name: 'Category $index', icon: ''),
  );
}
