import 'package:propix8/core/functional/result.dart';
import 'package:propix8/feature/auth/domain/entities/city_entity.dart';
import 'package:propix8/feature/auth/domain/repositories/address_setup_repository.dart';

class GetCitiesUseCase {
  GetCitiesUseCase(this._repository);
  final AddressSetupRepository _repository;

  ResultFuture<List<City>> call() => _repository.getCities();
}
