import 'package:freezed_annotation/freezed_annotation.dart';

part 'reset_password_state.freezed.dart';

enum ResetPasswordStatus { initial, loading, success, failure, emailSent }

@freezed
abstract class ResetPasswordState with _$ResetPasswordState {
  const ResetPasswordState._();

  const factory ResetPasswordState({
    @Default(ResetPasswordStatus.initial) ResetPasswordStatus status,
    String? errorMessage,
    String? successMessage,
    String? token,
  }) = _ResetPasswordState;
}
