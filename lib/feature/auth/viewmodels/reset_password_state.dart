import 'package:equatable/equatable.dart';

enum ResetPasswordStatus { initial, loading, emailSent, success, failure }

class ResetPasswordState extends Equatable {
  const ResetPasswordState({
    this.status = ResetPasswordStatus.initial,
    this.errorMessage,
    this.successMessage,
    this.token,
  });
  final ResetPasswordStatus status;
  final String? errorMessage;
  final String? successMessage;
  final String? token;

  ResetPasswordState copyWith({
    ResetPasswordStatus? status,
    String? errorMessage,
    String? successMessage,
    String? token,
  }) => ResetPasswordState(
    status: status ?? this.status,
    errorMessage: errorMessage ?? this.errorMessage,
    successMessage: successMessage ?? this.successMessage,
    token: token ?? this.token,
  );

  @override
  List<Object?> get props => [status, errorMessage, successMessage, token];
}
