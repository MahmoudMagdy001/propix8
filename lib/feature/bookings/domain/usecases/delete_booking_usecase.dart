import 'package:propix8/feature/bookings/domain/repositories/booking_repository.dart';

class DeleteBookingUseCase {
  const DeleteBookingUseCase(this._repository);

  final BookingRepository _repository;

  Future<bool> call(int bookingId) => _repository.deleteBooking(bookingId);
}
