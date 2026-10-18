import 'package:propix8/core/functional/result.dart';
import 'package:propix8/feature/contact/domain/entities/contact_request_entity.dart';

abstract class ContactRepository {
  ResultUnit sendContactRequest(
    ContactRequestEntity request,
  );
}
