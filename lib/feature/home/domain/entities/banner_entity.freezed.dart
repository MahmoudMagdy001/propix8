// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'banner_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BannerEntity {

 int get id; String get image; String get url; int get sortOrder;
/// Create a copy of BannerEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BannerEntityCopyWith<BannerEntity> get copyWith => _$BannerEntityCopyWithImpl<BannerEntity>(this as BannerEntity, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as BannerEntity;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BannerEntity&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.image, _this.image) || other.image == _this.image)&&(identical(other.url, _this.url) || other.url == _this.url)&&(identical(other.sortOrder, _this.sortOrder) || other.sortOrder == _this.sortOrder));
}


@override
int get hashCode {
  final _this = this as BannerEntity;
  return Object.hash(runtimeType,_this.id,_this.image,_this.url,_this.sortOrder);
}

@override
String toString() {
  final _this = this as BannerEntity;
  return 'BannerEntity(id: ${_this.id}, image: ${_this.image}, url: ${_this.url}, sortOrder: ${_this.sortOrder})';
}


}

/// @nodoc
abstract mixin class $BannerEntityCopyWith<$Res>  {
  factory $BannerEntityCopyWith(BannerEntity value, $Res Function(BannerEntity) _then) = _$BannerEntityCopyWithImpl;
@useResult
$Res call({
 int id, String image, String url, int sortOrder
});




}
/// @nodoc
class _$BannerEntityCopyWithImpl<$Res>
    implements $BannerEntityCopyWith<$Res> {
  _$BannerEntityCopyWithImpl(this._self, this._then);

  final BannerEntity _self;
  final $Res Function(BannerEntity) _then;

/// Create a copy of BannerEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? image = null,Object? url = null,Object? sortOrder = null,}) {
  return _then(BannerEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [BannerEntity].
extension BannerEntityPatterns on BannerEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BannerEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BannerEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BannerEntity value)  $default,){
final _that = this;
switch (_that) {
case _BannerEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BannerEntity value)?  $default,){
final _that = this;
switch (_that) {
case _BannerEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String image,  String url,  int sortOrder)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BannerEntity() when $default != null:
return $default(_that.id,_that.image,_that.url,_that.sortOrder);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String image,  String url,  int sortOrder)  $default,) {final _that = this;
switch (_that) {
case _BannerEntity():
return $default(_that.id,_that.image,_that.url,_that.sortOrder);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String image,  String url,  int sortOrder)?  $default,) {final _that = this;
switch (_that) {
case _BannerEntity() when $default != null:
return $default(_that.id,_that.image,_that.url,_that.sortOrder);case _:
  return null;

}
}

}

/// @nodoc


class _BannerEntity implements BannerEntity {
  const _BannerEntity({required this.id, required this.image, required this.url, required this.sortOrder});
  

@override final  int id;
@override final  String image;
@override final  String url;
@override final  int sortOrder;

/// Create a copy of BannerEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BannerEntityCopyWith<_BannerEntity> get copyWith => __$BannerEntityCopyWithImpl<_BannerEntity>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BannerEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.image, image) || other.image == image)&&(identical(other.url, url) || other.url == url)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,image,url,sortOrder);
}

@override
String toString() {
    return 'BannerEntity(id: $id, image: $image, url: $url, sortOrder: $sortOrder)';
}


}

/// @nodoc
abstract mixin class _$BannerEntityCopyWith<$Res> implements $BannerEntityCopyWith<$Res> {
  factory _$BannerEntityCopyWith(_BannerEntity value, $Res Function(_BannerEntity) _then) = __$BannerEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, String image, String url, int sortOrder
});




}
/// @nodoc
class __$BannerEntityCopyWithImpl<$Res>
    implements _$BannerEntityCopyWith<$Res> {
  __$BannerEntityCopyWithImpl(this._self, this._then);

  final _BannerEntity _self;
  final $Res Function(_BannerEntity) _then;

/// Create a copy of BannerEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? image = null,Object? url = null,Object? sortOrder = null,}) {
  return _then(_BannerEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
