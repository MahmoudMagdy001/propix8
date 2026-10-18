import 'package:propix8/feature/bookings/domain/repositories/booking_repository.dart';

class UpdateBookingStatusUseCase {
  const UpdateBookingStatusUseCase(this._repository);

  final BookingRepository _repository;

  Future<bool> call({required int bookingId, required String status}) =>
      _repository.updateBookingStatus(bookingId: bookingId, status: status);
}
