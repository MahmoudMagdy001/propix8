import 'package:propix8/core/functional/result.dart';
import 'package:propix8/feature/auth/data/models/auth_model.dart';
import 'package:propix8/feature/auth/domain/repositories/auth_repository.dart';

class RegisterUseCase {
  RegisterUseCase(this._repository);
  final AuthRepository _repository;

  ResultFuture<AuthResponse> call(RegisterRequest request) =>
      _repository.register(request);
}
