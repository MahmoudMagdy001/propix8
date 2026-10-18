import 'package:propix8/core/functional/result.dart';
import 'package:propix8/feature/auth/domain/repositories/auth_repository.dart';

class ForgotPasswordUseCase {
  ForgotPasswordUseCase(this._repository);
  final AuthRepository _repository;

  ResultFuture<Map<String, String>> call(String email) =>
      _repository.forgotPassword(email);
}
