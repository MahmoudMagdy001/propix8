import 'package:dartz/dartz.dart';
import 'package:propix8/core/error/failures.dart';
import 'package:propix8/core/models/pagination_model.dart';
import 'package:propix8/feature/home/domain/entities/unit_entity.dart';
import 'package:propix8/feature/home/domain/usecases/get_all_units_usecase.dart';

class SearchUnitsUseCase {
  const SearchUnitsUseCase(this._getAllUnitsUseCase);

  final GetAllUnitsUseCase _getAllUnitsUseCase;

  Future<Either<Failure, PaginatedResponse<UnitEntity>>> call({
    required String query,
    int page = 1,
  }) =>
      _getAllUnitsUseCase(
        searchQuery: query,
        page: page,
      );
}
