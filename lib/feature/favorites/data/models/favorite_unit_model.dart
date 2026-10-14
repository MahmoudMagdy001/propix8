import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:propix8/feature/favorites/domain/entities/favorite_unit_entity.dart';
import 'package:propix8/feature/home/data/models/unit_model.dart';

part 'favorite_unit_model.freezed.dart';

@Freezed(toJson: false, fromJson: false)
abstract class FavoriteUnitModel with _$FavoriteUnitModel implements FavoriteUnitEntity {
  const factory FavoriteUnitModel({
    required int id,
    required UnitModel unit,
    required DateTime createdAt,
  }) = _FavoriteUnitModel;

  factory FavoriteUnitModel.fromJson(Map<String, dynamic> json) {
    final unitJson = Map<String, dynamic>.from(
      json['unit'] as Map<String, dynamic>,
    );
    unitJson['is_favourite'] = true;

    return FavoriteUnitModel(
      id: json['id'] as int,
      unit: UnitModel.fromJson(unitJson),
      createdAt: DateTime.parse(json['created_at'] as String),
    );
  }
}
