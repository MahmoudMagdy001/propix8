import '../../../../core/models/pagination_model.dart';
import '../models/developer_collection_model.dart';
import '../services/developer_service.dart';

abstract class DeveloperRepository {
  Future<DeveloperCollectionModel> getDeveloperUnits(int id, {int? page});
}

class DeveloperRepositoryImpl implements DeveloperRepository {
  DeveloperRepositoryImpl(this._developerService);
  final DeveloperService _developerService;

  @override
  Future<DeveloperCollectionModel> getDeveloperUnits(
    int id, {
    int? page,
  }) async {
    try {
      final response = await _developerService.getDeveloperUnits(
        id,
        page: page,
      );

      return DeveloperCollectionModel.fromJson(
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
