import 'package:propix8/feature/bookings/domain/entities/booking_entity.dart';
import 'package:propix8/feature/bookings/domain/repositories/booking_repository.dart';

class GetBookingsUseCase {
  const GetBookingsUseCase(this._repository);

  final BookingRepository _repository;

  Future<BookingResponse> call({int page = 1}) =>
      _repository.getBookings(page: page);
}
