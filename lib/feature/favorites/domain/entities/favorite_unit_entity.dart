import 'package:propix8/feature/home/domain/entities/unit_entity.dart';

class FavoriteUnitEntity {
  const FavoriteUnitEntity({
    required this.id,
    required this.unit,
    required this.createdAt,
  });

  final int id;
  final UnitEntity unit;
  final DateTime createdAt;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavoriteUnitEntity &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          unit == other.unit &&
          createdAt == other.createdAt;

  @override
  int get hashCode => Object.hash(id, unit, createdAt);
}
