import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:propix8/feature/auth/models/auth_model.dart';
import 'package:propix8/feature/auth/repositories/auth_repository.dart';
import 'package:propix8/feature/auth/viewmodels/reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit(this._authRepository) : super(const ResetPasswordState());
  final AuthRepository _authRepository;

  Future<void> forgotPassword(String email) async {
    emit(state.copyWith(status: ResetPasswordStatus.loading));

    final result = await _authRepository.forgotPassword(email);
    if (isClosed) return;

    result.fold(
      (error) => emit(
        state.copyWith(
          status: ResetPasswordStatus.failure,
          errorMessage: error,
        ),
      ),
      (data) => emit(
        state.copyWith(
          status: ResetPasswordStatus.emailSent,
          successMessage: data['message'],
          token: data['token'],
        ),
      ),
    );
  }

  Future<void> resetPassword(ResetPasswordRequest request) async {
    emit(state.copyWith(status: ResetPasswordStatus.loading));

    final result = await _authRepository.resetPassword(request);
    if (isClosed) return;

    result.fold(
      (error) => emit(
        state.copyWith(
          status: ResetPasswordStatus.failure,
          errorMessage: error,
        ),
      ),
      (message) => emit(
        state.copyWith(
          status: ResetPasswordStatus.success,
          successMessage: message,
        ),
      ),
    );
  }
}
