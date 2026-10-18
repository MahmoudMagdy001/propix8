import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:propix8/feature/auth/data/models/auth_model.dart';

part 'reset_password_event.freezed.dart';

@freezed
sealed class ResetPasswordEvent with _$ResetPasswordEvent {
  const factory ResetPasswordEvent.forgotPasswordSubmitted(String email) =
      ForgotPasswordSubmitted;

  const factory ResetPasswordEvent.resetPasswordSubmitted(
    ResetPasswordRequest request,
  ) = ResetPasswordSubmitted;
}
