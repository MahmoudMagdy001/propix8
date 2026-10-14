import 'package:propix8/core/models/pagination_model.dart';
import 'package:propix8/core/network/dio_client.dart';
import 'package:propix8/feature/developer_details/data/models/developer_collection_model.dart';

abstract class DeveloperDetailsRemoteDataSource {
  Future<DeveloperCollectionModel> getDeveloperUnits(int id, {int? page});
}

class DeveloperDetailsRemoteDataSourceImpl
    implements DeveloperDetailsRemoteDataSource {
  const DeveloperDetailsRemoteDataSourceImpl(this._dioClient);

  final DioClient _dioClient;

  @override
  Future<DeveloperCollectionModel> getDeveloperUnits(int id, {int? page}) async {
    final response = await _dioClient.get(
      'developers/$id',
      queryParameters: page != null ? {'page': page} : null,
    );
    final data = response.data as Map<String, dynamic>;
    return DeveloperCollectionModel.fromJson(
      data['data'] as Map<String, dynamic>,
      pagination: data['pagination'] != null
          ? PaginationModel.fromJson(
              data['pagination'] as Map<String, dynamic>,
            )
          : null,
    );
  }
}
