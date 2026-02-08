import '../../../core/network/dio_client.dart';
import '../models/favorite_model.dart';

class FavoriteService {
  FavoriteService(this._dioClient);
  final DioClient _dioClient;

  Future<FavoriteResponse> getFavorites({int page = 1}) async {
    try {
      final response = await _dioClient.get(
        'favorites',
        queryParameters: {'page': page},
      );
      return FavoriteResponse.fromJson(response.data as Map<String, dynamic>);
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> toggleFavorite(int unitId) async {
    try {
      final response = await _dioClient.post(
        'favorites/toggle',
        data: {'unit_id': unitId},
      );
      return (response.data as Map<String, dynamic>)['status'] as bool? ??
          false;
    } catch (e) {
      rethrow;
    }
  }
}
