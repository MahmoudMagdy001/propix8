import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:propix8/feature/bookings/domain/entities/booking_entity.dart';

part 'booking_state.freezed.dart';

enum RequestStatus { initial, loading, success, failure }

@freezed
abstract class BookingState with _$BookingState {
  const BookingState._();

  const factory BookingState({
    @Default(RequestStatus.initial) RequestStatus status,
    @Default(<BookingEntity>[]) List<BookingEntity> bookings,
    String? errorMessage,
    @Default(1) int currentPage,
    @Default(1) int lastPage,
  }) = _BookingState;

  bool get hasMore => currentPage < lastPage;
}
