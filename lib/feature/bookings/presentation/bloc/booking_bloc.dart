import 'package:propix8/core/shared/bloc/safe_bloc.dart';
import 'package:propix8/feature/bookings/domain/usecases/delete_booking_usecase.dart';
import 'package:propix8/feature/bookings/domain/usecases/get_bookings_usecase.dart';
import 'package:propix8/feature/bookings/domain/usecases/suggest_new_time_usecase.dart';
import 'package:propix8/feature/bookings/domain/usecases/update_booking_status_usecase.dart';
import 'package:propix8/feature/bookings/presentation/bloc/booking_event.dart';
import 'package:propix8/feature/bookings/presentation/bloc/booking_state.dart';

class BookingBloc extends SafeBloc<BookingEvent, BookingState> {
  BookingBloc({
    required GetBookingsUseCase getBookingsUseCase,
    required UpdateBookingStatusUseCase updateBookingStatusUseCase,
    required SuggestNewTimeUseCase suggestNewTimeUseCase,
    required DeleteBookingUseCase deleteBookingUseCase,
  })  : _getBookingsUseCase = getBookingsUseCase,
        _updateBookingStatusUseCase = updateBookingStatusUseCase,
        _suggestNewTimeUseCase = suggestNewTimeUseCase,
        _deleteBookingUseCase = deleteBookingUseCase,
        super(const BookingState()) {
    on<BookingFetchRequested>(_onFetchRequested);
    on<BookingLoadMoreRequested>(_onLoadMoreRequested);
    on<BookingNetworkFailed>(_onNetworkFailed);
    on<BookingAccepted>(_onBookingAccepted);
    on<BookingCancelled>(_onBookingCancelled);
    on<BookingNewTimeSuggested>(_onNewTimeSuggested);
    on<BookingDeleted>(_onBookingDeleted);
  }

  final GetBookingsUseCase _getBookingsUseCase;
  final UpdateBookingStatusUseCase _updateBookingStatusUseCase;
  final SuggestNewTimeUseCase _suggestNewTimeUseCase;
  final DeleteBookingUseCase _deleteBookingUseCase;

  Future<void> _onFetchRequested(
    BookingFetchRequested event,
    Emitter<BookingState> emit,
  ) async {
    emit(
      state.copyWith(
        status: RequestStatus.loading,
        currentPage: 1,
        bookings: event.isRefresh ? [] : state.bookings,
      ),
    );

    try {
      final response = await _getBookingsUseCase();
      emit(
        state.copyWith(
          status: RequestStatus.success,
          bookings: response.data,
          lastPage: response.pagination?.lastPage ?? 1,
        ),
      );
    } on Object catch (e) {
      emit(
        state.copyWith(
          status: RequestStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> _onLoadMoreRequested(
    BookingLoadMoreRequested event,
    Emitter<BookingState> emit,
  ) async {
    if (state.status == RequestStatus.loading || !state.hasMore) {
      return;
    }

    emit(state.copyWith(status: RequestStatus.loading));

    try {
      final nextPage = state.currentPage + 1;
      final response = await _getBookingsUseCase(page: nextPage);

      emit(
        state.copyWith(
          status: RequestStatus.success,
          bookings: [...state.bookings, ...response.data],
          currentPage: nextPage,
          lastPage: response.pagination?.lastPage ?? state.lastPage,
        ),
      );
    } on Object catch (e) {
      emit(
        state.copyWith(
          status: RequestStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  void _onNetworkFailed(
    BookingNetworkFailed event,
    Emitter<BookingState> emit,
  ) {
    emit(
      state.copyWith(
        status: RequestStatus.failure,
        errorMessage: 'No Internet Connection',
      ),
    );
  }

  Future<void> _onBookingAccepted(
    BookingAccepted event,
    Emitter<BookingState> emit,
  ) async {
    try {
      final success = await _updateBookingStatusUseCase(
        bookingId: event.bookingId,
        status: 'accepted',
      );

      if (success) {
        final updatedBookings = state.bookings.map((booking) {
          if (booking.id == event.bookingId) {
            return booking.copyWith(status: 'accepted');
          }
          return booking;
        }).toList();
        emit(state.copyWith(bookings: updatedBookings));
      }
    } on Object catch (e) {
      emit(
        state.copyWith(
          status: RequestStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> _onBookingCancelled(
    BookingCancelled event,
    Emitter<BookingState> emit,
  ) async {
    try {
      final success = await _updateBookingStatusUseCase(
        bookingId: event.bookingId,
        status: 'cancelled',
      );

      if (success) {
        final updatedBookings = state.bookings.map((booking) {
          if (booking.id == event.bookingId) {
            return booking.copyWith(status: 'cancelled');
          }
          return booking;
        }).toList();
        emit(state.copyWith(bookings: updatedBookings));
      }
    } on Object catch (e) {
      emit(
        state.copyWith(
          status: RequestStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> _onNewTimeSuggested(
    BookingNewTimeSuggested event,
    Emitter<BookingState> emit,
  ) async {
    try {
      final success = await _suggestNewTimeUseCase(
        bookingId: event.bookingId,
        date: event.date,
        time: event.time,
        userMessage: event.userMessage,
      );

      if (success) {
        final updatedBookings = state.bookings.map((booking) {
          if (booking.id == event.bookingId) {
            return booking.copyWith(
              date: event.date,
              time: event.time,
              userMessage: event.userMessage,
            );
          }
          return booking;
        }).toList();
        emit(state.copyWith(bookings: updatedBookings));
      }
    } on Object catch (e) {
      emit(
        state.copyWith(
          status: RequestStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> _onBookingDeleted(
    BookingDeleted event,
    Emitter<BookingState> emit,
  ) async {
    try {
      final success = await _deleteBookingUseCase(event.bookingId);

      if (success) {
        final updatedBookings = state.bookings
            .where((booking) => booking.id != event.bookingId)
            .toList();
        emit(state.copyWith(bookings: updatedBookings));
      }
    } on Object catch (e) {
      emit(
        state.copyWith(
          status: RequestStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
