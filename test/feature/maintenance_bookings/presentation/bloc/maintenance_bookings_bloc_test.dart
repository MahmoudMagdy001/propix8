import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:propix8/core/error/failures.dart';
import 'package:propix8/core/models/pagination_model.dart';
import 'package:propix8/feature/maintenance_bookings/domain/entities/maintenance_booking_entity.dart';
import 'package:propix8/feature/maintenance_bookings/domain/usecases/delete_maintenance_booking_usecase.dart';
import 'package:propix8/feature/maintenance_bookings/domain/usecases/get_maintenance_bookings_usecase.dart';
import 'package:propix8/feature/maintenance_bookings/domain/usecases/update_maintenance_booking_usecase.dart';
import 'package:propix8/feature/maintenance_bookings/presentation/bloc/maintenance_bookings_bloc.dart';
import 'package:propix8/feature/maintenance_bookings/presentation/bloc/maintenance_bookings_event.dart';
import 'package:propix8/feature/maintenance_bookings/presentation/bloc/maintenance_bookings_state.dart';
import 'package:propix8/feature/maintenance_services/domain/entities/maintenance_service_entity.dart';

class MockGetMaintenanceBookingsUseCase extends Mock
    implements GetMaintenanceBookingsUseCase {}

class MockDeleteMaintenanceBookingUseCase extends Mock
    implements DeleteMaintenanceBookingUseCase {}

class MockUpdateMaintenanceBookingUseCase extends Mock
    implements UpdateMaintenanceBookingUseCase {}

class FakeUpdateMaintenanceBookingParams extends Fake
    implements UpdateMaintenanceBookingParams {}

void main() {
  late MockGetMaintenanceBookingsUseCase mockGetMaintenanceBookingsUseCase;
  late MockDeleteMaintenanceBookingUseCase mockDeleteMaintenanceBookingUseCase;
  late MockUpdateMaintenanceBookingUseCase mockUpdateMaintenanceBookingUseCase;
  late MaintenanceBookingsBloc bloc;

  setUpAll(() {
    registerFallbackValue(FakeUpdateMaintenanceBookingParams());
  });

  setUp(() {
    mockGetMaintenanceBookingsUseCase = MockGetMaintenanceBookingsUseCase();
    mockDeleteMaintenanceBookingUseCase = MockDeleteMaintenanceBookingUseCase();
    mockUpdateMaintenanceBookingUseCase = MockUpdateMaintenanceBookingUseCase();

    bloc = MaintenanceBookingsBloc(
      getMaintenanceBookingsUseCase: mockGetMaintenanceBookingsUseCase,
      deleteMaintenanceBookingUseCase: mockDeleteMaintenanceBookingUseCase,
      updateMaintenanceBookingUseCase: mockUpdateMaintenanceBookingUseCase,
    );
  });

  tearDown(() async {
    await bloc.close();
  });

  const tBooking = MaintenanceBookingEntity(
    id: 1,
    service: MaintenanceServiceEntity(
      id: 10,
      title: 'Plumbing Service',
      image: 'image.png',
      category: 'Plumbing',
      createdAt: '2026-01-01',
    ),
    phone: '1234567890',
    address: '123 Test St',
    message: 'Need help with plumbing',
    status: 'pending',
    createdAt: '2026-01-01',
  );

  const tBookingsData = MaintenanceBookingsDataEntity(
    bookings: [tBooking],
    pagination: PaginationModel(lastPage: 2, total: 10),
  );

  test('initial state should be MaintenanceBookingsState()', () {
    expect(bloc.state, const MaintenanceBookingsState());
  });

  group('fetchInitial', () {
    blocTest<MaintenanceBookingsBloc, MaintenanceBookingsState>(
      'emits [loading, success] when fetching initial bookings succeeds',
      build: () {
        when(() => mockGetMaintenanceBookingsUseCase())
            .thenAnswer((_) async => const Right(tBookingsData));
        return bloc;
      },
      act: (bloc) => bloc.add(const MaintenanceBookingsEvent.fetchInitial()),
      expect: () => [
        const MaintenanceBookingsState(
          status: MaintenanceBookingsStatus.loading,
        ),
        const MaintenanceBookingsState(
          status: MaintenanceBookingsStatus.success,
          bookings: [tBooking],
          lastPage: 2,
        ),
      ],
      verify: (_) {
        verify(() => mockGetMaintenanceBookingsUseCase()).called(1);
      },
    );

    blocTest<MaintenanceBookingsBloc, MaintenanceBookingsState>(
      'emits [loading, failure] when fetching initial bookings fails',
      build: () {
        when(() => mockGetMaintenanceBookingsUseCase())
            .thenAnswer((_) async => const Left(ServerFailure('Server error')));
        return bloc;
      },
      act: (bloc) => bloc.add(const MaintenanceBookingsEvent.fetchInitial()),
      expect: () => [
        const MaintenanceBookingsState(
          status: MaintenanceBookingsStatus.loading,
        ),
        const MaintenanceBookingsState(
          status: MaintenanceBookingsStatus.failure,
          errorMessage: 'Server error',
        ),
      ],
    );
  });

  group('loadMore', () {
    const tBooking2 = MaintenanceBookingEntity(
      id: 2,
      service: null,
      phone: '0987654321',
      address: '456 Other St',
      message: '',
      status: 'done',
      createdAt: '2026-01-02',
    );

    const tMoreBookingsData = MaintenanceBookingsDataEntity(
      bookings: [tBooking2],
      pagination: PaginationModel(currentPage: 2, lastPage: 2, total: 10),
    );

    blocTest<MaintenanceBookingsBloc, MaintenanceBookingsState>(
      'emits success with appended bookings on loadMore',
      build: () {
        when(() => mockGetMaintenanceBookingsUseCase(page: 2))
            .thenAnswer((_) async => const Right(tMoreBookingsData));
        return bloc;
      },
      seed: () => const MaintenanceBookingsState(
        status: MaintenanceBookingsStatus.success,
        bookings: [tBooking],
        lastPage: 2,
      ),
      act: (bloc) => bloc.add(const MaintenanceBookingsEvent.loadMore()),
      expect: () => [
        const MaintenanceBookingsState(
          status: MaintenanceBookingsStatus.success,
          bookings: [tBooking, tBooking2],
          currentPage: 2,
          lastPage: 2,
        ),
      ],
      verify: (_) {
        verify(() => mockGetMaintenanceBookingsUseCase(page: 2)).called(1);
      },
    );
  });

  group('deleteBooking', () {
    blocTest<MaintenanceBookingsBloc, MaintenanceBookingsState>(
      'removes booking from state on successful delete',
      build: () {
        when(() => mockDeleteMaintenanceBookingUseCase(1))
            .thenAnswer((_) async => const Right(true));
        return bloc;
      },
      seed: () => const MaintenanceBookingsState(
        status: MaintenanceBookingsStatus.success,
        bookings: [tBooking],
      ),
      act: (bloc) => bloc.add(const MaintenanceBookingsEvent.deleteBooking(1)),
      expect: () => [
        const MaintenanceBookingsState(
          status: MaintenanceBookingsStatus.success,
        ),
      ],
    );
  });

  group('updateBooking', () {
    blocTest<MaintenanceBookingsBloc, MaintenanceBookingsState>(
      'emits [loading, success] with updated booking on updateBooking success',
      build: () {
        when(() => mockUpdateMaintenanceBookingUseCase(any()))
            .thenAnswer((_) async => const Right(true));
        return bloc;
      },
      seed: () => const MaintenanceBookingsState(
        status: MaintenanceBookingsStatus.success,
        bookings: [tBooking],
      ),
      act: (bloc) => bloc.add(
        const MaintenanceBookingsEvent.updateBooking(
          id: 1,
          phone: '9999999999',
          address: 'Updated Address',
          message: 'Updated Message',
        ),
      ),
      expect: () => [
        const MaintenanceBookingsState(
          status: MaintenanceBookingsStatus.loading,
          bookings: [tBooking],
        ),
        MaintenanceBookingsState(
          status: MaintenanceBookingsStatus.success,
          bookings: [
            tBooking.copyWith(
              phone: '9999999999',
              address: 'Updated Address',
              message: 'Updated Message',
            ),
          ],
        ),
      ],
    );
  });
}
