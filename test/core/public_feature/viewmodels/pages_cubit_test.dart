import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:propix8/core/models/page_model.dart';
import 'package:propix8/core/models/stat_model.dart';
import 'package:propix8/core/public_feature/repositories/pages_repository.dart';
import 'package:propix8/core/public_feature/viewmodels/pages_cubit.dart';

class MockPagesRepository extends Mock implements PagesRepository {}

void main() {
  late MockPagesRepository mockRepository;
  late PagesCubit cubit;

  setUp(() {
    mockRepository = MockPagesRepository();
    cubit = PagesCubit(mockRepository);
  });

  tearDown(() async {
    await cubit.close();
  });

  test('initial state should be PagesState.initial()', () {
    expect(cubit.state.status, equals(PagesStatus.initial));
    expect(cubit.state.pages, isEmpty);
    expect(cubit.state.stats, isEmpty);
    expect(cubit.state.errorMessage, isNull);
  });

  group('loadPages', () {
    const tPages = [
      PageModel(
        id: 1,
        slug: 'about-us',
        image: 'img.png',
        title: 'About Us',
        content: 'Content',
        teamMembers: [],
        sections: [],
      ),
    ];
    const tError = 'Failed to fetch pages';

    blocTest<PagesCubit, PagesState>(
      'emits [loading, success] when getPages succeeds',
      build: () {
        when(() => mockRepository.getPages())
            .thenAnswer((_) async => const Right(tPages));
        return cubit;
      },
      act: (cubit) => cubit.loadPages(),
      expect: () => [
        const PagesState(status: PagesStatus.loading),
        const PagesState(status: PagesStatus.success, pages: tPages),
      ],
      verify: (_) {
        verify(() => mockRepository.getPages()).called(1);
      },
    );

    blocTest<PagesCubit, PagesState>(
      'emits [loading, failure] when getPages fails',
      build: () {
        when(() => mockRepository.getPages())
            .thenAnswer((_) async => const Left(tError));
        return cubit;
      },
      act: (cubit) => cubit.loadPages(),
      expect: () => [
        const PagesState(status: PagesStatus.loading),
        const PagesState(status: PagesStatus.failure, errorMessage: tError),
      ],
    );
  });

  group('loadStats', () {
    const tStats = [
      StatModel(label: 'Users', value: '10k', icon: 'user_icon'),
    ];
    const tError = 'Failed to fetch stats';

    blocTest<PagesCubit, PagesState>(
      'emits [loading, success] when getStats succeeds',
      build: () {
        when(() => mockRepository.getStats())
            .thenAnswer((_) async => const Right(tStats));
        return cubit;
      },
      act: (cubit) => cubit.loadStats(),
      expect: () => [
        const PagesState(status: PagesStatus.loading),
        const PagesState(status: PagesStatus.success, stats: tStats),
      ],
      verify: (_) {
        verify(() => mockRepository.getStats()).called(1);
      },
    );

    blocTest<PagesCubit, PagesState>(
      'emits [loading, failure] when getStats fails',
      build: () {
        when(() => mockRepository.getStats())
            .thenAnswer((_) async => const Left(tError));
        return cubit;
      },
      act: (cubit) => cubit.loadStats(),
      expect: () => [
        const PagesState(status: PagesStatus.loading),
        const PagesState(status: PagesStatus.failure, errorMessage: tError),
      ],
    );
  });

  group('loadAll', () {
    const tPages = [
      PageModel(
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
      StatModel(label: 'Users', value: '10k', icon: 'user_icon'),
    ];
    const tError = 'Error loading data';

    blocTest<PagesCubit, PagesState>(
      'emits [loading, success] when both succeed',
      build: () {
        when(() => mockRepository.getPages())
            .thenAnswer((_) async => const Right(tPages));
        when(() => mockRepository.getStats())
            .thenAnswer((_) async => const Right(tStats));
        return cubit;
      },
      act: (cubit) => cubit.loadAll(),
      expect: () => [
        const PagesState(status: PagesStatus.loading),
        const PagesState(
          status: PagesStatus.success,
          pages: tPages,
          stats: tStats,
        ),
      ],
    );

    blocTest<PagesCubit, PagesState>(
      'emits [loading, failure] when getPages fails',
      build: () {
        when(() => mockRepository.getPages())
            .thenAnswer((_) async => const Left(tError));
        when(() => mockRepository.getStats())
            .thenAnswer((_) async => const Right(tStats));
        return cubit;
      },
      act: (cubit) => cubit.loadAll(),
      expect: () => [
        const PagesState(status: PagesStatus.loading),
        const PagesState(status: PagesStatus.failure, errorMessage: tError),
      ],
    );

    blocTest<PagesCubit, PagesState>(
      'emits [loading, failure] when getStats fails',
      build: () {
        when(() => mockRepository.getPages())
            .thenAnswer((_) async => const Right(tPages));
        when(() => mockRepository.getStats())
            .thenAnswer((_) async => const Left(tError));
        return cubit;
      },
      act: (cubit) => cubit.loadAll(),
      expect: () => [
        const PagesState(status: PagesStatus.loading),
        const PagesState(status: PagesStatus.failure, errorMessage: tError),
      ],
    );
  });
}
