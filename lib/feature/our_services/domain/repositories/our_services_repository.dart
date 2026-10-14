import 'package:dartz/dartz.dart';
import 'package:propix8/core/error/failures.dart';
import 'package:propix8/core/models/pagination_model.dart';
import 'package:propix8/feature/our_services/domain/entities/faq_entity.dart';
import 'package:propix8/feature/our_services/domain/entities/service_entity.dart';
import 'package:propix8/feature/our_services/domain/entities/testimonial_entity.dart';

abstract class OurServicesRepository {
  Future<Either<Failure, List<ServiceEntity>>> getOurServices();
  Future<Either<Failure, List<FaqEntity>>> getFaqs();
  Future<Either<Failure, PaginatedResponse<TestimonialEntity>>>
  getTestimonials({int page = 1});
  Future<Either<Failure, void>> addTestimonial(String content);
  Future<Either<Failure, void>> updateTestimonial(int id, String content);
  Future<Either<Failure, void>> deleteTestimonial(int id);
}
