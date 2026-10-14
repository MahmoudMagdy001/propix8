import 'package:dartz/dartz.dart';
import 'package:propix8/core/error/failures.dart';
import 'package:propix8/feature/contact/domain/entities/contact_request_entity.dart';

abstract class ContactRepository {
  Future<Either<Failure, void>> sendContactRequest(
    ContactRequestEntity request,
  );
}
