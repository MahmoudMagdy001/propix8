import 'package:dartz/dartz.dart';

import 'package:propix8/core/models/pagination_model.dart';
import 'package:propix8/feature/our_services/models/faq_model.dart';
import 'package:propix8/feature/our_services/models/service_model.dart';
import 'package:propix8/feature/our_services/models/testimonial_model.dart';
import 'package:propix8/feature/our_services/services/our_services_service.dart';

abstract class OurServicesRepository {
  Future<Either<String, List<ServiceModel>>> getOurServices();
  Future<Either<String, List<FaqModel>>> getFaqs();
  Future<Either<String, PaginatedResponse<TestimonialModel>>> getTestimonials({
    int page = 1,
  });
  Future<Either<String, void>> addTestimonial(String content);
  Future<Either<String, void>> updateTestimonial(int id, String content);
  Future<Either<String, void>> deleteTestimonial(int id);
}

class OurServicesRepositoryImpl implements OurServicesRepository {
  OurServicesRepositoryImpl(this._service);
  final OurServicesService _service;

  @override
  Future<Either<String, List<ServiceModel>>> getOurServices() async {
    try {
      final services = await _service.getOurServices();
      return Right(services);
    } on Object catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, List<FaqModel>>> getFaqs() async {
    try {
      final faqs = await _service.getFaqs();
      return Right(faqs);
    } on Object catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, PaginatedResponse<TestimonialModel>>> getTestimonials({
    int page = 1,
  }) async {
    try {
      final testimonials = await _service.getTestimonials(page: page);
      return Right(testimonials);
    } on Object catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, void>> addTestimonial(String content) async {
    try {
      await _service.addTestimonial(content);
      return const Right(null);
    } on Object catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, void>> updateTestimonial(int id, String content) async {
    try {
      await _service.updateTestimonial(id, content);
      return const Right(null);
    } on Object catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, void>> deleteTestimonial(int id) async {
    try {
      await _service.deleteTestimonial(id);
      return const Right(null);
    } on Object catch (e) {
      return Left(e.toString());
    }
  }
}
