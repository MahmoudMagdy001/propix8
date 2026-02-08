import '../../../../core/network/dio_client.dart';
import '../models/compound_model.dart';

class CompoundsService {
  CompoundsService(this._dioClient);
  final DioClient _dioClient;

  Future<CompoundResponse> getCompounds() async {
    try {
      final response = await _dioClient.get('compounds');
      return CompoundResponse.fromJson(response.data as Map<String, dynamic>);
    } catch (e) {
      rethrow;
    }
  }
}
