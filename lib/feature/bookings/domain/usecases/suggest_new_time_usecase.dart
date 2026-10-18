import 'package:propix8/feature/bookings/domain/repositories/booking_repository.dart';

class SuggestNewTimeUseCase {
  const SuggestNewTimeUseCase(this._repository);

  final BookingRepository _repository;

  Future<bool> call({
    required int bookingId,
    required String date,
    required String time,
    required String userMessage,
  }) => _repository.suggestNewTime(
    bookingId: bookingId,
    date: date,
    time: time,
    userMessage: userMessage,
  );
}
