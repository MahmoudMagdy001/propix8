import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:propix8/core/error/failures.dart';
import 'package:propix8/feature/developers/domain/entities/developer_entity.dart';
import 'package:propix8/feature/developers/domain/usecases/get_developers_usecase.dart';
import 'package:propix8/feature/developers/presentation/bloc/developers_bloc.dart';
import 'package:propix8/feature/developers/presentation/bloc/developers_event.dart';
import 'package:propix8/feature/developers/presentation/bloc/developers_state.dart';

class MockGetDevelopersUseCase extends Mock implements GetDevelopersUseCase {}

void main() {
  late MockGetDevelopersUseCase mockGetDevelopersUseCase;
  late DevelopersBloc bloc;

  setUp(() {
    mockGetDevelopersUseCase = MockGetDevelopersUseCase();
    bloc = DevelopersBloc(getDevelopersUseCase: mockGetDevelopersUseCase);
  });

  tearDown(() async {
    await bloc.close();
  });

  const tDevelopers = [
    DeveloperEntity(
      id: 1,
      name: 'Emaar Misr',
      logo: 'https://example.com/emaar.png',
      email: 'info@emaar.com',
      phone: '16116',
      address: 'New Cairo, Egypt',
    ),
    DeveloperEntity(
      id: 2,
      name: 'SODIC',
      logo: 'https://example.com/sodic.png',
      email: 'info@sodic.com',
      phone: '16220',
      address: 'Sheikh Zayed, Egypt',
    ),
  ];

  test('initial state should be DevelopersState with initial status', () {
    expect(bloc.state.status, equals(DevelopersStatus.initial));
    expect(bloc.state.developers, isEmpty);
    expect(bloc.state.errorMessage, isNull);
  });

  group('DevelopersRequested event', () {
    blocTest<DevelopersBloc, DevelopersState>(
      'emits [loading, success] when getDevelopers succeeds',
      build: () {
        when(
          () => mockGetDevelopersUseCase(),
        ).thenAnswer((_) async => const Right(tDevelopers));
        return bloc;
      },
      act: (bloc) => bloc.add(const DevelopersEvent.developersRequested()),
      expect: () => [
        const DevelopersState(status: DevelopersStatus.loading),
        const DevelopersState(
          status: DevelopersStatus.success,
          developers: tDevelopers,
        ),
      ],
      verify: (_) {
        verify(() => mockGetDevelopersUseCase()).called(1);
      },
    );

    blocTest<DevelopersBloc, DevelopersState>(
      'emits [loading, failure] when getDevelopers fails',
      build: () {
        when(
          () => mockGetDevelopersUseCase(),
        ).thenAnswer((_) async => const Left(ServerFailure('Server error')));
        return bloc;
      },
      act: (bloc) => bloc.add(const DevelopersEvent.developersRequested()),
      expect: () => [
        const DevelopersState(status: DevelopersStatus.loading),
        const DevelopersState(
          status: DevelopersStatus.failure,
          errorMessage: 'Server error',
        ),
      ],
      verify: (_) {
        verify(() => mockGetDevelopersUseCase()).called(1);
      },
    );
  });

  group('DevelopersRefreshed event', () {
    blocTest<DevelopersBloc, DevelopersState>(
      'emits [success] when getDevelopers succeeds during refresh',
      build: () {
        when(
          () => mockGetDevelopersUseCase(),
        ).thenAnswer((_) async => const Right(tDevelopers));
        return bloc;
      },
      act: (bloc) => bloc.add(const DevelopersEvent.refreshed()),
      expect: () => [
        const DevelopersState(
          status: DevelopersStatus.success,
          developers: tDevelopers,
        ),
      ],
      verify: (_) {
        verify(() => mockGetDevelopersUseCase()).called(1);
      },
    );

    blocTest<DevelopersBloc, DevelopersState>(
      'emits [failure] when getDevelopers fails during refresh',
      build: () {
        when(
          () => mockGetDevelopersUseCase(),
        ).thenAnswer((_) async => const Left(ServerFailure('Network error')));
        return bloc;
      },
      act: (bloc) => bloc.add(const DevelopersEvent.refreshed()),
      expect: () => [
        const DevelopersState(
          status: DevelopersStatus.failure,
          errorMessage: 'Network error',
        ),
      ],
      verify: (_) {
        verify(() => mockGetDevelopersUseCase()).called(1);
      },
    );
  });
}
