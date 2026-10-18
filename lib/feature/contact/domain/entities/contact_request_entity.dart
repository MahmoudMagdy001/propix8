import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact_request_entity.freezed.dart';

@freezed
abstract class ContactRequestEntity with _$ContactRequestEntity {
  const factory ContactRequestEntity({
    required String name,
    required String email,
    required String phone,
    required String address,
    required String message,
  }) = _ContactRequestEntity;
}
