import 'package:propix8/core/shared/bloc/safe_bloc.dart';
import 'package:propix8/feature/maintenance_bookings/domain/usecases/delete_maintenance_booking_usecase.dart';
import 'package:propix8/feature/maintenance_bookings/domain/usecases/get_maintenance_bookings_usecase.dart';
import 'package:propix8/feature/maintenance_bookings/domain/usecases/update_maintenance_booking_usecase.dart';
import 'package:propix8/feature/maintenance_bookings/presentation/bloc/maintenance_bookings_event.dart';
import 'package:propix8/feature/maintenance_bookings/presentation/bloc/maintenance_bookings_state.dart';

class MaintenanceBookingsBloc
    extends SafeBloc<MaintenanceBookingsEvent, MaintenanceBookingsState> {
  MaintenanceBookingsBloc({
    required GetMaintenanceBookingsUseCase getMaintenanceBookingsUseCase,
    required DeleteMaintenanceBookingUseCase deleteMaintenanceBookingUseCase,
    required UpdateMaintenanceBookingUseCase updateMaintenanceBookingUseCase,
  })  : _getMaintenanceBookingsUseCase = getMaintenanceBookingsUseCase,
        _deleteMaintenanceBookingUseCase = deleteMaintenanceBookingUseCase,
        _updateMaintenanceBookingUseCase = updateMaintenanceBookingUseCase,
        super(const MaintenanceBookingsState()) {
    on<MaintenanceBookingsFetchInitial>(_onFetchInitial);
    on<MaintenanceBookingsLoadMore>(_onLoadMore);
    on<MaintenanceBookingsSetNetworkFailure>(_onSetNetworkFailure);
    on<MaintenanceBookingsDeleteBooking>(_onDeleteBooking);
    on<MaintenanceBookingsUpdateBooking>(_onUpdateBooking);
  }

  final GetMaintenanceBookingsUseCase _getMaintenanceBookingsUseCase;
  final DeleteMaintenanceBookingUseCase _deleteMaintenanceBookingUseCase;
  final UpdateMaintenanceBookingUseCase _updateMaintenanceBookingUseCase;

  Future<void> _onFetchInitial(
    MaintenanceBookingsFetchInitial event,
    Emitter<MaintenanceBookingsState> emit,
  ) async {
    emit(
      state.copyWith(
        status: MaintenanceBookingsStatus.loading,
        currentPage: 1,
        bookings: [],
      ),
    );

    final result = await _getMaintenanceBookingsUseCase();
    result.fold(
      (failure) => emit(
        state.copyWith(
          status: MaintenanceBookingsStatus.failure,
          errorMessage: failure.message,
        ),
      ),
      (data) => emit(
        state.copyWith(
          status: MaintenanceBookingsStatus.success,
          bookings: data.bookings,
          lastPage: data.pagination?.lastPage ?? 1,
        ),
      ),
    );
  }

  Future<void> _onLoadMore(
    MaintenanceBookingsLoadMore event,
    Emitter<MaintenanceBookingsState> emit,
  ) async {
    if (state.status == MaintenanceBookingsStatus.loading || !state.hasMore) return;

    final nextPage = state.currentPage + 1;
    final result = await _getMaintenanceBookingsUseCase(page: nextPage);
    result.fold(
      (failure) => emit(
        state.copyWith(
          status: MaintenanceBookingsStatus.failure,
          errorMessage: failure.message,
        ),
      ),
      (data) => emit(
        state.copyWith(
          status: MaintenanceBookingsStatus.success,
          bookings: [...state.bookings, ...data.bookings],
          currentPage: nextPage,
          lastPage: data.pagination?.lastPage ?? state.lastPage,
        ),
      ),
    );
  }

  void _onSetNetworkFailure(
    MaintenanceBookingsSetNetworkFailure event,
    Emitter<MaintenanceBookingsState> emit,
  ) {
    emit(
      state.copyWith(
        status: MaintenanceBookingsStatus.failure,
        errorMessage: 'Network Error',
      ),
    );
  }

  Future<void> _onDeleteBooking(
    MaintenanceBookingsDeleteBooking event,
    Emitter<MaintenanceBookingsState> emit,
  ) async {
    final result = await _deleteMaintenanceBookingUseCase(event.id);
    result.fold(
      (failure) {},
      (success) {
        if (success) {
          final updatedBookings =
              state.bookings.where((booking) => booking.id != event.id).toList();
          emit(state.copyWith(bookings: updatedBookings));
        }
      },
    );
  }

  Future<void> _onUpdateBooking(
    MaintenanceBookingsUpdateBooking event,
    Emitter<MaintenanceBookingsState> emit,
  ) async {
    emit(state.copyWith(status: MaintenanceBookingsStatus.loading));

    final result = await _updateMaintenanceBookingUseCase(
      UpdateMaintenanceBookingParams(
        id: event.id,
        phone: event.phone,
        address: event.address,
        message: event.message,
      ),
    );

    result.fold(
      (failure) => emit(
        state.copyWith(
          status: MaintenanceBookingsStatus.failure,
          errorMessage: failure.message,
        ),
      ),
      (success) {
        if (success) {
          final updatedBookings = state.bookings.map((booking) {
            if (booking.id == event.id) {
              return booking.copyWith(
                phone: event.phone,
                address: event.address,
                message: event.message,
              );
            }
            return booking;
          }).toList();
          emit(
            state.copyWith(
              status: MaintenanceBookingsStatus.success,
              bookings: updatedBookings,
            ),
          );
        } else {
          emit(
            state.copyWith(
              status: MaintenanceBookingsStatus.failure,
              errorMessage: 'failedToUpdateBooking',
            ),
          );
        }
      },
    );
  }
}
