import 'package:propix8/core/functional/result.dart';
import 'package:propix8/feature/profile/domain/repositories/user_profile_repository.dart';

class DeleteUserProfileUseCase {
  const DeleteUserProfileUseCase(this._repository);
  final UserProfileRepository _repository;

  ResultUnit call() => _repository.deleteProfile();
}
