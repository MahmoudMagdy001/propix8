import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:propix8/core/models/pagination_model.dart';
import 'package:propix8/feature/home/domain/entities/unit_entity.dart';
import 'package:propix8/feature/home/presentation/bloc/home_state.dart';
import 'package:propix8/feature/unit_details/domain/entities/review_entity.dart';
import 'package:propix8/feature/unit_details/domain/entities/unit_details_entity.dart';

part 'unit_details_state.freezed.dart';

@freezed
abstract class UnitDetailsState with _$UnitDetailsState {
  const UnitDetailsState._();

  const factory UnitDetailsState({
    @Default(HomeRequestStatus.initial) HomeRequestStatus status,
    UnitDetailsEntity? unit,
    String? errorMessage,
    @Default(<UnitEntity>[]) List<UnitEntity> relatedUnits,
    @Default(HomeRequestStatus.initial) HomeRequestStatus relatedStatus,
    @Default(HomeRequestStatus.initial) HomeRequestStatus reviewStatus,
    String? reviewErrorMessage,
    @Default(<ReviewEntity>[]) List<ReviewEntity> reviews,
    @Default(HomeRequestStatus.initial) HomeRequestStatus reviewsFetchStatus,
    @Default(HomeRequestStatus.initial) HomeRequestStatus deleteReviewStatus,
    @Default(PaginationModel(perPage: 15))
    PaginationModel reviewsPagination,
    @Default(false) bool isReviewsLoadingMore,
    @Default(HomeRequestStatus.initial) HomeRequestStatus contactStatus,
    String? contactErrorMessage,
    @Default(HomeRequestStatus.initial) HomeRequestStatus bookingStatus,
    String? bookingSuccessMessage,
    String? bookingErrorMessage,
    @Default(false) bool isBookedByUser,
    int? cancelledBookingId,
  }) = _UnitDetailsState;
}
