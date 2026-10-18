import 'package:propix8/core/functional/result.dart';
import 'package:propix8/feature/contact/domain/entities/contact_request_entity.dart';
import 'package:propix8/feature/contact/domain/repositories/contact_repository.dart';

class SendContactRequestUseCase {
  const SendContactRequestUseCase(this._repository);

  final ContactRepository _repository;

  ResultUnit call(ContactRequestEntity request) =>
      _repository.sendContactRequest(request);
}
