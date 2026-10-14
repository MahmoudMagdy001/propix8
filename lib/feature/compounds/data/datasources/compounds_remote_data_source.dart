import 'package:propix8/core/network/dio_client.dart';
import 'package:propix8/feature/compounds/data/models/compound_response_model.dart';

abstract class CompoundsRemoteDataSource {
  Future<CompoundResponseModel> getCompounds();
}

class CompoundsRemoteDataSourceImpl implements CompoundsRemoteDataSource {
  const CompoundsRemoteDataSourceImpl(this._dioClient);

  final DioClient _dioClient;

  @override
  Future<CompoundResponseModel> getCompounds() async {
    final response = await _dioClient.get('compounds');
    return CompoundResponseModel.fromJson(
      response.data as Map<String, dynamic>,
    );
  }
}
