import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:propix8/core/models/pagination_model.dart';
import 'package:propix8/feature/our_services/domain/entities/faq_entity.dart';
import 'package:propix8/feature/our_services/domain/entities/service_entity.dart';
import 'package:propix8/feature/our_services/domain/entities/testimonial_entity.dart';

part 'our_services_state.freezed.dart';

enum OurServicesStatus { initial, loading, success, failure }

@freezed
abstract class OurServicesState with _$OurServicesState {
  const OurServicesState._();

  const factory OurServicesState({
    @Default(OurServicesStatus.initial) OurServicesStatus status,
    @Default([]) List<ServiceEntity> services,
    @Default([]) List<FaqEntity> faqs,
    PaginatedResponse<TestimonialEntity>? testimonials,
    String? errorMessage,
    @Default(false) bool isMoreLoading,
    @Default(false) bool isRefreshing,
    @Default(OurServicesStatus.initial) OurServicesStatus addTestimonialStatus,
    String? addTestimonialError,
    @Default(OurServicesStatus.initial)
    OurServicesStatus updateTestimonialStatus,
    @Default(OurServicesStatus.initial)
    OurServicesStatus deleteTestimonialStatus,
  }) = _OurServicesState;
}
