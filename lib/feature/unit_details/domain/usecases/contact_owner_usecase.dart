import 'package:dartz/dartz.dart';
import 'package:propix8/core/error/failures.dart';
import 'package:propix8/feature/unit_details/domain/repositories/unit_details_repository.dart';

class ContactOwnerUseCase {
  const ContactOwnerUseCase(this._repository);
  final UnitDetailsRepository _repository;

  Future<Either<Failure, void>> call({
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
