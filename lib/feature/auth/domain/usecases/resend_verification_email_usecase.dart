import 'package:propix8/core/functional/result.dart';
import 'package:propix8/feature/auth/domain/repositories/auth_repository.dart';

class ResendVerificationEmailUseCase {
  ResendVerificationEmailUseCase(this._repository);
  final AuthRepository _repository;

  ResultUnit call(String email) => _repository.resendVerificationEmail(email);
}
