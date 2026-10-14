import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:propix8/feature/contact/domain/entities/contact_request_entity.dart';

part 'contact_request_model.freezed.dart';
part 'contact_request_model.g.dart';

@freezed
abstract class ContactRequestModel with _$ContactRequestModel {
  const ContactRequestModel._();

  const factory ContactRequestModel({
    required String name,
    required String email,
    required String phone,
    required String address,
    required String message,
  }) = _ContactRequestModel;

  factory ContactRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ContactRequestModelFromJson(json);

  factory ContactRequestModel.fromDomain(ContactRequestEntity entity) =>
      ContactRequestModel(
        name: entity.name,
        email: entity.email,
        phone: entity.phone,
        address: entity.address,
        message: entity.message,
      );

  ContactRequestEntity toDomain() => ContactRequestEntity(
    name: name,
    email: email,
    phone: phone,
    address: address,
    message: message,
  );
}
