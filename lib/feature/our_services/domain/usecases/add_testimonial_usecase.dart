import 'package:dartz/dartz.dart';
import 'package:propix8/core/error/failures.dart';
import 'package:propix8/feature/our_services/domain/repositories/our_services_repository.dart';

class AddTestimonialUseCase {
  const AddTestimonialUseCase(this._repository);

  final OurServicesRepository _repository;

  Future<Either<Failure, void>> call(String content) =>
      _repository.addTestimonial(content);
}
