// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'unit_details_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UnitDetailsEvent {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is UnitDetailsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'UnitDetailsEvent()';
}


}

/// @nodoc
class $UnitDetailsEventCopyWith<$Res>  {
$UnitDetailsEventCopyWith(UnitDetailsEvent _, $Res Function(UnitDetailsEvent) __);
}


/// Adds pattern-matching-related methods to [UnitDetailsEvent].
extension UnitDetailsEventPatterns on UnitDetailsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( UnitDetailsRequested value)?  unitDetailsRequested,TResult Function( ReviewSubmitted value)?  reviewSubmitted,TResult Function( ReviewUpdated value)?  reviewUpdated,TResult Function( ReviewDeleted value)?  reviewDeleted,TResult Function( ReviewsMoreRequested value)?  reviewsMoreRequested,TResult Function( ContactOwnerSubmitted value)?  contactOwnerSubmitted,TResult Function( BookingSubmitted value)?  bookingSubmitted,TResult Function( ReviewStatusReset value)?  reviewStatusReset,TResult Function( DeleteReviewStatusReset value)?  deleteReviewStatusReset,TResult Function( ContactStatusReset value)?  contactStatusReset,TResult Function( BookingStatusReset value)?  bookingStatusReset,required TResult orElse(),}){
final _that = this;
switch (_that) {
case UnitDetailsRequested() when unitDetailsRequested != null:
return unitDetailsRequested(_that);case ReviewSubmitted() when reviewSubmitted != null:
return reviewSubmitted(_that);case ReviewUpdated() when reviewUpdated != null:
return reviewUpdated(_that);case ReviewDeleted() when reviewDeleted != null:
return reviewDeleted(_that);case ReviewsMoreRequested() when reviewsMoreRequested != null:
return reviewsMoreRequested(_that);case ContactOwnerSubmitted() when contactOwnerSubmitted != null:
return contactOwnerSubmitted(_that);case BookingSubmitted() when bookingSubmitted != null:
return bookingSubmitted(_that);case ReviewStatusReset() when reviewStatusReset != null:
return reviewStatusReset(_that);case DeleteReviewStatusReset() when deleteReviewStatusReset != null:
return deleteReviewStatusReset(_that);case ContactStatusReset() when contactStatusReset != null:
return contactStatusReset(_that);case BookingStatusReset() when bookingStatusReset != null:
return bookingStatusReset(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( UnitDetailsRequested value)  unitDetailsRequested,required TResult Function( ReviewSubmitted value)  reviewSubmitted,required TResult Function( ReviewUpdated value)  reviewUpdated,required TResult Function( ReviewDeleted value)  reviewDeleted,required TResult Function( ReviewsMoreRequested value)  reviewsMoreRequested,required TResult Function( ContactOwnerSubmitted value)  contactOwnerSubmitted,required TResult Function( BookingSubmitted value)  bookingSubmitted,required TResult Function( ReviewStatusReset value)  reviewStatusReset,required TResult Function( DeleteReviewStatusReset value)  deleteReviewStatusReset,required TResult Function( ContactStatusReset value)  contactStatusReset,required TResult Function( BookingStatusReset value)  bookingStatusReset,}){
final _that = this;
switch (_that) {
case UnitDetailsRequested():
return unitDetailsRequested(_that);case ReviewSubmitted():
return reviewSubmitted(_that);case ReviewUpdated():
return reviewUpdated(_that);case ReviewDeleted():
return reviewDeleted(_that);case ReviewsMoreRequested():
return reviewsMoreRequested(_that);case ContactOwnerSubmitted():
return contactOwnerSubmitted(_that);case BookingSubmitted():
return bookingSubmitted(_that);case ReviewStatusReset():
return reviewStatusReset(_that);case DeleteReviewStatusReset():
return deleteReviewStatusReset(_that);case ContactStatusReset():
return contactStatusReset(_that);case BookingStatusReset():
return bookingStatusReset(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( UnitDetailsRequested value)?  unitDetailsRequested,TResult? Function( ReviewSubmitted value)?  reviewSubmitted,TResult? Function( ReviewUpdated value)?  reviewUpdated,TResult? Function( ReviewDeleted value)?  reviewDeleted,TResult? Function( ReviewsMoreRequested value)?  reviewsMoreRequested,TResult? Function( ContactOwnerSubmitted value)?  contactOwnerSubmitted,TResult? Function( BookingSubmitted value)?  bookingSubmitted,TResult? Function( ReviewStatusReset value)?  reviewStatusReset,TResult? Function( DeleteReviewStatusReset value)?  deleteReviewStatusReset,TResult? Function( ContactStatusReset value)?  contactStatusReset,TResult? Function( BookingStatusReset value)?  bookingStatusReset,}){
final _that = this;
switch (_that) {
case UnitDetailsRequested() when unitDetailsRequested != null:
return unitDetailsRequested(_that);case ReviewSubmitted() when reviewSubmitted != null:
return reviewSubmitted(_that);case ReviewUpdated() when reviewUpdated != null:
return reviewUpdated(_that);case ReviewDeleted() when reviewDeleted != null:
return reviewDeleted(_that);case ReviewsMoreRequested() when reviewsMoreRequested != null:
return reviewsMoreRequested(_that);case ContactOwnerSubmitted() when contactOwnerSubmitted != null:
return contactOwnerSubmitted(_that);case BookingSubmitted() when bookingSubmitted != null:
return bookingSubmitted(_that);case ReviewStatusReset() when reviewStatusReset != null:
return reviewStatusReset(_that);case DeleteReviewStatusReset() when deleteReviewStatusReset != null:
return deleteReviewStatusReset(_that);case ContactStatusReset() when contactStatusReset != null:
return contactStatusReset(_that);case BookingStatusReset() when bookingStatusReset != null:
return bookingStatusReset(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int unitId)?  unitDetailsRequested,TResult Function( int rating,  String? comment)?  reviewSubmitted,TResult Function( int reviewId,  int rating,  String? comment)?  reviewUpdated,TResult Function( int reviewId)?  reviewDeleted,TResult Function()?  reviewsMoreRequested,TResult Function( String name,  String email,  String phone,  String message)?  contactOwnerSubmitted,TResult Function( String name,  String email,  String phone,  String date,  String time,  String notes)?  bookingSubmitted,TResult Function()?  reviewStatusReset,TResult Function()?  deleteReviewStatusReset,TResult Function()?  contactStatusReset,TResult Function()?  bookingStatusReset,required TResult orElse(),}) {final _that = this;
switch (_that) {
case UnitDetailsRequested() when unitDetailsRequested != null:
return unitDetailsRequested(_that.unitId);case ReviewSubmitted() when reviewSubmitted != null:
return reviewSubmitted(_that.rating,_that.comment);case ReviewUpdated() when reviewUpdated != null:
return reviewUpdated(_that.reviewId,_that.rating,_that.comment);case ReviewDeleted() when reviewDeleted != null:
return reviewDeleted(_that.reviewId);case ReviewsMoreRequested() when reviewsMoreRequested != null:
return reviewsMoreRequested();case ContactOwnerSubmitted() when contactOwnerSubmitted != null:
return contactOwnerSubmitted(_that.name,_that.email,_that.phone,_that.message);case BookingSubmitted() when bookingSubmitted != null:
return bookingSubmitted(_that.name,_that.email,_that.phone,_that.date,_that.time,_that.notes);case ReviewStatusReset() when reviewStatusReset != null:
return reviewStatusReset();case DeleteReviewStatusReset() when deleteReviewStatusReset != null:
return deleteReviewStatusReset();case ContactStatusReset() when contactStatusReset != null:
return contactStatusReset();case BookingStatusReset() when bookingStatusReset != null:
return bookingStatusReset();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int unitId)  unitDetailsRequested,required TResult Function( int rating,  String? comment)  reviewSubmitted,required TResult Function( int reviewId,  int rating,  String? comment)  reviewUpdated,required TResult Function( int reviewId)  reviewDeleted,required TResult Function()  reviewsMoreRequested,required TResult Function( String name,  String email,  String phone,  String message)  contactOwnerSubmitted,required TResult Function( String name,  String email,  String phone,  String date,  String time,  String notes)  bookingSubmitted,required TResult Function()  reviewStatusReset,required TResult Function()  deleteReviewStatusReset,required TResult Function()  contactStatusReset,required TResult Function()  bookingStatusReset,}) {final _that = this;
switch (_that) {
case UnitDetailsRequested():
return unitDetailsRequested(_that.unitId);case ReviewSubmitted():
return reviewSubmitted(_that.rating,_that.comment);case ReviewUpdated():
return reviewUpdated(_that.reviewId,_that.rating,_that.comment);case ReviewDeleted():
return reviewDeleted(_that.reviewId);case ReviewsMoreRequested():
return reviewsMoreRequested();case ContactOwnerSubmitted():
return contactOwnerSubmitted(_that.name,_that.email,_that.phone,_that.message);case BookingSubmitted():
return bookingSubmitted(_that.name,_that.email,_that.phone,_that.date,_that.time,_that.notes);case ReviewStatusReset():
return reviewStatusReset();case DeleteReviewStatusReset():
return deleteReviewStatusReset();case ContactStatusReset():
return contactStatusReset();case BookingStatusReset():
return bookingStatusReset();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int unitId)?  unitDetailsRequested,TResult? Function( int rating,  String? comment)?  reviewSubmitted,TResult? Function( int reviewId,  int rating,  String? comment)?  reviewUpdated,TResult? Function( int reviewId)?  reviewDeleted,TResult? Function()?  reviewsMoreRequested,TResult? Function( String name,  String email,  String phone,  String message)?  contactOwnerSubmitted,TResult? Function( String name,  String email,  String phone,  String date,  String time,  String notes)?  bookingSubmitted,TResult? Function()?  reviewStatusReset,TResult? Function()?  deleteReviewStatusReset,TResult? Function()?  contactStatusReset,TResult? Function()?  bookingStatusReset,}) {final _that = this;
switch (_that) {
case UnitDetailsRequested() when unitDetailsRequested != null:
return unitDetailsRequested(_that.unitId);case ReviewSubmitted() when reviewSubmitted != null:
return reviewSubmitted(_that.rating,_that.comment);case ReviewUpdated() when reviewUpdated != null:
return reviewUpdated(_that.reviewId,_that.rating,_that.comment);case ReviewDeleted() when reviewDeleted != null:
return reviewDeleted(_that.reviewId);case ReviewsMoreRequested() when reviewsMoreRequested != null:
return reviewsMoreRequested();case ContactOwnerSubmitted() when contactOwnerSubmitted != null:
return contactOwnerSubmitted(_that.name,_that.email,_that.phone,_that.message);case BookingSubmitted() when bookingSubmitted != null:
return bookingSubmitted(_that.name,_that.email,_that.phone,_that.date,_that.time,_that.notes);case ReviewStatusReset() when reviewStatusReset != null:
return reviewStatusReset();case DeleteReviewStatusReset() when deleteReviewStatusReset != null:
return deleteReviewStatusReset();case ContactStatusReset() when contactStatusReset != null:
return contactStatusReset();case BookingStatusReset() when bookingStatusReset != null:
return bookingStatusReset();case _:
  return null;

}
}

}

/// @nodoc


class UnitDetailsRequested implements UnitDetailsEvent {
  const UnitDetailsRequested(this.unitId);
  

 final  int unitId;

/// Create a copy of UnitDetailsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnitDetailsRequestedCopyWith<UnitDetailsRequested> get copyWith => _$UnitDetailsRequestedCopyWithImpl<UnitDetailsRequested>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is UnitDetailsRequested&&(identical(other.unitId, unitId) || other.unitId == unitId));
}


@override
int get hashCode {
    return Object.hash(runtimeType,unitId);
}

@override
String toString() {
    return 'UnitDetailsEvent.unitDetailsRequested(unitId: $unitId)';
}


}

/// @nodoc
abstract mixin class $UnitDetailsRequestedCopyWith<$Res> implements $UnitDetailsEventCopyWith<$Res> {
  factory $UnitDetailsRequestedCopyWith(UnitDetailsRequested value, $Res Function(UnitDetailsRequested) _then) = _$UnitDetailsRequestedCopyWithImpl;
@useResult
$Res call({
 int unitId
});




}
/// @nodoc
class _$UnitDetailsRequestedCopyWithImpl<$Res>
    implements $UnitDetailsRequestedCopyWith<$Res> {
  _$UnitDetailsRequestedCopyWithImpl(this._self, this._then);

  final UnitDetailsRequested _self;
  final $Res Function(UnitDetailsRequested) _then;

/// Create a copy of UnitDetailsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? unitId = null,}) {
  return _then(UnitDetailsRequested(
null == unitId ? _self.unitId : unitId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class ReviewSubmitted implements UnitDetailsEvent {
  const ReviewSubmitted({required this.rating, this.comment});
  

 final  int rating;
 final  String? comment;

/// Create a copy of UnitDetailsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReviewSubmittedCopyWith<ReviewSubmitted> get copyWith => _$ReviewSubmittedCopyWithImpl<ReviewSubmitted>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ReviewSubmitted&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.comment, comment) || other.comment == comment));
}


@override
int get hashCode {
    return Object.hash(runtimeType,rating,comment);
}

@override
String toString() {
    return 'UnitDetailsEvent.reviewSubmitted(rating: $rating, comment: $comment)';
}


}

/// @nodoc
abstract mixin class $ReviewSubmittedCopyWith<$Res> implements $UnitDetailsEventCopyWith<$Res> {
  factory $ReviewSubmittedCopyWith(ReviewSubmitted value, $Res Function(ReviewSubmitted) _then) = _$ReviewSubmittedCopyWithImpl;
@useResult
$Res call({
 int rating, String? comment
});




}
/// @nodoc
class _$ReviewSubmittedCopyWithImpl<$Res>
    implements $ReviewSubmittedCopyWith<$Res> {
  _$ReviewSubmittedCopyWithImpl(this._self, this._then);

  final ReviewSubmitted _self;
  final $Res Function(ReviewSubmitted) _then;

/// Create a copy of UnitDetailsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? rating = null,Object? comment = freezed,}) {
  return _then(ReviewSubmitted(
rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as int,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class ReviewUpdated implements UnitDetailsEvent {
  const ReviewUpdated({required this.reviewId, required this.rating, this.comment});
  

 final  int reviewId;
 final  int rating;
 final  String? comment;

/// Create a copy of UnitDetailsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReviewUpdatedCopyWith<ReviewUpdated> get copyWith => _$ReviewUpdatedCopyWithImpl<ReviewUpdated>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ReviewUpdated&&(identical(other.reviewId, reviewId) || other.reviewId == reviewId)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.comment, comment) || other.comment == comment));
}


@override
int get hashCode {
    return Object.hash(runtimeType,reviewId,rating,comment);
}

@override
String toString() {
    return 'UnitDetailsEvent.reviewUpdated(reviewId: $reviewId, rating: $rating, comment: $comment)';
}


}

/// @nodoc
abstract mixin class $ReviewUpdatedCopyWith<$Res> implements $UnitDetailsEventCopyWith<$Res> {
  factory $ReviewUpdatedCopyWith(ReviewUpdated value, $Res Function(ReviewUpdated) _then) = _$ReviewUpdatedCopyWithImpl;
@useResult
$Res call({
 int reviewId, int rating, String? comment
});




}
/// @nodoc
class _$ReviewUpdatedCopyWithImpl<$Res>
    implements $ReviewUpdatedCopyWith<$Res> {
  _$ReviewUpdatedCopyWithImpl(this._self, this._then);

  final ReviewUpdated _self;
  final $Res Function(ReviewUpdated) _then;

/// Create a copy of UnitDetailsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? reviewId = null,Object? rating = null,Object? comment = freezed,}) {
  return _then(ReviewUpdated(
reviewId: null == reviewId ? _self.reviewId : reviewId // ignore: cast_nullable_to_non_nullable
as int,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as int,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class ReviewDeleted implements UnitDetailsEvent {
  const ReviewDeleted(this.reviewId);
  

 final  int reviewId;

/// Create a copy of UnitDetailsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReviewDeletedCopyWith<ReviewDeleted> get copyWith => _$ReviewDeletedCopyWithImpl<ReviewDeleted>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ReviewDeleted&&(identical(other.reviewId, reviewId) || other.reviewId == reviewId));
}


@override
int get hashCode {
    return Object.hash(runtimeType,reviewId);
}

@override
String toString() {
    return 'UnitDetailsEvent.reviewDeleted(reviewId: $reviewId)';
}


}

/// @nodoc
abstract mixin class $ReviewDeletedCopyWith<$Res> implements $UnitDetailsEventCopyWith<$Res> {
  factory $ReviewDeletedCopyWith(ReviewDeleted value, $Res Function(ReviewDeleted) _then) = _$ReviewDeletedCopyWithImpl;
@useResult
$Res call({
 int reviewId
});




}
/// @nodoc
class _$ReviewDeletedCopyWithImpl<$Res>
    implements $ReviewDeletedCopyWith<$Res> {
  _$ReviewDeletedCopyWithImpl(this._self, this._then);

  final ReviewDeleted _self;
  final $Res Function(ReviewDeleted) _then;

/// Create a copy of UnitDetailsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? reviewId = null,}) {
  return _then(ReviewDeleted(
null == reviewId ? _self.reviewId : reviewId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class ReviewsMoreRequested implements UnitDetailsEvent {
  const ReviewsMoreRequested();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ReviewsMoreRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'UnitDetailsEvent.reviewsMoreRequested()';
}


}




/// @nodoc


class ContactOwnerSubmitted implements UnitDetailsEvent {
  const ContactOwnerSubmitted({required this.name, required this.email, required this.phone, required this.message});
  

 final  String name;
 final  String email;
 final  String phone;
 final  String message;

/// Create a copy of UnitDetailsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContactOwnerSubmittedCopyWith<ContactOwnerSubmitted> get copyWith => _$ContactOwnerSubmittedCopyWithImpl<ContactOwnerSubmitted>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ContactOwnerSubmitted&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode {
    return Object.hash(runtimeType,name,email,phone,message);
}

@override
String toString() {
    return 'UnitDetailsEvent.contactOwnerSubmitted(name: $name, email: $email, phone: $phone, message: $message)';
}


}

/// @nodoc
abstract mixin class $ContactOwnerSubmittedCopyWith<$Res> implements $UnitDetailsEventCopyWith<$Res> {
  factory $ContactOwnerSubmittedCopyWith(ContactOwnerSubmitted value, $Res Function(ContactOwnerSubmitted) _then) = _$ContactOwnerSubmittedCopyWithImpl;
@useResult
$Res call({
 String name, String email, String phone, String message
});




}
/// @nodoc
class _$ContactOwnerSubmittedCopyWithImpl<$Res>
    implements $ContactOwnerSubmittedCopyWith<$Res> {
  _$ContactOwnerSubmittedCopyWithImpl(this._self, this._then);

  final ContactOwnerSubmitted _self;
  final $Res Function(ContactOwnerSubmitted) _then;

/// Create a copy of UnitDetailsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? name = null,Object? email = null,Object? phone = null,Object? message = null,}) {
  return _then(ContactOwnerSubmitted(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class BookingSubmitted implements UnitDetailsEvent {
  const BookingSubmitted({required this.name, required this.email, required this.phone, required this.date, required this.time, this.notes = ''});
  

 final  String name;
 final  String email;
 final  String phone;
 final  String date;
 final  String time;
@JsonKey() final  String notes;

/// Create a copy of UnitDetailsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookingSubmittedCopyWith<BookingSubmitted> get copyWith => _$BookingSubmittedCopyWithImpl<BookingSubmitted>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingSubmitted&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.date, date) || other.date == date)&&(identical(other.time, time) || other.time == time)&&(identical(other.notes, notes) || other.notes == notes));
}


@override
int get hashCode {
    return Object.hash(runtimeType,name,email,phone,date,time,notes);
}

@override
String toString() {
    return 'UnitDetailsEvent.bookingSubmitted(name: $name, email: $email, phone: $phone, date: $date, time: $time, notes: $notes)';
}


}

/// @nodoc
abstract mixin class $BookingSubmittedCopyWith<$Res> implements $UnitDetailsEventCopyWith<$Res> {
  factory $BookingSubmittedCopyWith(BookingSubmitted value, $Res Function(BookingSubmitted) _then) = _$BookingSubmittedCopyWithImpl;
@useResult
$Res call({
 String name, String email, String phone, String date, String time, String notes
});




}
/// @nodoc
class _$BookingSubmittedCopyWithImpl<$Res>
    implements $BookingSubmittedCopyWith<$Res> {
  _$BookingSubmittedCopyWithImpl(this._self, this._then);

  final BookingSubmitted _self;
  final $Res Function(BookingSubmitted) _then;

/// Create a copy of UnitDetailsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? name = null,Object? email = null,Object? phone = null,Object? date = null,Object? time = null,Object? notes = null,}) {
  return _then(BookingSubmitted(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ReviewStatusReset implements UnitDetailsEvent {
  const ReviewStatusReset();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ReviewStatusReset);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'UnitDetailsEvent.reviewStatusReset()';
}


}




/// @nodoc


class DeleteReviewStatusReset implements UnitDetailsEvent {
  const DeleteReviewStatusReset();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteReviewStatusReset);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'UnitDetailsEvent.deleteReviewStatusReset()';
}


}




/// @nodoc


class ContactStatusReset implements UnitDetailsEvent {
  const ContactStatusReset();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ContactStatusReset);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'UnitDetailsEvent.contactStatusReset()';
}


}




/// @nodoc


class BookingStatusReset implements UnitDetailsEvent {
  const BookingStatusReset();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingStatusReset);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'UnitDetailsEvent.bookingStatusReset()';
}


}




// dart format on
