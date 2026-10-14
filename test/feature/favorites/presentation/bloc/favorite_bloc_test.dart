import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:propix8/core/error/failures.dart';
import 'package:propix8/core/models/pagination_model.dart';
import 'package:propix8/core/utils/enums.dart';
import 'package:propix8/feature/favorites/domain/entities/favorite_response_entity.dart';
import 'package:propix8/feature/favorites/domain/entities/favorite_unit_entity.dart';
import 'package:propix8/feature/favorites/domain/usecases/get_favorites_usecase.dart';
import 'package:propix8/feature/favorites/domain/usecases/toggle_favorite_item_usecase.dart';
import 'package:propix8/feature/favorites/presentation/bloc/favorite_bloc.dart';
import 'package:propix8/feature/favorites/presentation/bloc/favorite_event.dart';
import 'package:propix8/feature/favorites/presentation/bloc/favorite_state.dart';
import 'package:propix8/feature/home/domain/entities/unit_entity.dart';

class MockGetFavoritesUseCase extends Mock implements GetFavoritesUseCase {}

class MockToggleFavoriteItemUseCase extends Mock
    implements ToggleFavoriteItemUseCase {}

void main() {
  late MockGetFavoritesUseCase mockGetFavoritesUseCase;
  late MockToggleFavoriteItemUseCase mockToggleFavoriteItemUseCase;
  late FavoriteBloc favoriteBloc;

  final testDate = DateTime(2026);
  const testUnit = UnitEntity(
    id: 101,
    title: 'Luxury Villa',
    price: 5000000.0,
    description: 'Beautiful villa',
    address: 'New Cairo',
    bedrooms: 4,
    bathrooms: 3,
    area: 300.0,
  );

  final testFavoriteUnit = FavoriteUnitEntity(
    id: 1,
    unit: testUnit,
    createdAt: testDate,
  );

  final testResponse = FavoriteResponseEntity(
    status: true,
    message: 'Success',
    data: [testFavoriteUnit],
    pagination: const PaginationModel(
      currentPage: 1,
      lastPage: 2,
      perPage: 10,
      total: 20,
    ),
  );

  setUp(() {
    mockGetFavoritesUseCase = MockGetFavoritesUseCase();
    mockToggleFavoriteItemUseCase = MockToggleFavoriteItemUseCase();
    favoriteBloc = FavoriteBloc(
      getFavoritesUseCase: mockGetFavoritesUseCase,
      toggleFavoriteItemUseCase: mockToggleFavoriteItemUseCase,
    );
  });

  tearDown(() async {
    await favoriteBloc.close();
  });

  test('initial state should be FavoriteState() with default values', () {
    expect(favoriteBloc.state, const FavoriteState());
    expect(favoriteBloc.state.status, FavoriteStatus.initial);
    expect(favoriteBloc.state.listStatus, FavoriteStatus.initial);
    expect(favoriteBloc.state.favorites, isEmpty);
    expect(favoriteBloc.state.favoriteUnits, isEmpty);
    expect(favoriteBloc.state.currentPage, 1);
    expect(favoriteBloc.state.lastPage, 1);
    expect(favoriteBloc.state.viewType, ViewType.grid);
  });

  group('GetFavoritesRequested', () {
    blocTest<FavoriteBloc, FavoriteState>(
      'emits [loading, success] with favorites and updates map when call succeeds',
      build: () {
        when(() => mockGetFavoritesUseCase())
            .thenAnswer((_) async => Right(testResponse));
        return favoriteBloc;
      },
      act: (bloc) => bloc.add(const FavoriteEvent.getFavoritesRequested()),
      expect: () => [
        const FavoriteState(listStatus: FavoriteStatus.loading),
        FavoriteState(
          listStatus: FavoriteStatus.success,
          favoriteUnits: [testFavoriteUnit],
          favorites: const {101: true},
          lastPage: 2,
        ),
      ],
      verify: (_) {
        verify(() => mockGetFavoritesUseCase()).called(1);
      },
    );

    blocTest<FavoriteBloc, FavoriteState>(
      'emits [loading, failure] when call fails',
      build: () {
        when(() => mockGetFavoritesUseCase())
            .thenAnswer((_) async => const Left(ServerFailure('Server error')));
        return favoriteBloc;
      },
      act: (bloc) => bloc.add(const FavoriteEvent.getFavoritesRequested()),
      expect: () => [
        const FavoriteState(listStatus: FavoriteStatus.loading),
        const FavoriteState(
          listStatus: FavoriteStatus.failure,
          errorMessage: 'Server error',
        ),
      ],
    );

    blocTest<FavoriteBloc, FavoriteState>(
      'does not refetch if already loaded and neither isLoadMore nor forceRefresh',
      seed: () => FavoriteState(
        listStatus: FavoriteStatus.success,
        favoriteUnits: [testFavoriteUnit],
      ),
      build: () => favoriteBloc,
      act: (bloc) => bloc.add(const FavoriteEvent.getFavoritesRequested()),
      expect: () => <FavoriteState>[],
      verify: (_) {
        verifyNever(() => mockGetFavoritesUseCase(page: any(named: 'page')));
      },
    );

    blocTest<FavoriteBloc, FavoriteState>(
      'loads more units and appends them when isLoadMore is true',
      seed: () => FavoriteState(
        listStatus: FavoriteStatus.success,
        favoriteUnits: [testFavoriteUnit],
        favorites: const {101: true},
        lastPage: 2,
      ),
      build: () {
        final secondFavoriteUnit = FavoriteUnitEntity(
          id: 2,
          unit: const UnitEntity(
            id: 102,
            title: 'Modern Apartment',
            price: 2000000.0,
          ),
          createdAt: testDate,
        );
        final secondPageResponse = FavoriteResponseEntity(
          status: true,
          message: 'Success',
          data: [secondFavoriteUnit],
          pagination: const PaginationModel(
            currentPage: 2,
            lastPage: 2,
            perPage: 10,
            total: 20,
          ),
        );
        when(() => mockGetFavoritesUseCase(page: 2))
            .thenAnswer((_) async => Right(secondPageResponse));
        return favoriteBloc;
      },
      act: (bloc) => bloc.add(
        const FavoriteEvent.getFavoritesRequested(isLoadMore: true),
      ),
      expect: () => [
        FavoriteState(
          listStatus: FavoriteStatus.loading,
          favoriteUnits: [testFavoriteUnit],
          favorites: const {101: true},
          lastPage: 2,
        ),
        predicate<FavoriteState>(
          (state) =>
              state.listStatus == FavoriteStatus.success &&
              state.favoriteUnits.length == 2 &&
              (state.favorites[101] ?? false) &&
              (state.favorites[102] ?? false) &&
              state.currentPage == 2,
        ),
      ],
    );
  });

  group('FavoriteToggled', () {
    blocTest<FavoriteBloc, FavoriteState>(
      'optimistically removes favorite when unit is currently favorite and API succeeds',
      seed: () => FavoriteState(
        listStatus: FavoriteStatus.success,
        favoriteUnits: [testFavoriteUnit],
        favorites: const {101: true},
      ),
      build: () {
        when(() => mockToggleFavoriteItemUseCase(101))
            .thenAnswer((_) async => const Right(false));
        return favoriteBloc;
      },
      act: (bloc) => bloc.add(const FavoriteEvent.favoriteToggled(testUnit)),
      expect: () => const [
        FavoriteState(
          listStatus: FavoriteStatus.success,
          status: FavoriteStatus.loading,
          favorites: {101: false},
        ),
        FavoriteState(
          listStatus: FavoriteStatus.success,
          status: FavoriteStatus.success,
          favorites: {101: false},
        ),
      ],
      verify: (_) {
        verify(() => mockToggleFavoriteItemUseCase(101)).called(1);
      },
    );

    blocTest<FavoriteBloc, FavoriteState>(
      'optimistically adds favorite when unit is not favorite and API succeeds',
      seed: () => const FavoriteState(
        listStatus: FavoriteStatus.success,
        favorites: {101: false},
      ),
      build: () {
        when(() => mockToggleFavoriteItemUseCase(101))
            .thenAnswer((_) async => const Right(true));
        return favoriteBloc;
      },
      act: (bloc) => bloc.add(const FavoriteEvent.favoriteToggled(testUnit)),
      expect: () => [
        predicate<FavoriteState>(
          (state) =>
              state.status == FavoriteStatus.loading &&
              (state.favorites[101] ?? false) &&
              state.favoriteUnits.length == 1 &&
              state.favoriteUnits.first.unit.id == 101,
        ),
        predicate<FavoriteState>(
          (state) =>
              state.status == FavoriteStatus.success &&
              (state.favorites[101] ?? false) &&
              state.favoriteUnits.length == 1 &&
              state.favoriteUnits.first.unit.id == 101,
        ),
      ],
    );

    blocTest<FavoriteBloc, FavoriteState>(
      'reverts optimistic change when API call fails',
      seed: () => FavoriteState(
        listStatus: FavoriteStatus.success,
        favoriteUnits: [testFavoriteUnit],
        favorites: const {101: true},
      ),
      build: () {
        when(() => mockToggleFavoriteItemUseCase(101))
            .thenAnswer((_) async => const Left(ServerFailure('Network error')));
        return favoriteBloc;
      },
      act: (bloc) => bloc.add(const FavoriteEvent.favoriteToggled(testUnit)),
      expect: () => [
        const FavoriteState(
          listStatus: FavoriteStatus.success,
          status: FavoriteStatus.loading,
          favorites: {101: false},
        ),
        FavoriteState(
          listStatus: FavoriteStatus.success,
          status: FavoriteStatus.failure,
          favoriteUnits: [testFavoriteUnit],
          favorites: const {101: true},
          errorMessage: 'Network error',
        ),
      ],
    );
  });

  group('FavoriteStatusUpdated & FavoritesInitialized', () {
    blocTest<FavoriteBloc, FavoriteState>(
      'updates specific favorite status',
      build: () => favoriteBloc,
      act: (bloc) => bloc.add(
        const FavoriteEvent.favoriteStatusUpdated(
          unitId: 50,
          isFavorite: true,
        ),
      ),
      expect: () => const [
        FavoriteState(favorites: {50: true}),
      ],
    );

    blocTest<FavoriteBloc, FavoriteState>(
      'initializes favorites map',
      build: () => favoriteBloc,
      act: (bloc) => bloc.add(
        const FavoriteEvent.favoritesInitialized({1: true, 2: false}),
      ),
      expect: () => const [
        FavoriteState(favorites: {1: true, 2: false}),
      ],
    );
  });

  group('FavoriteViewTypeToggled', () {
    blocTest<FavoriteBloc, FavoriteState>(
      'toggles view type between grid and list',
      build: () => favoriteBloc,
      act: (bloc) {
        bloc
          ..add(const FavoriteEvent.favoriteViewTypeToggled())
          ..add(const FavoriteEvent.favoriteViewTypeToggled());
      },
      expect: () => const [
        FavoriteState(viewType: ViewType.list),
        FavoriteState(),
      ],
    );
  });
}
