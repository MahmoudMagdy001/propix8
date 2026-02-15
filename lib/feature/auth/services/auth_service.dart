import '../../../core/network/dio_client.dart';
import '../../../core/utils/auth_constants.dart';
import '../models/auth_model.dart';

/// Handles direct API interactions for authentication endpoints.
///
/// Returns raw or lightly-parsed responses. Exceptions propagate to the
/// repository layer for user-friendly error mapping.
class AuthService {
  AuthService(this._dioClient);
  final DioClient _dioClient;

  Future<AuthResponse> login(LoginRequest request) async {
    final response = await _dioClient.post(
      AuthConstants.loginEndpoint,
      data: request.toJson(),
    );
    return AuthResponse.fromJson(response.data);
  }

  Future<AuthResponse> register(RegisterRequest request) async {
    final response = await _dioClient.post(
      AuthConstants.registerEndpoint,
      data: request.toJson(),
    );
    return AuthResponse.fromJson(response.data);
  }

  Future<Map<String, String>> forgotPassword(String email) async {
    final response = await _dioClient.post(
      AuthConstants.forgotPasswordEndpoint,
      data: {'email': email},
    );
    final data = response.data as Map<String, dynamic>;
    return {
      'message': data['message']?.toString() ?? 'Success',
      'token':
          (data['data'] as Map<String, dynamic>?)?['token']?.toString() ?? '',
    };
  }

  Future<String> resetPassword(ResetPasswordRequest request) async {
    final response = await _dioClient.post(
      AuthConstants.resetPasswordEndpoint,
      data: request.toJson(),
    );
    return (response.data as Map<String, dynamic>)['message']?.toString() ??
        'Success';
  }

  Future<void> logout() async {
    await _dioClient.post(AuthConstants.logoutEndpoint);
  }

  Future<void> resendVerificationEmail(String email) async {
    await _dioClient.post(
      AuthConstants.resendVerificationEndpoint,
      data: {'email': email},
    );
  }

  Future<void> verifyEmailByUrl(String url) async {
    // Dio handles full URLs automatically even if baseUrl is set
    await _dioClient.get(url);
  }
}
