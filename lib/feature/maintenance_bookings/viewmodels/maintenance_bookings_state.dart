import 'package:equatable/equatable.dart';

import '../models/maintenance_booking_model.dart';

enum RequestStatus { initial, loading, success, failure }

class MaintenanceBookingsState extends Equatable {
  const MaintenanceBookingsState({
    this.status = RequestStatus.initial,
    this.bookings = const [],
    this.errorMessage,
    this.currentPage = 1,
    this.lastPage = 1,
  });

  final RequestStatus status;
  final List<MaintenanceBookingModel> bookings;
  final String? errorMessage;
  final int currentPage;
  final int lastPage;

  bool get hasMore => currentPage < lastPage;

  MaintenanceBookingsState copyWith({
    RequestStatus? status,
    List<MaintenanceBookingModel>? bookings,
    String? errorMessage,
    int? currentPage,
    int? lastPage,
  }) => MaintenanceBookingsState(
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
