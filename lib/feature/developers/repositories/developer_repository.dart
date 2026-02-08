import '../models/developer_model.dart';
import '../services/developer_service.dart';

abstract class DevelopersRepository {
  Future<List<DeveloperModel>> getDevelopers();
}

class DevelopersRepositoryImpl implements DevelopersRepository {
  DevelopersRepositoryImpl(this._service);
  final DevelopersService _service;

  @override
  Future<List<DeveloperModel>> getDevelopers() async {
    try {
      final response = await _service.getDevelopers();
      if (response.status) {
        return response.data;
      } else {
        throw Exception(response.message);
      }
    } catch (e) {
      rethrow;
    }
  }
}
