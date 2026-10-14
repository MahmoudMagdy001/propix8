import 'package:propix8/core/models/pagination_model.dart';
import 'package:propix8/feature/favorites/domain/entities/favorite_unit_entity.dart';

class FavoriteResponseEntity {
  const FavoriteResponseEntity({
    required this.status,
    required this.message,
    required this.data,
    this.pagination,
  });

  final bool status;
  final String message;
  final List<FavoriteUnitEntity> data;
  final PaginationModel? pagination;
}
