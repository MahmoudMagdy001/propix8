import 'package:freezed_annotation/freezed_annotation.dart';

part 'booking_event.freezed.dart';

@freezed
abstract class BookingEvent with _$BookingEvent {
  const factory BookingEvent.fetchRequested({@Default(false) bool isRefresh}) =
      BookingFetchRequested;
  const factory BookingEvent.loadMoreRequested() = BookingLoadMoreRequested;
  const factory BookingEvent.networkFailed() = BookingNetworkFailed;
  const factory BookingEvent.bookingAccepted({required int bookingId}) =
      BookingAccepted;
  const factory BookingEvent.bookingCancelled({required int bookingId}) =
      BookingCancelled;
  const factory BookingEvent.newTimeSuggested({
    required int bookingId,
    required String date,
    required String time,
    required String userMessage,
  }) = BookingNewTimeSuggested;
  const factory BookingEvent.bookingDeleted({required int bookingId}) =
      BookingDeleted;
}
