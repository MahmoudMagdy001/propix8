import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:propix8/feature/contact/domain/entities/contact_request_entity.dart';

part 'contact_event.freezed.dart';

@freezed
abstract class ContactEvent with _$ContactEvent {
  const factory ContactEvent.contactRequestSubmitted(
    ContactRequestEntity request,
  ) = ContactRequestSubmitted;
  const factory ContactEvent.reset() = ContactReset;
}
