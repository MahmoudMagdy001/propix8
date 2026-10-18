import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:propix8/core/error/failures.dart';
import 'package:propix8/feature/auth/data/models/city_model.dart';
import 'package:propix8/feature/auth/domain/repositories/address_setup_repository.dart';
import 'package:propix8/feature/home/presentation/filter/bloc/filter_bloc.dart';
import 'package:propix8/feature/home/presentation/filter/bloc/filter_event.dart';
import 'package:propix8/feature/home/presentation/filter/bloc/filter_state.dart';

class MockAddressSetupRepository extends Mock
    implements AddressSetupRepository {}

void main() {
  late MockAddressSetupRepository mockAddressSetupRepository;
  late FilterBloc filterBloc;

  const testCity = City(id: 1, name: 'Cairo');

  setUp(() {
    mockAddressSetupRepository = MockAddressSetupRepository();
    filterBloc = FilterBloc(mockAddressSetupRepository);
  });

  tearDown(() async {
    await filterBloc.close();
  });

  test('initial state should be FilterState with default values', () {
    expect(filterBloc.state, equals(const FilterState()));
  });

  group('FilterCitiesRequested', () {
    blocTest<FilterBloc, FilterState>(
      'emits [citiesLoading, citiesLoaded] with cities when getCities succeeds',
      build: () {
        when(
          () => mockAddressSetupRepository.getCities(),
        ).thenAnswer((_) async => const Right([testCity]));
        return filterBloc;
      },
      act: (bloc) => bloc.add(const FilterEvent.citiesRequested()),
      expect: () => [
        const FilterState(status: FilterStatus.citiesLoading),
        const FilterState(
          status: FilterStatus.citiesLoaded,
          cities: [testCity],
        ),
      ],
    );

    blocTest<FilterBloc, FilterState>(
      'emits [citiesLoading, failure] when getCities fails',
      build: () {
        when(
          () => mockAddressSetupRepository.getCities(),
        ).thenAnswer((_) async => const Left(ServerFailure('Failed to load cities')));
        return filterBloc;
      },
      act: (bloc) => bloc.add(const FilterEvent.citiesRequested()),
      expect: () => [
        const FilterState(status: FilterStatus.citiesLoading),
        const FilterState(
          status: FilterStatus.failure,
          errorMessage: 'Failed to load cities',
        ),
      ],
    );
  });

  group('Filter field updates', () {
    blocTest<FilterBloc, FilterState>(
      'updates selectedCityId on FilterCitySelected',
      build: () => filterBloc,
      act: (bloc) => bloc.add(const FilterEvent.citySelected(1)),
      expect: () => [
        const FilterState(selectedCityId: 1),
      ],
    );

    blocTest<FilterBloc, FilterState>(
      'updates price range on FilterPriceRangeUpdated',
      build: () => filterBloc,
      act: (bloc) => bloc.add(
        const FilterEvent.priceRangeUpdated(100000, 5000000),
      ),
      expect: () => [
        const FilterState(minPrice: 100000, maxPrice: 5000000),
      ],
    );

    blocTest<FilterBloc, FilterState>(
      'updates bedrooms on FilterBedroomsUpdated',
      build: () => filterBloc,
      act: (bloc) => bloc.add(const FilterEvent.bedroomsUpdated(3)),
      expect: () => [
        const FilterState(bedrooms: 3),
      ],
    );

    blocTest<FilterBloc, FilterState>(
      'updates bathrooms on FilterBathroomsUpdated',
      build: () => filterBloc,
      act: (bloc) => bloc.add(const FilterEvent.bathroomsUpdated(2)),
      expect: () => [
        const FilterState(bathrooms: 2),
      ],
    );

    blocTest<FilterBloc, FilterState>(
      'updates rooms on FilterRoomsUpdated',
      build: () => filterBloc,
      act: (bloc) => bloc.add(const FilterEvent.roomsUpdated(5)),
      expect: () => [
        const FilterState(rooms: 5),
      ],
    );

    blocTest<FilterBloc, FilterState>(
      'updates area range on FilterAreaRangeUpdated',
      build: () => filterBloc,
      act: (bloc) => bloc.add(
        const FilterEvent.areaRangeUpdated(80, 350),
      ),
      expect: () => [
        const FilterState(minArea: 80, maxArea: 350),
      ],
    );

    blocTest<FilterBloc, FilterState>(
      'resets filter state and requests cities on FilterReset',
      build: () {
        when(
          () => mockAddressSetupRepository.getCities(),
        ).thenAnswer((_) async => const Right([testCity]));
        return filterBloc;
      },
      seed: () => const FilterState(selectedCityId: 1, bedrooms: 4),
      act: (bloc) => bloc.add(const FilterEvent.reset()),
      expect: () => [
        const FilterState(),
        const FilterState(status: FilterStatus.citiesLoading),
        const FilterState(
          status: FilterStatus.citiesLoaded,
          cities: [testCity],
        ),
      ],
    );
  });
}
