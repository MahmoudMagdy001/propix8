class ServiceEntity {
  const ServiceEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.icon,
  });

  final int id;
  final String name;
  final String description;
  final String icon;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ServiceEntity &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          description == other.description &&
          icon == other.icon;

  @override
  int get hashCode => Object.hash(id, name, description, icon);
}
