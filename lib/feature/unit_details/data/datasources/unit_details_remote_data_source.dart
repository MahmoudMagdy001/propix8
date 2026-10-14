import 'package:propix8/core/network/dio_client.dart';
import 'package:propix8/feature/home/data/models/unit_model.dart';
import 'package:propix8/feature/unit_details/data/models/booking_request_model.dart';
import 'package:propix8/feature/unit_details/data/models/booking_response_model.dart';
import 'package:propix8/feature/unit_details/data/models/review_model.dart';
import 'package:propix8/feature/unit_details/data/models/unit_details_model.dart';

abstract class UnitDetailsRemoteDataSource {
  Future<UnitDetailsModel> getUnitDetails(int unitId);
  Future<List<UnitModel>> getRelatedUnits(int unitId);
  Future<Map<String, dynamic>> getReviews(int unitId, {int page = 1});
  Future<ReviewModel> submitReview({
    required int unitId,
    required int rating,
    String? comment,
  });
  Future<void> deleteReview(int reviewId);
  Future<ReviewModel> updateReview({
    required int reviewId,
    required int rating,
    String? comment,
  });
  Future<void> contactOwner({
    required String name,
    required String email,
    required String phone,
    required String message,
    required int unitId,
  });
  Future<BookingResponseModel> createBooking(BookingRequestModel request);
}

class UnitDetailsRemoteDataSourceImpl implements UnitDetailsRemoteDataSource {
  const UnitDetailsRemoteDataSourceImpl(this._dioClient);
  final DioClient _dioClient;

  @override
  Future<UnitDetailsModel> getUnitDetails(int unitId) async {
    final response = await _dioClient.get('units/$unitId');
    final data = response.data as Map<String, dynamic>;
    return UnitDetailsModel.fromJson(data['data'] as Map<String, dynamic>?);
  }

  @override
  Future<List<UnitModel>> getRelatedUnits(int unitId) async {
    final response = await _dioClient.get('units/$unitId/related');
    final data = response.data as Map<String, dynamic>;
    return (data['data'] as List?)
            ?.map((unit) => UnitModel.fromJson(unit as Map<String, dynamic>))
            .toList() ??
        [];
  }

  @override
  Future<Map<String, dynamic>> getReviews(int unitId, {int page = 1}) async {
    final response = await _dioClient.get(
      'units/$unitId/reviews',
      queryParameters: {'page': page},
    );
    return response.data as Map<String, dynamic>;
  }

  @override
  Future<ReviewModel> submitReview({
    required int unitId,
    required int rating,
    String? comment,
  }) async {
    final response = await _dioClient.post(
      'reviews',
      data: {'unit_id': unitId, 'rating': rating, 'comment': comment},
    );
    final data = response.data as Map<String, dynamic>;
    return ReviewModel.fromJson(data['data'] as Map<String, dynamic>);
  }

  @override
  Future<void> deleteReview(int reviewId) async {
    await _dioClient.delete('reviews/$reviewId');
  }

  @override
  Future<ReviewModel> updateReview({
    required int reviewId,
    required int rating,
    String? comment,
  }) async {
    final response = await _dioClient.post(
      'reviews/$reviewId',
      data: {'rating': rating, 'comment': comment, '_method': 'PUT'},
    );
    final data = response.data as Map<String, dynamic>;
    return ReviewModel.fromJson(data['data'] as Map<String, dynamic>);
  }

  @override
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

  @override
  Future<BookingResponseModel> createBooking(BookingRequestModel request) async {
    final response = await _dioClient.post('bookings', data: request.toJson());
    return BookingResponseModel.fromJson(response.data as Map<String, dynamic>);
  }
}
