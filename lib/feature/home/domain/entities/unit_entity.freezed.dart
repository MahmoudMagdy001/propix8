// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'unit_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UnitEntity {

 int get id; String get title; double get price; String? get description; String? get address; String? get imageUrl; int? get bedrooms; int? get bathrooms; double? get area; bool? get isFavorite; String? get offerType;
/// Create a copy of UnitEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnitEntityCopyWith<UnitEntity> get copyWith => _$UnitEntityCopyWithImpl<UnitEntity>(this as UnitEntity, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as UnitEntity;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnitEntity&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.price, _this.price) || other.price == _this.price)&&(identical(other.description, _this.description) || other.description == _this.description)&&(identical(other.address, _this.address) || other.address == _this.address)&&(identical(other.imageUrl, _this.imageUrl) || other.imageUrl == _this.imageUrl)&&(identical(other.bedrooms, _this.bedrooms) || other.bedrooms == _this.bedrooms)&&(identical(other.bathrooms, _this.bathrooms) || other.bathrooms == _this.bathrooms)&&(identical(other.area, _this.area) || other.area == _this.area)&&(identical(other.isFavorite, _this.isFavorite) || other.isFavorite == _this.isFavorite)&&(identical(other.offerType, _this.offerType) || other.offerType == _this.offerType));
}


@override
int get hashCode {
  final _this = this as UnitEntity;
  return Object.hash(runtimeType,_this.id,_this.title,_this.price,_this.description,_this.address,_this.imageUrl,_this.bedrooms,_this.bathrooms,_this.area,_this.isFavorite,_this.offerType);
}

@override
String toString() {
  final _this = this as UnitEntity;
  return 'UnitEntity(id: ${_this.id}, title: ${_this.title}, price: ${_this.price}, description: ${_this.description}, address: ${_this.address}, imageUrl: ${_this.imageUrl}, bedrooms: ${_this.bedrooms}, bathrooms: ${_this.bathrooms}, area: ${_this.area}, isFavorite: ${_this.isFavorite}, offerType: ${_this.offerType})';
}


}

/// @nodoc
abstract mixin class $UnitEntityCopyWith<$Res>  {
  factory $UnitEntityCopyWith(UnitEntity value, $Res Function(UnitEntity) _then) = _$UnitEntityCopyWithImpl;
@useResult
$Res call({
 int id, String title, double price, String? description, String? address, String? imageUrl, int? bedrooms, int? bathrooms, double? area, bool? isFavorite, String? offerType
});




}
/// @nodoc
class _$UnitEntityCopyWithImpl<$Res>
    implements $UnitEntityCopyWith<$Res> {
  _$UnitEntityCopyWithImpl(this._self, this._then);

  final UnitEntity _self;
  final $Res Function(UnitEntity) _then;

/// Create a copy of UnitEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? price = null,Object? description = freezed,Object? address = freezed,Object? imageUrl = freezed,Object? bedrooms = freezed,Object? bathrooms = freezed,Object? area = freezed,Object? isFavorite = freezed,Object? offerType = freezed,}) {
  return _then(UnitEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,bedrooms: freezed == bedrooms ? _self.bedrooms : bedrooms // ignore: cast_nullable_to_non_nullable
as int?,bathrooms: freezed == bathrooms ? _self.bathrooms : bathrooms // ignore: cast_nullable_to_non_nullable
as int?,area: freezed == area ? _self.area : area // ignore: cast_nullable_to_non_nullable
as double?,isFavorite: freezed == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool?,offerType: freezed == offerType ? _self.offerType : offerType // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [UnitEntity].
extension UnitEntityPatterns on UnitEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UnitEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UnitEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UnitEntity value)  $default,){
final _that = this;
switch (_that) {
case _UnitEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UnitEntity value)?  $default,){
final _that = this;
switch (_that) {
case _UnitEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String title,  double price,  String? description,  String? address,  String? imageUrl,  int? bedrooms,  int? bathrooms,  double? area,  bool? isFavorite,  String? offerType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UnitEntity() when $default != null:
return $default(_that.id,_that.title,_that.price,_that.description,_that.address,_that.imageUrl,_that.bedrooms,_that.bathrooms,_that.area,_that.isFavorite,_that.offerType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String title,  double price,  String? description,  String? address,  String? imageUrl,  int? bedrooms,  int? bathrooms,  double? area,  bool? isFavorite,  String? offerType)  $default,) {final _that = this;
switch (_that) {
case _UnitEntity():
return $default(_that.id,_that.title,_that.price,_that.description,_that.address,_that.imageUrl,_that.bedrooms,_that.bathrooms,_that.area,_that.isFavorite,_that.offerType);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String title,  double price,  String? description,  String? address,  String? imageUrl,  int? bedrooms,  int? bathrooms,  double? area,  bool? isFavorite,  String? offerType)?  $default,) {final _that = this;
switch (_that) {
case _UnitEntity() when $default != null:
return $default(_that.id,_that.title,_that.price,_that.description,_that.address,_that.imageUrl,_that.bedrooms,_that.bathrooms,_that.area,_that.isFavorite,_that.offerType);case _:
  return null;

}
}

}

/// @nodoc


class _UnitEntity extends UnitEntity {
  const _UnitEntity({required this.id, required this.title, required this.price, this.description, this.address, this.imageUrl, this.bedrooms, this.bathrooms, this.area, this.isFavorite, this.offerType}): super._();
  

@override final  int id;
@override final  String title;
@override final  double price;
@override final  String? description;
@override final  String? address;
@override final  String? imageUrl;
@override final  int? bedrooms;
@override final  int? bathrooms;
@override final  double? area;
@override final  bool? isFavorite;
@override final  String? offerType;

/// Create a copy of UnitEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UnitEntityCopyWith<_UnitEntity> get copyWith => __$UnitEntityCopyWithImpl<_UnitEntity>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _UnitEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.price, price) || other.price == price)&&(identical(other.description, description) || other.description == description)&&(identical(other.address, address) || other.address == address)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.bedrooms, bedrooms) || other.bedrooms == bedrooms)&&(identical(other.bathrooms, bathrooms) || other.bathrooms == bathrooms)&&(identical(other.area, area) || other.area == area)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite)&&(identical(other.offerType, offerType) || other.offerType == offerType));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,title,price,description,address,imageUrl,bedrooms,bathrooms,area,isFavorite,offerType);
}

@override
String toString() {
    return 'UnitEntity(id: $id, title: $title, price: $price, description: $description, address: $address, imageUrl: $imageUrl, bedrooms: $bedrooms, bathrooms: $bathrooms, area: $area, isFavorite: $isFavorite, offerType: $offerType)';
}


}

/// @nodoc
abstract mixin class _$UnitEntityCopyWith<$Res> implements $UnitEntityCopyWith<$Res> {
  factory _$UnitEntityCopyWith(_UnitEntity value, $Res Function(_UnitEntity) _then) = __$UnitEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, String title, double price, String? description, String? address, String? imageUrl, int? bedrooms, int? bathrooms, double? area, bool? isFavorite, String? offerType
});




}
/// @nodoc
class __$UnitEntityCopyWithImpl<$Res>
    implements _$UnitEntityCopyWith<$Res> {
  __$UnitEntityCopyWithImpl(this._self, this._then);

  final _UnitEntity _self;
  final $Res Function(_UnitEntity) _then;

/// Create a copy of UnitEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? price = null,Object? description = freezed,Object? address = freezed,Object? imageUrl = freezed,Object? bedrooms = freezed,Object? bathrooms = freezed,Object? area = freezed,Object? isFavorite = freezed,Object? offerType = freezed,}) {
  return _then(_UnitEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,bedrooms: freezed == bedrooms ? _self.bedrooms : bedrooms // ignore: cast_nullable_to_non_nullable
as int?,bathrooms: freezed == bathrooms ? _self.bathrooms : bathrooms // ignore: cast_nullable_to_non_nullable
as int?,area: freezed == area ? _self.area : area // ignore: cast_nullable_to_non_nullable
as double?,isFavorite: freezed == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool?,offerType: freezed == offerType ? _self.offerType : offerType // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
