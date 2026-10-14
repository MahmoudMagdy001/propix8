import 'package:dartz/dartz.dart';
import 'package:propix8/core/error/failures.dart';
import 'package:propix8/core/models/pagination_model.dart';
import 'package:propix8/feature/home/domain/entities/banner_entity.dart';
import 'package:propix8/feature/home/domain/entities/category_entity.dart';
import 'package:propix8/feature/home/domain/entities/unit_entity.dart';

abstract class UnitRepository {
  Future<Either<Failure, PaginatedResponse<UnitEntity>>> getNearbyUnits({
    int page = 1,
  });

  Future<Either<Failure, List<UnitEntity>>> getLatestUnits();

  Future<Either<Failure, PaginatedResponse<UnitEntity>>> getAllUnits({
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

  Future<Either<Failure, List<CategoryEntity>>> getCategories();

  Future<Either<Failure, List<BannerEntity>>> getBanners();

  Future<Either<Failure, bool>> toggleFavorite(int unitId);
}
