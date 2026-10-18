import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:propix8/core/error/failures.dart';
import 'package:propix8/core/functional/result.dart';
import 'package:propix8/core/models/pagination_model.dart';
import 'package:propix8/core/utils/enums.dart';
import 'package:propix8/feature/developer_details/domain/entities/developer_collection_entity.dart';
import 'package:propix8/feature/developer_details/domain/usecases/get_developer_units_usecase.dart';
import 'package:propix8/feature/developer_details/presentation/bloc/developer_units_bloc.dart';
import 'package:propix8/feature/developer_details/presentation/bloc/developer_units_event.dart';
import 'package:propix8/feature/developer_details/presentation/bloc/developer_units_state.dart';
import 'package:propix8/feature/home/domain/entities/unit_entity.dart';
import 'package:propix8/feature/home/presentation/bloc/home_state.dart';

class MockGetDeveloperUnitsUseCase extends Mock
    implements GetDeveloperUnitsUseCase {}

void main() {
  late MockGetDeveloperUnitsUseCase mockGetDeveloperUnitsUseCase;
  late DeveloperUnitsBloc developerUnitsBloc;

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

  const testDeveloper = DeveloperCollectionEntity(
    id: 5,
    name: 'Emaar Misr',
    description: 'Premier developer',
    logo: 'logo.png',
    email: 'info@emaar.com',
    phone: '19000',
    address: 'New Cairo',
    units: [testUnit1],
    pagination: PaginationModel(
      lastPage: 2,
      total: 20,
    ),
  );

  setUp(() {
    mockGetDeveloperUnitsUseCase = MockGetDeveloperUnitsUseCase();
    developerUnitsBloc = DeveloperUnitsBloc(
      getDeveloperUnitsUseCase: mockGetDeveloperUnitsUseCase,
    );
  });

  tearDown(() async {
    await developerUnitsBloc.close();
  });

  test('initial state should be DeveloperUnitsState with default values', () {
    expect(developerUnitsBloc.state, const DeveloperUnitsState());
    expect(developerUnitsBloc.state.status, HomeRequestStatus.initial);
    expect(developerUnitsBloc.state.developer, isNull);
    expect(developerUnitsBloc.state.viewType, ViewType.grid);
    expect(developerUnitsBloc.state.isLoadingMore, isFalse);
  });

  group('DeveloperUnitsRequested', () {
    blocTest<DeveloperUnitsBloc, DeveloperUnitsState>(
      'emits [loading, success] with developer when usecase succeeds',
      build: () {
        when(() => mockGetDeveloperUnitsUseCase(5, page: 1))
            .thenAnswer((_) async => const Right(testDeveloper));
        return developerUnitsBloc;
      },
      act: (bloc) =>
          bloc.add(const DeveloperUnitsEvent.developerUnitsRequested(5)),
      expect: () => const [
        DeveloperUnitsState(status: HomeRequestStatus.loading),
        DeveloperUnitsState(
          status: HomeRequestStatus.success,
          developer: testDeveloper,
        ),
      ],
      verify: (_) {
        verify(() => mockGetDeveloperUnitsUseCase(5, page: 1)).called(1);
      },
    );

    blocTest<DeveloperUnitsBloc, DeveloperUnitsState>(
      'emits [loading, failure] with errorMessage when usecase fails',
      build: () {
        when(() => mockGetDeveloperUnitsUseCase(5, page: 1)).thenAnswer(
            (_) async => const Left(ServerFailure('Server error')));
        return developerUnitsBloc;
      },
      act: (bloc) =>
          bloc.add(const DeveloperUnitsEvent.developerUnitsRequested(5)),
      expect: () => const [
        DeveloperUnitsState(status: HomeRequestStatus.loading),
        DeveloperUnitsState(
          status: HomeRequestStatus.failure,
          errorMessage: 'Server error',
        ),
      ],
      verify: (_) {
        verify(() => mockGetDeveloperUnitsUseCase(5, page: 1)).called(1);
      },
    );
  });

  group('DeveloperUnitsMoreRequested', () {
    const page2Developer = DeveloperCollectionEntity(
      id: 5,
      name: 'Emaar Misr',
      description: 'Premier developer',
      logo: 'logo.png',
      email: 'info@emaar.com',
      phone: '19000',
      address: 'New Cairo',
      units: [testUnit2],
      pagination: PaginationModel(
        currentPage: 2,
        lastPage: 2,
        total: 20,
      ),
    );

    blocTest<DeveloperUnitsBloc, DeveloperUnitsState>(
      'emits [isLoadingMore: true, developer with appended units] when loading more succeeds',
      build: () {
        when(() => mockGetDeveloperUnitsUseCase(5, page: 2))
            .thenAnswer((_) async => const Right(page2Developer));
        return developerUnitsBloc;
      },
      seed: () => const DeveloperUnitsState(
        status: HomeRequestStatus.success,
        developer: testDeveloper,
      ),
      act: (bloc) =>
          bloc.add(const DeveloperUnitsEvent.developerUnitsMoreRequested(5)),
      expect: () => [
        const DeveloperUnitsState(
          status: HomeRequestStatus.success,
          developer: testDeveloper,
          isLoadingMore: true,
        ),
        const DeveloperUnitsState(
          status: HomeRequestStatus.success,
          developer: DeveloperCollectionEntity(
            id: 5,
            name: 'Emaar Misr',
            description: 'Premier developer',
            logo: 'logo.png',
            email: 'info@emaar.com',
            phone: '19000',
            address: 'New Cairo',
            units: [testUnit1, testUnit2],
            pagination: PaginationModel(
              currentPage: 2,
              lastPage: 2,
              total: 20,
            ),
          ),
        ),
      ],
      verify: (_) {
        verify(() => mockGetDeveloperUnitsUseCase(5, page: 2)).called(1);
      },
    );

    blocTest<DeveloperUnitsBloc, DeveloperUnitsState>(
      'emits [isLoadingMore: true, isLoadingMore: false] when loading more fails',
      build: () {
        when(() => mockGetDeveloperUnitsUseCase(5, page: 2)).thenAnswer(
            (_) async => const Left(ServerFailure('Connection error')));
        return developerUnitsBloc;
      },
      seed: () => const DeveloperUnitsState(
        status: HomeRequestStatus.success,
        developer: testDeveloper,
      ),
      act: (bloc) =>
          bloc.add(const DeveloperUnitsEvent.developerUnitsMoreRequested(5)),
      expect: () => const [
        DeveloperUnitsState(
          status: HomeRequestStatus.success,
          developer: testDeveloper,
          isLoadingMore: true,
        ),
        DeveloperUnitsState(
          status: HomeRequestStatus.success,
          developer: testDeveloper,
        ),
      ],
      verify: (_) {
        verify(() => mockGetDeveloperUnitsUseCase(5, page: 2)).called(1);
      },
    );

    blocTest<DeveloperUnitsBloc, DeveloperUnitsState>(
      'does nothing when hasMorePages is false',
      build: () => developerUnitsBloc,
      seed: () => const DeveloperUnitsState(
        status: HomeRequestStatus.success,
        developer: page2Developer,
      ),
      act: (bloc) =>
          bloc.add(const DeveloperUnitsEvent.developerUnitsMoreRequested(5)),
      expect: () => <DeveloperUnitsState>[],
      verify: (_) {
        verifyNever(() => mockGetDeveloperUnitsUseCase(5, page: any(named: 'page')));
      },
    );

    blocTest<DeveloperUnitsBloc, DeveloperUnitsState>(
      'does nothing when already isLoadingMore',
      build: () => developerUnitsBloc,
      seed: () => const DeveloperUnitsState(
        status: HomeRequestStatus.success,
        developer: testDeveloper,
        isLoadingMore: true,
      ),
      act: (bloc) =>
          bloc.add(const DeveloperUnitsEvent.developerUnitsMoreRequested(5)),
      expect: () => <DeveloperUnitsState>[],
      verify: (_) {
        verifyNever(() => mockGetDeveloperUnitsUseCase(5, page: any(named: 'page')));
      },
    );
  });

  group('DeveloperUnitsViewTypeToggled', () {
    blocTest<DeveloperUnitsBloc, DeveloperUnitsState>(
      'toggles viewType from grid to list and back',
      build: () => developerUnitsBloc,
      act: (bloc) => bloc
        ..add(const DeveloperUnitsEvent.developerUnitsViewTypeToggled())
        ..add(const DeveloperUnitsEvent.developerUnitsViewTypeToggled()),
      expect: () => const [
        DeveloperUnitsState(viewType: ViewType.list),
        DeveloperUnitsState(),
      ],
    );
  });
}
