import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:propix8/core/error/failures.dart';
import 'package:propix8/core/models/pagination_model.dart';
import 'package:propix8/feature/home/domain/entities/category_entity.dart';
import 'package:propix8/feature/home/domain/entities/unit_entity.dart';
import 'package:propix8/feature/home/domain/usecases/get_all_units_usecase.dart';
import 'package:propix8/feature/home/domain/usecases/get_banners_usecase.dart';
import 'package:propix8/feature/home/domain/usecases/get_categories_usecase.dart';
import 'package:propix8/feature/home/domain/usecases/get_latest_units_usecase.dart';
import 'package:propix8/feature/home/domain/usecases/get_nearby_units_usecase.dart';
import 'package:propix8/feature/home/domain/usecases/toggle_favorite_usecase.dart';
import 'package:propix8/feature/home/presentation/bloc/home_bloc.dart';
import 'package:propix8/feature/home/presentation/bloc/home_event.dart';
import 'package:propix8/feature/home/presentation/bloc/home_state.dart';
import 'package:propix8/feature/home/presentation/filter/bloc/filter_state.dart';

class MockGetBannersUseCase extends Mock implements GetBannersUseCase {}

class MockGetCategoriesUseCase extends Mock implements GetCategoriesUseCase {}

class MockGetNearbyUnitsUseCase extends Mock implements GetNearbyUnitsUseCase {}

class MockGetLatestUnitsUseCase extends Mock implements GetLatestUnitsUseCase {}

class MockGetAllUnitsUseCase extends Mock implements GetAllUnitsUseCase {}

class MockToggleFavoriteUseCase extends Mock implements ToggleFavoriteUseCase {}

void main() {
  late MockGetBannersUseCase mockGetBannersUseCase;
  late MockGetCategoriesUseCase mockGetCategoriesUseCase;
  late MockGetNearbyUnitsUseCase mockGetNearbyUnitsUseCase;
  late MockGetLatestUnitsUseCase mockGetLatestUnitsUseCase;
  late MockGetAllUnitsUseCase mockGetAllUnitsUseCase;
  late MockToggleFavoriteUseCase mockToggleFavoriteUseCase;
  late HomeBloc homeBloc;

  const testCategory = CategoryEntity(id: 1, name: 'Apartment', icon: 'icon');
  const testUnit = UnitEntity(
    id: 1,
    title: 'Villa',
    price: 5000000,
    isFavorite: false,
  );
  const testPaginatedUnits = PaginatedResponse<UnitEntity>(
    data: [testUnit],
    pagination: PaginationModel(
      lastPage: 2,
      total: 10,
    ),
  );

  setUp(() {
    mockGetBannersUseCase = MockGetBannersUseCase();
    mockGetCategoriesUseCase = MockGetCategoriesUseCase();
    mockGetNearbyUnitsUseCase = MockGetNearbyUnitsUseCase();
    mockGetLatestUnitsUseCase = MockGetLatestUnitsUseCase();
    mockGetAllUnitsUseCase = MockGetAllUnitsUseCase();
    mockToggleFavoriteUseCase = MockToggleFavoriteUseCase();

    homeBloc = HomeBloc(
      getBannersUseCase: mockGetBannersUseCase,
      getCategoriesUseCase: mockGetCategoriesUseCase,
      getNearbyUnitsUseCase: mockGetNearbyUnitsUseCase,
      getLatestUnitsUseCase: mockGetLatestUnitsUseCase,
      getAllUnitsUseCase: mockGetAllUnitsUseCase,
      toggleFavoriteUseCase: mockToggleFavoriteUseCase,
    );
  });

  tearDown(() async {
    await homeBloc.close();
  });

  test('initial state should be HomeState with initial statuses', () {
    expect(homeBloc.state, equals(const HomeState()));
  });

  group('HomeCategoriesRequested', () {
    blocTest<HomeBloc, HomeState>(
      'emits [categoryStatus: loading, success] with categories when call succeeds',
      build: () {
        when(
          () => mockGetCategoriesUseCase(),
        ).thenAnswer((_) async => const Right([testCategory]));
        return homeBloc;
      },
      act: (bloc) => bloc.add(const HomeEvent.categoriesRequested()),
      expect: () => [
        const HomeState(categoryStatus: HomeRequestStatus.loading),
        const HomeState(
          categoryStatus: HomeRequestStatus.success,
          categories: [testCategory],
        ),
      ],
    );

    blocTest<HomeBloc, HomeState>(
      'emits [categoryStatus: loading, failure] with errorMessage when call fails',
      build: () {
        when(() => mockGetCategoriesUseCase()).thenAnswer(
          (_) async => const Left(ServerFailure('Server error')),
        );
        return homeBloc;
      },
      act: (bloc) => bloc.add(const HomeEvent.categoriesRequested()),
      expect: () => [
        const HomeState(categoryStatus: HomeRequestStatus.loading),
        const HomeState(
          categoryStatus: HomeRequestStatus.failure,
          errorMessage: 'Server error',
        ),
      ],
    );
  });

  group('HomeCategorySelected', () {
    blocTest<HomeBloc, HomeState>(
      'updates selectedUnitTypeId and fetches units',
      build: () {
        when(
          () => mockGetAllUnitsUseCase(
            page: any(named: 'page'),
            unitTypeId: 1,
            offerType: any(named: 'offerType'),
            developmentStatus: any(named: 'developmentStatus'),
            searchQuery: any(named: 'searchQuery'),
            minPrice: any(named: 'minPrice'),
            maxPrice: any(named: 'maxPrice'),
            rooms: any(named: 'rooms'),
            bathrooms: any(named: 'bathrooms'),
            minArea: any(named: 'minArea'),
            maxArea: any(named: 'maxArea'),
            cityId: any(named: 'cityId'),
          ),
        ).thenAnswer((_) async => const Right(testPaginatedUnits));
        return homeBloc;
      },
      act: (bloc) => bloc.add(const HomeEvent.categorySelected(1)),
      expect: () => [
        const HomeState(selectedUnitTypeId: 1),
        const HomeState(
          selectedUnitTypeId: 1,
          allStatus: HomeRequestStatus.loading,
        ),
        const HomeState(
          selectedUnitTypeId: 1,
          allStatus: HomeRequestStatus.success,
          allUnits: [testUnit],
          lastPage: 2,
        ),
      ],
    );
  });

  group('HomeTabChanged', () {
    blocTest<HomeBloc, HomeState>(
      'updates activeTab and refreshes all units with buy offer type',
      build: () {
        when(
          () => mockGetAllUnitsUseCase(
            page: any(named: 'page'),
            unitTypeId: any(named: 'unitTypeId'),
            offerType: 'sale',
            developmentStatus: any(named: 'developmentStatus'),
            searchQuery: any(named: 'searchQuery'),
            minPrice: any(named: 'minPrice'),
            maxPrice: any(named: 'maxPrice'),
            rooms: any(named: 'rooms'),
            bathrooms: any(named: 'bathrooms'),
            minArea: any(named: 'minArea'),
            maxArea: any(named: 'maxArea'),
            cityId: any(named: 'cityId'),
          ),
        ).thenAnswer((_) async => const Right(testPaginatedUnits));
        return homeBloc;
      },
      act: (bloc) => bloc.add(const HomeEvent.tabChanged(HomeTab.buy)),
      expect: () => [
        const HomeState(activeTab: HomeTab.buy),
        const HomeState(
          activeTab: HomeTab.buy,
          allStatus: HomeRequestStatus.loading,
        ),
        const HomeState(
          activeTab: HomeTab.buy,
          allStatus: HomeRequestStatus.success,
          allUnits: [testUnit],
          lastPage: 2,
        ),
      ],
    );
  });

  group('HomeFilterApplied and HomeFilterCleared', () {
    const filterState = FilterState(selectedCityId: 2, bedrooms: 3);

    blocTest<HomeBloc, HomeState>(
      'updates filterState and applies filters to all units',
      build: () {
        when(
          () => mockGetAllUnitsUseCase(
            page: any(named: 'page'),
            unitTypeId: any(named: 'unitTypeId'),
            offerType: any(named: 'offerType'),
            developmentStatus: any(named: 'developmentStatus'),
            searchQuery: any(named: 'searchQuery'),
            minPrice: any(named: 'minPrice'),
            maxPrice: any(named: 'maxPrice'),
            rooms: any(named: 'rooms'),
            bathrooms: any(named: 'bathrooms'),
            minArea: any(named: 'minArea'),
            maxArea: any(named: 'maxArea'),
            cityId: 2,
          ),
        ).thenAnswer((_) async => const Right(testPaginatedUnits));
        return homeBloc;
      },
      act: (bloc) => bloc.add(const HomeEvent.filterApplied(filterState)),
      expect: () => [
        const HomeState(filterState: filterState),
        const HomeState(
          filterState: filterState,
          allStatus: HomeRequestStatus.loading,
        ),
        const HomeState(
          filterState: filterState,
          allStatus: HomeRequestStatus.success,
          allUnits: [testUnit],
          lastPage: 2,
        ),
      ],
    );

    blocTest<HomeBloc, HomeState>(
      'clears filterState and resets units',
      build: () {
        when(
          () => mockGetAllUnitsUseCase(
            page: any(named: 'page'),
            unitTypeId: any(named: 'unitTypeId'),
            offerType: any(named: 'offerType'),
            developmentStatus: any(named: 'developmentStatus'),
            searchQuery: any(named: 'searchQuery'),
            minPrice: any(named: 'minPrice'),
            maxPrice: any(named: 'maxPrice'),
            rooms: any(named: 'rooms'),
            bathrooms: any(named: 'bathrooms'),
            minArea: any(named: 'minArea'),
            maxArea: any(named: 'maxArea'),
            cityId: any(named: 'cityId'),
          ),
        ).thenAnswer((_) async => const Right(testPaginatedUnits));
        return homeBloc;
      },
      seed: () => const HomeState(filterState: filterState),
      act: (bloc) => bloc.add(const HomeEvent.filterCleared()),
      expect: () => [
        const HomeState(),
        const HomeState(allStatus: HomeRequestStatus.loading),
        const HomeState(
          allStatus: HomeRequestStatus.success,
          allUnits: [testUnit],
          lastPage: 2,
        ),
      ],
    );
  });

  group('HomeFavoriteToggled', () {
    blocTest<HomeBloc, HomeState>(
      'optimistically toggles favorite and syncs with API result',
      build: () {
        when(
          () => mockToggleFavoriteUseCase(1),
        ).thenAnswer((_) async => const Right(true));
        return homeBloc;
      },
      seed: () => const HomeState(allUnits: [testUnit]),
      act: (bloc) => bloc.add(const HomeEvent.favoriteToggled(1)),
      expect: () => [
        HomeState(
          allUnits: [testUnit.copyWithUnit(isFavorite: true)],
        ),
      ],
    );

    blocTest<HomeBloc, HomeState>(
      'reverts optimistic toggle when API fails',
      build: () {
        when(() => mockToggleFavoriteUseCase(1)).thenAnswer(
          (_) async => const Left(ServerFailure('Error')),
        );
        return homeBloc;
      },
      seed: () => const HomeState(allUnits: [testUnit]),
      act: (bloc) => bloc.add(const HomeEvent.favoriteToggled(1)),
      expect: () => [
        HomeState(
          allUnits: [testUnit.copyWithUnit(isFavorite: true)],
        ),
        const HomeState(allUnits: [testUnit]),
      ],
    );
  });

  group('HomeLoadMoreAllUnitsRequested', () {
    const nextUnit = UnitEntity(id: 2, title: 'Townhouse', price: 4000000);
    const nextPageResponse = PaginatedResponse<UnitEntity>(
      data: [nextUnit],
      pagination: PaginationModel(
        currentPage: 2,
        lastPage: 2,
        total: 10,
      ),
    );

    blocTest<HomeBloc, HomeState>(
      'loads and appends next page of units',
      build: () {
        when(
          () => mockGetAllUnitsUseCase(
            page: 2,
            unitTypeId: any(named: 'unitTypeId'),
            offerType: any(named: 'offerType'),
            developmentStatus: any(named: 'developmentStatus'),
            searchQuery: any(named: 'searchQuery'),
            minPrice: any(named: 'minPrice'),
            maxPrice: any(named: 'maxPrice'),
            rooms: any(named: 'rooms'),
            bathrooms: any(named: 'bathrooms'),
            minArea: any(named: 'minArea'),
            maxArea: any(named: 'maxArea'),
            cityId: any(named: 'cityId'),
          ),
        ).thenAnswer((_) async => const Right(nextPageResponse));
        return homeBloc;
      },
      seed: () => const HomeState(
        allStatus: HomeRequestStatus.success,
        allUnits: [testUnit],
        lastPage: 2,
      ),
      act: (bloc) => bloc.add(const HomeEvent.loadMoreAllUnitsRequested()),
      expect: () => [
        const HomeState(
          allStatus: HomeRequestStatus.success,
          loadMoreStatus: HomeRequestStatus.loading,
          allUnits: [testUnit],
          lastPage: 2,
        ),
        const HomeState(
          allStatus: HomeRequestStatus.success,
          loadMoreStatus: HomeRequestStatus.success,
          allUnits: [testUnit, nextUnit],
          currentPage: 2,
          lastPage: 2,
        ),
      ],
    );
  });
}
