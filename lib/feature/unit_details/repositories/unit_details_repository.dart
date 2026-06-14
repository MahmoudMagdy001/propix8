import 'package:propix8/core/models/pagination_model.dart';
import 'package:propix8/core/services/booking_event_service.dart';
import 'package:propix8/feature/home/models/unit_model.dart';
import 'package:propix8/feature/unit_details/models/booking_request_model.dart';
import 'package:propix8/feature/unit_details/models/booking_response_model.dart';
import 'package:propix8/feature/unit_details/models/review_model.dart';
import 'package:propix8/feature/unit_details/models/unit_details_model.dart';
import 'package:propix8/feature/unit_details/services/unit_details_service.dart';

abstract class UnitDetailsRepository {
  Future<UnitDetailsModel> getUnitDetails(int unitId);
  Future<List<UnitModel>> getRelatedUnits(int unitId);
  Future<PaginatedResponse<ReviewModel>> getReviews(int unitId, {int page = 1});
  Future<ReviewModel> submitReview(int unitId, int rating, String? comment);
  Future<void> deleteReview(int reviewId);
  Future<ReviewModel> updateReview(int reviewId, int rating, String? comment);
  Future<void> contactOwner({
    required String name,
    required String email,
    required String phone,
    required String message,
    required int unitId,
  });
  Future<BookingResponse> createBooking(BookingRequestModel request);
}

class UnitDetailsRepositoryImpl implements UnitDetailsRepository {
  UnitDetailsRepositoryImpl(
    this._unitDetailsService,
    this._bookingEventService,
  );
  final UnitDetailsService _unitDetailsService;
  final BookingEventService _bookingEventService;

  @override
  Future<UnitDetailsModel> getUnitDetails(int unitId) async {
    try {
      final json = await _unitDetailsService.getUnitDetails(unitId);
      return UnitDetailsModel.fromJson(json['data'] as Map<String, dynamic>?);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<UnitModel>> getRelatedUnits(int unitId) async {
    try {
      final json = await _unitDetailsService.getRelatedUnits(unitId);
      return (json['data'] as List?)
              ?.map((unit) => UnitModel.fromJson(unit as Map<String, dynamic>))
              .toList() ??
          [];
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ReviewModel> submitReview(
    int unitId,
    int rating,
    String? comment,
  ) async {
    try {
      final json = await _unitDetailsService.submitReview(
        unitId: unitId,
        rating: rating,
        comment: comment,
      );
      return ReviewModel.fromJson(json['data'] as Map<String, dynamic>);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<PaginatedResponse<ReviewModel>> getReviews(
    int unitId, {
    int page = 1,
  }) async {
    try {
      final json = await _unitDetailsService.getReviews(unitId, page: page);
      final reviews =
          (json['data'] as List?)
              ?.map((review) =>
                  ReviewModel.fromJson(review as Map<String, dynamic>))
              .toList() ??
          [];
      final pagination = PaginationModel.fromJson(
          json['pagination'] as Map<String, dynamic>?);
      return PaginatedResponse(data: reviews, pagination: pagination);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteReview(int reviewId) async {
    try {
      await _unitDetailsService.deleteReview(reviewId);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ReviewModel> updateReview(
    int reviewId,
    int rating,
    String? comment,
  ) async {
    try {
      final json = await _unitDetailsService.updateReview(
        reviewId: reviewId,
        rating: rating,
        comment: comment,
      );
      return ReviewModel.fromJson(json['data'] as Map<String, dynamic>);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> contactOwner({
    required String name,
    required String email,
    required String phone,
    required String message,
    required int unitId,
  }) async {
    try {
      await _unitDetailsService.contactOwner(
        name: name,
        email: email,
        phone: phone,
        message: message,
        unitId: unitId,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<BookingResponse> createBooking(BookingRequestModel request) async {
    try {
      final json = await _unitDetailsService.createBooking(request.toJson());
      _bookingEventService.notifyBookingChanged();
      return BookingResponse.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }
}
