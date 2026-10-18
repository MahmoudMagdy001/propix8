import 'package:propix8/core/functional/result.dart';
import 'package:propix8/feature/our_services/domain/repositories/our_services_repository.dart';

class UpdateTestimonialUseCase {
  const UpdateTestimonialUseCase(this._repository);

  final OurServicesRepository _repository;

  ResultUnit call(int id, String content) =>
      _repository.updateTestimonial(id, content);
}
