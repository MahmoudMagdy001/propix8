import 'package:propix8/core/functional/result.dart';
import 'package:propix8/feature/auth/domain/entities/user_entity.dart';
import 'package:propix8/feature/auth/domain/repositories/address_setup_repository.dart';

class UpdateAddressProfileUseCase {
  UpdateAddressProfileUseCase(this._repository);
  final AddressSetupRepository _repository;

  ResultFuture<User> call({
    required int cityId,
    required String address,
  }) =>
      _repository.updateProfile(cityId: cityId, address: address);
}
