import 'package:freezed_annotation/freezed_annotation.dart';

part 'our_services_event.freezed.dart';

@freezed
abstract class OurServicesEvent with _$OurServicesEvent {
  const factory OurServicesEvent.dataRequested({
    @Default(false) bool isRefreshing,
    @Default(true) bool loadServices,
    @Default(true) bool loadFaqs,
    @Default(true) bool loadTestimonials,
  }) = OurServicesDataRequested;

  const factory OurServicesEvent.moreTestimonialsRequested() =
      OurServicesMoreTestimonialsRequested;

  const factory OurServicesEvent.testimonialAdded(String content) =
      OurServicesTestimonialAdded;

  const factory OurServicesEvent.testimonialUpdated({
    required int id,
    required String content,
  }) = OurServicesTestimonialUpdated;

  const factory OurServicesEvent.testimonialDeleted(int id) =
      OurServicesTestimonialDeleted;

  const factory OurServicesEvent.refreshed() = OurServicesRefreshed;
}
