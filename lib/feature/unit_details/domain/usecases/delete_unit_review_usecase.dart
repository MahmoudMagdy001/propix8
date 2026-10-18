import 'package:propix8/core/functional/result.dart';
import 'package:propix8/feature/unit_details/domain/repositories/unit_details_repository.dart';

class DeleteUnitReviewUseCase {
  const DeleteUnitReviewUseCase(this._repository);
  final UnitDetailsRepository _repository;

  ResultUnit call(int reviewId) =>
      _repository.deleteReview(reviewId);
}
