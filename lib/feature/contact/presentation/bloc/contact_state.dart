import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact_state.freezed.dart';

enum ContactStatus { initial, loading, success, failure }

@freezed
abstract class ContactState with _$ContactState {
  const ContactState._();

  const factory ContactState({
    @Default(ContactStatus.initial) ContactStatus status,
    String? errorMessage,
    String? successMessage,
  }) = _ContactState;
}
