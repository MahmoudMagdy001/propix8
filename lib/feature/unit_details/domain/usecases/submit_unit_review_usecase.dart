import 'package:dartz/dartz.dart';
import 'package:propix8/core/error/failures.dart';
import 'package:propix8/feature/unit_details/domain/entities/review_entity.dart';
import 'package:propix8/feature/unit_details/domain/repositories/unit_details_repository.dart';

class SubmitUnitReviewUseCase {
  const SubmitUnitReviewUseCase(this._repository);
  final UnitDetailsRepository _repository;

  Future<Either<Failure, ReviewEntity>> call(
    int unitId,
    int rating,
    String? comment,
  ) =>
      _repository.submitReview(unitId, rating, comment);
}
