import 'package:dartz/dartz.dart';
import 'package:propix8/core/error/failures.dart';
import 'package:propix8/feature/unit_details/domain/repositories/unit_details_repository.dart';

class DeleteUnitReviewUseCase {
  const DeleteUnitReviewUseCase(this._repository);
  final UnitDetailsRepository _repository;

  Future<Either<Failure, void>> call(int reviewId) =>
      _repository.deleteReview(reviewId);
}
