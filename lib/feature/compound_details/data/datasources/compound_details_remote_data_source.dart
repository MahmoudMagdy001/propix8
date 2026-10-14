import 'package:propix8/core/models/pagination_model.dart';
import 'package:propix8/core/network/dio_client.dart';
import 'package:propix8/feature/compound_details/data/models/compound_collection_model.dart';

abstract class CompoundDetailsRemoteDataSource {
  Future<CompoundCollectionModel> getCompoundUnits(int id, {int? page});
}

class CompoundDetailsRemoteDataSourceImpl
    implements CompoundDetailsRemoteDataSource {
  const CompoundDetailsRemoteDataSourceImpl(this._dioClient);

  final DioClient _dioClient;

  @override
  Future<CompoundCollectionModel> getCompoundUnits(int id, {int? page}) async {
    final response = await _dioClient.get(
      'compounds/$id',
      queryParameters: {'page': ?page},
    );
    final data = response.data as Map<String, dynamic>;
    return CompoundCollectionModel.fromJson(
      data['data'] as Map<String, dynamic>,
      pagination: data['pagination'] != null
          ? PaginationModel.fromJson(
              data['pagination'] as Map<String, dynamic>,
            )
          : null,
    );
  }
}
