import 'package:propix8/feature/bookings/domain/entities/booking_entity.dart';

abstract class BookingRepository {
  Future<BookingResponse> getBookings({int page = 1});
  Future<bool> updateBookingStatus({
    required int bookingId,
    required String status,
  });
  Future<bool> suggestNewTime({
    required int bookingId,
    required String date,
    required String time,
    required String userMessage,
  });
  Future<bool> deleteBooking(int bookingId);
}
