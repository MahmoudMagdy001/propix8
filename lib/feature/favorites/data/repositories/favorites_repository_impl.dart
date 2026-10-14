import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:propix8/core/error/failures.dart';
import 'package:propix8/feature/favorites/data/datasources/favorites_remote_data_source.dart';
import 'package:propix8/feature/favorites/domain/entities/favorite_response_entity.dart';
import 'package:propix8/feature/favorites/domain/repositories/favorites_repository.dart';

class FavoritesRepositoryImpl implements FavoritesRepository {
  const FavoritesRepositoryImpl(this._remoteDataSource);

  final FavoritesRemoteDataSource _remoteDataSource;

  @override
  Future<Either<Failure, FavoriteResponseEntity>> getFavorites({
    int page = 1,
  }) async {
    try {
      final response = await _remoteDataSource.getFavorites(page: page);
      return Right(response);
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Server error'));
    } on Object catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> toggleFavorite(int unitId) async {
    try {
      final result = await _remoteDataSource.toggleFavorite(unitId);
      return Right(result);
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Server error'));
    } on Object catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
