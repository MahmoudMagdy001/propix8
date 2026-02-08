import 'package:equatable/equatable.dart';

enum ContactStatus { initial, loading, success, failure }

class ContactState extends Equatable {
  const ContactState({
    this.status = ContactStatus.initial,
    this.errorMessage,
    this.successMessage,
  });
  final ContactStatus status;
  final String? errorMessage;
  final String? successMessage;

  ContactState copyWith({
    ContactStatus? status,
    String? errorMessage,
    String? successMessage,
  }) => ContactState(
    status: status ?? this.status,
    errorMessage: errorMessage ?? this.errorMessage,
    successMessage: successMessage ?? this.successMessage,
  );

  @override
  List<Object?> get props => [status, errorMessage, successMessage];
}
