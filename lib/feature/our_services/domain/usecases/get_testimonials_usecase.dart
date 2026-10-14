import 'package:dartz/dartz.dart';
import 'package:propix8/core/error/failures.dart';
import 'package:propix8/core/models/pagination_model.dart';
import 'package:propix8/feature/our_services/domain/entities/testimonial_entity.dart';
import 'package:propix8/feature/our_services/domain/repositories/our_services_repository.dart';

class GetTestimonialsUseCase {
  const GetTestimonialsUseCase(this._repository);

  final OurServicesRepository _repository;

  Future<Either<Failure, PaginatedResponse<TestimonialEntity>>> call({
    int page = 1,
  }) => _repository.getTestimonials(page: page);
}
