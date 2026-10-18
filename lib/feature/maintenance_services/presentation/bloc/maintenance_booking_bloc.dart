import 'package:propix8/core/shared/bloc/safe_bloc.dart';
import 'package:propix8/feature/maintenance_services/domain/usecases/book_maintenance_service_usecase.dart';
import 'package:propix8/feature/maintenance_services/presentation/bloc/maintenance_booking_event.dart';
import 'package:propix8/feature/maintenance_services/presentation/bloc/maintenance_booking_state.dart';

class MaintenanceBookingBloc
    extends SafeBloc<MaintenanceBookingEvent, MaintenanceBookingState> {
  MaintenanceBookingBloc(this._bookMaintenanceServiceUseCase)
      : super(const MaintenanceBookingState()) {
    on<MaintenanceBookingSubmitted>(_onSubmitted);
    on<MaintenanceBookingReset>(_onReset);
  }

  final BookMaintenanceServiceUseCase _bookMaintenanceServiceUseCase;

  Future<void> _onSubmitted(
    MaintenanceBookingSubmitted event,
    Emitter<MaintenanceBookingState> emit,
  ) async {
    emit(state.copyWith(status: BookingSubmissionStatus.loading));

    final result = await _bookMaintenanceServiceUseCase(
      maintenanceServiceId: event.maintenanceServiceId,
      phone: event.phone,
      address: event.address,
      message: event.message,
    );

    result.fold(
      (failure) => emit(
        state.copyWith(
          status: BookingSubmissionStatus.failure,
          errorMessage: failure.message,
        ),
      ),
      (_) => emit(state.copyWith(status: BookingSubmissionStatus.success)),
    );
  }

  void _onReset(
    MaintenanceBookingReset event,
    Emitter<MaintenanceBookingState> emit,
  ) {
    emit(const MaintenanceBookingState());
  }
}
