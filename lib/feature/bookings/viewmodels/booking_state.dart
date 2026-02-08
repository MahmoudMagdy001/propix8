import 'package:equatable/equatable.dart';

import '../models/booking_model.dart';

enum RequestStatus { initial, loading, success, failure }

class BookingState extends Equatable {
  const BookingState({
    this.status = RequestStatus.initial,
    this.bookings = const [],
    this.errorMessage,
    this.currentPage = 1,
    this.lastPage = 1,
  });

  final RequestStatus status;
  final List<BookingModel> bookings;
  final String? errorMessage;
  final int currentPage;
  final int lastPage;

  bool get hasMore => currentPage < lastPage;

  BookingState copyWith({
    RequestStatus? status,
    List<BookingModel>? bookings,
    String? errorMessage,
    int? currentPage,
    int? lastPage,
  }) => BookingState(
    status: status ?? this.status,
    bookings: bookings ?? this.bookings,
    errorMessage: errorMessage ?? this.errorMessage,
    currentPage: currentPage ?? this.currentPage,
    lastPage: lastPage ?? this.lastPage,
  );

  @override
  List<Object?> get props => [
    status,
    bookings,
    errorMessage,
    currentPage,
    lastPage,
  ];
}
