import 'package:propix8/core/functional/result.dart';
import 'package:propix8/feature/auth/data/models/auth_model.dart';
import 'package:propix8/feature/profile/domain/repositories/user_profile_repository.dart';

class GetUserProfileUseCase {
  const GetUserProfileUseCase(this._repository);
  final UserProfileRepository _repository;

  ResultFuture<User> call({bool forceRefresh = false}) =>
      _repository.getProfile(forceRefresh: forceRefresh);
}
