import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:propix8/feature/home/domain/entities/unit_entity.dart';

part 'favorite_unit_entity.freezed.dart';

@freezed
abstract class FavoriteUnitEntity with _$FavoriteUnitEntity {
  const factory FavoriteUnitEntity({
    required int id,
    required UnitEntity unit,
    required DateTime createdAt,
  }) = _FavoriteUnitEntity;
}
