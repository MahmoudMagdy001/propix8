import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:propix8/core/models/pagination_model.dart';
import 'package:propix8/feature/home/domain/entities/unit_entity.dart';

part 'compound_collection_entity.freezed.dart';

@freezed
abstract class CompoundCollectionEntity with _$CompoundCollectionEntity {
  const CompoundCollectionEntity._();

  const factory CompoundCollectionEntity({
    required int id,
    required String name,
    required String description,
    required List<UnitEntity> units,
    PaginationModel? pagination,
  }) = _CompoundCollectionEntity;

  static CompoundCollectionEntity dummy() => CompoundCollectionEntity(
        id: 0,
        name: 'Compound Name',
        description: 'This is a dummy description for skeleton loading.',
        units: UnitEntity.dummyUnits,
      );
}
