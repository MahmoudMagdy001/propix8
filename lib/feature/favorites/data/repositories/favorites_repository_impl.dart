import 'package:dio/dio.dart';
import 'package:propix8/core/error/failures.dart';
import 'package:propix8/core/functional/result.dart';
import 'package:propix8/feature/favorites/data/datasources/favorites_remote_data_source.dart';
import 'package:propix8/feature/favorites/domain/entities/favorite_response_entity.dart';
import 'package:propix8/feature/favorites/domain/repositories/favorites_repository.dart';

class FavoritesRepositoryImpl implements FavoritesRepository {
  const FavoritesRepositoryImpl(this._remoteDataSource);

  final FavoritesRemoteDataSource _remoteDataSource;

  @override
  ResultFuture<FavoriteResponseEntity> getFavorites({
    int page = 1,
  }) async {
    try {
      final response = await _remoteDataSource.getFavorites(page: page);
      return right(response.toEntity());
    } on DioException catch (e) {
      return left(ServerFailure(e.message ?? 'Server error'));
    } on Object catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  ResultFuture<bool> toggleFavorite(int unitId) async {
    try {
      final result = await _remoteDataSource.toggleFavorite(unitId);
      return right(result);
    } on DioException catch (e) {
      return left(ServerFailure(e.message ?? 'Server error'));
    } on Object catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
