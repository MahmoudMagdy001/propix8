import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:propix8/core/error/failures.dart';
import 'package:propix8/core/models/pagination_model.dart';
import 'package:propix8/core/shared/bloc/safe_bloc.dart';
import 'package:propix8/feature/bookings/models/booking_model.dart';
import 'package:propix8/feature/bookings/repositories/booking_repository.dart';
import 'package:propix8/feature/home/domain/entities/unit_entity.dart';
import 'package:propix8/feature/home/presentation/bloc/home_state.dart';
import 'package:propix8/feature/unit_details/domain/entities/review_entity.dart';
import 'package:propix8/feature/unit_details/domain/entities/unit_details_entity.dart';
import 'package:propix8/feature/unit_details/domain/usecases/contact_owner_usecase.dart';
import 'package:propix8/feature/unit_details/domain/usecases/create_unit_booking_usecase.dart';
import 'package:propix8/feature/unit_details/domain/usecases/delete_unit_review_usecase.dart';
import 'package:propix8/feature/unit_details/domain/usecases/get_related_units_usecase.dart';
import 'package:propix8/feature/unit_details/domain/usecases/get_unit_details_usecase.dart';
import 'package:propix8/feature/unit_details/domain/usecases/get_unit_reviews_usecase.dart';
import 'package:propix8/feature/unit_details/domain/usecases/submit_unit_review_usecase.dart';
import 'package:propix8/feature/unit_details/domain/usecases/update_unit_review_usecase.dart';
import 'package:propix8/feature/unit_details/presentation/bloc/unit_details_event.dart';
import 'package:propix8/feature/unit_details/presentation/bloc/unit_details_state.dart';

class UnitDetailsBloc extends SafeBloc<UnitDetailsEvent, UnitDetailsState> {
  UnitDetailsBloc({
    required GetUnitDetailsUseCase getUnitDetailsUseCase,
    required GetRelatedUnitsUseCase getRelatedUnitsUseCase,
    required GetUnitReviewsUseCase getUnitReviewsUseCase,
    required SubmitUnitReviewUseCase submitUnitReviewUseCase,
    required DeleteUnitReviewUseCase deleteUnitReviewUseCase,
    required UpdateUnitReviewUseCase updateUnitReviewUseCase,
    required ContactOwnerUseCase contactOwnerUseCase,
    required CreateUnitBookingUseCase createUnitBookingUseCase,
    required BookingRepository bookingRepository,
  })  : _getUnitDetailsUseCase = getUnitDetailsUseCase,
        _getRelatedUnitsUseCase = getRelatedUnitsUseCase,
        _getUnitReviewsUseCase = getUnitReviewsUseCase,
        _submitUnitReviewUseCase = submitUnitReviewUseCase,
        _deleteUnitReviewUseCase = deleteUnitReviewUseCase,
        _updateUnitReviewUseCase = updateUnitReviewUseCase,
        _contactOwnerUseCase = contactOwnerUseCase,
        _createUnitBookingUseCase = createUnitBookingUseCase,
        _bookingRepository = bookingRepository,
        super(const UnitDetailsState()) {
    on<UnitDetailsRequested>(_onUnitDetailsRequested);
    on<ReviewSubmitted>(_onReviewSubmitted);
    on<ReviewUpdated>(_onReviewUpdated);
    on<ReviewDeleted>(_onReviewDeleted);
    on<ReviewsMoreRequested>(_onReviewsMoreRequested);
    on<ContactOwnerSubmitted>(_onContactOwnerSubmitted);
    on<BookingSubmitted>(_onBookingSubmitted);
    on<ReviewStatusReset>(_onReviewStatusReset);
    on<DeleteReviewStatusReset>(_onDeleteReviewStatusReset);
    on<ContactStatusReset>(_onContactStatusReset);
    on<BookingStatusReset>(_onBookingStatusReset);
  }

  final GetUnitDetailsUseCase _getUnitDetailsUseCase;
  final GetRelatedUnitsUseCase _getRelatedUnitsUseCase;
  final GetUnitReviewsUseCase _getUnitReviewsUseCase;
  final SubmitUnitReviewUseCase _submitUnitReviewUseCase;
  final DeleteUnitReviewUseCase _deleteUnitReviewUseCase;
  final UpdateUnitReviewUseCase _updateUnitReviewUseCase;
  final ContactOwnerUseCase _contactOwnerUseCase;
  final CreateUnitBookingUseCase _createUnitBookingUseCase;
  final BookingRepository _bookingRepository;

  Future<void> _onUnitDetailsRequested(
    UnitDetailsRequested event,
    Emitter<UnitDetailsState> emit,
  ) async {
    final unitId = event.unitId;
    emit(
      state.copyWith(
        status: HomeRequestStatus.loading,
        relatedStatus: HomeRequestStatus.loading,
        reviewsFetchStatus: HomeRequestStatus.loading,
        unit: state.unit ?? UnitDetailsEntity.dummy,
      ),
    );

    try {
      final results = await Future.wait([
        _getUnitDetailsUseCase(unitId),
        _getRelatedUnitsUseCase(unitId),
        _getUnitReviewsUseCase(unitId),
        _bookingRepository.getBookings(),
      ]);

      final unitResult = results[0] as Either<Failure, UnitDetailsEntity>;
      final relatedResult = results[1] as Either<Failure, List<UnitEntity>>;
      final reviewsResult =
          results[2] as Either<Failure, PaginatedResponse<ReviewEntity>>;
      final bookingsResponse = results[3];

      var isBooked = false;
      int? cancelledBookingId;

      if (bookingsResponse is BookingResponse) {
        for (final b in bookingsResponse.data) {
          if (b.unit.id == unitId) {
            final statusStr = b.status.toLowerCase();
            if (statusStr != 'cancelled') {
              isBooked = true;
            } else {
              cancelledBookingId = b.id;
            }
          }
        }
      }

      unitResult.fold(
        (failure) => emit(
          state.copyWith(
            status: HomeRequestStatus.failure,
            relatedStatus: HomeRequestStatus.failure,
            reviewsFetchStatus: HomeRequestStatus.failure,
            errorMessage: failure.message,
          ),
        ),
        (unit) {
          var finalState = state.copyWith(
            status: HomeRequestStatus.success,
            unit: unit,
            isBookedByUser: isBooked,
            cancelledBookingId: cancelledBookingId,
          );

          relatedResult.fold(
            (_) => finalState = finalState.copyWith(
              relatedStatus: HomeRequestStatus.failure,
            ),
            (related) => finalState = finalState.copyWith(
              relatedStatus: HomeRequestStatus.success,
              relatedUnits: related,
            ),
          );

          reviewsResult.fold(
            (_) => finalState = finalState.copyWith(
              reviewsFetchStatus: HomeRequestStatus.failure,
            ),
            (paginated) => finalState = finalState.copyWith(
              reviewsFetchStatus: HomeRequestStatus.success,
              reviews: paginated.data,
              reviewsPagination: paginated.pagination,
            ),
          );

          emit(finalState);
        },
      );
    } on Object catch (e) {
      emit(
        state.copyWith(
          status: HomeRequestStatus.failure,
          relatedStatus: HomeRequestStatus.failure,
          reviewsFetchStatus: HomeRequestStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> _onReviewSubmitted(
    ReviewSubmitted event,
    Emitter<UnitDetailsState> emit,
  ) async {
    final unit = state.unit;
    if (unit == null) return;

    emit(state.copyWith(reviewStatus: HomeRequestStatus.loading));

    final result = await _submitUnitReviewUseCase(
      unit.id,
      event.rating,
      event.comment,
    );

    await result.fold(
      (failure) async => emit(
        state.copyWith(
          reviewStatus: HomeRequestStatus.failure,
          reviewErrorMessage: failure.message,
        ),
      ),
      (review) async {
        final refreshed = await _fetchRefreshedData(unit.id);
        emit(
          state.copyWith(
            reviewStatus: HomeRequestStatus.success,
            unit: refreshed.unit ?? state.unit,
            reviews: refreshed.reviewsResponse?.data ?? state.reviews,
            reviewsPagination: refreshed.reviewsResponse?.pagination ??
                state.reviewsPagination,
          ),
        );
      },
    );
  }

  Future<void> _onReviewUpdated(
    ReviewUpdated event,
    Emitter<UnitDetailsState> emit,
  ) async {
    final unit = state.unit;
    if (unit == null) return;

    emit(state.copyWith(reviewStatus: HomeRequestStatus.loading));

    final result = await _updateUnitReviewUseCase(
      event.reviewId,
      event.rating,
      event.comment,
    );

    await result.fold(
      (failure) async => emit(
        state.copyWith(
          reviewStatus: HomeRequestStatus.failure,
          reviewErrorMessage: failure.message,
        ),
      ),
      (review) async {
        final refreshed = await _fetchRefreshedData(unit.id);
        emit(
          state.copyWith(
            reviewStatus: HomeRequestStatus.success,
            unit: refreshed.unit ?? state.unit,
            reviews: refreshed.reviewsResponse?.data ?? state.reviews,
            reviewsPagination: refreshed.reviewsResponse?.pagination ??
                state.reviewsPagination,
          ),
        );
      },
    );
  }

  Future<void> _onReviewDeleted(
    ReviewDeleted event,
    Emitter<UnitDetailsState> emit,
  ) async {
    final unit = state.unit;
    if (unit == null) return;

    emit(state.copyWith(deleteReviewStatus: HomeRequestStatus.loading));

    final result = await _deleteUnitReviewUseCase(event.reviewId);

    await result.fold(
      (failure) async => emit(
        state.copyWith(deleteReviewStatus: HomeRequestStatus.failure),
      ),
      (_) async {
        final refreshed = await _fetchRefreshedData(unit.id);
        emit(
          state.copyWith(
            deleteReviewStatus: HomeRequestStatus.success,
            unit: refreshed.unit ?? state.unit,
            reviews: refreshed.reviewsResponse?.data ?? state.reviews,
            reviewsPagination: refreshed.reviewsResponse?.pagination ??
                state.reviewsPagination,
          ),
        );
      },
    );
  }

  Future<void> _onReviewsMoreRequested(
    ReviewsMoreRequested event,
    Emitter<UnitDetailsState> emit,
  ) async {
    final unit = state.unit;
    if (unit == null ||
        !state.reviewsPagination.hasMorePages ||
        state.isReviewsLoadingMore) {
      return;
    }

    emit(state.copyWith(isReviewsLoadingMore: true));

    final nextPage = state.reviewsPagination.currentPage + 1;
    final result = await _getUnitReviewsUseCase(unit.id, page: nextPage);

    result.fold(
      (failure) => emit(state.copyWith(isReviewsLoadingMore: false)),
      (response) => emit(
        state.copyWith(
          isReviewsLoadingMore: false,
          reviews: [...state.reviews, ...response.data],
          reviewsPagination: response.pagination,
        ),
      ),
    );
  }

  Future<void> _onContactOwnerSubmitted(
    ContactOwnerSubmitted event,
    Emitter<UnitDetailsState> emit,
  ) async {
    final unit = state.unit;
    if (unit == null) return;

    emit(state.copyWith(contactStatus: HomeRequestStatus.loading));

    final result = await _contactOwnerUseCase(
      name: event.name,
      email: event.email,
      phone: event.phone,
      message: event.message,
      unitId: unit.id,
    );

    result.fold(
      (failure) => emit(
        state.copyWith(
          contactStatus: HomeRequestStatus.failure,
          contactErrorMessage: failure.message,
        ),
      ),
      (_) => emit(
        state.copyWith(contactStatus: HomeRequestStatus.success),
      ),
    );
  }

  Future<void> _onBookingSubmitted(
    BookingSubmitted event,
    Emitter<UnitDetailsState> emit,
  ) async {
    final unit = state.unit;
    if (unit == null) return;

    emit(state.copyWith(bookingStatus: HomeRequestStatus.loading));

    try {
      if (state.cancelledBookingId != null) {
        await _bookingRepository.deleteBooking(state.cancelledBookingId!);
      }

      final result = await _createUnitBookingUseCase(
        unitId: unit.id,
        name: event.name,
        email: event.email,
        phone: event.phone,
        date: event.date,
        time: event.time,
        notes: event.notes,
      );

      result.fold(
        (failure) => emit(
          state.copyWith(
            bookingStatus: HomeRequestStatus.failure,
            bookingErrorMessage: failure.message,
          ),
        ),
        (response) {
          if (response.status) {
            emit(
              state.copyWith(
                bookingStatus: HomeRequestStatus.success,
                bookingSuccessMessage: response.message,
                isBookedByUser: true,
              ),
            );
          } else {
            emit(
              state.copyWith(
                bookingStatus: HomeRequestStatus.failure,
                bookingErrorMessage: response.message,
              ),
            );
          }
        },
      );
    } on Object catch (e) {
      emit(
        state.copyWith(
          bookingStatus: HomeRequestStatus.failure,
          bookingErrorMessage: e.toString(),
        ),
      );
    }
  }

  void _onReviewStatusReset(
    ReviewStatusReset event,
    Emitter<UnitDetailsState> emit,
  ) {
    emit(state.copyWith(reviewStatus: HomeRequestStatus.initial));
  }

  void _onDeleteReviewStatusReset(
    DeleteReviewStatusReset event,
    Emitter<UnitDetailsState> emit,
  ) {
    emit(state.copyWith(deleteReviewStatus: HomeRequestStatus.initial));
  }

  void _onContactStatusReset(
    ContactStatusReset event,
    Emitter<UnitDetailsState> emit,
  ) {
    emit(state.copyWith(contactStatus: HomeRequestStatus.initial));
  }

  void _onBookingStatusReset(
    BookingStatusReset event,
    Emitter<UnitDetailsState> emit,
  ) {
    emit(state.copyWith(bookingStatus: HomeRequestStatus.initial));
  }

  Future<
      ({
        UnitDetailsEntity? unit,
        PaginatedResponse<ReviewEntity>? reviewsResponse,
      })> _fetchRefreshedData(int unitId) async {
    try {
      final results = await Future.wait([
        _getUnitDetailsUseCase(unitId),
        _getUnitReviewsUseCase(unitId),
      ]);

      final unitResult = results[0] as Either<Failure, UnitDetailsEntity>;
      final reviewsResult =
          results[1] as Either<Failure, PaginatedResponse<ReviewEntity>>;

      final unit = unitResult.fold((_) => null, (u) => u);
      final reviews = reviewsResult.fold((_) => null, (r) => r);

      return (unit: unit, reviewsResponse: reviews);
    } on Object catch (_) {
      return (unit: null, reviewsResponse: null);
    }
  }
}
