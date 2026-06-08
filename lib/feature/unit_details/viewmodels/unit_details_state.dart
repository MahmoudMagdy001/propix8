import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import 'package:propix8/core/models/pagination_model.dart';
import 'package:propix8/feature/home/models/unit_model.dart';
import 'package:propix8/feature/unit_details/models/review_model.dart';
import 'package:propix8/feature/unit_details/models/unit_details_model.dart';

enum RequestStatus { initial, loading, success, failure }

@immutable
class UnitDetailsState extends Equatable {
  const UnitDetailsState({
    this.status = RequestStatus.initial,
    this.unit,
    this.errorMessage,
    this.relatedUnits = const [],
    this.relatedStatus = RequestStatus.initial,
    this.reviewStatus = RequestStatus.initial,
    this.reviewErrorMessage,
    this.reviews = const [],
    this.reviewsFetchStatus = RequestStatus.initial,
    this.deleteReviewStatus = RequestStatus.initial,
    this.reviewsPagination = const PaginationModel(
      currentPage: 1,
      perPage: 15,
      total: 0,
      lastPage: 1,
    ),
    this.isReviewsLoadingMore = false,
    this.contactStatus = RequestStatus.initial,
    this.contactErrorMessage,
    this.bookingStatus = RequestStatus.initial,
    this.bookingSuccessMessage,
    this.bookingErrorMessage,
    this.isBookedByUser = false,
    this.cancelledBookingId,
  });
  final RequestStatus status;
  final UnitDetailsModel? unit;
  final String? errorMessage;
  final List<UnitModel> relatedUnits;
  final RequestStatus relatedStatus;
  final RequestStatus reviewStatus;
  final String? reviewErrorMessage;
  final List<ReviewModel> reviews;
  final RequestStatus reviewsFetchStatus;
  final RequestStatus deleteReviewStatus;
  final PaginationModel reviewsPagination;
  final bool isReviewsLoadingMore;
  final RequestStatus contactStatus;
  final String? contactErrorMessage;
  final RequestStatus bookingStatus;
  final String? bookingSuccessMessage;
  final String? bookingErrorMessage;
  final bool isBookedByUser;
  final int? cancelledBookingId;

  UnitDetailsState copyWith({
    RequestStatus? status,
    UnitDetailsModel? unit,
    String? errorMessage,
    List<UnitModel>? relatedUnits,
    RequestStatus? relatedStatus,
    RequestStatus? reviewStatus,
    String? reviewErrorMessage,
    List<ReviewModel>? reviews,
    RequestStatus? reviewsFetchStatus,
    RequestStatus? deleteReviewStatus,
    PaginationModel? reviewsPagination,
    bool? isReviewsLoadingMore,
    RequestStatus? contactStatus,
    String? contactErrorMessage,
    RequestStatus? bookingStatus,
    String? bookingSuccessMessage,
    String? bookingErrorMessage,
    bool? isBookedByUser,
    int? cancelledBookingId,
    bool clearCancelledBookingId = false,
  }) => UnitDetailsState(
    status: status ?? this.status,
    unit: unit ?? this.unit,
    errorMessage: errorMessage ?? this.errorMessage,
    relatedUnits: relatedUnits ?? this.relatedUnits,
    relatedStatus: relatedStatus ?? this.relatedStatus,
    reviewStatus: reviewStatus ?? this.reviewStatus,
    reviewErrorMessage: reviewErrorMessage ?? this.reviewErrorMessage,
    reviews: reviews ?? this.reviews,
    reviewsFetchStatus: reviewsFetchStatus ?? this.reviewsFetchStatus,
    deleteReviewStatus: deleteReviewStatus ?? this.deleteReviewStatus,
    reviewsPagination: reviewsPagination ?? this.reviewsPagination,
    isReviewsLoadingMore: isReviewsLoadingMore ?? this.isReviewsLoadingMore,
    contactStatus: contactStatus ?? this.contactStatus,
    contactErrorMessage: contactErrorMessage ?? this.contactErrorMessage,
    bookingStatus: bookingStatus ?? this.bookingStatus,
    bookingSuccessMessage: bookingSuccessMessage ?? this.bookingSuccessMessage,
    bookingErrorMessage: bookingErrorMessage ?? this.bookingErrorMessage,
    isBookedByUser: isBookedByUser ?? this.isBookedByUser,
    cancelledBookingId: clearCancelledBookingId
        ? null
        : cancelledBookingId ?? this.cancelledBookingId,
  );

  @override
  List<Object?> get props => [
    status,
    unit,
    errorMessage,
    relatedUnits,
    relatedStatus,
    reviewStatus,
    reviewErrorMessage,
    reviews,
    reviewsFetchStatus,
    deleteReviewStatus,
    reviewsPagination,
    isReviewsLoadingMore,
    contactStatus,
    contactErrorMessage,
    bookingStatus,
    bookingSuccessMessage,
    bookingErrorMessage,
    isBookedByUser,
    cancelledBookingId,
  ];
}
