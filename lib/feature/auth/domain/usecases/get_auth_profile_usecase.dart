import 'package:propix8/core/functional/result.dart';
import 'package:propix8/feature/auth/domain/entities/user_entity.dart';
import 'package:propix8/feature/auth/domain/repositories/address_setup_repository.dart';

class GetAuthProfileUseCase {
  GetAuthProfileUseCase(this._repository);
  final AddressSetupRepository _repository;

  ResultFuture<User> call() => _repository.getProfile();
}
