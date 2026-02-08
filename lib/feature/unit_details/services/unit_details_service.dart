import '../../../core/network/dio_client.dart';

class UnitDetailsService {
  UnitDetailsService(this._dioClient);
  final DioClient _dioClient;

  Future<Map<String, dynamic>> getUnitDetails(int unitId) async {
    try {
      final response = await _dioClient.get('units/$unitId');
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> getRelatedUnits(int unitId) async {
    try {
      final response = await _dioClient.get('units/$unitId/related');
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> submitReview({
    required int unitId,
    required int rating,
    String? comment,
  }) async {
    try {
      final response = await _dioClient.post(
        'reviews',
        data: {'unit_id': unitId, 'rating': rating, 'comment': comment},
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> getReviews(int unitId, {int page = 1}) async {
    try {
      final response = await _dioClient.get(
        'units/$unitId/reviews',
        queryParameters: {'page': page},
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteReview(int reviewId) async {
    try {
      await _dioClient.delete('reviews/$reviewId');
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> updateReview({
    required int reviewId,
    required int rating,
    String? comment,
  }) async {
    try {
      final response = await _dioClient.post(
        'reviews/$reviewId',
        data: {'rating': rating, 'comment': comment, '_method': 'PUT'},
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> contactOwner({
    required String name,
    required String email,
    required String phone,
    required String message,
    required int unitId,
  }) async {
    try {
      await _dioClient.post(
        'contact',
        data: {
          'name': name,
          'email': email,
          'phone': phone,
          'message': message,
          'unit_id': unitId,
        },
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> createBooking(Map<String, dynamic> data) async {
    try {
      final response = await _dioClient.post('bookings', data: data);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
