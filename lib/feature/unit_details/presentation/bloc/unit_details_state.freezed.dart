// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'unit_details_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UnitDetailsState {

 HomeRequestStatus get status; UnitDetailsEntity? get unit; String? get errorMessage; List<UnitEntity> get relatedUnits; HomeRequestStatus get relatedStatus; HomeRequestStatus get reviewStatus; String? get reviewErrorMessage; List<ReviewEntity> get reviews; HomeRequestStatus get reviewsFetchStatus; HomeRequestStatus get deleteReviewStatus; PaginationModel get reviewsPagination; bool get isReviewsLoadingMore; HomeRequestStatus get contactStatus; String? get contactErrorMessage; HomeRequestStatus get bookingStatus; String? get bookingSuccessMessage; String? get bookingErrorMessage; bool get isBookedByUser; int? get cancelledBookingId;
/// Create a copy of UnitDetailsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnitDetailsStateCopyWith<UnitDetailsState> get copyWith => _$UnitDetailsStateCopyWithImpl<UnitDetailsState>(this as UnitDetailsState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as UnitDetailsState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnitDetailsState&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.unit, _this.unit) || other.unit == _this.unit)&&(identical(other.errorMessage, _this.errorMessage) || other.errorMessage == _this.errorMessage)&&const DeepCollectionEquality().equals(other.relatedUnits, _this.relatedUnits)&&(identical(other.relatedStatus, _this.relatedStatus) || other.relatedStatus == _this.relatedStatus)&&(identical(other.reviewStatus, _this.reviewStatus) || other.reviewStatus == _this.reviewStatus)&&(identical(other.reviewErrorMessage, _this.reviewErrorMessage) || other.reviewErrorMessage == _this.reviewErrorMessage)&&const DeepCollectionEquality().equals(other.reviews, _this.reviews)&&(identical(other.reviewsFetchStatus, _this.reviewsFetchStatus) || other.reviewsFetchStatus == _this.reviewsFetchStatus)&&(identical(other.deleteReviewStatus, _this.deleteReviewStatus) || other.deleteReviewStatus == _this.deleteReviewStatus)&&(identical(other.reviewsPagination, _this.reviewsPagination) || other.reviewsPagination == _this.reviewsPagination)&&(identical(other.isReviewsLoadingMore, _this.isReviewsLoadingMore) || other.isReviewsLoadingMore == _this.isReviewsLoadingMore)&&(identical(other.contactStatus, _this.contactStatus) || other.contactStatus == _this.contactStatus)&&(identical(other.contactErrorMessage, _this.contactErrorMessage) || other.contactErrorMessage == _this.contactErrorMessage)&&(identical(other.bookingStatus, _this.bookingStatus) || other.bookingStatus == _this.bookingStatus)&&(identical(other.bookingSuccessMessage, _this.bookingSuccessMessage) || other.bookingSuccessMessage == _this.bookingSuccessMessage)&&(identical(other.bookingErrorMessage, _this.bookingErrorMessage) || other.bookingErrorMessage == _this.bookingErrorMessage)&&(identical(other.isBookedByUser, _this.isBookedByUser) || other.isBookedByUser == _this.isBookedByUser)&&(identical(other.cancelledBookingId, _this.cancelledBookingId) || other.cancelledBookingId == _this.cancelledBookingId));
}


@override
int get hashCode {
  final _this = this as UnitDetailsState;
  return Object.hashAll([runtimeType,_this.status,_this.unit,_this.errorMessage,const DeepCollectionEquality().hash(_this.relatedUnits),_this.relatedStatus,_this.reviewStatus,_this.reviewErrorMessage,const DeepCollectionEquality().hash(_this.reviews),_this.reviewsFetchStatus,_this.deleteReviewStatus,_this.reviewsPagination,_this.isReviewsLoadingMore,_this.contactStatus,_this.contactErrorMessage,_this.bookingStatus,_this.bookingSuccessMessage,_this.bookingErrorMessage,_this.isBookedByUser,_this.cancelledBookingId]);
}

@override
String toString() {
  final _this = this as UnitDetailsState;
  return 'UnitDetailsState(status: ${_this.status}, unit: ${_this.unit}, errorMessage: ${_this.errorMessage}, relatedUnits: ${_this.relatedUnits}, relatedStatus: ${_this.relatedStatus}, reviewStatus: ${_this.reviewStatus}, reviewErrorMessage: ${_this.reviewErrorMessage}, reviews: ${_this.reviews}, reviewsFetchStatus: ${_this.reviewsFetchStatus}, deleteReviewStatus: ${_this.deleteReviewStatus}, reviewsPagination: ${_this.reviewsPagination}, isReviewsLoadingMore: ${_this.isReviewsLoadingMore}, contactStatus: ${_this.contactStatus}, contactErrorMessage: ${_this.contactErrorMessage}, bookingStatus: ${_this.bookingStatus}, bookingSuccessMessage: ${_this.bookingSuccessMessage}, bookingErrorMessage: ${_this.bookingErrorMessage}, isBookedByUser: ${_this.isBookedByUser}, cancelledBookingId: ${_this.cancelledBookingId})';
}


}

/// @nodoc
abstract mixin class $UnitDetailsStateCopyWith<$Res>  {
  factory $UnitDetailsStateCopyWith(UnitDetailsState value, $Res Function(UnitDetailsState) _then) = _$UnitDetailsStateCopyWithImpl;
@useResult
$Res call({
 HomeRequestStatus status, UnitDetailsEntity? unit, String? errorMessage, List<UnitEntity> relatedUnits, HomeRequestStatus relatedStatus, HomeRequestStatus reviewStatus, String? reviewErrorMessage, List<ReviewEntity> reviews, HomeRequestStatus reviewsFetchStatus, HomeRequestStatus deleteReviewStatus, PaginationModel reviewsPagination, bool isReviewsLoadingMore, HomeRequestStatus contactStatus, String? contactErrorMessage, HomeRequestStatus bookingStatus, String? bookingSuccessMessage, String? bookingErrorMessage, bool isBookedByUser, int? cancelledBookingId
});


$UnitDetailsEntityCopyWith<$Res>? get unit;$PaginationModelCopyWith<$Res> get reviewsPagination;

}
/// @nodoc
class _$UnitDetailsStateCopyWithImpl<$Res>
    implements $UnitDetailsStateCopyWith<$Res> {
  _$UnitDetailsStateCopyWithImpl(this._self, this._then);

  final UnitDetailsState _self;
  final $Res Function(UnitDetailsState) _then;

/// Create a copy of UnitDetailsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? unit = freezed,Object? errorMessage = freezed,Object? relatedUnits = null,Object? relatedStatus = null,Object? reviewStatus = null,Object? reviewErrorMessage = freezed,Object? reviews = null,Object? reviewsFetchStatus = null,Object? deleteReviewStatus = null,Object? reviewsPagination = null,Object? isReviewsLoadingMore = null,Object? contactStatus = null,Object? contactErrorMessage = freezed,Object? bookingStatus = null,Object? bookingSuccessMessage = freezed,Object? bookingErrorMessage = freezed,Object? isBookedByUser = null,Object? cancelledBookingId = freezed,}) {
  return _then(UnitDetailsState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as HomeRequestStatus,unit: freezed == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as UnitDetailsEntity?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,relatedUnits: null == relatedUnits ? _self.relatedUnits : relatedUnits // ignore: cast_nullable_to_non_nullable
as List<UnitEntity>,relatedStatus: null == relatedStatus ? _self.relatedStatus : relatedStatus // ignore: cast_nullable_to_non_nullable
as HomeRequestStatus,reviewStatus: null == reviewStatus ? _self.reviewStatus : reviewStatus // ignore: cast_nullable_to_non_nullable
as HomeRequestStatus,reviewErrorMessage: freezed == reviewErrorMessage ? _self.reviewErrorMessage : reviewErrorMessage // ignore: cast_nullable_to_non_nullable
as String?,reviews: null == reviews ? _self.reviews : reviews // ignore: cast_nullable_to_non_nullable
as List<ReviewEntity>,reviewsFetchStatus: null == reviewsFetchStatus ? _self.reviewsFetchStatus : reviewsFetchStatus // ignore: cast_nullable_to_non_nullable
as HomeRequestStatus,deleteReviewStatus: null == deleteReviewStatus ? _self.deleteReviewStatus : deleteReviewStatus // ignore: cast_nullable_to_non_nullable
as HomeRequestStatus,reviewsPagination: null == reviewsPagination ? _self.reviewsPagination : reviewsPagination // ignore: cast_nullable_to_non_nullable
as PaginationModel,isReviewsLoadingMore: null == isReviewsLoadingMore ? _self.isReviewsLoadingMore : isReviewsLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,contactStatus: null == contactStatus ? _self.contactStatus : contactStatus // ignore: cast_nullable_to_non_nullable
as HomeRequestStatus,contactErrorMessage: freezed == contactErrorMessage ? _self.contactErrorMessage : contactErrorMessage // ignore: cast_nullable_to_non_nullable
as String?,bookingStatus: null == bookingStatus ? _self.bookingStatus : bookingStatus // ignore: cast_nullable_to_non_nullable
as HomeRequestStatus,bookingSuccessMessage: freezed == bookingSuccessMessage ? _self.bookingSuccessMessage : bookingSuccessMessage // ignore: cast_nullable_to_non_nullable
as String?,bookingErrorMessage: freezed == bookingErrorMessage ? _self.bookingErrorMessage : bookingErrorMessage // ignore: cast_nullable_to_non_nullable
as String?,isBookedByUser: null == isBookedByUser ? _self.isBookedByUser : isBookedByUser // ignore: cast_nullable_to_non_nullable
as bool,cancelledBookingId: freezed == cancelledBookingId ? _self.cancelledBookingId : cancelledBookingId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of UnitDetailsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UnitDetailsEntityCopyWith<$Res>? get unit {
    if (_self.unit == null) {
    return null;
  }

  return $UnitDetailsEntityCopyWith<$Res>(_self.unit!, (value) {
    return _then(_self.copyWith(unit: value));
  });
}/// Create a copy of UnitDetailsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationModelCopyWith<$Res> get reviewsPagination {
  
  return $PaginationModelCopyWith<$Res>(_self.reviewsPagination, (value) {
    return _then(_self.copyWith(reviewsPagination: value));
  });
}
}


/// Adds pattern-matching-related methods to [UnitDetailsState].
extension UnitDetailsStatePatterns on UnitDetailsState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UnitDetailsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UnitDetailsState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UnitDetailsState value)  $default,){
final _that = this;
switch (_that) {
case _UnitDetailsState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UnitDetailsState value)?  $default,){
final _that = this;
switch (_that) {
case _UnitDetailsState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( HomeRequestStatus status,  UnitDetailsEntity? unit,  String? errorMessage,  List<UnitEntity> relatedUnits,  HomeRequestStatus relatedStatus,  HomeRequestStatus reviewStatus,  String? reviewErrorMessage,  List<ReviewEntity> reviews,  HomeRequestStatus reviewsFetchStatus,  HomeRequestStatus deleteReviewStatus,  PaginationModel reviewsPagination,  bool isReviewsLoadingMore,  HomeRequestStatus contactStatus,  String? contactErrorMessage,  HomeRequestStatus bookingStatus,  String? bookingSuccessMessage,  String? bookingErrorMessage,  bool isBookedByUser,  int? cancelledBookingId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UnitDetailsState() when $default != null:
return $default(_that.status,_that.unit,_that.errorMessage,_that.relatedUnits,_that.relatedStatus,_that.reviewStatus,_that.reviewErrorMessage,_that.reviews,_that.reviewsFetchStatus,_that.deleteReviewStatus,_that.reviewsPagination,_that.isReviewsLoadingMore,_that.contactStatus,_that.contactErrorMessage,_that.bookingStatus,_that.bookingSuccessMessage,_that.bookingErrorMessage,_that.isBookedByUser,_that.cancelledBookingId);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( HomeRequestStatus status,  UnitDetailsEntity? unit,  String? errorMessage,  List<UnitEntity> relatedUnits,  HomeRequestStatus relatedStatus,  HomeRequestStatus reviewStatus,  String? reviewErrorMessage,  List<ReviewEntity> reviews,  HomeRequestStatus reviewsFetchStatus,  HomeRequestStatus deleteReviewStatus,  PaginationModel reviewsPagination,  bool isReviewsLoadingMore,  HomeRequestStatus contactStatus,  String? contactErrorMessage,  HomeRequestStatus bookingStatus,  String? bookingSuccessMessage,  String? bookingErrorMessage,  bool isBookedByUser,  int? cancelledBookingId)  $default,) {final _that = this;
switch (_that) {
case _UnitDetailsState():
return $default(_that.status,_that.unit,_that.errorMessage,_that.relatedUnits,_that.relatedStatus,_that.reviewStatus,_that.reviewErrorMessage,_that.reviews,_that.reviewsFetchStatus,_that.deleteReviewStatus,_that.reviewsPagination,_that.isReviewsLoadingMore,_that.contactStatus,_that.contactErrorMessage,_that.bookingStatus,_that.bookingSuccessMessage,_that.bookingErrorMessage,_that.isBookedByUser,_that.cancelledBookingId);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( HomeRequestStatus status,  UnitDetailsEntity? unit,  String? errorMessage,  List<UnitEntity> relatedUnits,  HomeRequestStatus relatedStatus,  HomeRequestStatus reviewStatus,  String? reviewErrorMessage,  List<ReviewEntity> reviews,  HomeRequestStatus reviewsFetchStatus,  HomeRequestStatus deleteReviewStatus,  PaginationModel reviewsPagination,  bool isReviewsLoadingMore,  HomeRequestStatus contactStatus,  String? contactErrorMessage,  HomeRequestStatus bookingStatus,  String? bookingSuccessMessage,  String? bookingErrorMessage,  bool isBookedByUser,  int? cancelledBookingId)?  $default,) {final _that = this;
switch (_that) {
case _UnitDetailsState() when $default != null:
return $default(_that.status,_that.unit,_that.errorMessage,_that.relatedUnits,_that.relatedStatus,_that.reviewStatus,_that.reviewErrorMessage,_that.reviews,_that.reviewsFetchStatus,_that.deleteReviewStatus,_that.reviewsPagination,_that.isReviewsLoadingMore,_that.contactStatus,_that.contactErrorMessage,_that.bookingStatus,_that.bookingSuccessMessage,_that.bookingErrorMessage,_that.isBookedByUser,_that.cancelledBookingId);case _:
  return null;

}
}

}

/// @nodoc


class _UnitDetailsState extends UnitDetailsState {
  const _UnitDetailsState({this.status = HomeRequestStatus.initial, this.unit, this.errorMessage,  List<UnitEntity> relatedUnits = const <UnitEntity>[], this.relatedStatus = HomeRequestStatus.initial, this.reviewStatus = HomeRequestStatus.initial, this.reviewErrorMessage,  List<ReviewEntity> reviews = const <ReviewEntity>[], this.reviewsFetchStatus = HomeRequestStatus.initial, this.deleteReviewStatus = HomeRequestStatus.initial, this.reviewsPagination = const PaginationModel(perPage: 15), this.isReviewsLoadingMore = false, this.contactStatus = HomeRequestStatus.initial, this.contactErrorMessage, this.bookingStatus = HomeRequestStatus.initial, this.bookingSuccessMessage, this.bookingErrorMessage, this.isBookedByUser = false, this.cancelledBookingId}): _relatedUnits = relatedUnits,_reviews = reviews,super._();
  

@override@JsonKey() final  HomeRequestStatus status;
@override final  UnitDetailsEntity? unit;
@override final  String? errorMessage;
 final  List<UnitEntity> _relatedUnits;
@override@JsonKey() List<UnitEntity> get relatedUnits {
  if (_relatedUnits is EqualUnmodifiableListView) return _relatedUnits;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_relatedUnits);
}

@override@JsonKey() final  HomeRequestStatus relatedStatus;
@override@JsonKey() final  HomeRequestStatus reviewStatus;
@override final  String? reviewErrorMessage;
 final  List<ReviewEntity> _reviews;
@override@JsonKey() List<ReviewEntity> get reviews {
  if (_reviews is EqualUnmodifiableListView) return _reviews;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_reviews);
}

@override@JsonKey() final  HomeRequestStatus reviewsFetchStatus;
@override@JsonKey() final  HomeRequestStatus deleteReviewStatus;
@override@JsonKey() final  PaginationModel reviewsPagination;
@override@JsonKey() final  bool isReviewsLoadingMore;
@override@JsonKey() final  HomeRequestStatus contactStatus;
@override final  String? contactErrorMessage;
@override@JsonKey() final  HomeRequestStatus bookingStatus;
@override final  String? bookingSuccessMessage;
@override final  String? bookingErrorMessage;
@override@JsonKey() final  bool isBookedByUser;
@override final  int? cancelledBookingId;

/// Create a copy of UnitDetailsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UnitDetailsStateCopyWith<_UnitDetailsState> get copyWith => __$UnitDetailsStateCopyWithImpl<_UnitDetailsState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _UnitDetailsState&&(identical(other.status, status) || other.status == status)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&const DeepCollectionEquality().equals(other.relatedUnits, _relatedUnits)&&(identical(other.relatedStatus, relatedStatus) || other.relatedStatus == relatedStatus)&&(identical(other.reviewStatus, reviewStatus) || other.reviewStatus == reviewStatus)&&(identical(other.reviewErrorMessage, reviewErrorMessage) || other.reviewErrorMessage == reviewErrorMessage)&&const DeepCollectionEquality().equals(other.reviews, _reviews)&&(identical(other.reviewsFetchStatus, reviewsFetchStatus) || other.reviewsFetchStatus == reviewsFetchStatus)&&(identical(other.deleteReviewStatus, deleteReviewStatus) || other.deleteReviewStatus == deleteReviewStatus)&&(identical(other.reviewsPagination, reviewsPagination) || other.reviewsPagination == reviewsPagination)&&(identical(other.isReviewsLoadingMore, isReviewsLoadingMore) || other.isReviewsLoadingMore == isReviewsLoadingMore)&&(identical(other.contactStatus, contactStatus) || other.contactStatus == contactStatus)&&(identical(other.contactErrorMessage, contactErrorMessage) || other.contactErrorMessage == contactErrorMessage)&&(identical(other.bookingStatus, bookingStatus) || other.bookingStatus == bookingStatus)&&(identical(other.bookingSuccessMessage, bookingSuccessMessage) || other.bookingSuccessMessage == bookingSuccessMessage)&&(identical(other.bookingErrorMessage, bookingErrorMessage) || other.bookingErrorMessage == bookingErrorMessage)&&(identical(other.isBookedByUser, isBookedByUser) || other.isBookedByUser == isBookedByUser)&&(identical(other.cancelledBookingId, cancelledBookingId) || other.cancelledBookingId == cancelledBookingId));
}


@override
int get hashCode {
    return Object.hashAll([runtimeType,status,unit,errorMessage,const DeepCollectionEquality().hash(_relatedUnits),relatedStatus,reviewStatus,reviewErrorMessage,const DeepCollectionEquality().hash(_reviews),reviewsFetchStatus,deleteReviewStatus,reviewsPagination,isReviewsLoadingMore,contactStatus,contactErrorMessage,bookingStatus,bookingSuccessMessage,bookingErrorMessage,isBookedByUser,cancelledBookingId]);
}

@override
String toString() {
    return 'UnitDetailsState(status: $status, unit: $unit, errorMessage: $errorMessage, relatedUnits: $relatedUnits, relatedStatus: $relatedStatus, reviewStatus: $reviewStatus, reviewErrorMessage: $reviewErrorMessage, reviews: $reviews, reviewsFetchStatus: $reviewsFetchStatus, deleteReviewStatus: $deleteReviewStatus, reviewsPagination: $reviewsPagination, isReviewsLoadingMore: $isReviewsLoadingMore, contactStatus: $contactStatus, contactErrorMessage: $contactErrorMessage, bookingStatus: $bookingStatus, bookingSuccessMessage: $bookingSuccessMessage, bookingErrorMessage: $bookingErrorMessage, isBookedByUser: $isBookedByUser, cancelledBookingId: $cancelledBookingId)';
}


}

/// @nodoc
abstract mixin class _$UnitDetailsStateCopyWith<$Res> implements $UnitDetailsStateCopyWith<$Res> {
  factory _$UnitDetailsStateCopyWith(_UnitDetailsState value, $Res Function(_UnitDetailsState) _then) = __$UnitDetailsStateCopyWithImpl;
@override @useResult
$Res call({
 HomeRequestStatus status, UnitDetailsEntity? unit, String? errorMessage, List<UnitEntity> relatedUnits, HomeRequestStatus relatedStatus, HomeRequestStatus reviewStatus, String? reviewErrorMessage, List<ReviewEntity> reviews, HomeRequestStatus reviewsFetchStatus, HomeRequestStatus deleteReviewStatus, PaginationModel reviewsPagination, bool isReviewsLoadingMore, HomeRequestStatus contactStatus, String? contactErrorMessage, HomeRequestStatus bookingStatus, String? bookingSuccessMessage, String? bookingErrorMessage, bool isBookedByUser, int? cancelledBookingId
});


@override $UnitDetailsEntityCopyWith<$Res>? get unit;@override $PaginationModelCopyWith<$Res> get reviewsPagination;

}
/// @nodoc
class __$UnitDetailsStateCopyWithImpl<$Res>
    implements _$UnitDetailsStateCopyWith<$Res> {
  __$UnitDetailsStateCopyWithImpl(this._self, this._then);

  final _UnitDetailsState _self;
  final $Res Function(_UnitDetailsState) _then;

/// Create a copy of UnitDetailsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? unit = freezed,Object? errorMessage = freezed,Object? relatedUnits = null,Object? relatedStatus = null,Object? reviewStatus = null,Object? reviewErrorMessage = freezed,Object? reviews = null,Object? reviewsFetchStatus = null,Object? deleteReviewStatus = null,Object? reviewsPagination = null,Object? isReviewsLoadingMore = null,Object? contactStatus = null,Object? contactErrorMessage = freezed,Object? bookingStatus = null,Object? bookingSuccessMessage = freezed,Object? bookingErrorMessage = freezed,Object? isBookedByUser = null,Object? cancelledBookingId = freezed,}) {
  return _then(_UnitDetailsState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as HomeRequestStatus,unit: freezed == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as UnitDetailsEntity?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,relatedUnits: null == relatedUnits ? _self._relatedUnits : relatedUnits // ignore: cast_nullable_to_non_nullable
as List<UnitEntity>,relatedStatus: null == relatedStatus ? _self.relatedStatus : relatedStatus // ignore: cast_nullable_to_non_nullable
as HomeRequestStatus,reviewStatus: null == reviewStatus ? _self.reviewStatus : reviewStatus // ignore: cast_nullable_to_non_nullable
as HomeRequestStatus,reviewErrorMessage: freezed == reviewErrorMessage ? _self.reviewErrorMessage : reviewErrorMessage // ignore: cast_nullable_to_non_nullable
as String?,reviews: null == reviews ? _self._reviews : reviews // ignore: cast_nullable_to_non_nullable
as List<ReviewEntity>,reviewsFetchStatus: null == reviewsFetchStatus ? _self.reviewsFetchStatus : reviewsFetchStatus // ignore: cast_nullable_to_non_nullable
as HomeRequestStatus,deleteReviewStatus: null == deleteReviewStatus ? _self.deleteReviewStatus : deleteReviewStatus // ignore: cast_nullable_to_non_nullable
as HomeRequestStatus,reviewsPagination: null == reviewsPagination ? _self.reviewsPagination : reviewsPagination // ignore: cast_nullable_to_non_nullable
as PaginationModel,isReviewsLoadingMore: null == isReviewsLoadingMore ? _self.isReviewsLoadingMore : isReviewsLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,contactStatus: null == contactStatus ? _self.contactStatus : contactStatus // ignore: cast_nullable_to_non_nullable
as HomeRequestStatus,contactErrorMessage: freezed == contactErrorMessage ? _self.contactErrorMessage : contactErrorMessage // ignore: cast_nullable_to_non_nullable
as String?,bookingStatus: null == bookingStatus ? _self.bookingStatus : bookingStatus // ignore: cast_nullable_to_non_nullable
as HomeRequestStatus,bookingSuccessMessage: freezed == bookingSuccessMessage ? _self.bookingSuccessMessage : bookingSuccessMessage // ignore: cast_nullable_to_non_nullable
as String?,bookingErrorMessage: freezed == bookingErrorMessage ? _self.bookingErrorMessage : bookingErrorMessage // ignore: cast_nullable_to_non_nullable
as String?,isBookedByUser: null == isBookedByUser ? _self.isBookedByUser : isBookedByUser // ignore: cast_nullable_to_non_nullable
as bool,cancelledBookingId: freezed == cancelledBookingId ? _self.cancelledBookingId : cancelledBookingId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of UnitDetailsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UnitDetailsEntityCopyWith<$Res>? get unit {
    if (_self.unit == null) {
    return null;
  }

  return $UnitDetailsEntityCopyWith<$Res>(_self.unit!, (value) {
    return _then(_self.copyWith(unit: value));
  });
}/// Create a copy of UnitDetailsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationModelCopyWith<$Res> get reviewsPagination {
  
  return $PaginationModelCopyWith<$Res>(_self.reviewsPagination, (value) {
    return _then(_self.copyWith(reviewsPagination: value));
  });
}
}

// dart format on
