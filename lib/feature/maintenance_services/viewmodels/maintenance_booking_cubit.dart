import 'package:equatable/equatable.dart';
import 'package:propix8/core/shared/bloc/safe_bloc.dart';
import 'package:propix8/feature/maintenance_services/models/maintenance_booking_model.dart';
import 'package:propix8/feature/maintenance_services/repositories/maintenance_service_repository.dart';

enum BookingStatus { initial, loading, success, failure }

class MaintenanceBookingState extends Equatable {
  const MaintenanceBookingState({
    this.status = BookingStatus.initial,
    this.response,
    this.errorMessage,
  });

  final BookingStatus status;
  final MaintenanceBookingResponse? response;
  final String? errorMessage;

  MaintenanceBookingState copyWith({
    BookingStatus? status,
    MaintenanceBookingResponse? response,
    String? errorMessage,
  }) => MaintenanceBookingState(
    status: status ?? this.status,
    response: response ?? this.response,
    errorMessage: errorMessage ?? this.errorMessage,
  );

  @override
  List<Object?> get props => [status, response, errorMessage];
}

class MaintenanceBookingCubit extends SafeCubit<MaintenanceBookingState> {
  MaintenanceBookingCubit(this._repository)
    : super(const MaintenanceBookingState());

  final MaintenanceServiceRepository _repository;

  Future<void> bookMaintenance({
    required int maintenanceServiceId,
    required String phone,
    required String address,
    required String message,
  }) async {
    emit(state.copyWith(status: BookingStatus.loading));
    try {
      final response = await _repository.bookMaintenance(
        maintenanceServiceId: maintenanceServiceId,
        phone: phone,
        address: address,
        message: message,
      );
      if (isClosed) return;
      if (response.status) {
        emit(state.copyWith(status: BookingStatus.success, response: response));
      } else {
        emit(
          state.copyWith(
            status: BookingStatus.failure,
            errorMessage: response.message,
          ),
        );
      }
    } on Object catch (e) {
      emit(
        state.copyWith(
          status: BookingStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  void reset() {
    emit(const MaintenanceBookingState());
  }
}
