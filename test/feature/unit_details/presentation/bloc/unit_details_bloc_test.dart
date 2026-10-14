import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:propix8/core/error/failures.dart';
import 'package:propix8/core/models/pagination_model.dart';
import 'package:propix8/feature/bookings/models/booking_model.dart';
import 'package:propix8/feature/bookings/repositories/booking_repository.dart';
import 'package:propix8/feature/home/domain/entities/unit_entity.dart';
import 'package:propix8/feature/home/presentation/bloc/home_state.dart';
import 'package:propix8/feature/unit_details/domain/entities/review_entity.dart';
import 'package:propix8/feature/unit_details/domain/entities/unit_booking_entity.dart';
import 'package:propix8/feature/unit_details/domain/entities/unit_details_entity.dart';
import 'package:propix8/feature/unit_details/domain/usecases/contact_owner_usecase.dart';
import 'package:propix8/feature/unit_details/domain/usecases/create_unit_booking_usecase.dart';
import 'package:propix8/feature/unit_details/domain/usecases/delete_unit_review_usecase.dart';
import 'package:propix8/feature/unit_details/domain/usecases/get_related_units_usecase.dart';
import 'package:propix8/feature/unit_details/domain/usecases/get_unit_details_usecase.dart';
import 'package:propix8/feature/unit_details/domain/usecases/get_unit_reviews_usecase.dart';
import 'package:propix8/feature/unit_details/domain/usecases/submit_unit_review_usecase.dart';
import 'package:propix8/feature/unit_details/domain/usecases/update_unit_review_usecase.dart';
import 'package:propix8/feature/unit_details/presentation/bloc/unit_details_bloc.dart';
import 'package:propix8/feature/unit_details/presentation/bloc/unit_details_event.dart';
import 'package:propix8/feature/unit_details/presentation/bloc/unit_details_state.dart';

class MockGetUnitDetailsUseCase extends Mock implements GetUnitDetailsUseCase {}

class MockGetRelatedUnitsUseCase extends Mock
    implements GetRelatedUnitsUseCase {}

class MockGetUnitReviewsUseCase extends Mock implements GetUnitReviewsUseCase {}

class MockSubmitUnitReviewUseCase extends Mock
    implements SubmitUnitReviewUseCase {}

class MockDeleteUnitReviewUseCase extends Mock
    implements DeleteUnitReviewUseCase {}

class MockUpdateUnitReviewUseCase extends Mock
    implements UpdateUnitReviewUseCase {}

class MockContactOwnerUseCase extends Mock implements ContactOwnerUseCase {}

class MockCreateUnitBookingUseCase extends Mock
    implements CreateUnitBookingUseCase {}

class MockBookingRepository extends Mock implements BookingRepository {}

void main() {
  late MockGetUnitDetailsUseCase mockGetUnitDetailsUseCase;
  late MockGetRelatedUnitsUseCase mockGetRelatedUnitsUseCase;
  late MockGetUnitReviewsUseCase mockGetUnitReviewsUseCase;
  late MockSubmitUnitReviewUseCase mockSubmitUnitReviewUseCase;
  late MockDeleteUnitReviewUseCase mockDeleteUnitReviewUseCase;
  late MockUpdateUnitReviewUseCase mockUpdateUnitReviewUseCase;
  late MockContactOwnerUseCase mockContactOwnerUseCase;
  late MockCreateUnitBookingUseCase mockCreateUnitBookingUseCase;
  late MockBookingRepository mockBookingRepository;
  late UnitDetailsBloc bloc;

  final tUnitDetails = UnitDetailsEntity(
    id: 1,
    title: 'Test Unit',
    description: 'Test Description',
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

  const tRelatedUnits = [
    UnitEntity(id: 2, title: 'Related Unit', price: 900000),
  ];

  final tReviews = [
    ReviewEntity(
      id: 1,
      rating: 5,
      comment: 'Great property',
      createdAt: DateTime(2025),
      user: const ReviewUserEntity(id: 10, name: 'User 1'),
    ),
  ];

  const tPagination = PaginationModel(
    currentPage: 1,
    lastPage: 1,
    perPage: 10,
    total: 1,
  );

  final tReviewsResponse = PaginatedResponse<ReviewEntity>(
    data: tReviews,
    pagination: tPagination,
  );

  const tBookingResponse = BookingResponse(
    status: true,
    message: 'Success',
    data: [],
  );

  setUp(() {
    mockGetUnitDetailsUseCase = MockGetUnitDetailsUseCase();
    mockGetRelatedUnitsUseCase = MockGetRelatedUnitsUseCase();
    mockGetUnitReviewsUseCase = MockGetUnitReviewsUseCase();
    mockSubmitUnitReviewUseCase = MockSubmitUnitReviewUseCase();
    mockDeleteUnitReviewUseCase = MockDeleteUnitReviewUseCase();
    mockUpdateUnitReviewUseCase = MockUpdateUnitReviewUseCase();
    mockContactOwnerUseCase = MockContactOwnerUseCase();
    mockCreateUnitBookingUseCase = MockCreateUnitBookingUseCase();
    mockBookingRepository = MockBookingRepository();

    bloc = UnitDetailsBloc(
      getUnitDetailsUseCase: mockGetUnitDetailsUseCase,
      getRelatedUnitsUseCase: mockGetRelatedUnitsUseCase,
      getUnitReviewsUseCase: mockGetUnitReviewsUseCase,
      submitUnitReviewUseCase: mockSubmitUnitReviewUseCase,
      deleteUnitReviewUseCase: mockDeleteUnitReviewUseCase,
      updateUnitReviewUseCase: mockUpdateUnitReviewUseCase,
      contactOwnerUseCase: mockContactOwnerUseCase,
      createUnitBookingUseCase: mockCreateUnitBookingUseCase,
      bookingRepository: mockBookingRepository,
    );
  });

  tearDown(() async {
    await bloc.close();
  });

  test('initial state should have initial status', () {
    expect(bloc.state.status, equals(HomeRequestStatus.initial));
    expect(bloc.state.unit, isNull);
    expect(bloc.state.relatedUnits, isEmpty);
    expect(bloc.state.reviews, isEmpty);
  });

  group('UnitDetailsRequested', () {
    blocTest<UnitDetailsBloc, UnitDetailsState>(
      'emits [loading, success] when data load succeeds',
      build: () {
        when(() => mockGetUnitDetailsUseCase(1))
            .thenAnswer((_) async => Right(tUnitDetails));
        when(() => mockGetRelatedUnitsUseCase(1))
            .thenAnswer((_) async => const Right(tRelatedUnits));
        when(() => mockGetUnitReviewsUseCase(1))
            .thenAnswer((_) async => Right(tReviewsResponse));
        when(() => mockBookingRepository.getBookings())
            .thenAnswer((_) async => tBookingResponse);
        return bloc;
      },
      act: (bloc) => bloc.add(const UnitDetailsEvent.unitDetailsRequested(1)),
      expect: () => [
        UnitDetailsState(
          status: HomeRequestStatus.loading,
          relatedStatus: HomeRequestStatus.loading,
          reviewsFetchStatus: HomeRequestStatus.loading,
          unit: UnitDetailsEntity.dummy,
        ),
        UnitDetailsState(
          status: HomeRequestStatus.success,
          unit: tUnitDetails,
          relatedStatus: HomeRequestStatus.success,
          relatedUnits: tRelatedUnits,
          reviewsFetchStatus: HomeRequestStatus.success,
          reviews: tReviews,
          reviewsPagination: tPagination,
        ),
      ],
    );

    blocTest<UnitDetailsBloc, UnitDetailsState>(
      'emits [loading, failure] when getUnitDetails fails',
      build: () {
        when(() => mockGetUnitDetailsUseCase(1)).thenAnswer(
          (_) async => const Left(ServerFailure('Failed to load unit')),
        );
        when(() => mockGetRelatedUnitsUseCase(1))
            .thenAnswer((_) async => const Right(tRelatedUnits));
        when(() => mockGetUnitReviewsUseCase(1))
            .thenAnswer((_) async => Right(tReviewsResponse));
        when(() => mockBookingRepository.getBookings())
            .thenAnswer((_) async => tBookingResponse);
        return bloc;
      },
      act: (bloc) => bloc.add(const UnitDetailsEvent.unitDetailsRequested(1)),
      expect: () => [
        UnitDetailsState(
          status: HomeRequestStatus.loading,
          relatedStatus: HomeRequestStatus.loading,
          reviewsFetchStatus: HomeRequestStatus.loading,
          unit: UnitDetailsEntity.dummy,
        ),
        UnitDetailsState(
          status: HomeRequestStatus.failure,
          relatedStatus: HomeRequestStatus.failure,
          reviewsFetchStatus: HomeRequestStatus.failure,
          unit: UnitDetailsEntity.dummy,
          errorMessage: 'Failed to load unit',
        ),
      ],
    );
  });

  group('ReviewSubmitted', () {
    blocTest<UnitDetailsBloc, UnitDetailsState>(
      'submits review and refreshes reviews',
      seed: () => UnitDetailsState(
        status: HomeRequestStatus.success,
        unit: tUnitDetails,
      ),
      build: () {
        when(
          () => mockSubmitUnitReviewUseCase(1, 5, 'Great'),
        ).thenAnswer((_) async => Right(tReviews.first));
        when(() => mockGetUnitDetailsUseCase(1))
            .thenAnswer((_) async => Right(tUnitDetails));
        when(() => mockGetUnitReviewsUseCase(1))
            .thenAnswer((_) async => Right(tReviewsResponse));
        return bloc;
      },
      act: (bloc) => bloc.add(
        const UnitDetailsEvent.reviewSubmitted(rating: 5, comment: 'Great'),
      ),
      expect: () => [
        UnitDetailsState(
          status: HomeRequestStatus.success,
          unit: tUnitDetails,
          reviewStatus: HomeRequestStatus.loading,
        ),
        UnitDetailsState(
          status: HomeRequestStatus.success,
          unit: tUnitDetails,
          reviewStatus: HomeRequestStatus.success,
          reviews: tReviews,
          reviewsPagination: tPagination,
        ),
      ],
    );
  });

  group('DeleteReviewRequested', () {
    const tEmptyPagination = PaginationModel(
      currentPage: 1,
      lastPage: 1,
      perPage: 10,
      total: 0,
    );

    blocTest<UnitDetailsBloc, UnitDetailsState>(
      'deletes review successfully',
      seed: () => UnitDetailsState(
        status: HomeRequestStatus.success,
        unit: tUnitDetails,
        reviews: tReviews,
      ),
      build: () {
        when(() => mockDeleteUnitReviewUseCase(1))
            .thenAnswer((_) async => const Right(null));
        when(() => mockGetUnitDetailsUseCase(1))
            .thenAnswer((_) async => Right(tUnitDetails));
        when(() => mockGetUnitReviewsUseCase(1)).thenAnswer(
          (_) async => const Right(
            PaginatedResponse<ReviewEntity>(
              data: [],
              pagination: tEmptyPagination,
            ),
          ),
        );
        return bloc;
      },
      act: (bloc) => bloc.add(const UnitDetailsEvent.reviewDeleted(1)),
      expect: () => [
        UnitDetailsState(
          status: HomeRequestStatus.success,
          unit: tUnitDetails,
          reviews: tReviews,
          deleteReviewStatus: HomeRequestStatus.loading,
        ),
        UnitDetailsState(
          status: HomeRequestStatus.success,
          unit: tUnitDetails,
          reviewsPagination: tEmptyPagination,
          deleteReviewStatus: HomeRequestStatus.success,
        ),
      ],
    );
  });

  group('ContactOwnerSubmitted', () {
    blocTest<UnitDetailsBloc, UnitDetailsState>(
      'submits contact owner successfully',
      seed: () => UnitDetailsState(
        status: HomeRequestStatus.success,
        unit: tUnitDetails,
      ),
      build: () {
        when(
          () => mockContactOwnerUseCase(
            name: 'John',
            email: 'john@test.com',
            phone: '1234567890',
            message: 'Hello',
            unitId: 1,
          ),
        ).thenAnswer((_) async => const Right(null));
        return bloc;
      },
      act: (bloc) => bloc.add(
        const UnitDetailsEvent.contactOwnerSubmitted(
          name: 'John',
          email: 'john@test.com',
          phone: '1234567890',
          message: 'Hello',
        ),
      ),
      expect: () => [
        UnitDetailsState(
          status: HomeRequestStatus.success,
          unit: tUnitDetails,
          contactStatus: HomeRequestStatus.loading,
        ),
        UnitDetailsState(
          status: HomeRequestStatus.success,
          unit: tUnitDetails,
          contactStatus: HomeRequestStatus.success,
        ),
      ],
    );
  });

  group('BookingSubmitted', () {
    const tBookingResult = UnitBookingResponseEntity(
      status: true,
      message: 'Booked',
    );

    blocTest<UnitDetailsBloc, UnitDetailsState>(
      'submits booking successfully',
      seed: () => UnitDetailsState(
        status: HomeRequestStatus.success,
        unit: tUnitDetails,
      ),
      build: () {
        when(
          () => mockCreateUnitBookingUseCase(
            unitId: 1,
            name: 'John',
            email: 'john@test.com',
            phone: '1234567890',
            date: '2025-01-01',
            time: '10:00',
            notes: 'Test booking',
          ),
        ).thenAnswer((_) async => const Right(tBookingResult));
        return bloc;
      },
      act: (bloc) => bloc.add(
        const UnitDetailsEvent.bookingSubmitted(
          name: 'John',
          email: 'john@test.com',
          phone: '1234567890',
          date: '2025-01-01',
          time: '10:00',
          notes: 'Test booking',
        ),
      ),
      expect: () => [
        UnitDetailsState(
          status: HomeRequestStatus.success,
          unit: tUnitDetails,
          bookingStatus: HomeRequestStatus.loading,
        ),
        UnitDetailsState(
          status: HomeRequestStatus.success,
          unit: tUnitDetails,
          bookingStatus: HomeRequestStatus.success,
          bookingSuccessMessage: 'Booked',
          isBookedByUser: true,
        ),
      ],
    );
  });
}
