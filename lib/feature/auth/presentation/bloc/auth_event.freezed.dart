// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthEvent {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'AuthEvent()';
}


}

/// @nodoc
class $AuthEventCopyWith<$Res>  {
$AuthEventCopyWith(AuthEvent _, $Res Function(AuthEvent) __);
}


/// Adds pattern-matching-related methods to [AuthEvent].
extension AuthEventPatterns on AuthEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CheckAuthStatusRequested value)?  checkAuthStatusRequested,TResult Function( LoginRequested value)?  loginRequested,TResult Function( RegisterRequested value)?  registerRequested,TResult Function( LogoutRequested value)?  logoutRequested,TResult Function( ClearLocalSessionRequested value)?  clearLocalSessionRequested,TResult Function( ResendVerificationEmailRequested value)?  resendVerificationEmailRequested,TResult Function( VerifyEmailRequested value)?  verifyEmailRequested,TResult Function( AuthUserUpdated value)?  authUserUpdated,TResult Function( CheckUserProfileRequested value)?  checkUserProfileRequested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CheckAuthStatusRequested() when checkAuthStatusRequested != null:
return checkAuthStatusRequested(_that);case LoginRequested() when loginRequested != null:
return loginRequested(_that);case RegisterRequested() when registerRequested != null:
return registerRequested(_that);case LogoutRequested() when logoutRequested != null:
return logoutRequested(_that);case ClearLocalSessionRequested() when clearLocalSessionRequested != null:
return clearLocalSessionRequested(_that);case ResendVerificationEmailRequested() when resendVerificationEmailRequested != null:
return resendVerificationEmailRequested(_that);case VerifyEmailRequested() when verifyEmailRequested != null:
return verifyEmailRequested(_that);case AuthUserUpdated() when authUserUpdated != null:
return authUserUpdated(_that);case CheckUserProfileRequested() when checkUserProfileRequested != null:
return checkUserProfileRequested(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CheckAuthStatusRequested value)  checkAuthStatusRequested,required TResult Function( LoginRequested value)  loginRequested,required TResult Function( RegisterRequested value)  registerRequested,required TResult Function( LogoutRequested value)  logoutRequested,required TResult Function( ClearLocalSessionRequested value)  clearLocalSessionRequested,required TResult Function( ResendVerificationEmailRequested value)  resendVerificationEmailRequested,required TResult Function( VerifyEmailRequested value)  verifyEmailRequested,required TResult Function( AuthUserUpdated value)  authUserUpdated,required TResult Function( CheckUserProfileRequested value)  checkUserProfileRequested,}){
final _that = this;
switch (_that) {
case CheckAuthStatusRequested():
return checkAuthStatusRequested(_that);case LoginRequested():
return loginRequested(_that);case RegisterRequested():
return registerRequested(_that);case LogoutRequested():
return logoutRequested(_that);case ClearLocalSessionRequested():
return clearLocalSessionRequested(_that);case ResendVerificationEmailRequested():
return resendVerificationEmailRequested(_that);case VerifyEmailRequested():
return verifyEmailRequested(_that);case AuthUserUpdated():
return authUserUpdated(_that);case CheckUserProfileRequested():
return checkUserProfileRequested(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CheckAuthStatusRequested value)?  checkAuthStatusRequested,TResult? Function( LoginRequested value)?  loginRequested,TResult? Function( RegisterRequested value)?  registerRequested,TResult? Function( LogoutRequested value)?  logoutRequested,TResult? Function( ClearLocalSessionRequested value)?  clearLocalSessionRequested,TResult? Function( ResendVerificationEmailRequested value)?  resendVerificationEmailRequested,TResult? Function( VerifyEmailRequested value)?  verifyEmailRequested,TResult? Function( AuthUserUpdated value)?  authUserUpdated,TResult? Function( CheckUserProfileRequested value)?  checkUserProfileRequested,}){
final _that = this;
switch (_that) {
case CheckAuthStatusRequested() when checkAuthStatusRequested != null:
return checkAuthStatusRequested(_that);case LoginRequested() when loginRequested != null:
return loginRequested(_that);case RegisterRequested() when registerRequested != null:
return registerRequested(_that);case LogoutRequested() when logoutRequested != null:
return logoutRequested(_that);case ClearLocalSessionRequested() when clearLocalSessionRequested != null:
return clearLocalSessionRequested(_that);case ResendVerificationEmailRequested() when resendVerificationEmailRequested != null:
return resendVerificationEmailRequested(_that);case VerifyEmailRequested() when verifyEmailRequested != null:
return verifyEmailRequested(_that);case AuthUserUpdated() when authUserUpdated != null:
return authUserUpdated(_that);case CheckUserProfileRequested() when checkUserProfileRequested != null:
return checkUserProfileRequested(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  checkAuthStatusRequested,TResult Function( String email,  String password)?  loginRequested,TResult Function( RegisterRequest request)?  registerRequested,TResult Function()?  logoutRequested,TResult Function()?  clearLocalSessionRequested,TResult Function( String email)?  resendVerificationEmailRequested,TResult Function( String url)?  verifyEmailRequested,TResult Function( User user)?  authUserUpdated,TResult Function( bool isBackgroundSync)?  checkUserProfileRequested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CheckAuthStatusRequested() when checkAuthStatusRequested != null:
return checkAuthStatusRequested();case LoginRequested() when loginRequested != null:
return loginRequested(_that.email,_that.password);case RegisterRequested() when registerRequested != null:
return registerRequested(_that.request);case LogoutRequested() when logoutRequested != null:
return logoutRequested();case ClearLocalSessionRequested() when clearLocalSessionRequested != null:
return clearLocalSessionRequested();case ResendVerificationEmailRequested() when resendVerificationEmailRequested != null:
return resendVerificationEmailRequested(_that.email);case VerifyEmailRequested() when verifyEmailRequested != null:
return verifyEmailRequested(_that.url);case AuthUserUpdated() when authUserUpdated != null:
return authUserUpdated(_that.user);case CheckUserProfileRequested() when checkUserProfileRequested != null:
return checkUserProfileRequested(_that.isBackgroundSync);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  checkAuthStatusRequested,required TResult Function( String email,  String password)  loginRequested,required TResult Function( RegisterRequest request)  registerRequested,required TResult Function()  logoutRequested,required TResult Function()  clearLocalSessionRequested,required TResult Function( String email)  resendVerificationEmailRequested,required TResult Function( String url)  verifyEmailRequested,required TResult Function( User user)  authUserUpdated,required TResult Function( bool isBackgroundSync)  checkUserProfileRequested,}) {final _that = this;
switch (_that) {
case CheckAuthStatusRequested():
return checkAuthStatusRequested();case LoginRequested():
return loginRequested(_that.email,_that.password);case RegisterRequested():
return registerRequested(_that.request);case LogoutRequested():
return logoutRequested();case ClearLocalSessionRequested():
return clearLocalSessionRequested();case ResendVerificationEmailRequested():
return resendVerificationEmailRequested(_that.email);case VerifyEmailRequested():
return verifyEmailRequested(_that.url);case AuthUserUpdated():
return authUserUpdated(_that.user);case CheckUserProfileRequested():
return checkUserProfileRequested(_that.isBackgroundSync);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  checkAuthStatusRequested,TResult? Function( String email,  String password)?  loginRequested,TResult? Function( RegisterRequest request)?  registerRequested,TResult? Function()?  logoutRequested,TResult? Function()?  clearLocalSessionRequested,TResult? Function( String email)?  resendVerificationEmailRequested,TResult? Function( String url)?  verifyEmailRequested,TResult? Function( User user)?  authUserUpdated,TResult? Function( bool isBackgroundSync)?  checkUserProfileRequested,}) {final _that = this;
switch (_that) {
case CheckAuthStatusRequested() when checkAuthStatusRequested != null:
return checkAuthStatusRequested();case LoginRequested() when loginRequested != null:
return loginRequested(_that.email,_that.password);case RegisterRequested() when registerRequested != null:
return registerRequested(_that.request);case LogoutRequested() when logoutRequested != null:
return logoutRequested();case ClearLocalSessionRequested() when clearLocalSessionRequested != null:
return clearLocalSessionRequested();case ResendVerificationEmailRequested() when resendVerificationEmailRequested != null:
return resendVerificationEmailRequested(_that.email);case VerifyEmailRequested() when verifyEmailRequested != null:
return verifyEmailRequested(_that.url);case AuthUserUpdated() when authUserUpdated != null:
return authUserUpdated(_that.user);case CheckUserProfileRequested() when checkUserProfileRequested != null:
return checkUserProfileRequested(_that.isBackgroundSync);case _:
  return null;

}
}

}

/// @nodoc


class CheckAuthStatusRequested implements AuthEvent {
  const CheckAuthStatusRequested();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckAuthStatusRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'AuthEvent.checkAuthStatusRequested()';
}


}




/// @nodoc


class LoginRequested implements AuthEvent {
  const LoginRequested({required this.email, required this.password});
  

 final  String email;
 final  String password;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginRequestedCopyWith<LoginRequested> get copyWith => _$LoginRequestedCopyWithImpl<LoginRequested>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginRequested&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password));
}


@override
int get hashCode {
    return Object.hash(runtimeType,email,password);
}

@override
String toString() {
    return 'AuthEvent.loginRequested(email: $email, password: $password)';
}


}

/// @nodoc
abstract mixin class $LoginRequestedCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory $LoginRequestedCopyWith(LoginRequested value, $Res Function(LoginRequested) _then) = _$LoginRequestedCopyWithImpl;
@useResult
$Res call({
 String email, String password
});




}
/// @nodoc
class _$LoginRequestedCopyWithImpl<$Res>
    implements $LoginRequestedCopyWith<$Res> {
  _$LoginRequestedCopyWithImpl(this._self, this._then);

  final LoginRequested _self;
  final $Res Function(LoginRequested) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,Object? password = null,}) {
  return _then(LoginRequested(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class RegisterRequested implements AuthEvent {
  const RegisterRequested(this.request);
  

 final  RegisterRequest request;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegisterRequestedCopyWith<RegisterRequested> get copyWith => _$RegisterRequestedCopyWithImpl<RegisterRequested>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterRequested&&(identical(other.request, request) || other.request == request));
}


@override
int get hashCode {
    return Object.hash(runtimeType,request);
}

@override
String toString() {
    return 'AuthEvent.registerRequested(request: $request)';
}


}

/// @nodoc
abstract mixin class $RegisterRequestedCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory $RegisterRequestedCopyWith(RegisterRequested value, $Res Function(RegisterRequested) _then) = _$RegisterRequestedCopyWithImpl;
@useResult
$Res call({
 RegisterRequest request
});


$RegisterRequestCopyWith<$Res> get request;

}
/// @nodoc
class _$RegisterRequestedCopyWithImpl<$Res>
    implements $RegisterRequestedCopyWith<$Res> {
  _$RegisterRequestedCopyWithImpl(this._self, this._then);

  final RegisterRequested _self;
  final $Res Function(RegisterRequested) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? request = null,}) {
  return _then(RegisterRequested(
null == request ? _self.request : request // ignore: cast_nullable_to_non_nullable
as RegisterRequest,
  ));
}

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RegisterRequestCopyWith<$Res> get request {
  
  return $RegisterRequestCopyWith<$Res>(_self.request, (value) {
    return _then(_self.copyWith(request: value));
  });
}
}

/// @nodoc


class LogoutRequested implements AuthEvent {
  const LogoutRequested();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is LogoutRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'AuthEvent.logoutRequested()';
}


}




/// @nodoc


class ClearLocalSessionRequested implements AuthEvent {
  const ClearLocalSessionRequested();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ClearLocalSessionRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'AuthEvent.clearLocalSessionRequested()';
}


}




/// @nodoc


class ResendVerificationEmailRequested implements AuthEvent {
  const ResendVerificationEmailRequested(this.email);
  

 final  String email;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResendVerificationEmailRequestedCopyWith<ResendVerificationEmailRequested> get copyWith => _$ResendVerificationEmailRequestedCopyWithImpl<ResendVerificationEmailRequested>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ResendVerificationEmailRequested&&(identical(other.email, email) || other.email == email));
}


@override
int get hashCode {
    return Object.hash(runtimeType,email);
}

@override
String toString() {
    return 'AuthEvent.resendVerificationEmailRequested(email: $email)';
}


}

/// @nodoc
abstract mixin class $ResendVerificationEmailRequestedCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory $ResendVerificationEmailRequestedCopyWith(ResendVerificationEmailRequested value, $Res Function(ResendVerificationEmailRequested) _then) = _$ResendVerificationEmailRequestedCopyWithImpl;
@useResult
$Res call({
 String email
});




}
/// @nodoc
class _$ResendVerificationEmailRequestedCopyWithImpl<$Res>
    implements $ResendVerificationEmailRequestedCopyWith<$Res> {
  _$ResendVerificationEmailRequestedCopyWithImpl(this._self, this._then);

  final ResendVerificationEmailRequested _self;
  final $Res Function(ResendVerificationEmailRequested) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,}) {
  return _then(ResendVerificationEmailRequested(
null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class VerifyEmailRequested implements AuthEvent {
  const VerifyEmailRequested(this.url);
  

 final  String url;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VerifyEmailRequestedCopyWith<VerifyEmailRequested> get copyWith => _$VerifyEmailRequestedCopyWithImpl<VerifyEmailRequested>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is VerifyEmailRequested&&(identical(other.url, url) || other.url == url));
}


@override
int get hashCode {
    return Object.hash(runtimeType,url);
}

@override
String toString() {
    return 'AuthEvent.verifyEmailRequested(url: $url)';
}


}

/// @nodoc
abstract mixin class $VerifyEmailRequestedCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory $VerifyEmailRequestedCopyWith(VerifyEmailRequested value, $Res Function(VerifyEmailRequested) _then) = _$VerifyEmailRequestedCopyWithImpl;
@useResult
$Res call({
 String url
});




}
/// @nodoc
class _$VerifyEmailRequestedCopyWithImpl<$Res>
    implements $VerifyEmailRequestedCopyWith<$Res> {
  _$VerifyEmailRequestedCopyWithImpl(this._self, this._then);

  final VerifyEmailRequested _self;
  final $Res Function(VerifyEmailRequested) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? url = null,}) {
  return _then(VerifyEmailRequested(
null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class AuthUserUpdated implements AuthEvent {
  const AuthUserUpdated(this.user);
  

 final  User user;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthUserUpdatedCopyWith<AuthUserUpdated> get copyWith => _$AuthUserUpdatedCopyWithImpl<AuthUserUpdated>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthUserUpdated&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode {
    return Object.hash(runtimeType,user);
}

@override
String toString() {
    return 'AuthEvent.authUserUpdated(user: $user)';
}


}

/// @nodoc
abstract mixin class $AuthUserUpdatedCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory $AuthUserUpdatedCopyWith(AuthUserUpdated value, $Res Function(AuthUserUpdated) _then) = _$AuthUserUpdatedCopyWithImpl;
@useResult
$Res call({
 User user
});


$UserCopyWith<$Res> get user;

}
/// @nodoc
class _$AuthUserUpdatedCopyWithImpl<$Res>
    implements $AuthUserUpdatedCopyWith<$Res> {
  _$AuthUserUpdatedCopyWithImpl(this._self, this._then);

  final AuthUserUpdated _self;
  final $Res Function(AuthUserUpdated) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = null,}) {
  return _then(AuthUserUpdated(
null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,
  ));
}

/// Create a copy of AuthEvent
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


class CheckUserProfileRequested implements AuthEvent {
  const CheckUserProfileRequested({this.isBackgroundSync = false});
  

@JsonKey() final  bool isBackgroundSync;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheckUserProfileRequestedCopyWith<CheckUserProfileRequested> get copyWith => _$CheckUserProfileRequestedCopyWithImpl<CheckUserProfileRequested>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckUserProfileRequested&&(identical(other.isBackgroundSync, isBackgroundSync) || other.isBackgroundSync == isBackgroundSync));
}


@override
int get hashCode {
    return Object.hash(runtimeType,isBackgroundSync);
}

@override
String toString() {
    return 'AuthEvent.checkUserProfileRequested(isBackgroundSync: $isBackgroundSync)';
}


}

/// @nodoc
abstract mixin class $CheckUserProfileRequestedCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory $CheckUserProfileRequestedCopyWith(CheckUserProfileRequested value, $Res Function(CheckUserProfileRequested) _then) = _$CheckUserProfileRequestedCopyWithImpl;
@useResult
$Res call({
 bool isBackgroundSync
});




}
/// @nodoc
class _$CheckUserProfileRequestedCopyWithImpl<$Res>
    implements $CheckUserProfileRequestedCopyWith<$Res> {
  _$CheckUserProfileRequestedCopyWithImpl(this._self, this._then);

  final CheckUserProfileRequested _self;
  final $Res Function(CheckUserProfileRequested) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? isBackgroundSync = null,}) {
  return _then(CheckUserProfileRequested(
isBackgroundSync: null == isBackgroundSync ? _self.isBackgroundSync : isBackgroundSync // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
