import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:propix8/core/error/failures.dart';
import 'package:propix8/core/models/pagination_model.dart';
import 'package:propix8/core/utils/enums.dart';
import 'package:propix8/feature/home/domain/entities/unit_entity.dart';
import 'package:propix8/feature/home/presentation/bloc/home_state.dart';
import 'package:propix8/feature/search/domain/usecases/search_units_usecase.dart';
import 'package:propix8/feature/search/presentation/bloc/search_bloc.dart';
import 'package:propix8/feature/search/presentation/bloc/search_event.dart';
import 'package:propix8/feature/search/presentation/bloc/search_state.dart';

class MockSearchUnitsUseCase extends Mock implements SearchUnitsUseCase {}

void main() {
  late MockSearchUnitsUseCase mockSearchUnitsUseCase;
  late SearchBloc searchBloc;

  const testUnit1 = UnitEntity(id: 1, title: 'Villa in New Cairo', price: 5000000.0);

  const testUnit2 = UnitEntity(id: 2, title: 'Apartment in Zayed', price: 3000000.0);

  const testPaginationPage1 = PaginationModel(lastPage: 2, total: 20);

  const testPaginationPage2 = PaginationModel(currentPage: 2, lastPage: 2, total: 20);

  const testResponsePage1 = PaginatedResponse<UnitEntity>(data: [testUnit1], pagination: testPaginationPage1);

  const testResponsePage2 = PaginatedResponse<UnitEntity>(data: [testUnit2], pagination: testPaginationPage2);

  setUp(() {
    mockSearchUnitsUseCase = MockSearchUnitsUseCase();
    searchBloc = SearchBloc(searchUnitsUseCase: mockSearchUnitsUseCase);
  });

  tearDown(() async {
    await searchBloc.close();
  });

  test('initial state should have default values', () {
    expect(searchBloc.state, const SearchState());
    expect(searchBloc.state.status, HomeRequestStatus.initial);
    expect(searchBloc.state.loadMoreStatus, HomeRequestStatus.initial);
    expect(searchBloc.state.results, isEmpty);
    expect(searchBloc.state.query, isEmpty);
    expect(searchBloc.state.currentPage, 1);
    expect(searchBloc.state.lastPage, 1);
    expect(searchBloc.state.hasMore, isFalse);
    expect(searchBloc.state.viewType, ViewType.grid);
  });

  group('SearchQueryChanged', () {
    blocTest<SearchBloc, SearchState>(
      'resets to initial state when query is empty',
      build: () => searchBloc,
      seed: () => const SearchState(status: HomeRequestStatus.success, results: [testUnit1], query: 'Villa'),
      act: (bloc) => bloc.add(const SearchEvent.queryChanged('')),
      expect: () => const [SearchState()],
      verify: (_) {
        verifyNever(
          () => mockSearchUnitsUseCase(
            query: any(named: 'query'),
            page: any(named: 'page'),
          ),
        );
      },
    );

    blocTest<SearchBloc, SearchState>(
      'emits [loading, success] with results when usecase succeeds',
      build: () {
        when(() => mockSearchUnitsUseCase(query: 'Villa')).thenAnswer((_) async => const Right(testResponsePage1));
        return searchBloc;
      },
      act: (bloc) => bloc.add(const SearchEvent.queryChanged('Villa')),
      expect: () => const [
        SearchState(status: HomeRequestStatus.loading, query: 'Villa'),
        SearchState(status: HomeRequestStatus.success, results: [testUnit1], query: 'Villa', lastPage: 2),
      ],
      verify: (_) {
        verify(() => mockSearchUnitsUseCase(query: 'Villa')).called(1);
      },
    );

    blocTest<SearchBloc, SearchState>(
      'emits [loading, failure] with errorMessage when usecase fails',
      build: () {
        when(
          () => mockSearchUnitsUseCase(query: 'Villa'),
        ).thenAnswer((_) async => const Left(ServerFailure('Search failed')));
        return searchBloc;
      },
      act: (bloc) => bloc.add(const SearchEvent.queryChanged('Villa')),
      expect: () => const [
        SearchState(status: HomeRequestStatus.loading, query: 'Villa'),
        SearchState(status: HomeRequestStatus.failure, errorMessage: 'Search failed', query: 'Villa'),
      ],
      verify: (_) {
        verify(() => mockSearchUnitsUseCase(query: 'Villa')).called(1);
      },
    );
  });

  group('SearchLoadMoreRequested', () {
    blocTest<SearchBloc, SearchState>(
      'emits [loadMoreStatus: loading, loadMoreStatus: success with appended units] on success',
      build: () {
        when(
          () => mockSearchUnitsUseCase(query: 'Villa', page: 2),
        ).thenAnswer((_) async => const Right(testResponsePage2));
        return searchBloc;
      },
      seed: () =>
          const SearchState(status: HomeRequestStatus.success, results: [testUnit1], query: 'Villa', lastPage: 2),
      act: (bloc) => bloc.add(const SearchEvent.loadMoreRequested()),
      expect: () => const [
        SearchState(
          status: HomeRequestStatus.success,
          loadMoreStatus: HomeRequestStatus.loading,
          results: [testUnit1],
          query: 'Villa',
          lastPage: 2,
        ),
        SearchState(
          status: HomeRequestStatus.success,
          loadMoreStatus: HomeRequestStatus.success,
          results: [testUnit1, testUnit2],
          query: 'Villa',
          currentPage: 2,
          lastPage: 2,
        ),
      ],
      verify: (_) {
        verify(() => mockSearchUnitsUseCase(query: 'Villa', page: 2)).called(1);
      },
    );

    blocTest<SearchBloc, SearchState>(
      'emits [loadMoreStatus: loading, loadMoreStatus: failure] when loadMore fails',
      build: () {
        when(
          () => mockSearchUnitsUseCase(query: 'Villa', page: 2),
        ).thenAnswer((_) async => const Left(ServerFailure('Connection error')));
        return searchBloc;
      },
      seed: () =>
          const SearchState(status: HomeRequestStatus.success, results: [testUnit1], query: 'Villa', lastPage: 2),
      act: (bloc) => bloc.add(const SearchEvent.loadMoreRequested()),
      expect: () => const [
        SearchState(
          status: HomeRequestStatus.success,
          loadMoreStatus: HomeRequestStatus.loading,
          results: [testUnit1],
          query: 'Villa',
          lastPage: 2,
        ),
        SearchState(
          status: HomeRequestStatus.success,
          loadMoreStatus: HomeRequestStatus.failure,
          errorMessage: 'Connection error',
          results: [testUnit1],
          query: 'Villa',
          lastPage: 2,
        ),
      ],
      verify: (_) {
        verify(() => mockSearchUnitsUseCase(query: 'Villa', page: 2)).called(1);
      },
    );

    blocTest<SearchBloc, SearchState>(
      'does nothing when hasMore is false',
      build: () => searchBloc,
      seed: () => const SearchState(
        status: HomeRequestStatus.success,
        results: [testUnit1],
        query: 'Villa',
        currentPage: 2,
        lastPage: 2,
      ),
      act: (bloc) => bloc.add(const SearchEvent.loadMoreRequested()),
      expect: () => <SearchState>[],
      verify: (_) {
        verifyNever(
          () => mockSearchUnitsUseCase(
            query: any(named: 'query'),
            page: any(named: 'page'),
          ),
        );
      },
    );

    blocTest<SearchBloc, SearchState>(
      'does nothing when loadMoreStatus is already loading',
      build: () => searchBloc,
      seed: () => const SearchState(
        status: HomeRequestStatus.success,
        loadMoreStatus: HomeRequestStatus.loading,
        results: [testUnit1],
        query: 'Villa',
        lastPage: 2,
      ),
      act: (bloc) => bloc.add(const SearchEvent.loadMoreRequested()),
      expect: () => <SearchState>[],
      verify: (_) {
        verifyNever(
          () => mockSearchUnitsUseCase(
            query: any(named: 'query'),
            page: any(named: 'page'),
          ),
        );
      },
    );
  });

  group('SearchViewTypeToggled & SearchCleared', () {
    blocTest<SearchBloc, SearchState>(
      'toggles viewType from grid to list and back',
      build: () => searchBloc,
      act: (bloc) => bloc
        ..add(const SearchEvent.viewTypeToggled())
        ..add(const SearchEvent.viewTypeToggled()),
      expect: () => const [SearchState(viewType: ViewType.list), SearchState()],
    );

    blocTest<SearchBloc, SearchState>(
      'clears search state back to initial on SearchCleared',
      build: () => searchBloc,
      seed: () => const SearchState(status: HomeRequestStatus.success, results: [testUnit1], query: 'Villa'),
      act: (bloc) => bloc.add(const SearchEvent.searchCleared()),
      expect: () => const [SearchState()],
    );
  });
}
