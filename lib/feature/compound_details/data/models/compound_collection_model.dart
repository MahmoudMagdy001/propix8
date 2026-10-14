import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:propix8/core/models/pagination_model.dart';
import 'package:propix8/feature/compound_details/domain/entities/compound_collection_entity.dart';
import 'package:propix8/feature/home/data/models/unit_model.dart';

part 'compound_collection_model.freezed.dart';

@Freezed(toJson: false, fromJson: false)
abstract class CompoundCollectionModel with _$CompoundCollectionModel
    implements CompoundCollectionEntity {
  const factory CompoundCollectionModel({
    required int id,
    required String name,
    required String description,
    required List<UnitModel> units,
    PaginationModel? pagination,
  }) = _CompoundCollectionModel;

  factory CompoundCollectionModel.fromJson(
    Map<String, dynamic> json, {
    PaginationModel? pagination,
  }) =>
      CompoundCollectionModel(
        id: json['id'] as int? ?? 0,
        name: json['name'] as String? ?? '',
        description: json['description'] as String? ?? '',
        units: (json['units'] as List?)
                ?.map((e) => UnitModel.fromJson(e as Map<String, dynamic>))
                .toList() ??
            const [],
        pagination: pagination,
      );

  static CompoundCollectionModel dummy() => CompoundCollectionModel(
        id: 0,
        name: 'Compound Name',
        description: 'This is a dummy description for skeleton loading.',
        units: UnitModel.dummyUnits,
      );
}
