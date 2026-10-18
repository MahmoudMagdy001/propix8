import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:propix8/core/error/failures.dart';
import 'package:propix8/feature/comparison/domain/usecases/compare_units_usecase.dart';
import 'package:propix8/feature/comparison/presentation/bloc/comparison_bloc.dart';
import 'package:propix8/feature/comparison/presentation/bloc/comparison_event.dart';
import 'package:propix8/feature/comparison/presentation/bloc/comparison_state.dart';
import 'package:propix8/feature/unit_details/domain/entities/unit_details_entity.dart';

class MockCompareUnitsUseCase extends Mock implements CompareUnitsUseCase {}

void main() {
  late MockCompareUnitsUseCase mockCompareUnitsUseCase;
  late ComparisonBloc comparisonBloc;

  final tBaseUnit = UnitDetailsEntity(
    id: 1,
    title: 'Base Unit',
    description: 'Description 1',
    address: 'Cairo',
    price: 1000000,
    pricePerM2: 10000,
    offerType: 'sale',
    area: 100,
    rooms: 3,
    bathrooms: 2,
    garages: 1,
    buildYear: '2023',
    latitude: '30.0',
    longitude: '31.0',
    status: 'available',
    isFavourite: false,
    isVisible: true,
    developmentStatus: 'completed',
    owner: const UnitOwnerEntity(
      id: 1,
      name: 'Owner',
      email: 'owner@test.com',
      phone: '12345',
      address: 'Cairo',
      avatar: '',
      status: 'active',
      role: 'agent',
    ),
    media: const [],
    city: const UnitCityEntity(id: 1, name: 'Cairo'),
    unitType: const UnitTypeEntity(id: 1, name: 'Apartment', icon: ''),
    amenities: const [],
    averageRating: 4.5,
    reviewsCount: 5,
    createdAt: DateTime(2025),
  );

  final tSelectedUnit = UnitDetailsEntity(
    id: 2,
    title: 'Selected Unit',
    description: 'Description 2',
    address: 'Giza',
    price: 2000000,
    pricePerM2: 20000,
    offerType: 'sale',
    area: 120,
    rooms: 4,
    bathrooms: 3,
    garages: 2,
    buildYear: '2024',
    latitude: '30.0',
    longitude: '31.0',
    status: 'available',
    isFavourite: false,
    isVisible: true,
    developmentStatus: 'completed',
    owner: const UnitOwnerEntity(
      id: 2,
      name: 'Owner 2',
      email: 'owner2@test.com',
      phone: '67890',
      address: 'Giza',
      avatar: '',
      status: 'active',
      role: 'agent',
    ),
    media: const [],
    city: const UnitCityEntity(id: 2, name: 'Giza'),
    unitType: const UnitTypeEntity(id: 1, name: 'Apartment', icon: ''),
    amenities: const [],
    averageRating: 4.8,
    reviewsCount: 10,
    createdAt: DateTime(2025),
  );

  setUp(() {
    mockCompareUnitsUseCase = MockCompareUnitsUseCase();
    comparisonBloc = ComparisonBloc(
      compareUnitsUseCase: mockCompareUnitsUseCase,
    );
  });

  tearDown(() async {
    await comparisonBloc.close();
  });

  test('initial state should have initial status and empty items', () {
    expect(comparisonBloc.state, const ComparisonState());
    expect(comparisonBloc.state.status, ComparisonStatus.initial);
    expect(comparisonBloc.state.comparisonItems, isEmpty);
  });

  group('ComparisonRequested', () {
    blocTest<ComparisonBloc, ComparisonState>(
      'emits [loading, success] with comparison items when usecase succeeds',
      build: () {
        when(
          () => mockCompareUnitsUseCase(baseUnitId: 1, selectedUnitId: 2),
        ).thenAnswer((_) async => Right((tBaseUnit, tSelectedUnit)));
        return comparisonBloc;
      },
      act: (bloc) => bloc.add(
        ComparisonEvent.comparisonRequested(
          baseUnitId: 1,
          selectedUnitId: 2,
          getLocalizedLabel: (key) => key,
          getLocalizedValue: (key, val) => val,
          meterSquared: 'm²',
          currencySymbol: 'EGP',
        ),
      ),
      expect: () => [
        const ComparisonState(status: ComparisonStatus.loading),
        isA<ComparisonState>()
            .having((s) => s.status, 'status', ComparisonStatus.success)
            .having((s) => s.baseUnit, 'baseUnit', tBaseUnit)
            .having((s) => s.selectedUnit, 'selectedUnit', tSelectedUnit)
            .having(
              (s) => s.comparisonItems.isNotEmpty,
              'has comparisonItems',
              isTrue,
            ),
      ],
      verify: (_) {
        verify(
          () => mockCompareUnitsUseCase(baseUnitId: 1, selectedUnitId: 2),
        ).called(1);
      },
    );

    blocTest<ComparisonBloc, ComparisonState>(
      'emits [loading, failure] when usecase fails',
      build: () {
        when(
          () => mockCompareUnitsUseCase(baseUnitId: 1, selectedUnitId: 2),
        ).thenAnswer((_) async => const Left(ServerFailure('Failed to load')));
        return comparisonBloc;
      },
      act: (bloc) => bloc.add(
        ComparisonEvent.comparisonRequested(
          baseUnitId: 1,
          selectedUnitId: 2,
          getLocalizedLabel: (key) => key,
          getLocalizedValue: (key, val) => val,
          meterSquared: 'm²',
          currencySymbol: 'EGP',
        ),
      ),
      expect: () => [
        const ComparisonState(status: ComparisonStatus.loading),
        const ComparisonState(
          status: ComparisonStatus.failure,
          errorMessage: 'Failed to load',
        ),
      ],
    );
  });
}
