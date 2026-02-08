import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/models/pagination_model.dart';
import '../../bookings/models/booking_model.dart' show BookingResponse;
import '../../bookings/repositories/booking_repository.dart';
import '../../home/models/unit_model.dart';
import '../models/booking_request_model.dart';
import '../models/review_model.dart';
import '../models/unit_details_model.dart';
import '../repositories/unit_details_repository.dart';
import 'unit_details_state.dart';

class UnitDetailsCubit extends Cubit<UnitDetailsState> {
  UnitDetailsCubit(this._unitDetailsRepository, this._bookingRepository)
    : super(const UnitDetailsState());
  final UnitDetailsRepository _unitDetailsRepository;
  final BookingRepository _bookingRepository;

  Future<void> loadUnitDetails(int unitId) async {
    emit(
      state.copyWith(
        status: RequestStatus.loading,
        relatedStatus: RequestStatus.loading,
        reviewsFetchStatus: RequestStatus.loading,
        unit: state.unit ?? UnitDetailsModel.dummy,
      ),
    );
    try {
      final results = await Future.wait([
        _unitDetailsRepository.getUnitDetails(unitId),
        _unitDetailsRepository.getRelatedUnits(unitId),
        _unitDetailsRepository.getReviews(unitId),
        _bookingRepository.getBookings(),
      ]);

      if (isClosed) return;

      final bookingsResponse = results[3] as BookingResponse;
      final isBooked = bookingsResponse.data.any((b) => b.unit.id == unitId);

      emit(
        state.copyWith(
          status: RequestStatus.success,
          unit: results[0] as UnitDetailsModel,
          relatedStatus: RequestStatus.success,
          relatedUnits: results[1] as List<UnitModel>,
          reviewsFetchStatus: RequestStatus.success,
          reviews: (results[2] as PaginatedResponse).data as List<ReviewModel>,
          reviewsPagination: (results[2] as PaginatedResponse).pagination,
          isBookedByUser: isBooked,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: RequestStatus.failure,
          relatedStatus: RequestStatus.failure,
          reviewsFetchStatus: RequestStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> submitReview(int rating, String? comment) async {
    final unit = state.unit;
    if (unit == null) return;

    emit(state.copyWith(reviewStatus: RequestStatus.loading));

    try {
      await _unitDetailsRepository.submitReview(unit.id, rating, comment);
      await _refreshUnitData(unit.id);
      if (isClosed) return;
      emit(state.copyWith(reviewStatus: RequestStatus.success));
    } catch (e) {
      emit(
        state.copyWith(
          reviewStatus: RequestStatus.failure,
          reviewErrorMessage: e.toString(),
        ),
      );
    }
  }

  void resetReviewStatus() {
    emit(state.copyWith(reviewStatus: RequestStatus.initial));
  }

  void resetDeleteReviewStatus() {
    emit(state.copyWith(deleteReviewStatus: RequestStatus.initial));
  }

  Future<void> deleteReview(int reviewId) async {
    final unit = state.unit;
    if (unit == null) return;

    emit(state.copyWith(deleteReviewStatus: RequestStatus.loading));
    try {
      await _unitDetailsRepository.deleteReview(reviewId);
      await _refreshUnitData(unit.id);
      if (isClosed) return;
      emit(state.copyWith(deleteReviewStatus: RequestStatus.success));
    } catch (e) {
      emit(state.copyWith(deleteReviewStatus: RequestStatus.failure));
    }
  }

  Future<void> loadMoreReviews() async {
    final unit = state.unit;
    if (unit == null ||
        !state.reviewsPagination.hasMorePages ||
        state.isReviewsLoadingMore) {
      return;
    }

    emit(state.copyWith(isReviewsLoadingMore: true));

    try {
      final response = await _unitDetailsRepository.getReviews(
        unit.id,
        page: state.reviewsPagination.currentPage + 1,
      );

      if (isClosed) return;

      emit(
        state.copyWith(
          isReviewsLoadingMore: false,
          reviews: [...state.reviews, ...response.data],
          reviewsPagination: response.pagination,
        ),
      );
    } catch (_) {
      emit(state.copyWith(isReviewsLoadingMore: false));
    }
  }

  Future<void> updateReview(int reviewId, int rating, String? comment) async {
    final unit = state.unit;
    if (unit == null) return;

    emit(state.copyWith(reviewStatus: RequestStatus.loading));

    try {
      await _unitDetailsRepository.updateReview(reviewId, rating, comment);
      await _refreshUnitData(unit.id);
      if (isClosed) return;
      emit(state.copyWith(reviewStatus: RequestStatus.success));
    } catch (e) {
      emit(
        state.copyWith(
          reviewStatus: RequestStatus.failure,
          reviewErrorMessage: e.toString(),
        ),
      );
    }
  }

  void resetContactStatus() {
    emit(state.copyWith(contactStatus: RequestStatus.initial));
  }

  Future<void> contactOwner({
    required String name,
    required String email,
    required String phone,
    required String message,
  }) async {
    final unit = state.unit;
    if (unit == null) return;

    emit(state.copyWith(contactStatus: RequestStatus.loading));

    try {
      await _unitDetailsRepository.contactOwner(
        name: name,
        email: email,
        phone: phone,
        message: message,
        unitId: unit.id,
      );
      if (isClosed) return;
      emit(state.copyWith(contactStatus: RequestStatus.success));
    } catch (e) {
      emit(
        state.copyWith(
          contactStatus: RequestStatus.failure,
          contactErrorMessage: e.toString(),
        ),
      );
    }
  }

  void resetBookingStatus() {
    emit(state.copyWith(bookingStatus: RequestStatus.initial));
  }

  Future<void> createBooking(BookingRequest request) async {
    emit(state.copyWith(bookingStatus: RequestStatus.loading));
    try {
      final response = await _unitDetailsRepository.createBooking(request);
      if (isClosed) return;
      if (response.status) {
        emit(
          state.copyWith(
            bookingStatus: RequestStatus.success,
            bookingSuccessMessage: response.message,
            isBookedByUser: true,
          ),
        );
      } else {
        emit(
          state.copyWith(
            bookingStatus: RequestStatus.failure,
            bookingErrorMessage: response.message,
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          bookingStatus: RequestStatus.failure,
          bookingErrorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> _refreshUnitData(int unitId) async {
    try {
      final results = await Future.wait([
        _unitDetailsRepository.getUnitDetails(unitId),
        _unitDetailsRepository.getReviews(unitId),
      ]);

      if (isClosed) return;

      emit(
        state.copyWith(
          unit: results[0] as UnitDetailsModel,
          reviews: (results[1] as PaginatedResponse).data as List<ReviewModel>,
          reviewsPagination: (results[1] as PaginatedResponse).pagination,
        ),
      );
    } catch (_) {
      // Create a silent failure or handle appropriately
    }
  }
}
