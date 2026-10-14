import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:propix8/core/error/failures.dart';
import 'package:propix8/core/models/pagination_model.dart';
import 'package:propix8/core/utils/enums.dart';
import 'package:propix8/feature/home/domain/entities/unit_entity.dart';
import 'package:propix8/feature/home/domain/usecases/get_nearby_units_usecase.dart';
import 'package:propix8/feature/home/domain/usecases/toggle_favorite_usecase.dart';
import 'package:propix8/feature/home/presentation/bloc/home_state.dart';
import 'package:propix8/feature/home/presentation/bloc/nearby_units_bloc.dart';
import 'package:propix8/feature/home/presentation/bloc/nearby_units_event.dart';
import 'package:propix8/feature/home/presentation/bloc/nearby_units_state.dart';

class MockGetNearbyUnitsUseCase extends Mock implements GetNearbyUnitsUseCase {}

class MockToggleFavoriteUseCase extends Mock implements ToggleFavoriteUseCase {}

void main() {
  late MockGetNearbyUnitsUseCase mockGetNearbyUnitsUseCase;
  late MockToggleFavoriteUseCase mockToggleFavoriteUseCase;
  late NearbyUnitsBloc nearbyUnitsBloc;

  const testUnit = UnitEntity(
    id: 1,
    title: 'Nearby Condo',
    price: 3000000,
    isFavorite: false,
  );
  const testPaginated = PaginatedResponse<UnitEntity>(
    data: [testUnit],
    pagination: PaginationModel(
      currentPage: 1,
      lastPage: 2,
      total: 5,
      perPage: 10,
    ),
  );

  setUp(() {
    mockGetNearbyUnitsUseCase = MockGetNearbyUnitsUseCase();
    mockToggleFavoriteUseCase = MockToggleFavoriteUseCase();
    nearbyUnitsBloc = NearbyUnitsBloc(
      getNearbyUnitsUseCase: mockGetNearbyUnitsUseCase,
      toggleFavoriteUseCase: mockToggleFavoriteUseCase,
    );
  });

  tearDown(() async {
    await nearbyUnitsBloc.close();
  });

  test('initial state should be NearbyUnitsState with initial values', () {
    expect(nearbyUnitsBloc.state, equals(const NearbyUnitsState()));
  });

  group('NearbyUnitsRequested', () {
    blocTest<NearbyUnitsBloc, NearbyUnitsState>(
      'emits [loading, success] with units when usecase succeeds',
      build: () {
        when(
          () => mockGetNearbyUnitsUseCase(page: any(named: 'page')),
        ).thenAnswer((_) async => const Right(testPaginated));
        return nearbyUnitsBloc;
      },
      act: (bloc) => bloc.add(const NearbyUnitsEvent.unitsRequested()),
      expect: () => [
        const NearbyUnitsState(status: HomeRequestStatus.loading),
        NearbyUnitsState(
          status: HomeRequestStatus.success,
          units: const [testUnit],
          pagination: testPaginated.pagination,
        ),
      ],
    );

    blocTest<NearbyUnitsBloc, NearbyUnitsState>(
      'emits [loading, failure] when usecase fails',
      build: () {
        when(
          () => mockGetNearbyUnitsUseCase(page: any(named: 'page')),
        ).thenAnswer((_) async => const Left(ServerFailure('Fetch failed')));
        return nearbyUnitsBloc;
      },
      act: (bloc) => bloc.add(const NearbyUnitsEvent.unitsRequested()),
      expect: () => [
        const NearbyUnitsState(status: HomeRequestStatus.loading),
        const NearbyUnitsState(
          status: HomeRequestStatus.failure,
          errorMessage: 'Fetch failed',
        ),
      ],
    );
  });

  group('NearbyUnitsViewTypeToggled', () {
    blocTest<NearbyUnitsBloc, NearbyUnitsState>(
      'toggles viewType from list to grid',
      build: () => nearbyUnitsBloc,
      act: (bloc) => bloc.add(const NearbyUnitsEvent.viewTypeToggled()),
      expect: () => [
        const NearbyUnitsState(viewType: ViewType.grid),
      ],
    );

    blocTest<NearbyUnitsBloc, NearbyUnitsState>(
      'toggles viewType from grid to list',
      build: () => nearbyUnitsBloc,
      seed: () => const NearbyUnitsState(viewType: ViewType.grid),
      act: (bloc) => bloc.add(const NearbyUnitsEvent.viewTypeToggled()),
      expect: () => [
        const NearbyUnitsState(),
      ],
    );
  });

  group('NearbyUnitsFavoriteToggled', () {
    blocTest<NearbyUnitsBloc, NearbyUnitsState>(
      'optimistically toggles favorite status in state',
      build: () {
        when(
          () => mockToggleFavoriteUseCase(1),
        ).thenAnswer((_) async => const Right(true));
        return nearbyUnitsBloc;
      },
      seed: () => const NearbyUnitsState(units: [testUnit]),
      act: (bloc) => bloc.add(const NearbyUnitsEvent.favoriteToggled(1)),
      expect: () => [
        NearbyUnitsState(
          units: [testUnit.copyWithUnit(isFavorite: true)],
        ),
      ],
    );
  });
}
