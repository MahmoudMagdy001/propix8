import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:propix8/core/error/failures.dart';
import 'package:propix8/core/models/pagination_model.dart';
import 'package:propix8/core/utils/enums.dart';
import 'package:propix8/feature/comparison/presentation/bloc/choose_product_bloc.dart';
import 'package:propix8/feature/comparison/presentation/bloc/choose_product_event.dart';
import 'package:propix8/feature/comparison/presentation/bloc/choose_product_state.dart';
import 'package:propix8/feature/home/domain/entities/unit_entity.dart';
import 'package:propix8/feature/home/domain/usecases/get_all_units_usecase.dart';

class MockGetAllUnitsUseCase extends Mock implements GetAllUnitsUseCase {}

void main() {
  late MockGetAllUnitsUseCase mockGetAllUnitsUseCase;
  late ChooseProductBloc chooseProductBloc;

  const testUnit1 = UnitEntity(id: 1, title: 'Unit 1', price: 1000000.0);
  const testUnit2 = UnitEntity(id: 2, title: 'Unit 2', price: 2000000.0);
  const testUnit3 = UnitEntity(id: 3, title: 'Unit 3', price: 3000000.0);

  const testPagination = PaginationModel(
    currentPage: 1,
    lastPage: 2,
    perPage: 10,
    total: 20,
  );

  const testResponse = PaginatedResponse<UnitEntity>(
    data: [testUnit1, testUnit2],
    pagination: testPagination,
  );

  setUp(() {
    mockGetAllUnitsUseCase = MockGetAllUnitsUseCase();
    chooseProductBloc = ChooseProductBloc(
      getAllUnitsUseCase: mockGetAllUnitsUseCase,
    );
  });

  tearDown(() async {
    await chooseProductBloc.close();
  });

  test('initial state should have default values', () {
    expect(chooseProductBloc.state, const ChooseProductState());
    expect(chooseProductBloc.state.status, ChooseProductStatus.initial);
    expect(chooseProductBloc.state.units, isEmpty);
    expect(chooseProductBloc.state.viewType, ViewType.grid);
  });

  group('ChooseProductUnitsLoaded', () {
    blocTest<ChooseProductBloc, ChooseProductState>(
      'emits [loading, success] with filtered units excluding excludeId',
      build: () {
        when(
          () => mockGetAllUnitsUseCase(),
        ).thenAnswer((_) async => const Right(testResponse));
        return chooseProductBloc;
      },
      act: (bloc) =>
          bloc.add(const ChooseProductEvent.unitsLoaded(excludeId: 1)),
      expect: () => [
        const ChooseProductState(status: ChooseProductStatus.loading),
        const ChooseProductState(
          status: ChooseProductStatus.success,
          units: [testUnit2],
          lastPage: 2,
        ),
      ],
      verify: (_) {
        verify(() => mockGetAllUnitsUseCase()).called(1);
      },
    );

    blocTest<ChooseProductBloc, ChooseProductState>(
      'emits [loading, failure] when usecase fails',
      build: () {
        when(
          () => mockGetAllUnitsUseCase(),
        ).thenAnswer((_) async => const Left(ServerFailure('Server error')));
        return chooseProductBloc;
      },
      act: (bloc) =>
          bloc.add(const ChooseProductEvent.unitsLoaded(excludeId: 1)),
      expect: () => [
        const ChooseProductState(status: ChooseProductStatus.loading),
        const ChooseProductState(
          status: ChooseProductStatus.failure,
          errorMessage: 'Server error',
        ),
      ],
    );
  });

  group('ChooseProductMoreUnitsLoaded', () {
    blocTest<ChooseProductBloc, ChooseProductState>(
      'appends next page units on success',
      seed: () => const ChooseProductState(
        status: ChooseProductStatus.success,
        units: [testUnit1],
        lastPage: 2,
      ),
      build: () {
        when(() => mockGetAllUnitsUseCase(page: 2)).thenAnswer(
          (_) async => const Right(
            PaginatedResponse(
              data: [testUnit3],
              pagination: PaginationModel(
                currentPage: 2,
                lastPage: 2,
                perPage: 10,
                total: 20,
              ),
            ),
          ),
        );
        return chooseProductBloc;
      },
      act: (bloc) =>
          bloc.add(const ChooseProductEvent.moreUnitsLoaded(excludeId: 99)),
      expect: () => [
        const ChooseProductState(
          status: ChooseProductStatus.loading,
          units: [testUnit1],
          lastPage: 2,
        ),
        const ChooseProductState(
          status: ChooseProductStatus.success,
          units: [testUnit1, testUnit3],
          currentPage: 2,
          lastPage: 2,
        ),
      ],
    );

    blocTest<ChooseProductBloc, ChooseProductState>(
      'does nothing when hasMore is false',
      seed: () => const ChooseProductState(
        status: ChooseProductStatus.success,
        units: [testUnit1],
        currentPage: 2,
        lastPage: 2,
      ),
      build: () => chooseProductBloc,
      act: (bloc) =>
          bloc.add(const ChooseProductEvent.moreUnitsLoaded(excludeId: 99)),
      expect: () => <ChooseProductState>[],
      verify: (_) {
        verifyNever(() => mockGetAllUnitsUseCase(page: any(named: 'page')));
      },
    );
  });

  group('ChooseProductViewTypeToggled', () {
    blocTest<ChooseProductBloc, ChooseProductState>(
      'toggles viewType from grid to list and back',
      build: () => chooseProductBloc,
      act: (bloc) {
        bloc
          ..add(const ChooseProductEvent.viewTypeToggled())
          ..add(const ChooseProductEvent.viewTypeToggled());
      },
      expect: () => [
        const ChooseProductState(viewType: ViewType.list),
        const ChooseProductState(),
      ],
    );
  });
}
