import 'package:equatable/equatable.dart';

import 'package:propix8/core/models/pagination_model.dart';
import 'package:propix8/feature/our_services/models/faq_model.dart';
import 'package:propix8/feature/our_services/models/service_model.dart';
import 'package:propix8/feature/our_services/models/testimonial_model.dart';

enum OurServicesStatus { initial, loading, success, failure }

class OurServicesState extends Equatable {
  const OurServicesState({
    this.status = OurServicesStatus.initial,
    this.services = const [],
    this.faqs = const [],
    this.testimonials,
    this.errorMessage,
    this.isMoreLoading = false,
    this.isRefreshing = false,
    this.addTestimonialStatus = OurServicesStatus.initial,
    this.addTestimonialError,
    this.updateTestimonialStatus = OurServicesStatus.initial,
    this.deleteTestimonialStatus = OurServicesStatus.initial,
  });
  final OurServicesStatus status;
  final List<ServiceModel> services;
  final List<FaqModel> faqs;
  final PaginatedResponse<TestimonialModel>? testimonials;
  final String? errorMessage;
  final bool isMoreLoading;
  final bool isRefreshing;
  final OurServicesStatus addTestimonialStatus;
  final String? addTestimonialError;
  final OurServicesStatus updateTestimonialStatus;
  final OurServicesStatus deleteTestimonialStatus;

  OurServicesState copyWith({
    OurServicesStatus? status,
    List<ServiceModel>? services,
    List<FaqModel>? faqs,
    PaginatedResponse<TestimonialModel>? testimonials,
    String? errorMessage,
    bool? isMoreLoading,
    bool? isRefreshing,
    OurServicesStatus? addTestimonialStatus,
    String? addTestimonialError,
    OurServicesStatus? updateTestimonialStatus,
    OurServicesStatus? deleteTestimonialStatus,
  }) => OurServicesState(
    status: status ?? this.status,
    services: services ?? this.services,
    faqs: faqs ?? this.faqs,
    testimonials: testimonials ?? this.testimonials,
    errorMessage: errorMessage ?? this.errorMessage,
    isMoreLoading: isMoreLoading ?? this.isMoreLoading,
    isRefreshing: isRefreshing ?? this.isRefreshing,
    addTestimonialStatus: addTestimonialStatus ?? this.addTestimonialStatus,
    addTestimonialError: addTestimonialError ?? this.addTestimonialError,
    updateTestimonialStatus:
        updateTestimonialStatus ?? this.updateTestimonialStatus,
    deleteTestimonialStatus:
        deleteTestimonialStatus ?? this.deleteTestimonialStatus,
  );

  @override
  List<Object?> get props => [
    status,
    services,
    faqs,
    testimonials,
    errorMessage,
    isMoreLoading,
    isRefreshing,
    addTestimonialStatus,
    addTestimonialError,
    updateTestimonialStatus,
    deleteTestimonialStatus,
  ];
}
