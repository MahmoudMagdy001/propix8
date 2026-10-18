import 'package:propix8/core/functional/result.dart';
import 'package:propix8/feature/auth/data/models/auth_model.dart';
import 'package:propix8/feature/auth/domain/repositories/auth_repository.dart';

class LoginUseCase {
  LoginUseCase(this._repository);
  final AuthRepository _repository;

  ResultFuture<AuthResponse> call(LoginRequest request) =>
      _repository.login(request);
}
