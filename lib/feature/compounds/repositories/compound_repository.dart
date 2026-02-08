import '../models/compound_model.dart';
import '../services/compound_service.dart';

abstract class CompoundsRepository {
  Future<List<CompoundModel>> getCompounds();
}

class CompoundsRepositoryImpl implements CompoundsRepository {
  CompoundsRepositoryImpl(this._service);
  final CompoundsService _service;

  @override
  Future<List<CompoundModel>> getCompounds() async {
    try {
      final response = await _service.getCompounds();
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
