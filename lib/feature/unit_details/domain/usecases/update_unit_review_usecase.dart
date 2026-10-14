import 'package:dartz/dartz.dart';
import 'package:propix8/core/error/failures.dart';
import 'package:propix8/feature/unit_details/domain/entities/review_entity.dart';
import 'package:propix8/feature/unit_details/domain/repositories/unit_details_repository.dart';

class UpdateUnitReviewUseCase {
  const UpdateUnitReviewUseCase(this._repository);
  final UnitDetailsRepository _repository;

  Future<Either<Failure, ReviewEntity>> call(
    int reviewId,
    int rating,
    String? comment,
  ) =>
      _repository.updateReview(reviewId, rating, comment);
}
