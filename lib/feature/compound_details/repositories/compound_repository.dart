import '../../../../core/models/pagination_model.dart';
import '../models/compound_collection_model.dart';
import '../services/compound_service.dart';

abstract class CompoundRepository {
  Future<CompoundCollectionModel> getCompoundUnits(int id, {int? page});
}

class CompoundRepositoryImpl implements CompoundRepository {
  CompoundRepositoryImpl(this._compoundService);
  final CompoundService _compoundService;

  @override
  Future<CompoundCollectionModel> getCompoundUnits(int id, {int? page}) async {
    try {
      final response = await _compoundService.getCompoundUnits(id, page: page);
      return CompoundCollectionModel.fromJson(
        response['data'] as Map<String, dynamic>,
        pagination: response['pagination'] != null
            ? PaginationModel.fromJson(
                response['pagination'] as Map<String, dynamic>,
              )
            : null,
      );
    } catch (e) {
      rethrow;
    }
  }
}
