import 'package:propix8/core/functional/result.dart';
import 'package:propix8/feature/auth/data/models/city_model.dart';
import 'package:propix8/feature/profile/domain/repositories/user_profile_repository.dart';

class GetProfileCitiesUseCase {
  const GetProfileCitiesUseCase(this._repository);
  final UserProfileRepository _repository;

  ResultFuture<List<City>> call() => _repository.getCities();
}
