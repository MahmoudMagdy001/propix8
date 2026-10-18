// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorite_unit_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FavoriteUnitModel {

 int get id; UnitModel get unit; DateTime get createdAt;
/// Create a copy of FavoriteUnitModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FavoriteUnitModelCopyWith<FavoriteUnitModel> get copyWith => _$FavoriteUnitModelCopyWithImpl<FavoriteUnitModel>(this as FavoriteUnitModel, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as FavoriteUnitModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FavoriteUnitModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.unit, _this.unit) || other.unit == _this.unit)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt));
}


@override
int get hashCode {
  final _this = this as FavoriteUnitModel;
  return Object.hash(runtimeType,_this.id,_this.unit,_this.createdAt);
}

@override
String toString() {
  final _this = this as FavoriteUnitModel;
  return 'FavoriteUnitModel(id: ${_this.id}, unit: ${_this.unit}, createdAt: ${_this.createdAt})';
}


}

/// @nodoc
abstract mixin class $FavoriteUnitModelCopyWith<$Res>  {
  factory $FavoriteUnitModelCopyWith(FavoriteUnitModel value, $Res Function(FavoriteUnitModel) _then) = _$FavoriteUnitModelCopyWithImpl;
@useResult
$Res call({
 int id, UnitModel unit, DateTime createdAt
});


$UnitModelCopyWith<$Res> get unit;

}
/// @nodoc
class _$FavoriteUnitModelCopyWithImpl<$Res>
    implements $FavoriteUnitModelCopyWith<$Res> {
  _$FavoriteUnitModelCopyWithImpl(this._self, this._then);

  final FavoriteUnitModel _self;
  final $Res Function(FavoriteUnitModel) _then;

/// Create a copy of FavoriteUnitModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? unit = null,Object? createdAt = null,}) {
  return _then(FavoriteUnitModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as UnitModel,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}
/// Create a copy of FavoriteUnitModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UnitModelCopyWith<$Res> get unit {
  
  return $UnitModelCopyWith<$Res>(_self.unit, (value) {
    return _then(_self.copyWith(unit: value));
  });
}
}


/// Adds pattern-matching-related methods to [FavoriteUnitModel].
extension FavoriteUnitModelPatterns on FavoriteUnitModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FavoriteUnitModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FavoriteUnitModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FavoriteUnitModel value)  $default,){
final _that = this;
switch (_that) {
case _FavoriteUnitModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FavoriteUnitModel value)?  $default,){
final _that = this;
switch (_that) {
case _FavoriteUnitModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  UnitModel unit,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FavoriteUnitModel() when $default != null:
return $default(_that.id,_that.unit,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  UnitModel unit,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _FavoriteUnitModel():
return $default(_that.id,_that.unit,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  UnitModel unit,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _FavoriteUnitModel() when $default != null:
return $default(_that.id,_that.unit,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc


class _FavoriteUnitModel extends FavoriteUnitModel {
  const _FavoriteUnitModel({required this.id, required this.unit, required this.createdAt}): super._();
  

@override final  int id;
@override final  UnitModel unit;
@override final  DateTime createdAt;

/// Create a copy of FavoriteUnitModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FavoriteUnitModelCopyWith<_FavoriteUnitModel> get copyWith => __$FavoriteUnitModelCopyWithImpl<_FavoriteUnitModel>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _FavoriteUnitModel&&(identical(other.id, id) || other.id == id)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,unit,createdAt);
}

@override
String toString() {
    return 'FavoriteUnitModel(id: $id, unit: $unit, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$FavoriteUnitModelCopyWith<$Res> implements $FavoriteUnitModelCopyWith<$Res> {
  factory _$FavoriteUnitModelCopyWith(_FavoriteUnitModel value, $Res Function(_FavoriteUnitModel) _then) = __$FavoriteUnitModelCopyWithImpl;
@override @useResult
$Res call({
 int id, UnitModel unit, DateTime createdAt
});


@override $UnitModelCopyWith<$Res> get unit;

}
/// @nodoc
class __$FavoriteUnitModelCopyWithImpl<$Res>
    implements _$FavoriteUnitModelCopyWith<$Res> {
  __$FavoriteUnitModelCopyWithImpl(this._self, this._then);

  final _FavoriteUnitModel _self;
  final $Res Function(_FavoriteUnitModel) _then;

/// Create a copy of FavoriteUnitModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? unit = null,Object? createdAt = null,}) {
  return _then(_FavoriteUnitModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as UnitModel,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

/// Create a copy of FavoriteUnitModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UnitModelCopyWith<$Res> get unit {
  
  return $UnitModelCopyWith<$Res>(_self.unit, (value) {
    return _then(_self.copyWith(unit: value));
  });
}
}

// dart format on
