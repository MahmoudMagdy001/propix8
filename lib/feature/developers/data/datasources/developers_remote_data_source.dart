import 'package:propix8/core/network/dio_client.dart';
import 'package:propix8/feature/developers/data/models/developer_response_model.dart';

abstract class DevelopersRemoteDataSource {
  Future<DeveloperResponseModel> getDevelopers();
}

class DevelopersRemoteDataSourceImpl implements DevelopersRemoteDataSource {
  const DevelopersRemoteDataSourceImpl(this._dioClient);

  final DioClient _dioClient;

  @override
  Future<DeveloperResponseModel> getDevelopers() async {
    final response = await _dioClient.get('developers');
    return DeveloperResponseModel.fromJson(
      response.data as Map<String, dynamic>,
    );
  }
}
