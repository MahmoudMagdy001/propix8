import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:propix8/core/error/failures.dart';
import 'package:propix8/feature/compounds/domain/entities/compound_entity.dart';
import 'package:propix8/feature/compounds/domain/usecases/get_compounds_usecase.dart';
import 'package:propix8/feature/compounds/presentation/bloc/compounds_bloc.dart';
import 'package:propix8/feature/compounds/presentation/bloc/compounds_event.dart';
import 'package:propix8/feature/compounds/presentation/bloc/compounds_state.dart';

class MockGetCompoundsUseCase extends Mock implements GetCompoundsUseCase {}

void main() {
  late MockGetCompoundsUseCase mockGetCompoundsUseCase;
  late CompoundsBloc bloc;

  setUp(() {
    mockGetCompoundsUseCase = MockGetCompoundsUseCase();
    bloc = CompoundsBloc(getCompoundsUseCase: mockGetCompoundsUseCase);
  });

  tearDown(() async {
    await bloc.close();
  });

  const tCompounds = [
    CompoundEntity(
      id: 1,
      name: 'Palm Hills',
      description: 'Luxury compound in 6th of October',
    ),
    CompoundEntity(
      id: 2,
      name: 'Mivida',
      description: 'Green compound in New Cairo',
    ),
  ];

  test('initial state should be CompoundsState with initial status', () {
    expect(bloc.state.status, equals(CompoundsStatus.initial));
    expect(bloc.state.compounds, isEmpty);
    expect(bloc.state.errorMessage, isNull);
  });

  group('CompoundsRequested event', () {
    blocTest<CompoundsBloc, CompoundsState>(
      'emits [loading, success] when getCompounds succeeds',
      build: () {
        when(
          () => mockGetCompoundsUseCase(),
        ).thenAnswer((_) async => const Right(tCompounds));
        return bloc;
      },
      act: (bloc) => bloc.add(const CompoundsEvent.compoundsRequested()),
      expect: () => [
        const CompoundsState(status: CompoundsStatus.loading),
        const CompoundsState(
          status: CompoundsStatus.success,
          compounds: tCompounds,
        ),
      ],
      verify: (_) {
        verify(() => mockGetCompoundsUseCase()).called(1);
      },
    );

    blocTest<CompoundsBloc, CompoundsState>(
      'emits [loading, failure] when getCompounds fails',
      build: () {
        when(() => mockGetCompoundsUseCase()).thenAnswer(
          (_) async => const Left(ServerFailure('Failed to load compounds')),
        );
        return bloc;
      },
      act: (bloc) => bloc.add(const CompoundsEvent.compoundsRequested()),
      expect: () => [
        const CompoundsState(status: CompoundsStatus.loading),
        const CompoundsState(
          status: CompoundsStatus.failure,
          errorMessage: 'Failed to load compounds',
        ),
      ],
      verify: (_) {
        verify(() => mockGetCompoundsUseCase()).called(1);
      },
    );
  });

  group('CompoundsRefreshed event', () {
    blocTest<CompoundsBloc, CompoundsState>(
      'emits [success] when getCompounds succeeds during refresh',
      build: () {
        when(
          () => mockGetCompoundsUseCase(),
        ).thenAnswer((_) async => const Right(tCompounds));
        return bloc;
      },
      act: (bloc) => bloc.add(const CompoundsEvent.refreshed()),
      expect: () => [
        const CompoundsState(
          status: CompoundsStatus.success,
          compounds: tCompounds,
        ),
      ],
      verify: (_) {
        verify(() => mockGetCompoundsUseCase()).called(1);
      },
    );

    blocTest<CompoundsBloc, CompoundsState>(
      'emits [failure] when getCompounds fails during refresh',
      build: () {
        when(
          () => mockGetCompoundsUseCase(),
        ).thenAnswer((_) async => const Left(ServerFailure('Network error')));
        return bloc;
      },
      act: (bloc) => bloc.add(const CompoundsEvent.refreshed()),
      expect: () => [
        const CompoundsState(
          status: CompoundsStatus.failure,
          errorMessage: 'Network error',
        ),
      ],
      verify: (_) {
        verify(() => mockGetCompoundsUseCase()).called(1);
      },
    );
  });
}
