// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'maintenance_services_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MaintenanceServicesState {

 MaintenanceRequestStatus get status; MaintenanceServicesDataEntity? get data; Set<int> get bookedServiceIds; String? get errorMessage;
/// Create a copy of MaintenanceServicesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MaintenanceServicesStateCopyWith<MaintenanceServicesState> get copyWith => _$MaintenanceServicesStateCopyWithImpl<MaintenanceServicesState>(this as MaintenanceServicesState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MaintenanceServicesState&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data)&&const DeepCollectionEquality().equals(other.bookedServiceIds, bookedServiceIds)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,data,const DeepCollectionEquality().hash(bookedServiceIds),errorMessage);

@override
String toString() {
  return 'MaintenanceServicesState(status: $status, data: $data, bookedServiceIds: $bookedServiceIds, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $MaintenanceServicesStateCopyWith<$Res>  {
  factory $MaintenanceServicesStateCopyWith(MaintenanceServicesState value, $Res Function(MaintenanceServicesState) _then) = _$MaintenanceServicesStateCopyWithImpl;
@useResult
$Res call({
 MaintenanceRequestStatus status, MaintenanceServicesDataEntity? data, Set<int> bookedServiceIds, String? errorMessage
});


$MaintenanceServicesDataEntityCopyWith<$Res>? get data;

}
/// @nodoc
class _$MaintenanceServicesStateCopyWithImpl<$Res>
    implements $MaintenanceServicesStateCopyWith<$Res> {
  _$MaintenanceServicesStateCopyWithImpl(this._self, this._then);

  final MaintenanceServicesState _self;
  final $Res Function(MaintenanceServicesState) _then;

/// Create a copy of MaintenanceServicesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? data = freezed,Object? bookedServiceIds = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as MaintenanceRequestStatus,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as MaintenanceServicesDataEntity?,bookedServiceIds: null == bookedServiceIds ? _self.bookedServiceIds : bookedServiceIds // ignore: cast_nullable_to_non_nullable
as Set<int>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of MaintenanceServicesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MaintenanceServicesDataEntityCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $MaintenanceServicesDataEntityCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [MaintenanceServicesState].
extension MaintenanceServicesStatePatterns on MaintenanceServicesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MaintenanceServicesState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MaintenanceServicesState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MaintenanceServicesState value)  $default,){
final _that = this;
switch (_that) {
case _MaintenanceServicesState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MaintenanceServicesState value)?  $default,){
final _that = this;
switch (_that) {
case _MaintenanceServicesState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( MaintenanceRequestStatus status,  MaintenanceServicesDataEntity? data,  Set<int> bookedServiceIds,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MaintenanceServicesState() when $default != null:
return $default(_that.status,_that.data,_that.bookedServiceIds,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( MaintenanceRequestStatus status,  MaintenanceServicesDataEntity? data,  Set<int> bookedServiceIds,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _MaintenanceServicesState():
return $default(_that.status,_that.data,_that.bookedServiceIds,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( MaintenanceRequestStatus status,  MaintenanceServicesDataEntity? data,  Set<int> bookedServiceIds,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _MaintenanceServicesState() when $default != null:
return $default(_that.status,_that.data,_that.bookedServiceIds,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _MaintenanceServicesState implements MaintenanceServicesState {
  const _MaintenanceServicesState({this.status = MaintenanceRequestStatus.initial, this.data, final  Set<int> bookedServiceIds = const <int>{}, this.errorMessage}): _bookedServiceIds = bookedServiceIds;
  

@override@JsonKey() final  MaintenanceRequestStatus status;
@override final  MaintenanceServicesDataEntity? data;
 final  Set<int> _bookedServiceIds;
@override@JsonKey() Set<int> get bookedServiceIds {
  if (_bookedServiceIds is EqualUnmodifiableSetView) return _bookedServiceIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_bookedServiceIds);
}

@override final  String? errorMessage;

/// Create a copy of MaintenanceServicesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MaintenanceServicesStateCopyWith<_MaintenanceServicesState> get copyWith => __$MaintenanceServicesStateCopyWithImpl<_MaintenanceServicesState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MaintenanceServicesState&&(identical(other.status, status) || other.status == status)&&(identical(other.data, data) || other.data == data)&&const DeepCollectionEquality().equals(other._bookedServiceIds, _bookedServiceIds)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,data,const DeepCollectionEquality().hash(_bookedServiceIds),errorMessage);

@override
String toString() {
  return 'MaintenanceServicesState(status: $status, data: $data, bookedServiceIds: $bookedServiceIds, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$MaintenanceServicesStateCopyWith<$Res> implements $MaintenanceServicesStateCopyWith<$Res> {
  factory _$MaintenanceServicesStateCopyWith(_MaintenanceServicesState value, $Res Function(_MaintenanceServicesState) _then) = __$MaintenanceServicesStateCopyWithImpl;
@override @useResult
$Res call({
 MaintenanceRequestStatus status, MaintenanceServicesDataEntity? data, Set<int> bookedServiceIds, String? errorMessage
});


@override $MaintenanceServicesDataEntityCopyWith<$Res>? get data;

}
/// @nodoc
class __$MaintenanceServicesStateCopyWithImpl<$Res>
    implements _$MaintenanceServicesStateCopyWith<$Res> {
  __$MaintenanceServicesStateCopyWithImpl(this._self, this._then);

  final _MaintenanceServicesState _self;
  final $Res Function(_MaintenanceServicesState) _then;

/// Create a copy of MaintenanceServicesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? data = freezed,Object? bookedServiceIds = null,Object? errorMessage = freezed,}) {
  return _then(_MaintenanceServicesState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as MaintenanceRequestStatus,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as MaintenanceServicesDataEntity?,bookedServiceIds: null == bookedServiceIds ? _self._bookedServiceIds : bookedServiceIds // ignore: cast_nullable_to_non_nullable
as Set<int>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of MaintenanceServicesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MaintenanceServicesDataEntityCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $MaintenanceServicesDataEntityCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}

// dart format on
