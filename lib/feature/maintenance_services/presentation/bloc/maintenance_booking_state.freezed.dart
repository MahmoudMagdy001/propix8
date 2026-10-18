// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'maintenance_booking_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MaintenanceBookingState {

 BookingSubmissionStatus get status; String? get errorMessage;
/// Create a copy of MaintenanceBookingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MaintenanceBookingStateCopyWith<MaintenanceBookingState> get copyWith => _$MaintenanceBookingStateCopyWithImpl<MaintenanceBookingState>(this as MaintenanceBookingState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MaintenanceBookingState&&(identical(other.status, status) || other.status == status)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,errorMessage);

@override
String toString() {
  return 'MaintenanceBookingState(status: $status, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $MaintenanceBookingStateCopyWith<$Res>  {
  factory $MaintenanceBookingStateCopyWith(MaintenanceBookingState value, $Res Function(MaintenanceBookingState) _then) = _$MaintenanceBookingStateCopyWithImpl;
@useResult
$Res call({
 BookingSubmissionStatus status, String? errorMessage
});




}
/// @nodoc
class _$MaintenanceBookingStateCopyWithImpl<$Res>
    implements $MaintenanceBookingStateCopyWith<$Res> {
  _$MaintenanceBookingStateCopyWithImpl(this._self, this._then);

  final MaintenanceBookingState _self;
  final $Res Function(MaintenanceBookingState) _then;

/// Create a copy of MaintenanceBookingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as BookingSubmissionStatus,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MaintenanceBookingState].
extension MaintenanceBookingStatePatterns on MaintenanceBookingState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MaintenanceBookingState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MaintenanceBookingState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MaintenanceBookingState value)  $default,){
final _that = this;
switch (_that) {
case _MaintenanceBookingState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MaintenanceBookingState value)?  $default,){
final _that = this;
switch (_that) {
case _MaintenanceBookingState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( BookingSubmissionStatus status,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MaintenanceBookingState() when $default != null:
return $default(_that.status,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( BookingSubmissionStatus status,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _MaintenanceBookingState():
return $default(_that.status,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( BookingSubmissionStatus status,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _MaintenanceBookingState() when $default != null:
return $default(_that.status,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _MaintenanceBookingState implements MaintenanceBookingState {
  const _MaintenanceBookingState({this.status = BookingSubmissionStatus.initial, this.errorMessage});
  

@override@JsonKey() final  BookingSubmissionStatus status;
@override final  String? errorMessage;

/// Create a copy of MaintenanceBookingState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MaintenanceBookingStateCopyWith<_MaintenanceBookingState> get copyWith => __$MaintenanceBookingStateCopyWithImpl<_MaintenanceBookingState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MaintenanceBookingState&&(identical(other.status, status) || other.status == status)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,errorMessage);

@override
String toString() {
  return 'MaintenanceBookingState(status: $status, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$MaintenanceBookingStateCopyWith<$Res> implements $MaintenanceBookingStateCopyWith<$Res> {
  factory _$MaintenanceBookingStateCopyWith(_MaintenanceBookingState value, $Res Function(_MaintenanceBookingState) _then) = __$MaintenanceBookingStateCopyWithImpl;
@override @useResult
$Res call({
 BookingSubmissionStatus status, String? errorMessage
});




}
/// @nodoc
class __$MaintenanceBookingStateCopyWithImpl<$Res>
    implements _$MaintenanceBookingStateCopyWith<$Res> {
  __$MaintenanceBookingStateCopyWithImpl(this._self, this._then);

  final _MaintenanceBookingState _self;
  final $Res Function(_MaintenanceBookingState) _then;

/// Create a copy of MaintenanceBookingState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? errorMessage = freezed,}) {
  return _then(_MaintenanceBookingState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as BookingSubmissionStatus,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
