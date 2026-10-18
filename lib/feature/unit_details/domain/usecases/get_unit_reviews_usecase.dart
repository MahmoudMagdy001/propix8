import 'package:propix8/core/functional/result.dart';
import 'package:propix8/core/models/pagination_model.dart';
import 'package:propix8/feature/unit_details/domain/entities/review_entity.dart';
import 'package:propix8/feature/unit_details/domain/repositories/unit_details_repository.dart';

class GetUnitReviewsUseCase {
  const GetUnitReviewsUseCase(this._repository);
  final UnitDetailsRepository _repository;

  ResultFuture<PaginatedResponse<ReviewEntity>> call(
    int unitId, {
    int page = 1,
  }) =>
      _repository.getReviews(unitId, page: page);
}
