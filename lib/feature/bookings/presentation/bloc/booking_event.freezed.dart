// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BookingEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BookingEvent()';
}


}

/// @nodoc
class $BookingEventCopyWith<$Res>  {
$BookingEventCopyWith(BookingEvent _, $Res Function(BookingEvent) __);
}


/// Adds pattern-matching-related methods to [BookingEvent].
extension BookingEventPatterns on BookingEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( BookingFetchRequested value)?  fetchRequested,TResult Function( BookingLoadMoreRequested value)?  loadMoreRequested,TResult Function( BookingNetworkFailed value)?  networkFailed,TResult Function( BookingAccepted value)?  bookingAccepted,TResult Function( BookingCancelled value)?  bookingCancelled,TResult Function( BookingNewTimeSuggested value)?  newTimeSuggested,TResult Function( BookingDeleted value)?  bookingDeleted,required TResult orElse(),}){
final _that = this;
switch (_that) {
case BookingFetchRequested() when fetchRequested != null:
return fetchRequested(_that);case BookingLoadMoreRequested() when loadMoreRequested != null:
return loadMoreRequested(_that);case BookingNetworkFailed() when networkFailed != null:
return networkFailed(_that);case BookingAccepted() when bookingAccepted != null:
return bookingAccepted(_that);case BookingCancelled() when bookingCancelled != null:
return bookingCancelled(_that);case BookingNewTimeSuggested() when newTimeSuggested != null:
return newTimeSuggested(_that);case BookingDeleted() when bookingDeleted != null:
return bookingDeleted(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( BookingFetchRequested value)  fetchRequested,required TResult Function( BookingLoadMoreRequested value)  loadMoreRequested,required TResult Function( BookingNetworkFailed value)  networkFailed,required TResult Function( BookingAccepted value)  bookingAccepted,required TResult Function( BookingCancelled value)  bookingCancelled,required TResult Function( BookingNewTimeSuggested value)  newTimeSuggested,required TResult Function( BookingDeleted value)  bookingDeleted,}){
final _that = this;
switch (_that) {
case BookingFetchRequested():
return fetchRequested(_that);case BookingLoadMoreRequested():
return loadMoreRequested(_that);case BookingNetworkFailed():
return networkFailed(_that);case BookingAccepted():
return bookingAccepted(_that);case BookingCancelled():
return bookingCancelled(_that);case BookingNewTimeSuggested():
return newTimeSuggested(_that);case BookingDeleted():
return bookingDeleted(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( BookingFetchRequested value)?  fetchRequested,TResult? Function( BookingLoadMoreRequested value)?  loadMoreRequested,TResult? Function( BookingNetworkFailed value)?  networkFailed,TResult? Function( BookingAccepted value)?  bookingAccepted,TResult? Function( BookingCancelled value)?  bookingCancelled,TResult? Function( BookingNewTimeSuggested value)?  newTimeSuggested,TResult? Function( BookingDeleted value)?  bookingDeleted,}){
final _that = this;
switch (_that) {
case BookingFetchRequested() when fetchRequested != null:
return fetchRequested(_that);case BookingLoadMoreRequested() when loadMoreRequested != null:
return loadMoreRequested(_that);case BookingNetworkFailed() when networkFailed != null:
return networkFailed(_that);case BookingAccepted() when bookingAccepted != null:
return bookingAccepted(_that);case BookingCancelled() when bookingCancelled != null:
return bookingCancelled(_that);case BookingNewTimeSuggested() when newTimeSuggested != null:
return newTimeSuggested(_that);case BookingDeleted() when bookingDeleted != null:
return bookingDeleted(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( bool isRefresh)?  fetchRequested,TResult Function()?  loadMoreRequested,TResult Function()?  networkFailed,TResult Function( int bookingId)?  bookingAccepted,TResult Function( int bookingId)?  bookingCancelled,TResult Function( int bookingId,  String date,  String time,  String userMessage)?  newTimeSuggested,TResult Function( int bookingId)?  bookingDeleted,required TResult orElse(),}) {final _that = this;
switch (_that) {
case BookingFetchRequested() when fetchRequested != null:
return fetchRequested(_that.isRefresh);case BookingLoadMoreRequested() when loadMoreRequested != null:
return loadMoreRequested();case BookingNetworkFailed() when networkFailed != null:
return networkFailed();case BookingAccepted() when bookingAccepted != null:
return bookingAccepted(_that.bookingId);case BookingCancelled() when bookingCancelled != null:
return bookingCancelled(_that.bookingId);case BookingNewTimeSuggested() when newTimeSuggested != null:
return newTimeSuggested(_that.bookingId,_that.date,_that.time,_that.userMessage);case BookingDeleted() when bookingDeleted != null:
return bookingDeleted(_that.bookingId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( bool isRefresh)  fetchRequested,required TResult Function()  loadMoreRequested,required TResult Function()  networkFailed,required TResult Function( int bookingId)  bookingAccepted,required TResult Function( int bookingId)  bookingCancelled,required TResult Function( int bookingId,  String date,  String time,  String userMessage)  newTimeSuggested,required TResult Function( int bookingId)  bookingDeleted,}) {final _that = this;
switch (_that) {
case BookingFetchRequested():
return fetchRequested(_that.isRefresh);case BookingLoadMoreRequested():
return loadMoreRequested();case BookingNetworkFailed():
return networkFailed();case BookingAccepted():
return bookingAccepted(_that.bookingId);case BookingCancelled():
return bookingCancelled(_that.bookingId);case BookingNewTimeSuggested():
return newTimeSuggested(_that.bookingId,_that.date,_that.time,_that.userMessage);case BookingDeleted():
return bookingDeleted(_that.bookingId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( bool isRefresh)?  fetchRequested,TResult? Function()?  loadMoreRequested,TResult? Function()?  networkFailed,TResult? Function( int bookingId)?  bookingAccepted,TResult? Function( int bookingId)?  bookingCancelled,TResult? Function( int bookingId,  String date,  String time,  String userMessage)?  newTimeSuggested,TResult? Function( int bookingId)?  bookingDeleted,}) {final _that = this;
switch (_that) {
case BookingFetchRequested() when fetchRequested != null:
return fetchRequested(_that.isRefresh);case BookingLoadMoreRequested() when loadMoreRequested != null:
return loadMoreRequested();case BookingNetworkFailed() when networkFailed != null:
return networkFailed();case BookingAccepted() when bookingAccepted != null:
return bookingAccepted(_that.bookingId);case BookingCancelled() when bookingCancelled != null:
return bookingCancelled(_that.bookingId);case BookingNewTimeSuggested() when newTimeSuggested != null:
return newTimeSuggested(_that.bookingId,_that.date,_that.time,_that.userMessage);case BookingDeleted() when bookingDeleted != null:
return bookingDeleted(_that.bookingId);case _:
  return null;

}
}

}

/// @nodoc


class BookingFetchRequested implements BookingEvent {
  const BookingFetchRequested({this.isRefresh = false});
  

@JsonKey() final  bool isRefresh;

/// Create a copy of BookingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookingFetchRequestedCopyWith<BookingFetchRequested> get copyWith => _$BookingFetchRequestedCopyWithImpl<BookingFetchRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingFetchRequested&&(identical(other.isRefresh, isRefresh) || other.isRefresh == isRefresh));
}


@override
int get hashCode => Object.hash(runtimeType,isRefresh);

@override
String toString() {
  return 'BookingEvent.fetchRequested(isRefresh: $isRefresh)';
}


}

/// @nodoc
abstract mixin class $BookingFetchRequestedCopyWith<$Res> implements $BookingEventCopyWith<$Res> {
  factory $BookingFetchRequestedCopyWith(BookingFetchRequested value, $Res Function(BookingFetchRequested) _then) = _$BookingFetchRequestedCopyWithImpl;
@useResult
$Res call({
 bool isRefresh
});




}
/// @nodoc
class _$BookingFetchRequestedCopyWithImpl<$Res>
    implements $BookingFetchRequestedCopyWith<$Res> {
  _$BookingFetchRequestedCopyWithImpl(this._self, this._then);

  final BookingFetchRequested _self;
  final $Res Function(BookingFetchRequested) _then;

/// Create a copy of BookingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? isRefresh = null,}) {
  return _then(BookingFetchRequested(
isRefresh: null == isRefresh ? _self.isRefresh : isRefresh // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class BookingLoadMoreRequested implements BookingEvent {
  const BookingLoadMoreRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingLoadMoreRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BookingEvent.loadMoreRequested()';
}


}




/// @nodoc


class BookingNetworkFailed implements BookingEvent {
  const BookingNetworkFailed();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingNetworkFailed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BookingEvent.networkFailed()';
}


}




/// @nodoc


class BookingAccepted implements BookingEvent {
  const BookingAccepted({required this.bookingId});
  

 final  int bookingId;

/// Create a copy of BookingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookingAcceptedCopyWith<BookingAccepted> get copyWith => _$BookingAcceptedCopyWithImpl<BookingAccepted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingAccepted&&(identical(other.bookingId, bookingId) || other.bookingId == bookingId));
}


@override
int get hashCode => Object.hash(runtimeType,bookingId);

@override
String toString() {
  return 'BookingEvent.bookingAccepted(bookingId: $bookingId)';
}


}

/// @nodoc
abstract mixin class $BookingAcceptedCopyWith<$Res> implements $BookingEventCopyWith<$Res> {
  factory $BookingAcceptedCopyWith(BookingAccepted value, $Res Function(BookingAccepted) _then) = _$BookingAcceptedCopyWithImpl;
@useResult
$Res call({
 int bookingId
});




}
/// @nodoc
class _$BookingAcceptedCopyWithImpl<$Res>
    implements $BookingAcceptedCopyWith<$Res> {
  _$BookingAcceptedCopyWithImpl(this._self, this._then);

  final BookingAccepted _self;
  final $Res Function(BookingAccepted) _then;

/// Create a copy of BookingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? bookingId = null,}) {
  return _then(BookingAccepted(
bookingId: null == bookingId ? _self.bookingId : bookingId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class BookingCancelled implements BookingEvent {
  const BookingCancelled({required this.bookingId});
  

 final  int bookingId;

/// Create a copy of BookingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookingCancelledCopyWith<BookingCancelled> get copyWith => _$BookingCancelledCopyWithImpl<BookingCancelled>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingCancelled&&(identical(other.bookingId, bookingId) || other.bookingId == bookingId));
}


@override
int get hashCode => Object.hash(runtimeType,bookingId);

@override
String toString() {
  return 'BookingEvent.bookingCancelled(bookingId: $bookingId)';
}


}

/// @nodoc
abstract mixin class $BookingCancelledCopyWith<$Res> implements $BookingEventCopyWith<$Res> {
  factory $BookingCancelledCopyWith(BookingCancelled value, $Res Function(BookingCancelled) _then) = _$BookingCancelledCopyWithImpl;
@useResult
$Res call({
 int bookingId
});




}
/// @nodoc
class _$BookingCancelledCopyWithImpl<$Res>
    implements $BookingCancelledCopyWith<$Res> {
  _$BookingCancelledCopyWithImpl(this._self, this._then);

  final BookingCancelled _self;
  final $Res Function(BookingCancelled) _then;

/// Create a copy of BookingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? bookingId = null,}) {
  return _then(BookingCancelled(
bookingId: null == bookingId ? _self.bookingId : bookingId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class BookingNewTimeSuggested implements BookingEvent {
  const BookingNewTimeSuggested({required this.bookingId, required this.date, required this.time, required this.userMessage});
  

 final  int bookingId;
 final  String date;
 final  String time;
 final  String userMessage;

/// Create a copy of BookingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookingNewTimeSuggestedCopyWith<BookingNewTimeSuggested> get copyWith => _$BookingNewTimeSuggestedCopyWithImpl<BookingNewTimeSuggested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingNewTimeSuggested&&(identical(other.bookingId, bookingId) || other.bookingId == bookingId)&&(identical(other.date, date) || other.date == date)&&(identical(other.time, time) || other.time == time)&&(identical(other.userMessage, userMessage) || other.userMessage == userMessage));
}


@override
int get hashCode => Object.hash(runtimeType,bookingId,date,time,userMessage);

@override
String toString() {
  return 'BookingEvent.newTimeSuggested(bookingId: $bookingId, date: $date, time: $time, userMessage: $userMessage)';
}


}

/// @nodoc
abstract mixin class $BookingNewTimeSuggestedCopyWith<$Res> implements $BookingEventCopyWith<$Res> {
  factory $BookingNewTimeSuggestedCopyWith(BookingNewTimeSuggested value, $Res Function(BookingNewTimeSuggested) _then) = _$BookingNewTimeSuggestedCopyWithImpl;
@useResult
$Res call({
 int bookingId, String date, String time, String userMessage
});




}
/// @nodoc
class _$BookingNewTimeSuggestedCopyWithImpl<$Res>
    implements $BookingNewTimeSuggestedCopyWith<$Res> {
  _$BookingNewTimeSuggestedCopyWithImpl(this._self, this._then);

  final BookingNewTimeSuggested _self;
  final $Res Function(BookingNewTimeSuggested) _then;

/// Create a copy of BookingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? bookingId = null,Object? date = null,Object? time = null,Object? userMessage = null,}) {
  return _then(BookingNewTimeSuggested(
bookingId: null == bookingId ? _self.bookingId : bookingId // ignore: cast_nullable_to_non_nullable
as int,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String,userMessage: null == userMessage ? _self.userMessage : userMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class BookingDeleted implements BookingEvent {
  const BookingDeleted({required this.bookingId});
  

 final  int bookingId;

/// Create a copy of BookingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookingDeletedCopyWith<BookingDeleted> get copyWith => _$BookingDeletedCopyWithImpl<BookingDeleted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingDeleted&&(identical(other.bookingId, bookingId) || other.bookingId == bookingId));
}


@override
int get hashCode => Object.hash(runtimeType,bookingId);

@override
String toString() {
  return 'BookingEvent.bookingDeleted(bookingId: $bookingId)';
}


}

/// @nodoc
abstract mixin class $BookingDeletedCopyWith<$Res> implements $BookingEventCopyWith<$Res> {
  factory $BookingDeletedCopyWith(BookingDeleted value, $Res Function(BookingDeleted) _then) = _$BookingDeletedCopyWithImpl;
@useResult
$Res call({
 int bookingId
});




}
/// @nodoc
class _$BookingDeletedCopyWithImpl<$Res>
    implements $BookingDeletedCopyWith<$Res> {
  _$BookingDeletedCopyWithImpl(this._self, this._then);

  final BookingDeleted _self;
  final $Res Function(BookingDeleted) _then;

/// Create a copy of BookingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? bookingId = null,}) {
  return _then(BookingDeleted(
bookingId: null == bookingId ? _self.bookingId : bookingId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
