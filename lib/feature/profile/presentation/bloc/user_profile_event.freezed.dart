// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_profile_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserProfileEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserProfileEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserProfileEvent()';
}


}

/// @nodoc
class $UserProfileEventCopyWith<$Res>  {
$UserProfileEventCopyWith(UserProfileEvent _, $Res Function(UserProfileEvent) __);
}


/// Adds pattern-matching-related methods to [UserProfileEvent].
extension UserProfileEventPatterns on UserProfileEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( UserProfileLoaded value)?  profileLoaded,TResult Function( UserProfileUpdated value)?  profileUpdated,TResult Function( UserProfileCitiesFetched value)?  citiesFetched,TResult Function( UserProfileDeleted value)?  profileDeleted,TResult Function( UserProfileUserChanged value)?  userChanged,TResult Function( UserProfileBookingCountsRefreshed value)?  bookingCountsRefreshed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case UserProfileLoaded() when profileLoaded != null:
return profileLoaded(_that);case UserProfileUpdated() when profileUpdated != null:
return profileUpdated(_that);case UserProfileCitiesFetched() when citiesFetched != null:
return citiesFetched(_that);case UserProfileDeleted() when profileDeleted != null:
return profileDeleted(_that);case UserProfileUserChanged() when userChanged != null:
return userChanged(_that);case UserProfileBookingCountsRefreshed() when bookingCountsRefreshed != null:
return bookingCountsRefreshed(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( UserProfileLoaded value)  profileLoaded,required TResult Function( UserProfileUpdated value)  profileUpdated,required TResult Function( UserProfileCitiesFetched value)  citiesFetched,required TResult Function( UserProfileDeleted value)  profileDeleted,required TResult Function( UserProfileUserChanged value)  userChanged,required TResult Function( UserProfileBookingCountsRefreshed value)  bookingCountsRefreshed,}){
final _that = this;
switch (_that) {
case UserProfileLoaded():
return profileLoaded(_that);case UserProfileUpdated():
return profileUpdated(_that);case UserProfileCitiesFetched():
return citiesFetched(_that);case UserProfileDeleted():
return profileDeleted(_that);case UserProfileUserChanged():
return userChanged(_that);case UserProfileBookingCountsRefreshed():
return bookingCountsRefreshed(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( UserProfileLoaded value)?  profileLoaded,TResult? Function( UserProfileUpdated value)?  profileUpdated,TResult? Function( UserProfileCitiesFetched value)?  citiesFetched,TResult? Function( UserProfileDeleted value)?  profileDeleted,TResult? Function( UserProfileUserChanged value)?  userChanged,TResult? Function( UserProfileBookingCountsRefreshed value)?  bookingCountsRefreshed,}){
final _that = this;
switch (_that) {
case UserProfileLoaded() when profileLoaded != null:
return profileLoaded(_that);case UserProfileUpdated() when profileUpdated != null:
return profileUpdated(_that);case UserProfileCitiesFetched() when citiesFetched != null:
return citiesFetched(_that);case UserProfileDeleted() when profileDeleted != null:
return profileDeleted(_that);case UserProfileUserChanged() when userChanged != null:
return userChanged(_that);case UserProfileBookingCountsRefreshed() when bookingCountsRefreshed != null:
return bookingCountsRefreshed(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( bool forceRefresh)?  profileLoaded,TResult Function( Map<String, dynamic> data,  String? avatarPath)?  profileUpdated,TResult Function()?  citiesFetched,TResult Function()?  profileDeleted,TResult Function( User user)?  userChanged,TResult Function()?  bookingCountsRefreshed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case UserProfileLoaded() when profileLoaded != null:
return profileLoaded(_that.forceRefresh);case UserProfileUpdated() when profileUpdated != null:
return profileUpdated(_that.data,_that.avatarPath);case UserProfileCitiesFetched() when citiesFetched != null:
return citiesFetched();case UserProfileDeleted() when profileDeleted != null:
return profileDeleted();case UserProfileUserChanged() when userChanged != null:
return userChanged(_that.user);case UserProfileBookingCountsRefreshed() when bookingCountsRefreshed != null:
return bookingCountsRefreshed();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( bool forceRefresh)  profileLoaded,required TResult Function( Map<String, dynamic> data,  String? avatarPath)  profileUpdated,required TResult Function()  citiesFetched,required TResult Function()  profileDeleted,required TResult Function( User user)  userChanged,required TResult Function()  bookingCountsRefreshed,}) {final _that = this;
switch (_that) {
case UserProfileLoaded():
return profileLoaded(_that.forceRefresh);case UserProfileUpdated():
return profileUpdated(_that.data,_that.avatarPath);case UserProfileCitiesFetched():
return citiesFetched();case UserProfileDeleted():
return profileDeleted();case UserProfileUserChanged():
return userChanged(_that.user);case UserProfileBookingCountsRefreshed():
return bookingCountsRefreshed();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( bool forceRefresh)?  profileLoaded,TResult? Function( Map<String, dynamic> data,  String? avatarPath)?  profileUpdated,TResult? Function()?  citiesFetched,TResult? Function()?  profileDeleted,TResult? Function( User user)?  userChanged,TResult? Function()?  bookingCountsRefreshed,}) {final _that = this;
switch (_that) {
case UserProfileLoaded() when profileLoaded != null:
return profileLoaded(_that.forceRefresh);case UserProfileUpdated() when profileUpdated != null:
return profileUpdated(_that.data,_that.avatarPath);case UserProfileCitiesFetched() when citiesFetched != null:
return citiesFetched();case UserProfileDeleted() when profileDeleted != null:
return profileDeleted();case UserProfileUserChanged() when userChanged != null:
return userChanged(_that.user);case UserProfileBookingCountsRefreshed() when bookingCountsRefreshed != null:
return bookingCountsRefreshed();case _:
  return null;

}
}

}

/// @nodoc


class UserProfileLoaded implements UserProfileEvent {
  const UserProfileLoaded({this.forceRefresh = false});
  

@JsonKey() final  bool forceRefresh;

/// Create a copy of UserProfileEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserProfileLoadedCopyWith<UserProfileLoaded> get copyWith => _$UserProfileLoadedCopyWithImpl<UserProfileLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserProfileLoaded&&(identical(other.forceRefresh, forceRefresh) || other.forceRefresh == forceRefresh));
}


@override
int get hashCode => Object.hash(runtimeType,forceRefresh);

@override
String toString() {
  return 'UserProfileEvent.profileLoaded(forceRefresh: $forceRefresh)';
}


}

/// @nodoc
abstract mixin class $UserProfileLoadedCopyWith<$Res> implements $UserProfileEventCopyWith<$Res> {
  factory $UserProfileLoadedCopyWith(UserProfileLoaded value, $Res Function(UserProfileLoaded) _then) = _$UserProfileLoadedCopyWithImpl;
@useResult
$Res call({
 bool forceRefresh
});




}
/// @nodoc
class _$UserProfileLoadedCopyWithImpl<$Res>
    implements $UserProfileLoadedCopyWith<$Res> {
  _$UserProfileLoadedCopyWithImpl(this._self, this._then);

  final UserProfileLoaded _self;
  final $Res Function(UserProfileLoaded) _then;

/// Create a copy of UserProfileEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? forceRefresh = null,}) {
  return _then(UserProfileLoaded(
forceRefresh: null == forceRefresh ? _self.forceRefresh : forceRefresh // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class UserProfileUpdated implements UserProfileEvent {
  const UserProfileUpdated(final  Map<String, dynamic> data, {this.avatarPath}): _data = data;
  

 final  Map<String, dynamic> _data;
 Map<String, dynamic> get data {
  if (_data is EqualUnmodifiableMapView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_data);
}

 final  String? avatarPath;

/// Create a copy of UserProfileEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserProfileUpdatedCopyWith<UserProfileUpdated> get copyWith => _$UserProfileUpdatedCopyWithImpl<UserProfileUpdated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserProfileUpdated&&const DeepCollectionEquality().equals(other._data, _data)&&(identical(other.avatarPath, avatarPath) || other.avatarPath == avatarPath));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data),avatarPath);

@override
String toString() {
  return 'UserProfileEvent.profileUpdated(data: $data, avatarPath: $avatarPath)';
}


}

/// @nodoc
abstract mixin class $UserProfileUpdatedCopyWith<$Res> implements $UserProfileEventCopyWith<$Res> {
  factory $UserProfileUpdatedCopyWith(UserProfileUpdated value, $Res Function(UserProfileUpdated) _then) = _$UserProfileUpdatedCopyWithImpl;
@useResult
$Res call({
 Map<String, dynamic> data, String? avatarPath
});




}
/// @nodoc
class _$UserProfileUpdatedCopyWithImpl<$Res>
    implements $UserProfileUpdatedCopyWith<$Res> {
  _$UserProfileUpdatedCopyWithImpl(this._self, this._then);

  final UserProfileUpdated _self;
  final $Res Function(UserProfileUpdated) _then;

/// Create a copy of UserProfileEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,Object? avatarPath = freezed,}) {
  return _then(UserProfileUpdated(
null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,avatarPath: freezed == avatarPath ? _self.avatarPath : avatarPath // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class UserProfileCitiesFetched implements UserProfileEvent {
  const UserProfileCitiesFetched();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserProfileCitiesFetched);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserProfileEvent.citiesFetched()';
}


}




/// @nodoc


class UserProfileDeleted implements UserProfileEvent {
  const UserProfileDeleted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserProfileDeleted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserProfileEvent.profileDeleted()';
}


}




/// @nodoc


class UserProfileUserChanged implements UserProfileEvent {
  const UserProfileUserChanged(this.user);
  

 final  User user;

/// Create a copy of UserProfileEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserProfileUserChangedCopyWith<UserProfileUserChanged> get copyWith => _$UserProfileUserChangedCopyWithImpl<UserProfileUserChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserProfileUserChanged&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString() {
  return 'UserProfileEvent.userChanged(user: $user)';
}


}

/// @nodoc
abstract mixin class $UserProfileUserChangedCopyWith<$Res> implements $UserProfileEventCopyWith<$Res> {
  factory $UserProfileUserChangedCopyWith(UserProfileUserChanged value, $Res Function(UserProfileUserChanged) _then) = _$UserProfileUserChangedCopyWithImpl;
@useResult
$Res call({
 User user
});


$UserCopyWith<$Res> get user;

}
/// @nodoc
class _$UserProfileUserChangedCopyWithImpl<$Res>
    implements $UserProfileUserChangedCopyWith<$Res> {
  _$UserProfileUserChangedCopyWithImpl(this._self, this._then);

  final UserProfileUserChanged _self;
  final $Res Function(UserProfileUserChanged) _then;

/// Create a copy of UserProfileEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = null,}) {
  return _then(UserProfileUserChanged(
null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,
  ));
}

/// Create a copy of UserProfileEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get user {
  
  return $UserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

/// @nodoc


class UserProfileBookingCountsRefreshed implements UserProfileEvent {
  const UserProfileBookingCountsRefreshed();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserProfileBookingCountsRefreshed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserProfileEvent.bookingCountsRefreshed()';
}


}




// dart format on
