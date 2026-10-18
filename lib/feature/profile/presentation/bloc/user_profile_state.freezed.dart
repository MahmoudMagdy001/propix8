// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_profile_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserProfileState {

 UserProfileStatus get status; User? get user; List<City> get cities; int get propertyBookingCount; int get serviceBookingCount; String? get errorMessage;
/// Create a copy of UserProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserProfileStateCopyWith<UserProfileState> get copyWith => _$UserProfileStateCopyWithImpl<UserProfileState>(this as UserProfileState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as UserProfileState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserProfileState&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.user, _this.user) || other.user == _this.user)&&const DeepCollectionEquality().equals(other.cities, _this.cities)&&(identical(other.propertyBookingCount, _this.propertyBookingCount) || other.propertyBookingCount == _this.propertyBookingCount)&&(identical(other.serviceBookingCount, _this.serviceBookingCount) || other.serviceBookingCount == _this.serviceBookingCount)&&(identical(other.errorMessage, _this.errorMessage) || other.errorMessage == _this.errorMessage));
}


@override
int get hashCode {
  final _this = this as UserProfileState;
  return Object.hash(runtimeType,_this.status,_this.user,const DeepCollectionEquality().hash(_this.cities),_this.propertyBookingCount,_this.serviceBookingCount,_this.errorMessage);
}

@override
String toString() {
  final _this = this as UserProfileState;
  return 'UserProfileState(status: ${_this.status}, user: ${_this.user}, cities: ${_this.cities}, propertyBookingCount: ${_this.propertyBookingCount}, serviceBookingCount: ${_this.serviceBookingCount}, errorMessage: ${_this.errorMessage})';
}


}

/// @nodoc
abstract mixin class $UserProfileStateCopyWith<$Res>  {
  factory $UserProfileStateCopyWith(UserProfileState value, $Res Function(UserProfileState) _then) = _$UserProfileStateCopyWithImpl;
@useResult
$Res call({
 UserProfileStatus status, User? user, List<City> cities, int propertyBookingCount, int serviceBookingCount, String? errorMessage
});


$UserCopyWith<$Res>? get user;

}
/// @nodoc
class _$UserProfileStateCopyWithImpl<$Res>
    implements $UserProfileStateCopyWith<$Res> {
  _$UserProfileStateCopyWithImpl(this._self, this._then);

  final UserProfileState _self;
  final $Res Function(UserProfileState) _then;

/// Create a copy of UserProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? user = freezed,Object? cities = null,Object? propertyBookingCount = null,Object? serviceBookingCount = null,Object? errorMessage = freezed,}) {
  return _then(UserProfileState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as UserProfileStatus,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User?,cities: null == cities ? _self.cities : cities // ignore: cast_nullable_to_non_nullable
as List<City>,propertyBookingCount: null == propertyBookingCount ? _self.propertyBookingCount : propertyBookingCount // ignore: cast_nullable_to_non_nullable
as int,serviceBookingCount: null == serviceBookingCount ? _self.serviceBookingCount : serviceBookingCount // ignore: cast_nullable_to_non_nullable
as int,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of UserProfileState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $UserCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// Adds pattern-matching-related methods to [UserProfileState].
extension UserProfileStatePatterns on UserProfileState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserProfileState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserProfileState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserProfileState value)  $default,){
final _that = this;
switch (_that) {
case _UserProfileState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserProfileState value)?  $default,){
final _that = this;
switch (_that) {
case _UserProfileState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( UserProfileStatus status,  User? user,  List<City> cities,  int propertyBookingCount,  int serviceBookingCount,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserProfileState() when $default != null:
return $default(_that.status,_that.user,_that.cities,_that.propertyBookingCount,_that.serviceBookingCount,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( UserProfileStatus status,  User? user,  List<City> cities,  int propertyBookingCount,  int serviceBookingCount,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _UserProfileState():
return $default(_that.status,_that.user,_that.cities,_that.propertyBookingCount,_that.serviceBookingCount,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( UserProfileStatus status,  User? user,  List<City> cities,  int propertyBookingCount,  int serviceBookingCount,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _UserProfileState() when $default != null:
return $default(_that.status,_that.user,_that.cities,_that.propertyBookingCount,_that.serviceBookingCount,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _UserProfileState extends UserProfileState {
  const _UserProfileState({this.status = UserProfileStatus.initial, this.user,  List<City> cities = const <City>[], this.propertyBookingCount = 0, this.serviceBookingCount = 0, this.errorMessage}): _cities = cities,super._();
  

@override@JsonKey() final  UserProfileStatus status;
@override final  User? user;
 final  List<City> _cities;
@override@JsonKey() List<City> get cities {
  if (_cities is EqualUnmodifiableListView) return _cities;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_cities);
}

@override@JsonKey() final  int propertyBookingCount;
@override@JsonKey() final  int serviceBookingCount;
@override final  String? errorMessage;

/// Create a copy of UserProfileState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserProfileStateCopyWith<_UserProfileState> get copyWith => __$UserProfileStateCopyWithImpl<_UserProfileState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserProfileState&&(identical(other.status, status) || other.status == status)&&(identical(other.user, user) || other.user == user)&&const DeepCollectionEquality().equals(other.cities, _cities)&&(identical(other.propertyBookingCount, propertyBookingCount) || other.propertyBookingCount == propertyBookingCount)&&(identical(other.serviceBookingCount, serviceBookingCount) || other.serviceBookingCount == serviceBookingCount)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode {
    return Object.hash(runtimeType,status,user,const DeepCollectionEquality().hash(_cities),propertyBookingCount,serviceBookingCount,errorMessage);
}

@override
String toString() {
    return 'UserProfileState(status: $status, user: $user, cities: $cities, propertyBookingCount: $propertyBookingCount, serviceBookingCount: $serviceBookingCount, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$UserProfileStateCopyWith<$Res> implements $UserProfileStateCopyWith<$Res> {
  factory _$UserProfileStateCopyWith(_UserProfileState value, $Res Function(_UserProfileState) _then) = __$UserProfileStateCopyWithImpl;
@override @useResult
$Res call({
 UserProfileStatus status, User? user, List<City> cities, int propertyBookingCount, int serviceBookingCount, String? errorMessage
});


@override $UserCopyWith<$Res>? get user;

}
/// @nodoc
class __$UserProfileStateCopyWithImpl<$Res>
    implements _$UserProfileStateCopyWith<$Res> {
  __$UserProfileStateCopyWithImpl(this._self, this._then);

  final _UserProfileState _self;
  final $Res Function(_UserProfileState) _then;

/// Create a copy of UserProfileState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? user = freezed,Object? cities = null,Object? propertyBookingCount = null,Object? serviceBookingCount = null,Object? errorMessage = freezed,}) {
  return _then(_UserProfileState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as UserProfileStatus,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User?,cities: null == cities ? _self._cities : cities // ignore: cast_nullable_to_non_nullable
as List<City>,propertyBookingCount: null == propertyBookingCount ? _self.propertyBookingCount : propertyBookingCount // ignore: cast_nullable_to_non_nullable
as int,serviceBookingCount: null == serviceBookingCount ? _self.serviceBookingCount : serviceBookingCount // ignore: cast_nullable_to_non_nullable
as int,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of UserProfileState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $UserCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

// dart format on
