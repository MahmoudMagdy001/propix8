import '../models/booking_model.dart';
import '../services/booking_service.dart';

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

class BookingRepositoryImpl implements BookingRepository {
  BookingRepositoryImpl(this._bookingService);
  final BookingService _bookingService;

  @override
  Future<BookingResponse> getBookings({int page = 1}) async {
    try {
      return await _bookingService.getBookings(page: page);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> updateBookingStatus({
    required int bookingId,
    required String status,
  }) async {
    try {
      return await _bookingService.updateBookingStatus(
        bookingId: bookingId,
        status: status,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> suggestNewTime({
    required int bookingId,
    required String date,
    required String time,
    required String userMessage,
  }) async {
    try {
      return await _bookingService.suggestNewTime(
        bookingId: bookingId,
        date: date,
        time: time,
        userMessage: userMessage,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> deleteBooking(int bookingId) async {
    try {
      return await _bookingService.deleteBooking(bookingId);
    } catch (e) {
      rethrow;
    }
  }
}
