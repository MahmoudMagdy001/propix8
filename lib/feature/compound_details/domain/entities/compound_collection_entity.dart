import 'package:propix8/core/models/pagination_model.dart';
import 'package:propix8/feature/home/domain/entities/unit_entity.dart';

class CompoundCollectionEntity {
  const CompoundCollectionEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.units,
    this.pagination,
  });

  final int id;
  final String name;
  final String description;
  final List<UnitEntity> units;
  final PaginationModel? pagination;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CompoundCollectionEntity &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          description == other.description &&
          units == other.units &&
          pagination == other.pagination;

  @override
  int get hashCode => Object.hash(id, name, description, units, pagination);

  static CompoundCollectionEntity dummy() => CompoundCollectionEntity(
        id: 0,
        name: 'Compound Name',
        description: 'This is a dummy description for skeleton loading.',
        units: UnitEntity.dummyUnits,
      );
}
