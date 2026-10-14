// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'unit_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UnitModel {

 int get id; String get title; double get price; String? get description; String? get address;@JsonKey(name: 'image_url') String? get imageUrl; int? get bedrooms; int? get bathrooms; double? get area;@JsonKey(name: 'is_favourite') bool? get isFavorite;@JsonKey(name: 'offer_type') String? get offerType;
/// Create a copy of UnitModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnitModelCopyWith<UnitModel> get copyWith => _$UnitModelCopyWithImpl<UnitModel>(this as UnitModel, _$identity);

  /// Serializes this UnitModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnitModel&&super == other&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.price, price) || other.price == price)&&(identical(other.description, description) || other.description == description)&&(identical(other.address, address) || other.address == address)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.bedrooms, bedrooms) || other.bedrooms == bedrooms)&&(identical(other.bathrooms, bathrooms) || other.bathrooms == bathrooms)&&(identical(other.area, area) || other.area == area)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite)&&(identical(other.offerType, offerType) || other.offerType == offerType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,super.hashCode,id,title,price,description,address,imageUrl,bedrooms,bathrooms,area,isFavorite,offerType);

@override
String toString() {
  return 'UnitModel(id: $id, title: $title, price: $price, description: $description, address: $address, imageUrl: $imageUrl, bedrooms: $bedrooms, bathrooms: $bathrooms, area: $area, isFavorite: $isFavorite, offerType: $offerType)';
}


}

/// @nodoc
abstract mixin class $UnitModelCopyWith<$Res>  {
  factory $UnitModelCopyWith(UnitModel value, $Res Function(UnitModel) _then) = _$UnitModelCopyWithImpl;
@useResult
$Res call({
 int id, String title, double price, String? description, String? address,@JsonKey(name: 'image_url') String? imageUrl, int? bedrooms, int? bathrooms, double? area,@JsonKey(name: 'is_favourite') bool? isFavorite,@JsonKey(name: 'offer_type') String? offerType
});




}
/// @nodoc
class _$UnitModelCopyWithImpl<$Res>
    implements $UnitModelCopyWith<$Res> {
  _$UnitModelCopyWithImpl(this._self, this._then);

  final UnitModel _self;
  final $Res Function(UnitModel) _then;

/// Create a copy of UnitModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? price = null,Object? description = freezed,Object? address = freezed,Object? imageUrl = freezed,Object? bedrooms = freezed,Object? bathrooms = freezed,Object? area = freezed,Object? isFavorite = freezed,Object? offerType = freezed,}) {
  return _then(_self.copyWith(
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


/// Adds pattern-matching-related methods to [UnitModel].
extension UnitModelPatterns on UnitModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UnitModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UnitModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UnitModel value)  $default,){
final _that = this;
switch (_that) {
case _UnitModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UnitModel value)?  $default,){
final _that = this;
switch (_that) {
case _UnitModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String title,  double price,  String? description,  String? address, @JsonKey(name: 'image_url')  String? imageUrl,  int? bedrooms,  int? bathrooms,  double? area, @JsonKey(name: 'is_favourite')  bool? isFavorite, @JsonKey(name: 'offer_type')  String? offerType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UnitModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String title,  double price,  String? description,  String? address, @JsonKey(name: 'image_url')  String? imageUrl,  int? bedrooms,  int? bathrooms,  double? area, @JsonKey(name: 'is_favourite')  bool? isFavorite, @JsonKey(name: 'offer_type')  String? offerType)  $default,) {final _that = this;
switch (_that) {
case _UnitModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String title,  double price,  String? description,  String? address, @JsonKey(name: 'image_url')  String? imageUrl,  int? bedrooms,  int? bathrooms,  double? area, @JsonKey(name: 'is_favourite')  bool? isFavorite, @JsonKey(name: 'offer_type')  String? offerType)?  $default,) {final _that = this;
switch (_that) {
case _UnitModel() when $default != null:
return $default(_that.id,_that.title,_that.price,_that.description,_that.address,_that.imageUrl,_that.bedrooms,_that.bathrooms,_that.area,_that.isFavorite,_that.offerType);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UnitModel extends UnitModel {
  const _UnitModel({this.id = 0, this.title = 'No Title', this.price = 0.0, this.description, this.address, @JsonKey(name: 'image_url') this.imageUrl, this.bedrooms, this.bathrooms, this.area, @JsonKey(name: 'is_favourite') this.isFavorite, @JsonKey(name: 'offer_type') this.offerType}): super._();
  factory _UnitModel.fromJson(Map<String, dynamic> json) => _$UnitModelFromJson(json);

@override@JsonKey() final  int id;
@override@JsonKey() final  String title;
@override@JsonKey() final  double price;
@override final  String? description;
@override final  String? address;
@override@JsonKey(name: 'image_url') final  String? imageUrl;
@override final  int? bedrooms;
@override final  int? bathrooms;
@override final  double? area;
@override@JsonKey(name: 'is_favourite') final  bool? isFavorite;
@override@JsonKey(name: 'offer_type') final  String? offerType;

/// Create a copy of UnitModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UnitModelCopyWith<_UnitModel> get copyWith => __$UnitModelCopyWithImpl<_UnitModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UnitModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UnitModel&&super == other&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.price, price) || other.price == price)&&(identical(other.description, description) || other.description == description)&&(identical(other.address, address) || other.address == address)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.bedrooms, bedrooms) || other.bedrooms == bedrooms)&&(identical(other.bathrooms, bathrooms) || other.bathrooms == bathrooms)&&(identical(other.area, area) || other.area == area)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite)&&(identical(other.offerType, offerType) || other.offerType == offerType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,super.hashCode,id,title,price,description,address,imageUrl,bedrooms,bathrooms,area,isFavorite,offerType);

@override
String toString() {
  return 'UnitModel(id: $id, title: $title, price: $price, description: $description, address: $address, imageUrl: $imageUrl, bedrooms: $bedrooms, bathrooms: $bathrooms, area: $area, isFavorite: $isFavorite, offerType: $offerType)';
}


}

/// @nodoc
abstract mixin class _$UnitModelCopyWith<$Res> implements $UnitModelCopyWith<$Res> {
  factory _$UnitModelCopyWith(_UnitModel value, $Res Function(_UnitModel) _then) = __$UnitModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String title, double price, String? description, String? address,@JsonKey(name: 'image_url') String? imageUrl, int? bedrooms, int? bathrooms, double? area,@JsonKey(name: 'is_favourite') bool? isFavorite,@JsonKey(name: 'offer_type') String? offerType
});




}
/// @nodoc
class __$UnitModelCopyWithImpl<$Res>
    implements _$UnitModelCopyWith<$Res> {
  __$UnitModelCopyWithImpl(this._self, this._then);

  final _UnitModel _self;
  final $Res Function(_UnitModel) _then;

/// Create a copy of UnitModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? price = null,Object? description = freezed,Object? address = freezed,Object? imageUrl = freezed,Object? bedrooms = freezed,Object? bathrooms = freezed,Object? area = freezed,Object? isFavorite = freezed,Object? offerType = freezed,}) {
  return _then(_UnitModel(
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
