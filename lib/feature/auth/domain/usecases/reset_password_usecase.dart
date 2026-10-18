import 'package:propix8/core/functional/result.dart';
import 'package:propix8/feature/auth/data/models/auth_model.dart';
import 'package:propix8/feature/auth/domain/repositories/auth_repository.dart';

class ResetPasswordUseCase {
  ResetPasswordUseCase(this._repository);
  final AuthRepository _repository;

  ResultFuture<String> call(ResetPasswordRequest request) =>
      _repository.resetPassword(request);
}
