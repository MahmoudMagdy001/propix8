import 'package:propix8/core/services/booking_event_service.dart';
import 'package:propix8/feature/bookings/data/datasources/booking_remote_data_source.dart';
import 'package:propix8/feature/bookings/data/models/booking_dto.dart';
import 'package:propix8/feature/bookings/domain/entities/booking_entity.dart';
import 'package:propix8/feature/bookings/domain/repositories/booking_repository.dart';

class BookingRepositoryImpl implements BookingRepository {
  BookingRepositoryImpl(this._remoteDataSource, this._bookingEventService);

  final BookingRemoteDataSource _remoteDataSource;
  final BookingEventService _bookingEventService;

  @override
  Future<BookingResponse> getBookings({int page = 1}) async {
    final responseDto = await _remoteDataSource.getBookings(page: page);
    return responseDto.toEntity();
  }

  @override
  Future<bool> updateBookingStatus({
    required int bookingId,
    required String status,
  }) async {
    final success = await _remoteDataSource.updateBookingStatus(
      bookingId: bookingId,
      status: status,
    );
    if (success) {
      _bookingEventService.notifyBookingChanged();
    }
    return success;
  }

  @override
  Future<bool> suggestNewTime({
    required int bookingId,
    required String date,
    required String time,
    required String userMessage,
  }) => _remoteDataSource.suggestNewTime(
    bookingId: bookingId,
    date: date,
    time: time,
    userMessage: userMessage,
  );

  @override
  Future<bool> deleteBooking(int bookingId) async {
    final success = await _remoteDataSource.deleteBooking(bookingId);
    if (success) {
      _bookingEventService.notifyBookingChanged();
    }
    return success;
  }
}
