// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contact_request_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ContactRequestEntity {

 String get name; String get email; String get phone; String get address; String get message;
/// Create a copy of ContactRequestEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContactRequestEntityCopyWith<ContactRequestEntity> get copyWith => _$ContactRequestEntityCopyWithImpl<ContactRequestEntity>(this as ContactRequestEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContactRequestEntity&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.address, address) || other.address == address)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,name,email,phone,address,message);

@override
String toString() {
  return 'ContactRequestEntity(name: $name, email: $email, phone: $phone, address: $address, message: $message)';
}


}

/// @nodoc
abstract mixin class $ContactRequestEntityCopyWith<$Res>  {
  factory $ContactRequestEntityCopyWith(ContactRequestEntity value, $Res Function(ContactRequestEntity) _then) = _$ContactRequestEntityCopyWithImpl;
@useResult
$Res call({
 String name, String email, String phone, String address, String message
});




}
/// @nodoc
class _$ContactRequestEntityCopyWithImpl<$Res>
    implements $ContactRequestEntityCopyWith<$Res> {
  _$ContactRequestEntityCopyWithImpl(this._self, this._then);

  final ContactRequestEntity _self;
  final $Res Function(ContactRequestEntity) _then;

/// Create a copy of ContactRequestEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? email = null,Object? phone = null,Object? address = null,Object? message = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ContactRequestEntity].
extension ContactRequestEntityPatterns on ContactRequestEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ContactRequestEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ContactRequestEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ContactRequestEntity value)  $default,){
final _that = this;
switch (_that) {
case _ContactRequestEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ContactRequestEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ContactRequestEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String email,  String phone,  String address,  String message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ContactRequestEntity() when $default != null:
return $default(_that.name,_that.email,_that.phone,_that.address,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String email,  String phone,  String address,  String message)  $default,) {final _that = this;
switch (_that) {
case _ContactRequestEntity():
return $default(_that.name,_that.email,_that.phone,_that.address,_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String email,  String phone,  String address,  String message)?  $default,) {final _that = this;
switch (_that) {
case _ContactRequestEntity() when $default != null:
return $default(_that.name,_that.email,_that.phone,_that.address,_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _ContactRequestEntity implements ContactRequestEntity {
  const _ContactRequestEntity({required this.name, required this.email, required this.phone, required this.address, required this.message});
  

@override final  String name;
@override final  String email;
@override final  String phone;
@override final  String address;
@override final  String message;

/// Create a copy of ContactRequestEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContactRequestEntityCopyWith<_ContactRequestEntity> get copyWith => __$ContactRequestEntityCopyWithImpl<_ContactRequestEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ContactRequestEntity&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.address, address) || other.address == address)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,name,email,phone,address,message);

@override
String toString() {
  return 'ContactRequestEntity(name: $name, email: $email, phone: $phone, address: $address, message: $message)';
}


}

/// @nodoc
abstract mixin class _$ContactRequestEntityCopyWith<$Res> implements $ContactRequestEntityCopyWith<$Res> {
  factory _$ContactRequestEntityCopyWith(_ContactRequestEntity value, $Res Function(_ContactRequestEntity) _then) = __$ContactRequestEntityCopyWithImpl;
@override @useResult
$Res call({
 String name, String email, String phone, String address, String message
});




}
/// @nodoc
class __$ContactRequestEntityCopyWithImpl<$Res>
    implements _$ContactRequestEntityCopyWith<$Res> {
  __$ContactRequestEntityCopyWithImpl(this._self, this._then);

  final _ContactRequestEntity _self;
  final $Res Function(_ContactRequestEntity) _then;

/// Create a copy of ContactRequestEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? email = null,Object? phone = null,Object? address = null,Object? message = null,}) {
  return _then(_ContactRequestEntity(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
