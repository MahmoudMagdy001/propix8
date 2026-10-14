// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contact_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ContactRequestModel {

 String get name; String get email; String get phone; String get address; String get message;
/// Create a copy of ContactRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContactRequestModelCopyWith<ContactRequestModel> get copyWith => _$ContactRequestModelCopyWithImpl<ContactRequestModel>(this as ContactRequestModel, _$identity);

  /// Serializes this ContactRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContactRequestModel&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.address, address) || other.address == address)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,email,phone,address,message);

@override
String toString() {
  return 'ContactRequestModel(name: $name, email: $email, phone: $phone, address: $address, message: $message)';
}


}

/// @nodoc
abstract mixin class $ContactRequestModelCopyWith<$Res>  {
  factory $ContactRequestModelCopyWith(ContactRequestModel value, $Res Function(ContactRequestModel) _then) = _$ContactRequestModelCopyWithImpl;
@useResult
$Res call({
 String name, String email, String phone, String address, String message
});




}
/// @nodoc
class _$ContactRequestModelCopyWithImpl<$Res>
    implements $ContactRequestModelCopyWith<$Res> {
  _$ContactRequestModelCopyWithImpl(this._self, this._then);

  final ContactRequestModel _self;
  final $Res Function(ContactRequestModel) _then;

/// Create a copy of ContactRequestModel
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


/// Adds pattern-matching-related methods to [ContactRequestModel].
extension ContactRequestModelPatterns on ContactRequestModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ContactRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ContactRequestModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ContactRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _ContactRequestModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ContactRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _ContactRequestModel() when $default != null:
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
case _ContactRequestModel() when $default != null:
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
case _ContactRequestModel():
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
case _ContactRequestModel() when $default != null:
return $default(_that.name,_that.email,_that.phone,_that.address,_that.message);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ContactRequestModel extends ContactRequestModel {
  const _ContactRequestModel({required this.name, required this.email, required this.phone, required this.address, required this.message}): super._();
  factory _ContactRequestModel.fromJson(Map<String, dynamic> json) => _$ContactRequestModelFromJson(json);

@override final  String name;
@override final  String email;
@override final  String phone;
@override final  String address;
@override final  String message;

/// Create a copy of ContactRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContactRequestModelCopyWith<_ContactRequestModel> get copyWith => __$ContactRequestModelCopyWithImpl<_ContactRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ContactRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ContactRequestModel&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.address, address) || other.address == address)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,email,phone,address,message);

@override
String toString() {
  return 'ContactRequestModel(name: $name, email: $email, phone: $phone, address: $address, message: $message)';
}


}

/// @nodoc
abstract mixin class _$ContactRequestModelCopyWith<$Res> implements $ContactRequestModelCopyWith<$Res> {
  factory _$ContactRequestModelCopyWith(_ContactRequestModel value, $Res Function(_ContactRequestModel) _then) = __$ContactRequestModelCopyWithImpl;
@override @useResult
$Res call({
 String name, String email, String phone, String address, String message
});




}
/// @nodoc
class __$ContactRequestModelCopyWithImpl<$Res>
    implements _$ContactRequestModelCopyWith<$Res> {
  __$ContactRequestModelCopyWithImpl(this._self, this._then);

  final _ContactRequestModel _self;
  final $Res Function(_ContactRequestModel) _then;

/// Create a copy of ContactRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? email = null,Object? phone = null,Object? address = null,Object? message = null,}) {
  return _then(_ContactRequestModel(
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
