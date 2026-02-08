import '../../../core/network/dio_client.dart';
import '../models/booking_model.dart';

class BookingService {
  BookingService(this._dioClient);
  final DioClient _dioClient;

  Future<BookingResponse> getBookings({int page = 1}) async {
    try {
      final response = await _dioClient.get(
        'bookings',
        queryParameters: {'page': page},
      );
      return BookingResponse.fromJson(response.data as Map<String, dynamic>);
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> updateBookingStatus({
    required int bookingId,
    required String status,
  }) async {
    try {
      final response = await _dioClient.post(
        'bookings/$bookingId',
        data: {'status': status, '_method': 'PUT'},
      );
      return (response.data as Map<String, dynamic>)['status'] as bool? ??
          false;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> suggestNewTime({
    required int bookingId,
    required String date,
    required String time,
    required String userMessage,
  }) async {
    try {
      final response = await _dioClient.post(
        'bookings/$bookingId',
        data: {
          'status': 'pending',
          'date': date,
          'time': time,
          'user_message': userMessage,
          '_method': 'PUT',
        },
      );
      return (response.data as Map<String, dynamic>)['status'] as bool? ??
          false;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> deleteBooking(int bookingId) async {
    try {
      final response = await _dioClient.delete('bookings/$bookingId');
      return (response.data as Map<String, dynamic>)['status'] as bool? ??
          false;
    } catch (e) {
      rethrow;
    }
  }
}
