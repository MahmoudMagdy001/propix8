import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:propix8/core/error/failures.dart';
import 'package:propix8/feature/maintenance_bookings/domain/entities/maintenance_booking_entity.dart';
import 'package:propix8/feature/maintenance_bookings/domain/repositories/maintenance_booking_repository.dart';
import 'package:propix8/feature/maintenance_services/domain/entities/maintenance_service_entity.dart';
import 'package:propix8/feature/maintenance_services/domain/usecases/get_maintenance_services_usecase.dart';
import 'package:propix8/feature/maintenance_services/presentation/bloc/maintenance_services_bloc.dart';
import 'package:propix8/feature/maintenance_services/presentation/bloc/maintenance_services_event.dart';
import 'package:propix8/feature/maintenance_services/presentation/bloc/maintenance_services_state.dart';

class MockGetMaintenanceServicesUseCase extends Mock
    implements GetMaintenanceServicesUseCase {}

class MockMaintenanceBookingRepository extends Mock
    implements MaintenanceBookingRepository {}

void main() {
  late MockGetMaintenanceServicesUseCase mockGetMaintenanceServicesUseCase;
  late MockMaintenanceBookingRepository mockMaintenanceBookingRepository;
  late MaintenanceServicesBloc bloc;

  const tService = MaintenanceServiceEntity(
    id: 1,
    title: 'AC Repair',
    category: 'home',
    image: 'image.png',
    createdAt: '2026-01-01',
  );

  const tData = MaintenanceServicesDataEntity(
    home: [tService],
    technical: [],
  );

  const tBookingsData = MaintenanceBookingsDataEntity(
    bookings: [],
    pagination: null,
  );

  setUp(() {
    mockGetMaintenanceServicesUseCase = MockGetMaintenanceServicesUseCase();
    mockMaintenanceBookingRepository = MockMaintenanceBookingRepository();

    bloc = MaintenanceServicesBloc(
      getMaintenanceServicesUseCase: mockGetMaintenanceServicesUseCase,
      maintenanceBookingRepository: mockMaintenanceBookingRepository,
    );
  });

  tearDown(() async {
    await bloc.close();
  });

  test('initial state should have initial status', () {
    expect(bloc.state.status, MaintenanceRequestStatus.initial);
    expect(bloc.state.data, isNull);
    expect(bloc.state.bookedServiceIds, isEmpty);
  });

  group('MaintenanceServicesStarted', () {
    blocTest<MaintenanceServicesBloc, MaintenanceServicesState>(
      'emits [loading, success] when getMaintenanceServices succeeds',
      build: () {
        when(() => mockGetMaintenanceServicesUseCase())
            .thenAnswer((_) async => const Right(tData));
        when(() => mockMaintenanceBookingRepository.getMaintenanceBookings())
            .thenAnswer((_) async => const Right(tBookingsData));
        return bloc;
      },
      act: (bloc) => bloc.add(const MaintenanceServicesEvent.started()),
      expect: () => [
        const MaintenanceServicesState(status: MaintenanceRequestStatus.loading),
        const MaintenanceServicesState(
          status: MaintenanceRequestStatus.success,
          data: tData,
        ),
      ],
    );

    blocTest<MaintenanceServicesBloc, MaintenanceServicesState>(
      'emits [loading, failure] when getMaintenanceServices fails',
      build: () {
        when(() => mockGetMaintenanceServicesUseCase())
            .thenAnswer((_) async => const Left(ServerFailure('Error')));
        when(() => mockMaintenanceBookingRepository.getMaintenanceBookings())
            .thenAnswer((_) async => const Right(tBookingsData));
        return bloc;
      },
      act: (bloc) => bloc.add(const MaintenanceServicesEvent.started()),
      expect: () => [
        const MaintenanceServicesState(status: MaintenanceRequestStatus.loading),
        const MaintenanceServicesState(
          status: MaintenanceRequestStatus.failure,
          errorMessage: 'Error',
        ),
      ],
    );
  });

  group('ServiceBooked & ServiceUnbooked', () {
    blocTest<MaintenanceServicesBloc, MaintenanceServicesState>(
      'adds serviceId to bookedServiceIds',
      build: () => bloc,
      act: (bloc) => bloc.add(const MaintenanceServicesEvent.serviceBooked(5)),
      expect: () => [
        const MaintenanceServicesState(
          bookedServiceIds: {5},
        ),
      ],
    );

    blocTest<MaintenanceServicesBloc, MaintenanceServicesState>(
      'removes serviceId from bookedServiceIds',
      seed: () => const MaintenanceServicesState(bookedServiceIds: {5, 10}),
      build: () => bloc,
      act: (bloc) => bloc.add(const MaintenanceServicesEvent.serviceUnbooked(5)),
      expect: () => [
        const MaintenanceServicesState(
          bookedServiceIds: {10},
        ),
      ],
    );
  });
}
