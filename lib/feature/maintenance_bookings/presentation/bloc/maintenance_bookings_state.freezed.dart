// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'maintenance_bookings_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MaintenanceBookingsState {

 MaintenanceBookingsStatus get status; List<MaintenanceBookingEntity> get bookings; String? get errorMessage; int get currentPage; int get lastPage;
/// Create a copy of MaintenanceBookingsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MaintenanceBookingsStateCopyWith<MaintenanceBookingsState> get copyWith => _$MaintenanceBookingsStateCopyWithImpl<MaintenanceBookingsState>(this as MaintenanceBookingsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MaintenanceBookingsState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.bookings, bookings)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.lastPage, lastPage) || other.lastPage == lastPage));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(bookings),errorMessage,currentPage,lastPage);

@override
String toString() {
  return 'MaintenanceBookingsState(status: $status, bookings: $bookings, errorMessage: $errorMessage, currentPage: $currentPage, lastPage: $lastPage)';
}


}

/// @nodoc
abstract mixin class $MaintenanceBookingsStateCopyWith<$Res>  {
  factory $MaintenanceBookingsStateCopyWith(MaintenanceBookingsState value, $Res Function(MaintenanceBookingsState) _then) = _$MaintenanceBookingsStateCopyWithImpl;
@useResult
$Res call({
 MaintenanceBookingsStatus status, List<MaintenanceBookingEntity> bookings, String? errorMessage, int currentPage, int lastPage
});




}
/// @nodoc
class _$MaintenanceBookingsStateCopyWithImpl<$Res>
    implements $MaintenanceBookingsStateCopyWith<$Res> {
  _$MaintenanceBookingsStateCopyWithImpl(this._self, this._then);

  final MaintenanceBookingsState _self;
  final $Res Function(MaintenanceBookingsState) _then;

/// Create a copy of MaintenanceBookingsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? bookings = null,Object? errorMessage = freezed,Object? currentPage = null,Object? lastPage = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as MaintenanceBookingsStatus,bookings: null == bookings ? _self.bookings : bookings // ignore: cast_nullable_to_non_nullable
as List<MaintenanceBookingEntity>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,lastPage: null == lastPage ? _self.lastPage : lastPage // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [MaintenanceBookingsState].
extension MaintenanceBookingsStatePatterns on MaintenanceBookingsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MaintenanceBookingsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MaintenanceBookingsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MaintenanceBookingsState value)  $default,){
final _that = this;
switch (_that) {
case _MaintenanceBookingsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MaintenanceBookingsState value)?  $default,){
final _that = this;
switch (_that) {
case _MaintenanceBookingsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( MaintenanceBookingsStatus status,  List<MaintenanceBookingEntity> bookings,  String? errorMessage,  int currentPage,  int lastPage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MaintenanceBookingsState() when $default != null:
return $default(_that.status,_that.bookings,_that.errorMessage,_that.currentPage,_that.lastPage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( MaintenanceBookingsStatus status,  List<MaintenanceBookingEntity> bookings,  String? errorMessage,  int currentPage,  int lastPage)  $default,) {final _that = this;
switch (_that) {
case _MaintenanceBookingsState():
return $default(_that.status,_that.bookings,_that.errorMessage,_that.currentPage,_that.lastPage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( MaintenanceBookingsStatus status,  List<MaintenanceBookingEntity> bookings,  String? errorMessage,  int currentPage,  int lastPage)?  $default,) {final _that = this;
switch (_that) {
case _MaintenanceBookingsState() when $default != null:
return $default(_that.status,_that.bookings,_that.errorMessage,_that.currentPage,_that.lastPage);case _:
  return null;

}
}

}

/// @nodoc


class _MaintenanceBookingsState extends MaintenanceBookingsState {
  const _MaintenanceBookingsState({this.status = MaintenanceBookingsStatus.initial, final  List<MaintenanceBookingEntity> bookings = const [], this.errorMessage, this.currentPage = 1, this.lastPage = 1}): _bookings = bookings,super._();
  

@override@JsonKey() final  MaintenanceBookingsStatus status;
 final  List<MaintenanceBookingEntity> _bookings;
@override@JsonKey() List<MaintenanceBookingEntity> get bookings {
  if (_bookings is EqualUnmodifiableListView) return _bookings;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_bookings);
}

@override final  String? errorMessage;
@override@JsonKey() final  int currentPage;
@override@JsonKey() final  int lastPage;

/// Create a copy of MaintenanceBookingsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MaintenanceBookingsStateCopyWith<_MaintenanceBookingsState> get copyWith => __$MaintenanceBookingsStateCopyWithImpl<_MaintenanceBookingsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MaintenanceBookingsState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._bookings, _bookings)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.lastPage, lastPage) || other.lastPage == lastPage));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_bookings),errorMessage,currentPage,lastPage);

@override
String toString() {
  return 'MaintenanceBookingsState(status: $status, bookings: $bookings, errorMessage: $errorMessage, currentPage: $currentPage, lastPage: $lastPage)';
}


}

/// @nodoc
abstract mixin class _$MaintenanceBookingsStateCopyWith<$Res> implements $MaintenanceBookingsStateCopyWith<$Res> {
  factory _$MaintenanceBookingsStateCopyWith(_MaintenanceBookingsState value, $Res Function(_MaintenanceBookingsState) _then) = __$MaintenanceBookingsStateCopyWithImpl;
@override @useResult
$Res call({
 MaintenanceBookingsStatus status, List<MaintenanceBookingEntity> bookings, String? errorMessage, int currentPage, int lastPage
});




}
/// @nodoc
class __$MaintenanceBookingsStateCopyWithImpl<$Res>
    implements _$MaintenanceBookingsStateCopyWith<$Res> {
  __$MaintenanceBookingsStateCopyWithImpl(this._self, this._then);

  final _MaintenanceBookingsState _self;
  final $Res Function(_MaintenanceBookingsState) _then;

/// Create a copy of MaintenanceBookingsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? bookings = null,Object? errorMessage = freezed,Object? currentPage = null,Object? lastPage = null,}) {
  return _then(_MaintenanceBookingsState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as MaintenanceBookingsStatus,bookings: null == bookings ? _self._bookings : bookings // ignore: cast_nullable_to_non_nullable
as List<MaintenanceBookingEntity>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,lastPage: null == lastPage ? _self.lastPage : lastPage // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
