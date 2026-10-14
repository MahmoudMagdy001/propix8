import 'package:dartz/dartz.dart';
import 'package:propix8/core/error/failures.dart';
import 'package:propix8/core/models/pagination_model.dart';
import 'package:propix8/feature/home/domain/entities/unit_entity.dart';
import 'package:propix8/feature/unit_details/domain/entities/review_entity.dart';
import 'package:propix8/feature/unit_details/domain/entities/unit_booking_entity.dart';
import 'package:propix8/feature/unit_details/domain/entities/unit_details_entity.dart';

abstract class UnitDetailsRepository {
  Future<Either<Failure, UnitDetailsEntity>> getUnitDetails(int unitId);
  Future<Either<Failure, List<UnitEntity>>> getRelatedUnits(int unitId);
  Future<Either<Failure, PaginatedResponse<ReviewEntity>>> getReviews(
    int unitId, {
    int page = 1,
  });
  Future<Either<Failure, ReviewEntity>> submitReview(
    int unitId,
    int rating,
    String? comment,
  );
  Future<Either<Failure, void>> deleteReview(int reviewId);
  Future<Either<Failure, ReviewEntity>> updateReview(
    int reviewId,
    int rating,
    String? comment,
  );
  Future<Either<Failure, void>> contactOwner({
    required String name,
    required String email,
    required String phone,
    required String message,
    required int unitId,
  });
  Future<Either<Failure, UnitBookingResponseEntity>> createBooking({
    required int unitId,
    required String name,
    required String email,
    required String phone,
    required String date,
    required String time,
    required String notes,
  });
}
