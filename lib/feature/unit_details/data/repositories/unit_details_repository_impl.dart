import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:propix8/core/error/failures.dart';
import 'package:propix8/core/models/pagination_model.dart';
import 'package:propix8/core/services/booking_event_service.dart';
import 'package:propix8/feature/home/domain/entities/unit_entity.dart';
import 'package:propix8/feature/unit_details/data/datasources/unit_details_remote_data_source.dart';
import 'package:propix8/feature/unit_details/data/models/booking_request_model.dart';
import 'package:propix8/feature/unit_details/data/models/review_model.dart';
import 'package:propix8/feature/unit_details/domain/entities/review_entity.dart';
import 'package:propix8/feature/unit_details/domain/entities/unit_booking_entity.dart';
import 'package:propix8/feature/unit_details/domain/entities/unit_details_entity.dart';
import 'package:propix8/feature/unit_details/domain/repositories/unit_details_repository.dart';

class UnitDetailsRepositoryImpl implements UnitDetailsRepository {
  const UnitDetailsRepositoryImpl(
    this._remoteDataSource,
    this._bookingEventService,
  );

  final UnitDetailsRemoteDataSource _remoteDataSource;
  final BookingEventService _bookingEventService;

  @override
  Future<Either<Failure, UnitDetailsEntity>> getUnitDetails(int unitId) async {
    try {
      final model = await _remoteDataSource.getUnitDetails(unitId);
      return Right(model.toEntity());
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Server error'));
    } on Object catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<UnitEntity>>> getRelatedUnits(int unitId) async {
    try {
      final models = await _remoteDataSource.getRelatedUnits(unitId);
      return Right(models.map((m) => m.toDomain()).toList());
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Server error'));
    } on Object catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, PaginatedResponse<ReviewEntity>>> getReviews(
    int unitId, {
    int page = 1,
  }) async {
    try {
      final json = await _remoteDataSource.getReviews(unitId, page: page);
      final rawList = json['data'] as List?;
      final reviews = rawList
              ?.map((r) => ReviewModel.fromJson(r as Map<String, dynamic>).toEntity())
              .toList() ??
          [];
      final pagination = PaginationModel.fromJson(
        json['pagination'] as Map<String, dynamic>?,
      );
      return Right(PaginatedResponse(data: reviews, pagination: pagination));
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Server error'));
    } on Object catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ReviewEntity>> submitReview(
    int unitId,
    int rating,
    String? comment,
  ) async {
    try {
      final model = await _remoteDataSource.submitReview(
        unitId: unitId,
        rating: rating,
        comment: comment,
      );
      return Right(model.toEntity());
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Server error'));
    } on Object catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteReview(int reviewId) async {
    try {
      await _remoteDataSource.deleteReview(reviewId);
      return const Right(null);
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Server error'));
    } on Object catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ReviewEntity>> updateReview(
    int reviewId,
    int rating,
    String? comment,
  ) async {
    try {
      final model = await _remoteDataSource.updateReview(
        reviewId: reviewId,
        rating: rating,
        comment: comment,
      );
      return Right(model.toEntity());
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Server error'));
    } on Object catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> contactOwner({
    required String name,
    required String email,
    required String phone,
    required String message,
    required int unitId,
  }) async {
    try {
      await _remoteDataSource.contactOwner(
        name: name,
        email: email,
        phone: phone,
        message: message,
        unitId: unitId,
      );
      return const Right(null);
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Server error'));
    } on Object catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UnitBookingResponseEntity>> createBooking({
    required int unitId,
    required String name,
    required String email,
    required String phone,
    required String date,
    required String time,
    required String notes,
  }) async {
    try {
      final request = BookingRequestModel(
        unitId: unitId,
        name: name,
        email: email,
        phone: phone,
        date: date,
        time: time,
        notes: notes,
      );
      final model = await _remoteDataSource.createBooking(request);
      _bookingEventService.notifyBookingChanged();
      return Right(model.toEntity());
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Server error'));
    } on Object catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
