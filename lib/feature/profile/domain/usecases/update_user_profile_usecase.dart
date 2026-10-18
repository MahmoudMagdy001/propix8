import 'package:propix8/core/functional/result.dart';
import 'package:propix8/feature/auth/data/models/auth_model.dart';
import 'package:propix8/feature/profile/domain/repositories/user_profile_repository.dart';

class UpdateUserProfileUseCase {
  const UpdateUserProfileUseCase(this._repository);
  final UserProfileRepository _repository;

  ResultFuture<User> call(
    Map<String, dynamic> data, {
    String? avatarPath,
  }) =>
      _repository.updateProfile(data, avatarPath: avatarPath);
}
