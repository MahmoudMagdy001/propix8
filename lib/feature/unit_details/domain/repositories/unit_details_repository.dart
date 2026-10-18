import 'package:propix8/core/functional/result.dart';
import 'package:propix8/core/models/pagination_model.dart';
import 'package:propix8/feature/home/domain/entities/unit_entity.dart';
import 'package:propix8/feature/unit_details/domain/entities/review_entity.dart';
import 'package:propix8/feature/unit_details/domain/entities/unit_booking_entity.dart';
import 'package:propix8/feature/unit_details/domain/entities/unit_details_entity.dart';

abstract class UnitDetailsRepository {
  ResultFuture<UnitDetailsEntity> getUnitDetails(int unitId);
  ResultFuture<List<UnitEntity>> getRelatedUnits(int unitId);
  ResultFuture<PaginatedResponse<ReviewEntity>> getReviews(
    int unitId, {
    int page = 1,
  });
  ResultFuture<ReviewEntity> submitReview(
    int unitId,
    int rating,
    String? comment,
  );
  ResultUnit deleteReview(int reviewId);
  ResultFuture<ReviewEntity> updateReview(
    int reviewId,
    int rating,
    String? comment,
  );
  ResultUnit contactOwner({
    required String name,
    required String email,
    required String phone,
    required String message,
    required int unitId,
  });
  ResultFuture<UnitBookingResponseEntity> createBooking({
    required int unitId,
    required String name,
    required String email,
    required String phone,
    required String date,
    required String time,
    required String notes,
  });
}
