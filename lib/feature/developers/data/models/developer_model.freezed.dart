// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'developer_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DeveloperModel {

 int get id; String get name; String get logo; String? get email; String? get phone; String? get address;
/// Create a copy of DeveloperModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeveloperModelCopyWith<DeveloperModel> get copyWith => _$DeveloperModelCopyWithImpl<DeveloperModel>(this as DeveloperModel, _$identity);

  /// Serializes this DeveloperModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as DeveloperModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeveloperModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.logo, _this.logo) || other.logo == _this.logo)&&(identical(other.email, _this.email) || other.email == _this.email)&&(identical(other.phone, _this.phone) || other.phone == _this.phone)&&(identical(other.address, _this.address) || other.address == _this.address));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as DeveloperModel;
  return Object.hash(runtimeType,_this.id,_this.name,_this.logo,_this.email,_this.phone,_this.address);
}

@override
String toString() {
  final _this = this as DeveloperModel;
  return 'DeveloperModel(id: ${_this.id}, name: ${_this.name}, logo: ${_this.logo}, email: ${_this.email}, phone: ${_this.phone}, address: ${_this.address})';
}


}

/// @nodoc
abstract mixin class $DeveloperModelCopyWith<$Res>  {
  factory $DeveloperModelCopyWith(DeveloperModel value, $Res Function(DeveloperModel) _then) = _$DeveloperModelCopyWithImpl;
@useResult
$Res call({
 int id, String name, String logo, String? email, String? phone, String? address
});




}
/// @nodoc
class _$DeveloperModelCopyWithImpl<$Res>
    implements $DeveloperModelCopyWith<$Res> {
  _$DeveloperModelCopyWithImpl(this._self, this._then);

  final DeveloperModel _self;
  final $Res Function(DeveloperModel) _then;

/// Create a copy of DeveloperModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? logo = null,Object? email = freezed,Object? phone = freezed,Object? address = freezed,}) {
  return _then(DeveloperModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,logo: null == logo ? _self.logo : logo // ignore: cast_nullable_to_non_nullable
as String,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [DeveloperModel].
extension DeveloperModelPatterns on DeveloperModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DeveloperModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DeveloperModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DeveloperModel value)  $default,){
final _that = this;
switch (_that) {
case _DeveloperModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DeveloperModel value)?  $default,){
final _that = this;
switch (_that) {
case _DeveloperModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String logo,  String? email,  String? phone,  String? address)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DeveloperModel() when $default != null:
return $default(_that.id,_that.name,_that.logo,_that.email,_that.phone,_that.address);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String logo,  String? email,  String? phone,  String? address)  $default,) {final _that = this;
switch (_that) {
case _DeveloperModel():
return $default(_that.id,_that.name,_that.logo,_that.email,_that.phone,_that.address);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String logo,  String? email,  String? phone,  String? address)?  $default,) {final _that = this;
switch (_that) {
case _DeveloperModel() when $default != null:
return $default(_that.id,_that.name,_that.logo,_that.email,_that.phone,_that.address);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DeveloperModel extends DeveloperModel {
  const _DeveloperModel({this.id = 0, this.name = '', this.logo = '', this.email, this.phone, this.address}): super._();
  factory _DeveloperModel.fromJson(Map<String, dynamic> json) => _$DeveloperModelFromJson(json);

@override@JsonKey() final  int id;
@override@JsonKey() final  String name;
@override@JsonKey() final  String logo;
@override final  String? email;
@override final  String? phone;
@override final  String? address;

/// Create a copy of DeveloperModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeveloperModelCopyWith<_DeveloperModel> get copyWith => __$DeveloperModelCopyWithImpl<_DeveloperModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DeveloperModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeveloperModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.logo, logo) || other.logo == logo)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.address, address) || other.address == address));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,logo,email,phone,address);
}

@override
String toString() {
    return 'DeveloperModel(id: $id, name: $name, logo: $logo, email: $email, phone: $phone, address: $address)';
}


}

/// @nodoc
abstract mixin class _$DeveloperModelCopyWith<$Res> implements $DeveloperModelCopyWith<$Res> {
  factory _$DeveloperModelCopyWith(_DeveloperModel value, $Res Function(_DeveloperModel) _then) = __$DeveloperModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String logo, String? email, String? phone, String? address
});




}
/// @nodoc
class __$DeveloperModelCopyWithImpl<$Res>
    implements _$DeveloperModelCopyWith<$Res> {
  __$DeveloperModelCopyWithImpl(this._self, this._then);

  final _DeveloperModel _self;
  final $Res Function(_DeveloperModel) _then;

/// Create a copy of DeveloperModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? logo = null,Object? email = freezed,Object? phone = freezed,Object? address = freezed,}) {
  return _then(_DeveloperModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,logo: null == logo ? _self.logo : logo // ignore: cast_nullable_to_non_nullable
as String,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
