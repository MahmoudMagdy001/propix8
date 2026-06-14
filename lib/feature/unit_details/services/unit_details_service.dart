import 'package:propix8/core/network/dio_client.dart';

class UnitDetailsService {
  UnitDetailsService(this._dioClient);
  final DioClient _dioClient;

  Future<Map<String, dynamic>> getUnitDetails(int unitId) async {
    final response = await _dioClient.get('units/$unitId');
    return response.data as Map<String, dynamic>;
  }

  Future<Map<String, dynamic>> getRelatedUnits(int unitId) async {
    final response = await _dioClient.get('units/$unitId/related');
    return response.data as Map<String, dynamic>;
  }

  Future<Map<String, dynamic>> submitReview({
    required int unitId,
    required int rating,
    String? comment,
  }) async {
    final response = await _dioClient.post(
      'reviews',
      data: {'unit_id': unitId, 'rating': rating, 'comment': comment},
    );
    return response.data as Map<String, dynamic>;
  }

  Future<Map<String, dynamic>> getReviews(int unitId, {int page = 1}) async {
    final response = await _dioClient.get(
      'units/$unitId/reviews',
      queryParameters: {'page': page},
    );
    return response.data as Map<String, dynamic>;
  }

  Future<void> deleteReview(int reviewId) async {
    await _dioClient.delete('reviews/$reviewId');
  }

  Future<Map<String, dynamic>> updateReview({
    required int reviewId,
    required int rating,
    String? comment,
  }) async {
    final response = await _dioClient.post(
      'reviews/$reviewId',
      data: {'rating': rating, 'comment': comment, '_method': 'PUT'},
    );
    return response.data as Map<String, dynamic>;
  }

  Future<void> contactOwner({
    required String name,
    required String email,
    required String phone,
    required String message,
    required int unitId,
  }) async {
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
  }

  Future<Map<String, dynamic>> createBooking(Map<String, dynamic> data) async {
    final response = await _dioClient.post('bookings', data: data);
    return response.data as Map<String, dynamic>;
  }
}
