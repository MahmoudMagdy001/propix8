import 'package:fpdart/fpdart.dart';
import 'package:propix8/core/error/failures.dart';
import 'package:propix8/core/shared/bloc/safe_bloc.dart';
import 'package:propix8/feature/maintenance_bookings/domain/entities/maintenance_booking_entity.dart';
import 'package:propix8/feature/maintenance_bookings/domain/repositories/maintenance_booking_repository.dart';
import 'package:propix8/feature/maintenance_services/domain/entities/maintenance_service_entity.dart';
import 'package:propix8/feature/maintenance_services/domain/usecases/get_maintenance_services_usecase.dart';
import 'package:propix8/feature/maintenance_services/presentation/bloc/maintenance_services_event.dart';
import 'package:propix8/feature/maintenance_services/presentation/bloc/maintenance_services_state.dart';

class MaintenanceServicesBloc
    extends SafeBloc<MaintenanceServicesEvent, MaintenanceServicesState> {
  MaintenanceServicesBloc({
    required GetMaintenanceServicesUseCase getMaintenanceServicesUseCase,
    required MaintenanceBookingRepository maintenanceBookingRepository,
  })  : _getMaintenanceServicesUseCase = getMaintenanceServicesUseCase,
        _maintenanceBookingRepository = maintenanceBookingRepository,
        super(const MaintenanceServicesState()) {
    on<MaintenanceServicesStarted>(_onStarted);
    on<MaintenanceServicesRefreshed>(_onRefreshed);
    on<MaintenanceServicesServiceBooked>(_onServiceBooked);
    on<MaintenanceServicesServiceUnbooked>(_onServiceUnbooked);
  }

  final GetMaintenanceServicesUseCase _getMaintenanceServicesUseCase;
  final MaintenanceBookingRepository _maintenanceBookingRepository;

  Future<void> _onStarted(
    MaintenanceServicesStarted event,
    Emitter<MaintenanceServicesState> emit,
  ) async {
    await _loadServices(emit);
  }

  Future<void> _onRefreshed(
    MaintenanceServicesRefreshed event,
    Emitter<MaintenanceServicesState> emit,
  ) async {
    await _loadServices(emit);
  }

  Future<void> _loadServices(Emitter<MaintenanceServicesState> emit) async {
    if (state.isLoading) return;

    emit(state.copyWith(status: MaintenanceRequestStatus.loading));

    final results = await Future.wait([
      _getMaintenanceServicesUseCase(),
      _maintenanceBookingRepository.getMaintenanceBookings(),
    ]);

    final servicesResult =
        results[0] as Either<Failure, MaintenanceServicesDataEntity>;
    final bookingsResult =
        results[1] as Either<Failure, MaintenanceBookingsDataEntity>;

    servicesResult.fold(
      (failure) => emit(
        state.copyWith(
          status: MaintenanceRequestStatus.failure,
          errorMessage: failure.message,
        ),
      ),
      (data) {
        final bookedIds = <int>{};
        bookingsResult.fold(
          (_) {},
          (bookingsData) {
            for (final b in bookingsData.bookings) {
              if (b.service != null) {
                bookedIds.add(b.service!.id);
              }
            }
          },
        );

        emit(
          state.copyWith(
            status: MaintenanceRequestStatus.success,
            data: data,
            bookedServiceIds: bookedIds,
          ),
        );
      },
    );
  }

  void _onServiceBooked(
    MaintenanceServicesServiceBooked event,
    Emitter<MaintenanceServicesState> emit,
  ) {
    emit(
      state.copyWith(
        bookedServiceIds: {...state.bookedServiceIds, event.serviceId},
      ),
    );
  }

  void _onServiceUnbooked(
    MaintenanceServicesServiceUnbooked event,
    Emitter<MaintenanceServicesState> emit,
  ) {
    emit(
      state.copyWith(
        bookedServiceIds:
            state.bookedServiceIds.where((id) => id != event.serviceId).toSet(),
      ),
    );
  }

  void markServiceAsBooked(int serviceId) {
    add(MaintenanceServicesEvent.serviceBooked(serviceId));
  }

  void unmarkServiceAsBooked(int serviceId) {
    add(MaintenanceServicesEvent.serviceUnbooked(serviceId));
  }
}
