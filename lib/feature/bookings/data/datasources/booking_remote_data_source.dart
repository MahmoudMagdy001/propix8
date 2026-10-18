import 'package:propix8/core/network/dio_client.dart';
import 'package:propix8/feature/bookings/data/models/booking_dto.dart';

abstract class BookingRemoteDataSource {
  Future<BookingResponseDto> getBookings({int page = 1});
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

class BookingRemoteDataSourceImpl implements BookingRemoteDataSource {
  BookingRemoteDataSourceImpl(this._dioClient);

  final DioClient _dioClient;

  @override
  Future<BookingResponseDto> getBookings({int page = 1}) async {
    final response = await _dioClient.get(
      'bookings',
      queryParameters: {'page': page},
    );
    return BookingResponseDto.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<bool> updateBookingStatus({
    required int bookingId,
    required String status,
  }) async {
    final response = await _dioClient.post(
      'bookings/$bookingId',
      data: {'status': status, '_method': 'PUT'},
    );
    return (response.data as Map<String, dynamic>)['status'] as bool? ?? false;
  }

  @override
  Future<bool> suggestNewTime({
    required int bookingId,
    required String date,
    required String time,
    required String userMessage,
  }) async {
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
    return (response.data as Map<String, dynamic>)['status'] as bool? ?? false;
  }

  @override
  Future<bool> deleteBooking(int bookingId) async {
    final response = await _dioClient.delete('bookings/$bookingId');
    return (response.data as Map<String, dynamic>)['status'] as bool? ?? false;
  }
}
