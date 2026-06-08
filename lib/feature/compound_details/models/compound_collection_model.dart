import 'package:equatable/equatable.dart';

import 'package:propix8/core/models/pagination_model.dart';
import 'package:propix8/feature/home/models/unit_model.dart';

class CompoundCollectionModel extends Equatable {
  const CompoundCollectionModel({
    required this.id,
    required this.name,
    required this.description,
    required this.units,
    this.pagination,
  });

  factory CompoundCollectionModel.fromJson(
    Map<String, dynamic> json, {
    PaginationModel? pagination,
  }) => CompoundCollectionModel(
    id: json['id'] as int,
    name: json['name'] as String? ?? '',
    description: json['description'] as String? ?? '',
    units:
        (json['units'] as List?)
            ?.map((e) => UnitModel.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    pagination: pagination,
  );
  final int id;
  final String name;
  final String description;
  final List<UnitModel> units;
  final PaginationModel? pagination;

  @override
  List<Object?> get props => [id, name, description, units, pagination];

  static CompoundCollectionModel dummy() => CompoundCollectionModel(
    id: 0,
    name: 'Compound Name',
    description: 'This is a dummy description for skeleton loading.',
    units: UnitModel.dummyUnits,
  );
}
