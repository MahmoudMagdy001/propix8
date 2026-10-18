import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:propix8/feature/auth/data/models/auth_model.dart';

part 'auth_event.freezed.dart';

@freezed
sealed class AuthEvent with _$AuthEvent {
  const factory AuthEvent.checkAuthStatusRequested() = CheckAuthStatusRequested;

  const factory AuthEvent.loginRequested({
    required String email,
    required String password,
  }) = LoginRequested;

  const factory AuthEvent.registerRequested(RegisterRequest request) =
      RegisterRequested;

  const factory AuthEvent.logoutRequested() = LogoutRequested;

  const factory AuthEvent.clearLocalSessionRequested() =
      ClearLocalSessionRequested;

  const factory AuthEvent.resendVerificationEmailRequested(String email) =
      ResendVerificationEmailRequested;

  const factory AuthEvent.verifyEmailRequested(String url) =
      VerifyEmailRequested;

  const factory AuthEvent.authUserUpdated(User user) = AuthUserUpdated;

  const factory AuthEvent.checkUserProfileRequested({
    @Default(false) bool isBackgroundSync,
  }) = CheckUserProfileRequested;
}
