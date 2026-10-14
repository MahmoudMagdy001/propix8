import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:propix8/core/error/failures.dart';
import 'package:propix8/core/models/pagination_model.dart';
import 'package:propix8/feature/home/data/datasources/unit_remote_data_source.dart';
import 'package:propix8/feature/home/domain/entities/banner_entity.dart';
import 'package:propix8/feature/home/domain/entities/category_entity.dart';
import 'package:propix8/feature/home/domain/entities/unit_entity.dart';
import 'package:propix8/feature/home/domain/repositories/unit_repository.dart';

class UnitRepositoryImpl implements UnitRepository {
  const UnitRepositoryImpl(this._remoteDataSource);

  final UnitRemoteDataSource _remoteDataSource;

  @override
  Future<Either<Failure, PaginatedResponse<UnitEntity>>> getNearbyUnits({
    int page = 1,
  }) async {
    try {
      final response = await _remoteDataSource.getNearbyUnits(page: page);
      return Right(
        PaginatedResponse(
          data: response.units.map((u) => u.toDomain()).toList(),
          pagination: response.pagination ?? PaginationModel.empty(),
        ),
      );
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Server error'));
    } on Object catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<UnitEntity>>> getLatestUnits() async {
    try {
      final models = await _remoteDataSource.getLatestUnits();
      return Right(models.map((u) => u.toDomain()).toList());
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Server error'));
    } on Object catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
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
  }) async {
    try {
      final response = await _remoteDataSource.getAllUnits(
        page: page,
        unitTypeId: unitTypeId,
        offerType: offerType,
        developmentStatus: developmentStatus,
        searchQuery: searchQuery,
        minPrice: minPrice,
        maxPrice: maxPrice,
        rooms: rooms,
        bathrooms: bathrooms,
        minArea: minArea,
        maxArea: maxArea,
        cityId: cityId,
      );
      return Right(
        PaginatedResponse(
          data: response.units.map((u) => u.toDomain()).toList(),
          pagination: response.pagination ?? PaginationModel.empty(),
        ),
      );
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Server error'));
    } on Object catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<CategoryEntity>>> getCategories() async {
    try {
      final models = await _remoteDataSource.getCategories();
      return Right(models.map((c) => c.toDomain()).toList());
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Server error'));
    } on Object catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BannerEntity>>> getBanners() async {
    try {
      final models = await _remoteDataSource.getBanners();
      return Right(models.map((b) => b.toDomain()).toList());
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Server error'));
    } on Object catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> toggleFavorite(int unitId) async {
    try {
      final isFav = await _remoteDataSource.toggleFavorite(unitId);
      return Right(isFav);
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Server error'));
    } on Object catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
