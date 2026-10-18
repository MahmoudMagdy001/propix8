import 'package:propix8/core/functional/result.dart';
import 'package:propix8/core/models/pagination_model.dart';
import 'package:propix8/feature/our_services/domain/entities/faq_entity.dart';
import 'package:propix8/feature/our_services/domain/entities/service_entity.dart';
import 'package:propix8/feature/our_services/domain/entities/testimonial_entity.dart';

abstract class OurServicesRepository {
  ResultFuture<List<ServiceEntity>> getOurServices();
  ResultFuture<List<FaqEntity>> getFaqs();
  ResultFuture<PaginatedResponse<TestimonialEntity>> getTestimonials({
    int page = 1,
  });
  ResultUnit addTestimonial(String content);
  ResultUnit updateTestimonial(int id, String content);
  ResultUnit deleteTestimonial(int id);
}
