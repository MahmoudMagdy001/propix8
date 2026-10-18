import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:propix8/core/error/failures.dart';
import 'package:propix8/feature/maintenance_services/domain/usecases/book_maintenance_service_usecase.dart';
import 'package:propix8/feature/maintenance_services/presentation/bloc/maintenance_booking_bloc.dart';
import 'package:propix8/feature/maintenance_services/presentation/bloc/maintenance_booking_event.dart';
import 'package:propix8/feature/maintenance_services/presentation/bloc/maintenance_booking_state.dart';

class MockBookMaintenanceServiceUseCase extends Mock
    implements BookMaintenanceServiceUseCase {}

void main() {
  late MockBookMaintenanceServiceUseCase mockBookMaintenanceServiceUseCase;
  late MaintenanceBookingBloc bloc;

  setUp(() {
    mockBookMaintenanceServiceUseCase = MockBookMaintenanceServiceUseCase();
    bloc = MaintenanceBookingBloc(mockBookMaintenanceServiceUseCase);
  });

  tearDown(() async {
    await bloc.close();
  });

  test('initial state is initial', () {
    expect(bloc.state.status, BookingSubmissionStatus.initial);
    expect(bloc.state.errorMessage, isNull);
  });

  group('MaintenanceBookingSubmitted', () {
    blocTest<MaintenanceBookingBloc, MaintenanceBookingState>(
      'emits [loading, success] when bookMaintenance succeeds',
      build: () {
        when(
          () => mockBookMaintenanceServiceUseCase(
            maintenanceServiceId: 1,
            phone: '1234567890',
            address: 'Cairo',
            message: 'Fix AC',
          ),
        ).thenAnswer((_) async => const Right(true));
        return bloc;
      },
      act: (bloc) => bloc.add(
        const MaintenanceBookingEvent.submitted(
          maintenanceServiceId: 1,
          phone: '1234567890',
          address: 'Cairo',
          message: 'Fix AC',
        ),
      ),
      expect: () => [
        const MaintenanceBookingState(status: BookingSubmissionStatus.loading),
        const MaintenanceBookingState(status: BookingSubmissionStatus.success),
      ],
    );

    blocTest<MaintenanceBookingBloc, MaintenanceBookingState>(
      'emits [loading, failure] when bookMaintenance fails',
      build: () {
        when(
          () => mockBookMaintenanceServiceUseCase(
            maintenanceServiceId: 1,
            phone: '1234567890',
            address: 'Cairo',
            message: 'Fix AC',
          ),
        ).thenAnswer((_) async => const Left(ServerFailure('Failed')));
        return bloc;
      },
      act: (bloc) => bloc.add(
        const MaintenanceBookingEvent.submitted(
          maintenanceServiceId: 1,
          phone: '1234567890',
          address: 'Cairo',
          message: 'Fix AC',
        ),
      ),
      expect: () => [
        const MaintenanceBookingState(status: BookingSubmissionStatus.loading),
        const MaintenanceBookingState(
          status: BookingSubmissionStatus.failure,
          errorMessage: 'Failed',
        ),
      ],
    );
  });
}
