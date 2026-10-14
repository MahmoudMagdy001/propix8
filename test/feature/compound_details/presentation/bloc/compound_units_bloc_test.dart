import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:propix8/core/error/failures.dart';
import 'package:propix8/core/models/pagination_model.dart';
import 'package:propix8/core/utils/enums.dart';
import 'package:propix8/feature/compound_details/domain/entities/compound_collection_entity.dart';
import 'package:propix8/feature/compound_details/domain/usecases/get_compound_units_usecase.dart';
import 'package:propix8/feature/compound_details/presentation/bloc/compound_units_bloc.dart';
import 'package:propix8/feature/compound_details/presentation/bloc/compound_units_event.dart';
import 'package:propix8/feature/compound_details/presentation/bloc/compound_units_state.dart';
import 'package:propix8/feature/home/domain/entities/unit_entity.dart';
import 'package:propix8/feature/home/presentation/bloc/home_state.dart';

class MockGetCompoundUnitsUseCase extends Mock
    implements GetCompoundUnitsUseCase {}

void main() {
  late MockGetCompoundUnitsUseCase mockGetCompoundUnitsUseCase;
  late CompoundUnitsBloc compoundUnitsBloc;

  const testUnit1 = UnitEntity(
    id: 1,
    title: 'Unit 1',
    price: 1000000.0,
  );

  const testUnit2 = UnitEntity(
    id: 2,
    title: 'Unit 2',
    price: 2000000.0,
  );

  const testCompound = CompoundCollectionEntity(
    id: 10,
    name: 'Palm Hills',
    description: 'Premier compound',
    units: [testUnit1],
    pagination: PaginationModel(
      currentPage: 1,
      lastPage: 2,
      perPage: 10,
      total: 20,
    ),
  );

  setUp(() {
    mockGetCompoundUnitsUseCase = MockGetCompoundUnitsUseCase();
    compoundUnitsBloc = CompoundUnitsBloc(
      getCompoundUnitsUseCase: mockGetCompoundUnitsUseCase,
    );
  });

  tearDown(() async {
    await compoundUnitsBloc.close();
  });

  test('initial state should be CompoundUnitsState with initial status', () {
    expect(compoundUnitsBloc.state, const CompoundUnitsState());
    expect(compoundUnitsBloc.state.status, HomeRequestStatus.initial);
    expect(compoundUnitsBloc.state.compound, isNull);
    expect(compoundUnitsBloc.state.viewType, ViewType.grid);
    expect(compoundUnitsBloc.state.isLoadingMore, isFalse);
  });

  group('CompoundUnitsRequested', () {
    blocTest<CompoundUnitsBloc, CompoundUnitsState>(
      'emits [loading, success] with compound when usecase succeeds',
      build: () {
        when(() => mockGetCompoundUnitsUseCase(10, page: 1))
            .thenAnswer((_) async => const Right(testCompound));
        return compoundUnitsBloc;
      },
      act: (bloc) => bloc.add(const CompoundUnitsEvent.compoundUnitsRequested(10)),
      expect: () => const [
        CompoundUnitsState(status: HomeRequestStatus.loading),
        CompoundUnitsState(
          status: HomeRequestStatus.success,
          compound: testCompound,
        ),
      ],
      verify: (_) {
        verify(() => mockGetCompoundUnitsUseCase(10, page: 1)).called(1);
      },
    );

    blocTest<CompoundUnitsBloc, CompoundUnitsState>(
      'emits [loading, failure] with errorMessage when usecase fails',
      build: () {
        when(() => mockGetCompoundUnitsUseCase(10, page: 1))
            .thenAnswer((_) async => const Left(ServerFailure('Server error')));
        return compoundUnitsBloc;
      },
      act: (bloc) => bloc.add(const CompoundUnitsEvent.compoundUnitsRequested(10)),
      expect: () => const [
        CompoundUnitsState(status: HomeRequestStatus.loading),
        CompoundUnitsState(
          status: HomeRequestStatus.failure,
          errorMessage: 'Server error',
        ),
      ],
    );
  });

  group('CompoundUnitsMoreRequested', () {
    const nextPageCompound = CompoundCollectionEntity(
      id: 10,
      name: 'Palm Hills',
      description: 'Premier compound',
      units: [testUnit2],
      pagination: PaginationModel(
        currentPage: 2,
        lastPage: 2,
        perPage: 10,
        total: 20,
      ),
    );

    blocTest<CompoundUnitsBloc, CompoundUnitsState>(
      'emits [isLoadingMore: true, isLoadingMore: false] and appends units on success',
      seed: () => const CompoundUnitsState(
        status: HomeRequestStatus.success,
        compound: testCompound,
      ),
      build: () {
        when(() => mockGetCompoundUnitsUseCase(10, page: 2))
            .thenAnswer((_) async => const Right(nextPageCompound));
        return compoundUnitsBloc;
      },
      act: (bloc) =>
          bloc.add(const CompoundUnitsEvent.compoundUnitsMoreRequested(10)),
      expect: () => [
        const CompoundUnitsState(
          status: HomeRequestStatus.success,
          compound: testCompound,
          isLoadingMore: true,
        ),
        predicate<CompoundUnitsState>(
          (state) =>
              !state.isLoadingMore &&
              state.compound != null &&
              state.compound!.units.length == 2 &&
              state.compound!.units[0].id == 1 &&
              state.compound!.units[1].id == 2 &&
              state.compound!.pagination?.currentPage == 2,
        ),
      ],
      verify: (_) {
        verify(() => mockGetCompoundUnitsUseCase(10, page: 2)).called(1);
      },
    );

    blocTest<CompoundUnitsBloc, CompoundUnitsState>(
      'does nothing when pagination has no more pages',
      seed: () => const CompoundUnitsState(
        status: HomeRequestStatus.success,
        compound: CompoundCollectionEntity(
          id: 10,
          name: 'Palm Hills',
          description: 'Premier compound',
          units: [testUnit1],
          pagination: PaginationModel(
            currentPage: 2,
            lastPage: 2,
            perPage: 10,
            total: 20,
          ),
        ),
      ),
      build: () => compoundUnitsBloc,
      act: (bloc) =>
          bloc.add(const CompoundUnitsEvent.compoundUnitsMoreRequested(10)),
      expect: () => <CompoundUnitsState>[],
      verify: (_) {
        verifyNever(
          () => mockGetCompoundUnitsUseCase(any(), page: any(named: 'page')),
        );
      },
    );

    blocTest<CompoundUnitsBloc, CompoundUnitsState>(
      'emits isLoadingMore: false when usecase fails',
      seed: () => const CompoundUnitsState(
        status: HomeRequestStatus.success,
        compound: testCompound,
      ),
      build: () {
        when(() => mockGetCompoundUnitsUseCase(10, page: 2))
            .thenAnswer((_) async => const Left(ServerFailure('Page error')));
        return compoundUnitsBloc;
      },
      act: (bloc) =>
          bloc.add(const CompoundUnitsEvent.compoundUnitsMoreRequested(10)),
      expect: () => const [
        CompoundUnitsState(
          status: HomeRequestStatus.success,
          compound: testCompound,
          isLoadingMore: true,
        ),
        CompoundUnitsState(
          status: HomeRequestStatus.success,
          compound: testCompound,
        ),
      ],
    );
  });

  group('CompoundUnitsViewTypeToggled', () {
    blocTest<CompoundUnitsBloc, CompoundUnitsState>(
      'toggles viewType from grid to list and back',
      build: () => compoundUnitsBloc,
      act: (bloc) {
        bloc
          ..add(const CompoundUnitsEvent.compoundUnitsViewTypeToggled())
          ..add(const CompoundUnitsEvent.compoundUnitsViewTypeToggled());
      },
      expect: () => const [
        CompoundUnitsState(viewType: ViewType.list),
        CompoundUnitsState(),
      ],
    );
  });
}
