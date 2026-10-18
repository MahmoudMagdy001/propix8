import 'package:propix8/core/network/dio_client.dart';
import 'package:propix8/core/utils/auth_constants.dart';
import 'package:propix8/feature/auth/data/models/auth_model.dart';

abstract class AuthRemoteDataSource {
  Future<AuthResponse> login(LoginRequest request);
  Future<AuthResponse> register(RegisterRequest request);
  Future<Map<String, String>> forgotPassword(String email);
  Future<String> resetPassword(ResetPasswordRequest request);
  Future<void> logout();
  Future<void> resendVerificationEmail(String email);
  Future<void> verifyEmailByUrl(String url);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  AuthRemoteDataSourceImpl(this._dioClient);
  final DioClient _dioClient;

  @override
  Future<AuthResponse> login(LoginRequest request) async {
    final response = await _dioClient.post(
      AuthConstants.loginEndpoint,
      data: request.toJson(),
    );
    return AuthResponse.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<AuthResponse> register(RegisterRequest request) async {
    final response = await _dioClient.post(
      AuthConstants.registerEndpoint,
      data: request.toJson(),
    );
    return AuthResponse.fromJson(response.data as Map<String, dynamic>);
  }

  @override
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

  @override
  Future<String> resetPassword(ResetPasswordRequest request) async {
    final response = await _dioClient.post(
      AuthConstants.resetPasswordEndpoint,
      data: request.toJson(),
    );
    return (response.data as Map<String, dynamic>)['message']?.toString() ??
        'Success';
  }

  @override
  Future<void> logout() async {
    await _dioClient.post(AuthConstants.logoutEndpoint);
  }

  @override
  Future<void> resendVerificationEmail(String email) async {
    await _dioClient.post(
      AuthConstants.resendVerificationEndpoint,
      data: {'email': email},
    );
  }

  @override
  Future<void> verifyEmailByUrl(String url) async {
    await _dioClient.get(url);
  }
}
