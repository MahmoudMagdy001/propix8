import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:propix8/feature/auth/domain/entities/user_entity.dart';

part 'auth_state.freezed.dart';

enum AuthRequestStatus { initial, loading, success, failure }

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

@freezed
abstract class AuthState with _$AuthState {
  const AuthState._();

  const factory AuthState({
    @Default(AuthRequestStatus.initial) AuthRequestStatus status,
    @Default(AuthenticationStatus.unknown)
    AuthenticationStatus authenticationStatus,
    @Default(AuthRequestStatus.initial) AuthRequestStatus resendStatus,
    @Default(AuthRequestStatus.initial) AuthRequestStatus verificationStatus,
    String? errorMessage,
    String? resendMessage,
    User? user,
  }) = _AuthState;
}
