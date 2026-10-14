import 'package:freezed_annotation/freezed_annotation.dart';

part 'unit_details_event.freezed.dart';

@freezed
class UnitDetailsEvent with _$UnitDetailsEvent {
  const factory UnitDetailsEvent.unitDetailsRequested(int unitId) =
      UnitDetailsRequested;

  const factory UnitDetailsEvent.reviewSubmitted({
    required int rating,
    String? comment,
  }) = ReviewSubmitted;

  const factory UnitDetailsEvent.reviewUpdated({
    required int reviewId,
    required int rating,
    String? comment,
  }) = ReviewUpdated;

  const factory UnitDetailsEvent.reviewDeleted(int reviewId) = ReviewDeleted;

  const factory UnitDetailsEvent.reviewsMoreRequested() = ReviewsMoreRequested;

  const factory UnitDetailsEvent.contactOwnerSubmitted({
    required String name,
    required String email,
    required String phone,
    required String message,
  }) = ContactOwnerSubmitted;

  const factory UnitDetailsEvent.bookingSubmitted({
    required String name,
    required String email,
    required String phone,
    required String date,
    required String time,
    @Default('') String notes,
  }) = BookingSubmitted;

  const factory UnitDetailsEvent.reviewStatusReset() = ReviewStatusReset;
  const factory UnitDetailsEvent.deleteReviewStatusReset() =
      DeleteReviewStatusReset;
  const factory UnitDetailsEvent.contactStatusReset() = ContactStatusReset;
  const factory UnitDetailsEvent.bookingStatusReset() = BookingStatusReset;
}
