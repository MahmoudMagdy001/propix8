import 'dart:async';
import 'package:propix8/core/shared/bloc/safe_bloc.dart';
import 'package:propix8/feature/auth/data/models/auth_model.dart';
import 'package:propix8/feature/auth/domain/repositories/auth_repository.dart';
import 'package:propix8/feature/auth/domain/usecases/forgot_password_usecase.dart';
import 'package:propix8/feature/auth/domain/usecases/reset_password_usecase.dart';
import 'package:propix8/feature/auth/presentation/bloc/reset_password_event.dart';
import 'package:propix8/feature/auth/presentation/bloc/reset_password_state.dart';

class ResetPasswordBloc
    extends SafeBloc<ResetPasswordEvent, ResetPasswordState> {
  ResetPasswordBloc({
    required AuthRepository authRepository,
    ForgotPasswordUseCase? forgotPasswordUseCase,
    ResetPasswordUseCase? resetPasswordUseCase,
  })  : _forgotPasswordUseCase =
            forgotPasswordUseCase ?? ForgotPasswordUseCase(authRepository),
        _resetPasswordUseCase =
            resetPasswordUseCase ?? ResetPasswordUseCase(authRepository),
        super(const ResetPasswordState()) {
    on<ForgotPasswordSubmitted>(_onForgotPassword);
    on<ResetPasswordSubmitted>(_onResetPassword);
  }

  final ForgotPasswordUseCase _forgotPasswordUseCase;
  final ResetPasswordUseCase _resetPasswordUseCase;

  Future<void> _onForgotPassword(
    ForgotPasswordSubmitted event,
    Emitter<ResetPasswordState> emit,
  ) async {
    emit(state.copyWith(status: ResetPasswordStatus.loading));

    final result = await _forgotPasswordUseCase(event.email);

    result.fold(
      (failure) => emit(
        state.copyWith(
          status: ResetPasswordStatus.failure,
          errorMessage: failure.message,
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

  Future<void> _onResetPassword(
    ResetPasswordSubmitted event,
    Emitter<ResetPasswordState> emit,
  ) async {
    emit(state.copyWith(status: ResetPasswordStatus.loading));

    final result = await _resetPasswordUseCase(event.request);

    result.fold(
      (failure) => emit(
        state.copyWith(
          status: ResetPasswordStatus.failure,
          errorMessage: failure.message,
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

  Future<void> forgotPassword(String email) async {
    add(ForgotPasswordSubmitted(email));
  }

  Future<void> resetPassword(ResetPasswordRequest request) async {
    add(ResetPasswordSubmitted(request));
  }
}
