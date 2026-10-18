// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reset_password_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ResetPasswordEvent {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ResetPasswordEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'ResetPasswordEvent()';
}


}

/// @nodoc
class $ResetPasswordEventCopyWith<$Res>  {
$ResetPasswordEventCopyWith(ResetPasswordEvent _, $Res Function(ResetPasswordEvent) __);
}


/// Adds pattern-matching-related methods to [ResetPasswordEvent].
extension ResetPasswordEventPatterns on ResetPasswordEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ForgotPasswordSubmitted value)?  forgotPasswordSubmitted,TResult Function( ResetPasswordSubmitted value)?  resetPasswordSubmitted,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ForgotPasswordSubmitted() when forgotPasswordSubmitted != null:
return forgotPasswordSubmitted(_that);case ResetPasswordSubmitted() when resetPasswordSubmitted != null:
return resetPasswordSubmitted(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ForgotPasswordSubmitted value)  forgotPasswordSubmitted,required TResult Function( ResetPasswordSubmitted value)  resetPasswordSubmitted,}){
final _that = this;
switch (_that) {
case ForgotPasswordSubmitted():
return forgotPasswordSubmitted(_that);case ResetPasswordSubmitted():
return resetPasswordSubmitted(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ForgotPasswordSubmitted value)?  forgotPasswordSubmitted,TResult? Function( ResetPasswordSubmitted value)?  resetPasswordSubmitted,}){
final _that = this;
switch (_that) {
case ForgotPasswordSubmitted() when forgotPasswordSubmitted != null:
return forgotPasswordSubmitted(_that);case ResetPasswordSubmitted() when resetPasswordSubmitted != null:
return resetPasswordSubmitted(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String email)?  forgotPasswordSubmitted,TResult Function( ResetPasswordRequest request)?  resetPasswordSubmitted,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ForgotPasswordSubmitted() when forgotPasswordSubmitted != null:
return forgotPasswordSubmitted(_that.email);case ResetPasswordSubmitted() when resetPasswordSubmitted != null:
return resetPasswordSubmitted(_that.request);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String email)  forgotPasswordSubmitted,required TResult Function( ResetPasswordRequest request)  resetPasswordSubmitted,}) {final _that = this;
switch (_that) {
case ForgotPasswordSubmitted():
return forgotPasswordSubmitted(_that.email);case ResetPasswordSubmitted():
return resetPasswordSubmitted(_that.request);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String email)?  forgotPasswordSubmitted,TResult? Function( ResetPasswordRequest request)?  resetPasswordSubmitted,}) {final _that = this;
switch (_that) {
case ForgotPasswordSubmitted() when forgotPasswordSubmitted != null:
return forgotPasswordSubmitted(_that.email);case ResetPasswordSubmitted() when resetPasswordSubmitted != null:
return resetPasswordSubmitted(_that.request);case _:
  return null;

}
}

}

/// @nodoc


class ForgotPasswordSubmitted implements ResetPasswordEvent {
  const ForgotPasswordSubmitted(this.email);
  

 final  String email;

/// Create a copy of ResetPasswordEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ForgotPasswordSubmittedCopyWith<ForgotPasswordSubmitted> get copyWith => _$ForgotPasswordSubmittedCopyWithImpl<ForgotPasswordSubmitted>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ForgotPasswordSubmitted&&(identical(other.email, email) || other.email == email));
}


@override
int get hashCode {
    return Object.hash(runtimeType,email);
}

@override
String toString() {
    return 'ResetPasswordEvent.forgotPasswordSubmitted(email: $email)';
}


}

/// @nodoc
abstract mixin class $ForgotPasswordSubmittedCopyWith<$Res> implements $ResetPasswordEventCopyWith<$Res> {
  factory $ForgotPasswordSubmittedCopyWith(ForgotPasswordSubmitted value, $Res Function(ForgotPasswordSubmitted) _then) = _$ForgotPasswordSubmittedCopyWithImpl;
@useResult
$Res call({
 String email
});




}
/// @nodoc
class _$ForgotPasswordSubmittedCopyWithImpl<$Res>
    implements $ForgotPasswordSubmittedCopyWith<$Res> {
  _$ForgotPasswordSubmittedCopyWithImpl(this._self, this._then);

  final ForgotPasswordSubmitted _self;
  final $Res Function(ForgotPasswordSubmitted) _then;

/// Create a copy of ResetPasswordEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,}) {
  return _then(ForgotPasswordSubmitted(
null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ResetPasswordSubmitted implements ResetPasswordEvent {
  const ResetPasswordSubmitted(this.request);
  

 final  ResetPasswordRequest request;

/// Create a copy of ResetPasswordEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResetPasswordSubmittedCopyWith<ResetPasswordSubmitted> get copyWith => _$ResetPasswordSubmittedCopyWithImpl<ResetPasswordSubmitted>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ResetPasswordSubmitted&&(identical(other.request, request) || other.request == request));
}


@override
int get hashCode {
    return Object.hash(runtimeType,request);
}

@override
String toString() {
    return 'ResetPasswordEvent.resetPasswordSubmitted(request: $request)';
}


}

/// @nodoc
abstract mixin class $ResetPasswordSubmittedCopyWith<$Res> implements $ResetPasswordEventCopyWith<$Res> {
  factory $ResetPasswordSubmittedCopyWith(ResetPasswordSubmitted value, $Res Function(ResetPasswordSubmitted) _then) = _$ResetPasswordSubmittedCopyWithImpl;
@useResult
$Res call({
 ResetPasswordRequest request
});


$ResetPasswordRequestCopyWith<$Res> get request;

}
/// @nodoc
class _$ResetPasswordSubmittedCopyWithImpl<$Res>
    implements $ResetPasswordSubmittedCopyWith<$Res> {
  _$ResetPasswordSubmittedCopyWithImpl(this._self, this._then);

  final ResetPasswordSubmitted _self;
  final $Res Function(ResetPasswordSubmitted) _then;

/// Create a copy of ResetPasswordEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? request = null,}) {
  return _then(ResetPasswordSubmitted(
null == request ? _self.request : request // ignore: cast_nullable_to_non_nullable
as ResetPasswordRequest,
  ));
}

/// Create a copy of ResetPasswordEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResetPasswordRequestCopyWith<$Res> get request {
  
  return $ResetPasswordRequestCopyWith<$Res>(_self.request, (value) {
    return _then(_self.copyWith(request: value));
  });
}
}

// dart format on
