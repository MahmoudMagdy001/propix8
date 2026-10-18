import 'package:propix8/core/functional/result.dart';
import 'package:propix8/core/models/pagination_model.dart';
import 'package:propix8/feature/home/domain/entities/unit_entity.dart';
import 'package:propix8/feature/home/domain/repositories/unit_repository.dart';

class GetAllUnitsUseCase {
  const GetAllUnitsUseCase(this._repository);

  final UnitRepository _repository;

  ResultFuture<PaginatedResponse<UnitEntity>> call({
    int page = 1,
    int? unitTypeId,
    String? offerType,
    String? developmentStatus,
    String? searchQuery,
    double? minPrice,
    double? maxPrice,
    int? rooms,
    int? bathrooms,
    double? minArea,
    double? maxArea,
    int? cityId,
  }) => _repository.getAllUnits(
    page: page,
    unitTypeId: unitTypeId,
    offerType: offerType,
    developmentStatus: developmentStatus,
    searchQuery: searchQuery,
    minPrice: minPrice,
    maxPrice: maxPrice,
    rooms: rooms,
    bathrooms: bathrooms,
    minArea: minArea,
    maxArea: maxArea,
    cityId: cityId,
  );
}
