import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:propix8/core/models/pagination_model.dart';
import 'package:propix8/feature/favorites/domain/entities/favorite_unit_entity.dart';

part 'favorite_response_entity.freezed.dart';

@freezed
abstract class FavoriteResponseEntity with _$FavoriteResponseEntity {
  const factory FavoriteResponseEntity({
    required bool status,
    required String message,
    required List<FavoriteUnitEntity> data,
    PaginationModel? pagination,
  }) = _FavoriteResponseEntity;
}
