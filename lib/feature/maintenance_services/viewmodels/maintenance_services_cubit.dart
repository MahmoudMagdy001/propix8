import 'package:flutter_bloc/flutter_bloc.dart';

import '../repositories/maintenance_service_repository.dart';
import 'maintenance_services_state.dart';

class MaintenanceServicesCubit extends Cubit<MaintenanceServicesState> {
  MaintenanceServicesCubit(this._repository)
    : super(const MaintenanceServicesState());
  final MaintenanceServiceRepository _repository;

  Future<void> getMaintenanceServices() async {
    if (state.isLoading) return;

    emit(
      state.copyWith(status: MaintenanceRequestStatus.loading, clearData: true),
    );
    try {
      final response = await _repository.getMaintenanceServices();
      if (isClosed) return;
      emit(
        state.copyWith(
          status: MaintenanceRequestStatus.success,
          data: response.data,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: MaintenanceRequestStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  void setNetworkFailure() {
    emit(
      state.copyWith(
        status: MaintenanceRequestStatus.failure,
        errorMessage: 'Network Error',
      ),
    );
  }
}
