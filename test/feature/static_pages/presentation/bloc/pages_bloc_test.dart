import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:propix8/core/error/failures.dart';
import 'package:propix8/feature/static_pages/domain/entities/page_entity.dart';
import 'package:propix8/feature/static_pages/domain/entities/stat_entity.dart';
import 'package:propix8/feature/static_pages/domain/usecases/get_pages_usecase.dart';
import 'package:propix8/feature/static_pages/domain/usecases/get_stats_usecase.dart';
import 'package:propix8/feature/static_pages/presentation/bloc/pages_bloc.dart';
import 'package:propix8/feature/static_pages/presentation/bloc/pages_event.dart';
import 'package:propix8/feature/static_pages/presentation/bloc/pages_state.dart';

class MockGetPagesUseCase extends Mock implements GetPagesUseCase {}

class MockGetStatsUseCase extends Mock implements GetStatsUseCase {}

void main() {
  late MockGetPagesUseCase mockGetPagesUseCase;
  late MockGetStatsUseCase mockGetStatsUseCase;
  late PagesBloc bloc;

  setUp(() {
    mockGetPagesUseCase = MockGetPagesUseCase();
    mockGetStatsUseCase = MockGetStatsUseCase();
    bloc = PagesBloc(
      getPagesUseCase: mockGetPagesUseCase,
      getStatsUseCase: mockGetStatsUseCase,
    );
  });

  tearDown(() async {
    await bloc.close();
  });

  test('initial state should be PagesState() with initial status', () {
    expect(bloc.state.status, equals(PagesStatus.initial));
    expect(bloc.state.pages, isEmpty);
    expect(bloc.state.stats, isEmpty);
    expect(bloc.state.errorMessage, isNull);
  });

  group('PagesRequested event', () {
    const tPages = [
      PageEntity(
        id: 1,
        slug: 'about-us',
        image: 'img.png',
        title: 'About Us',
        content: 'Content',
        teamMembers: [],
        sections: [],
      ),
    ];
    const tFailure = ServerFailure('Failed to fetch pages');

    blocTest<PagesBloc, PagesState>(
      'emits [loading, success] when getPages succeeds',
      build: () {
        when(
          () => mockGetPagesUseCase(),
        ).thenAnswer((_) async => const Right(tPages));
        return bloc;
      },
      act: (bloc) => bloc.add(const PagesRequested()),
      expect: () => [
        const PagesState(status: PagesStatus.loading),
        const PagesState(status: PagesStatus.success, pages: tPages),
      ],
      verify: (_) {
        verify(() => mockGetPagesUseCase()).called(1);
      },
    );

    blocTest<PagesBloc, PagesState>(
      'emits [loading, failure] when getPages fails',
      build: () {
        when(
          () => mockGetPagesUseCase(),
        ).thenAnswer((_) async => const Left(tFailure));
        return bloc;
      },
      act: (bloc) => bloc.add(const PagesRequested()),
      expect: () => [
        const PagesState(status: PagesStatus.loading),
        const PagesState(
          status: PagesStatus.failure,
          errorMessage: 'Failed to fetch pages',
        ),
      ],
    );
  });

  group('StatsRequested event', () {
    const tStats = [
      StatEntity(label: 'Users', value: '10k', icon: 'user_icon'),
    ];
    const tFailure = ServerFailure('Failed to fetch stats');

    blocTest<PagesBloc, PagesState>(
      'emits [loading, success] when getStats succeeds',
      build: () {
        when(
          () => mockGetStatsUseCase(),
        ).thenAnswer((_) async => const Right(tStats));
        return bloc;
      },
      act: (bloc) => bloc.add(const StatsRequested()),
      expect: () => [
        const PagesState(status: PagesStatus.loading),
        const PagesState(status: PagesStatus.success, stats: tStats),
      ],
      verify: (_) {
        verify(() => mockGetStatsUseCase()).called(1);
      },
    );

    blocTest<PagesBloc, PagesState>(
      'emits [loading, failure] when getStats fails',
      build: () {
        when(
          () => mockGetStatsUseCase(),
        ).thenAnswer((_) async => const Left(tFailure));
        return bloc;
      },
      act: (bloc) => bloc.add(const StatsRequested()),
      expect: () => [
        const PagesState(status: PagesStatus.loading),
        const PagesState(
          status: PagesStatus.failure,
          errorMessage: 'Failed to fetch stats',
        ),
      ],
    );
  });

  group('PagesAllDataRequested event', () {
    const tPages = [
      PageEntity(
        id: 1,
        slug: 'about-us',
        image: 'img.png',
        title: 'About Us',
        content: 'Content',
        teamMembers: [],
        sections: [],
      ),
    ];
    const tStats = [
      StatEntity(label: 'Users', value: '10k', icon: 'user_icon'),
    ];
    const tFailure = ServerFailure('Error loading data');

    blocTest<PagesBloc, PagesState>(
      'emits [loading, success] when both succeed',
      build: () {
        when(
          () => mockGetPagesUseCase(),
        ).thenAnswer((_) async => const Right(tPages));
        when(
          () => mockGetStatsUseCase(),
        ).thenAnswer((_) async => const Right(tStats));
        return bloc;
      },
      act: (bloc) => bloc.add(const PagesAllDataRequested()),
      expect: () => [
        const PagesState(status: PagesStatus.loading),
        const PagesState(
          status: PagesStatus.success,
          pages: tPages,
          stats: tStats,
        ),
      ],
    );

    blocTest<PagesBloc, PagesState>(
      'emits [loading, failure] when getPages fails',
      build: () {
        when(
          () => mockGetPagesUseCase(),
        ).thenAnswer((_) async => const Left(tFailure));
        when(
          () => mockGetStatsUseCase(),
        ).thenAnswer((_) async => const Right(tStats));
        return bloc;
      },
      act: (bloc) => bloc.add(const PagesAllDataRequested()),
      expect: () => [
        const PagesState(status: PagesStatus.loading),
        const PagesState(
          status: PagesStatus.failure,
          errorMessage: 'Error loading data',
        ),
      ],
    );

    blocTest<PagesBloc, PagesState>(
      'emits [loading, failure] when getStats fails',
      build: () {
        when(
          () => mockGetPagesUseCase(),
        ).thenAnswer((_) async => const Right(tPages));
        when(
          () => mockGetStatsUseCase(),
        ).thenAnswer((_) async => const Left(tFailure));
        return bloc;
      },
      act: (bloc) => bloc.add(const PagesAllDataRequested()),
      expect: () => [
        const PagesState(status: PagesStatus.loading),
        const PagesState(
          status: PagesStatus.failure,
          errorMessage: 'Error loading data',
        ),
      ],
    );
  });
}
