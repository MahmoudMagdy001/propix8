import 'package:propix8/core/functional/result.dart';
import 'package:propix8/feature/auth/domain/repositories/auth_repository.dart';

class VerifyEmailUseCase {
  VerifyEmailUseCase(this._repository);
  final AuthRepository _repository;

  ResultUnit call(String url) => _repository.verifyEmail(url);
}
