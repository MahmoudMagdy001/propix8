import 'package:equatable/equatable.dart';

import '../models/auth_model.dart';

enum AuthRequestStatus { initial, loading, success, failure }

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthState extends Equatable {
  const AuthState({
    this.status = AuthRequestStatus.initial,
    this.authenticationStatus = AuthenticationStatus.unknown,
    this.resendStatus = AuthRequestStatus.initial,
    this.verificationStatus = AuthRequestStatus.initial,
    this.errorMessage,
    this.resendMessage,
    this.user,
  });
  final AuthRequestStatus status;
  final AuthenticationStatus authenticationStatus;
  final AuthRequestStatus resendStatus;
  final AuthRequestStatus verificationStatus;
  final String? errorMessage;
  final String? resendMessage;
  final User? user;

  AuthState copyWith({
    AuthRequestStatus? status,
    AuthenticationStatus? authenticationStatus,
    AuthRequestStatus? resendStatus,
    AuthRequestStatus? verificationStatus,
    String? errorMessage,
    String? resendMessage,
    User? user,
  }) => AuthState(
    status: status ?? this.status,
    authenticationStatus: authenticationStatus ?? this.authenticationStatus,
    resendStatus: resendStatus ?? this.resendStatus,
    verificationStatus: verificationStatus ?? this.verificationStatus,
    errorMessage: errorMessage ?? this.errorMessage,
    resendMessage: resendMessage ?? this.resendMessage,
    user: user ?? this.user,
  );

  @override
  List<Object?> get props => [
    status,
    authenticationStatus,
    resendStatus,
    verificationStatus,
    errorMessage,
    resendMessage,
    user,
  ];
}
