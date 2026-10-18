import 'package:propix8/core/functional/result.dart';
import 'package:propix8/feature/unit_details/domain/repositories/unit_details_repository.dart';

class ContactOwnerUseCase {
  const ContactOwnerUseCase(this._repository);
  final UnitDetailsRepository _repository;

  ResultUnit call({
    required String name,
    required String email,
    required String phone,
    required String message,
    required int unitId,
  }) =>
      _repository.contactOwner(
        name: name,
        email: email,
        phone: phone,
        message: message,
        unitId: unitId,
      );
}
