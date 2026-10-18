import 'package:propix8/core/functional/result.dart';
import 'package:propix8/core/models/pagination_model.dart';
import 'package:propix8/feature/home/domain/entities/banner_entity.dart';
import 'package:propix8/feature/home/domain/entities/category_entity.dart';
import 'package:propix8/feature/home/domain/entities/unit_entity.dart';

abstract class UnitRepository {
  ResultFuture<PaginatedResponse<UnitEntity>> getNearbyUnits({
    int page = 1,
  });

  ResultFuture<List<UnitEntity>> getLatestUnits();

  ResultFuture<PaginatedResponse<UnitEntity>> getAllUnits({
    int page = 1,
    int? unitTypeId,
    String? offerType,
    String? developmentStatus,
    String? searchQuery,
    double? minPrice,
    double? maxPrice,
    int? rooms,
    int? bathrooms,
    double? minArea,
    double? maxArea,
    int? cityId,
  });

  ResultFuture<List<CategoryEntity>> getCategories();

  ResultFuture<List<BannerEntity>> getBanners();

  ResultFuture<bool> toggleFavorite(int unitId);
}
