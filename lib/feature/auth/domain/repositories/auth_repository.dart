import 'package:propix8/core/functional/result.dart';
import 'package:propix8/feature/auth/data/models/auth_model.dart';

abstract class AuthRepository {
  ResultFuture<AuthResponse> login(LoginRequest request);
  ResultFuture<AuthResponse> register(RegisterRequest request);
  ResultFuture<Map<String, String>> forgotPassword(String email);
  ResultFuture<String> resetPassword(ResetPasswordRequest request);
  ResultUnit resendVerificationEmail(String email);
  ResultUnit verifyEmail(String url);
  Future<void> logout();
  Future<void> clearLocalSession();
  bool isLoggedIn();
  User? getCachedUser();
  bool isTokenExpired();
}
