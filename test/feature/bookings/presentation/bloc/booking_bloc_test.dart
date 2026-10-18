import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:propix8/feature/bookings/domain/entities/booking_entity.dart';
import 'package:propix8/feature/bookings/domain/usecases/delete_booking_usecase.dart';
import 'package:propix8/feature/bookings/domain/usecases/get_bookings_usecase.dart';
import 'package:propix8/feature/bookings/domain/usecases/suggest_new_time_usecase.dart';
import 'package:propix8/feature/bookings/domain/usecases/update_booking_status_usecase.dart';
import 'package:propix8/feature/bookings/presentation/bloc/booking_bloc.dart';
import 'package:propix8/feature/bookings/presentation/bloc/booking_event.dart';
import 'package:propix8/feature/bookings/presentation/bloc/booking_state.dart';

class MockGetBookingsUseCase extends Mock implements GetBookingsUseCase {}

class MockUpdateBookingStatusUseCase extends Mock
    implements UpdateBookingStatusUseCase {}

class MockSuggestNewTimeUseCase extends Mock implements SuggestNewTimeUseCase {}

class MockDeleteBookingUseCase extends Mock implements DeleteBookingUseCase {}

void main() {
  late MockGetBookingsUseCase mockGetBookingsUseCase;
  late MockUpdateBookingStatusUseCase mockUpdateBookingStatusUseCase;
  late MockSuggestNewTimeUseCase mockSuggestNewTimeUseCase;
  late MockDeleteBookingUseCase mockDeleteBookingUseCase;
  late BookingBloc bookingBloc;

  final tBooking = BookingEntity(
    id: 1,
    userId: 1,
    user: const BookingUserEntity(
      id: 1,
      name: 'Test User',
      email: 'test@example.com',
    ),
    unit: BookingUnitEntity(
      id: 1,
      title: 'Test Unit',
      isVisible: true,
      isFavourite: false,
      address: 'Test Address',
      price: 100000,
      offerType: 'sale',
      area: 120,
      rooms: 3,
      bathrooms: 2,
      city: const BookingCityEntity(id: 1, name: 'Cairo'),
      compound: const BookingCompoundEntity(id: 1, name: 'Compound A'),
      developer: const BookingDeveloperEntity(id: 1, name: 'Dev A'),
      unitType: const BookingUnitTypeEntity(id: 1, name: 'Apartment'),
      mainImage: 'image.jpg',
      averageRating: 4,
      reviewsCount: 10,
      createdAt: DateTime(2025),
    ),
    name: 'Customer',
    email: 'customer@test.com',
    phone: '0123456789',
    date: '2025-01-01',
    time: '10:00:00',
    status: 'pending',
    createdAt: '2025-01-01',
    updatedAt: '2025-01-01',
  );

  final tBookingResponse = BookingResponse(
    status: true,
    message: 'Success',
    data: [tBooking],
  );

  setUp(() {
    mockGetBookingsUseCase = MockGetBookingsUseCase();
    mockUpdateBookingStatusUseCase = MockUpdateBookingStatusUseCase();
    mockSuggestNewTimeUseCase = MockSuggestNewTimeUseCase();
    mockDeleteBookingUseCase = MockDeleteBookingUseCase();

    bookingBloc = BookingBloc(
      getBookingsUseCase: mockGetBookingsUseCase,
      updateBookingStatusUseCase: mockUpdateBookingStatusUseCase,
      suggestNewTimeUseCase: mockSuggestNewTimeUseCase,
      deleteBookingUseCase: mockDeleteBookingUseCase,
    );
  });

  tearDown(() async {
    await bookingBloc.close();
  });

  test('initial state has RequestStatus.initial and empty bookings', () {
    expect(bookingBloc.state.status, RequestStatus.initial);
    expect(bookingBloc.state.bookings, isEmpty);
  });

  blocTest<BookingBloc, BookingState>(
    'emits [loading, success] when fetch requested succeeds',
    build: () {
      when(() => mockGetBookingsUseCase()).thenAnswer(
        (_) async => tBookingResponse,
      );
      return bookingBloc;
    },
    act: (bloc) => bloc.add(const BookingEvent.fetchRequested()),
    expect: () => [
      const BookingState(status: RequestStatus.loading),
      BookingState(
        status: RequestStatus.success,
        bookings: [tBooking],
      ),
    ],
  );

  blocTest<BookingBloc, BookingState>(
    'emits [loading, failure] when fetch requested fails',
    build: () {
      when(() => mockGetBookingsUseCase()).thenThrow(
        Exception('Network Error'),
      );
      return bookingBloc;
    },
    act: (bloc) => bloc.add(const BookingEvent.fetchRequested()),
    expect: () => [
      const BookingState(status: RequestStatus.loading),
      const BookingState(
        status: RequestStatus.failure,
        errorMessage: 'Exception: Network Error',
      ),
    ],
  );

  blocTest<BookingBloc, BookingState>(
    'updates booking status when BookingAccepted event is handled',
    seed: () => BookingState(
      status: RequestStatus.success,
      bookings: [tBooking],
    ),
    build: () {
      when(
        () => mockUpdateBookingStatusUseCase(
          bookingId: 1,
          status: 'accepted',
        ),
      ).thenAnswer((_) async => true);
      return bookingBloc;
    },
    act: (bloc) => bloc.add(const BookingEvent.bookingAccepted(bookingId: 1)),
    expect: () => [
      BookingState(
        status: RequestStatus.success,
        bookings: [tBooking.copyWith(status: 'accepted')],
      ),
    ],
  );

  blocTest<BookingBloc, BookingState>(
    'removes booking when BookingDeleted event is handled',
    seed: () => BookingState(
      status: RequestStatus.success,
      bookings: [tBooking],
    ),
    build: () {
      when(
        () => mockDeleteBookingUseCase(1),
      ).thenAnswer((_) async => true);
      return bookingBloc;
    },
    act: (bloc) => bloc.add(const BookingEvent.bookingDeleted(bookingId: 1)),
    expect: () => [
      const BookingState(
        status: RequestStatus.success,
      ),
    ],
  );
}
