import 'package:propix8/core/network/dio_client.dart';
import 'package:propix8/feature/favorites/data/models/favorite_response_model.dart';

abstract class FavoritesRemoteDataSource {
  Future<FavoriteResponseModel> getFavorites({int page = 1});
  Future<bool> toggleFavorite(int unitId);
}

class FavoritesRemoteDataSourceImpl implements FavoritesRemoteDataSource {
  const FavoritesRemoteDataSourceImpl(this._dioClient);

  final DioClient _dioClient;

  @override
  Future<FavoriteResponseModel> getFavorites({int page = 1}) async {
    final response = await _dioClient.get(
      'favorites',
      queryParameters: {'page': page},
    );
    return FavoriteResponseModel.fromJson(
      response.data as Map<String, dynamic>,
    );
  }

  @override
  Future<bool> toggleFavorite(int unitId) async {
    final response = await _dioClient.post(
      'favorites/toggle',
      data: {'unit_id': unitId},
    );
    return (response.data as Map<String, dynamic>)['status'] as bool? ?? false;
  }
}
