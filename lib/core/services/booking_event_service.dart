import 'dart:async';

class BookingEventService {
  final _bookingChangedController = StreamController<void>.broadcast();

  Stream<void> get bookingChanged => _bookingChangedController.stream;

  void notifyBookingChanged() {
    _bookingChangedController.add(null);
  }

  void dispose() {
    _bookingChangedController.close();
  }
}
