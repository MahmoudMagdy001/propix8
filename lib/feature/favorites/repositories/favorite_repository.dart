import '../models/favorite_model.dart';
import '../services/favorite_service.dart';

abstract class FavoriteRepository {
  Future<FavoriteResponse> getFavorites({int page = 1});
  Future<bool> toggleFavorite(int unitId);
}

class FavoriteRepositoryImpl implements FavoriteRepository {
  FavoriteRepositoryImpl(this._favoriteService);
  final FavoriteService _favoriteService;

  @override
  Future<FavoriteResponse> getFavorites({int page = 1}) async {
    try {
      return await _favoriteService.getFavorites(page: page);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> toggleFavorite(int unitId) async {
    try {
      return await _favoriteService.toggleFavorite(unitId);
    } catch (e) {
      rethrow;
    }
  }
}
