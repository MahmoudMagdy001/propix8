import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:propix8/core/error/failures.dart';
import 'package:propix8/core/models/pagination_model.dart';
import 'package:propix8/core/services/booking_event_service.dart';
import 'package:propix8/feature/auth/data/models/auth_model.dart';
import 'package:propix8/feature/auth/data/models/city_model.dart';
import 'package:propix8/feature/bookings/domain/entities/booking_entity.dart';
import 'package:propix8/feature/bookings/domain/repositories/booking_repository.dart';
import 'package:propix8/feature/maintenance_bookings/domain/entities/maintenance_booking_entity.dart';
import 'package:propix8/feature/maintenance_bookings/domain/repositories/maintenance_booking_repository.dart';
import 'package:propix8/feature/profile/domain/usecases/delete_user_profile_usecase.dart';
import 'package:propix8/feature/profile/domain/usecases/get_profile_cities_usecase.dart';
import 'package:propix8/feature/profile/domain/usecases/get_user_profile_usecase.dart';
import 'package:propix8/feature/profile/domain/usecases/update_user_profile_usecase.dart';
import 'package:propix8/feature/profile/presentation/bloc/user_profile_bloc.dart';
import 'package:propix8/feature/profile/presentation/bloc/user_profile_event.dart';
import 'package:propix8/feature/profile/presentation/bloc/user_profile_state.dart';

class MockGetUserProfileUseCase extends Mock implements GetUserProfileUseCase {}

class MockUpdateUserProfileUseCase extends Mock
    implements UpdateUserProfileUseCase {}

class MockGetProfileCitiesUseCase extends Mock
    implements GetProfileCitiesUseCase {}

class MockDeleteUserProfileUseCase extends Mock
    implements DeleteUserProfileUseCase {}

class MockBookingRepository extends Mock implements BookingRepository {}

class MockMaintenanceBookingRepository extends Mock
    implements MaintenanceBookingRepository {}

void main() {
  late MockGetUserProfileUseCase mockGetUserProfileUseCase;
  late MockUpdateUserProfileUseCase mockUpdateUserProfileUseCase;
  late MockGetProfileCitiesUseCase mockGetProfileCitiesUseCase;
  late MockDeleteUserProfileUseCase mockDeleteUserProfileUseCase;
  late MockBookingRepository mockBookingRepository;
  late MockMaintenanceBookingRepository mockMaintenanceBookingRepository;
  late BookingEventService bookingEventService;

  const testUser = User(
    id: 1,
    name: 'Test User',
    email: 'test@example.com',
    phone: '01012345678',
    address: 'Cairo, Egypt',
    cityId: 1,
  );

  const testCities = [
    City(id: 1, name: 'Cairo'),
    City(id: 2, name: 'Giza'),
  ];

  setUp(() {
    mockGetUserProfileUseCase = MockGetUserProfileUseCase();
    mockUpdateUserProfileUseCase = MockUpdateUserProfileUseCase();
    mockGetProfileCitiesUseCase = MockGetProfileCitiesUseCase();
    mockDeleteUserProfileUseCase = MockDeleteUserProfileUseCase();
    mockBookingRepository = MockBookingRepository();
    mockMaintenanceBookingRepository = MockMaintenanceBookingRepository();
    bookingEventService = BookingEventService();

    when(() => mockBookingRepository.getBookings()).thenAnswer(
      (_) async => const BookingResponse(
        status: true,
        message: 'Success',
        data: [],
        pagination: PaginationModel(
          total: 2,
        ),
      ),
    );

    when(() => mockMaintenanceBookingRepository.getMaintenanceBookings())
        .thenAnswer(
      (_) async => const Right(
        MaintenanceBookingsDataEntity(
          bookings: [],
          pagination: PaginationModel(
            total: 3,
          ),
        ),
      ),
    );
  });

  UserProfileBloc buildBloc({void Function(User)? onUserUpdated}) =>
      UserProfileBloc(
        getUserProfileUseCase: mockGetUserProfileUseCase,
        updateUserProfileUseCase: mockUpdateUserProfileUseCase,
        getProfileCitiesUseCase: mockGetProfileCitiesUseCase,
        deleteUserProfileUseCase: mockDeleteUserProfileUseCase,
        bookingRepository: mockBookingRepository,
        maintenanceBookingRepository: mockMaintenanceBookingRepository,
        bookingEventService: bookingEventService,
        onUserUpdated: onUserUpdated,
      );

  group('UserProfileBloc', () {
    test('initial state has default values', () async {
      final bloc = buildBloc();
      expect(bloc.state.status, UserProfileStatus.initial);
      expect(bloc.state.user, isNull);
      expect(bloc.state.cities, isEmpty);
      expect(bloc.state.propertyBookingCount, 0);
      expect(bloc.state.serviceBookingCount, 0);
      await bloc.close();
    });

    blocTest<UserProfileBloc, UserProfileState>(
      'emits [loading, success] and refreshes booking counts when profile load succeeds',
      build: () {
        when(() => mockGetUserProfileUseCase(forceRefresh: any(named: 'forceRefresh')))
            .thenAnswer((_) async => const Right(testUser));
        return buildBloc();
      },
      act: (bloc) => bloc.add(const UserProfileEvent.profileLoaded()),
      expect: () => [
        const UserProfileState(status: UserProfileStatus.loading),
        const UserProfileState(
          status: UserProfileStatus.success,
          user: testUser,
        ),
        const UserProfileState(
          status: UserProfileStatus.success,
          user: testUser,
          propertyBookingCount: 2,
          serviceBookingCount: 3,
        ),
      ],
    );

    blocTest<UserProfileBloc, UserProfileState>(
      'emits [loading, failure] when profile load fails',
      build: () {
        when(() => mockGetUserProfileUseCase(forceRefresh: any(named: 'forceRefresh')))
            .thenAnswer((_) async => const Left(ServerFailure('Failed to load profile')));
        return buildBloc();
      },
      act: (bloc) => bloc.add(const UserProfileEvent.profileLoaded()),
      expect: () => [
        const UserProfileState(status: UserProfileStatus.loading),
        const UserProfileState(
          status: UserProfileStatus.failure,
          errorMessage: 'Failed to load profile',
        ),
      ],
    );

    blocTest<UserProfileBloc, UserProfileState>(
      'emits [loading, updated] when updateProfile succeeds',
      build: () {
        when(
          () => mockUpdateUserProfileUseCase(
            any(),
            avatarPath: any(named: 'avatarPath'),
          ),
        ).thenAnswer((_) async => const Right(testUser));
        return buildBloc();
      },
      act: (bloc) => bloc.add(
        const UserProfileEvent.profileUpdated({'name': 'Test User'}),
      ),
      expect: () => [
        const UserProfileState(status: UserProfileStatus.loading),
        const UserProfileState(
          status: UserProfileStatus.updated,
          user: testUser,
        ),
      ],
    );

    blocTest<UserProfileBloc, UserProfileState>(
      'emits state with cities when citiesFetched succeeds',
      build: () {
        when(() => mockGetProfileCitiesUseCase())
            .thenAnswer((_) async => const Right(testCities));
        return buildBloc();
      },
      act: (bloc) => bloc.add(const UserProfileEvent.citiesFetched()),
      expect: () => [
        const UserProfileState(cities: testCities),
      ],
    );

    blocTest<UserProfileBloc, UserProfileState>(
      'emits [loading, accountDeleted] when profile delete succeeds',
      build: () {
        when(() => mockDeleteUserProfileUseCase())
            .thenAnswer((_) async => const Right(unit));
        return buildBloc();
      },
      act: (bloc) => bloc.add(const UserProfileEvent.profileDeleted()),
      expect: () => [
        const UserProfileState(status: UserProfileStatus.loading),
        const UserProfileState(status: UserProfileStatus.accountDeleted),
      ],
    );
  });
}
