import 'package:propix8/core/functional/result.dart';
import 'package:propix8/feature/our_services/domain/repositories/our_services_repository.dart';

class AddTestimonialUseCase {
  const AddTestimonialUseCase(this._repository);

  final OurServicesRepository _repository;

  ResultUnit call(String content) =>
      _repository.addTestimonial(content);
}
