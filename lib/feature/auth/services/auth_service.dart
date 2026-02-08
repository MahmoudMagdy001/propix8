import '../../../core/network/dio_client.dart';
import '../models/auth_model.dart';

class AuthService {
  AuthService(this._dioClient);
  final DioClient _dioClient;

  Future<AuthResponse> login(LoginRequest request) async {
    try {
      final response = await _dioClient.post('login', data: request.toJson());
      return AuthResponse.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<AuthResponse> register(RegisterRequest request) async {
    try {
      final response = await _dioClient.post(
        'register',
        data: request.toJson(),
      );
      return AuthResponse.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, String>> forgotPassword(String email) async {
    try {
      final response = await _dioClient.post(
        'forgot-password',
        data: {'email': email},
      );
      final data = response.data as Map<String, dynamic>;
      return {
        'message': data['message']?.toString() ?? 'Success',
        'token':
            (data['data'] as Map<String, dynamic>?)?['token']?.toString() ?? '',
      };
    } catch (e) {
      rethrow;
    }
  }

  Future<String> resetPassword(ResetPasswordRequest request) async {
    try {
      final response = await _dioClient.post(
        'reset-password',
        data: request.toJson(),
      );
      return (response.data as Map<String, dynamic>)['message']?.toString() ??
          'Success';
    } catch (e) {
      rethrow;
    }
  }

  Future<void> logout() async {
    try {
      await _dioClient.post('logout');
    } catch (e) {
      rethrow;
    }
  }

  Future<void> resendVerificationEmail(String email) async {
    try {
      await _dioClient.post('email/resend', data: {'email': email});
    } catch (e) {
      rethrow;
    }
  }

  Future<void> verifyEmailByUrl(String url) async {
    try {
      // Dio handles full URLs automatically even if baseUrl is set
      await _dioClient.get(url);
    } catch (e) {
      rethrow;
    }
  }
}
