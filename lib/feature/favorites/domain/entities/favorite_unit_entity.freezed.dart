// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorite_unit_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FavoriteUnitEntity {

 int get id; UnitEntity get unit; DateTime get createdAt;
/// Create a copy of FavoriteUnitEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FavoriteUnitEntityCopyWith<FavoriteUnitEntity> get copyWith => _$FavoriteUnitEntityCopyWithImpl<FavoriteUnitEntity>(this as FavoriteUnitEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FavoriteUnitEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,unit,createdAt);

@override
String toString() {
  return 'FavoriteUnitEntity(id: $id, unit: $unit, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $FavoriteUnitEntityCopyWith<$Res>  {
  factory $FavoriteUnitEntityCopyWith(FavoriteUnitEntity value, $Res Function(FavoriteUnitEntity) _then) = _$FavoriteUnitEntityCopyWithImpl;
@useResult
$Res call({
 int id, UnitEntity unit, DateTime createdAt
});


$UnitEntityCopyWith<$Res> get unit;

}
/// @nodoc
class _$FavoriteUnitEntityCopyWithImpl<$Res>
    implements $FavoriteUnitEntityCopyWith<$Res> {
  _$FavoriteUnitEntityCopyWithImpl(this._self, this._then);

  final FavoriteUnitEntity _self;
  final $Res Function(FavoriteUnitEntity) _then;

/// Create a copy of FavoriteUnitEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? unit = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as UnitEntity,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}
/// Create a copy of FavoriteUnitEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UnitEntityCopyWith<$Res> get unit {
  
  return $UnitEntityCopyWith<$Res>(_self.unit, (value) {
    return _then(_self.copyWith(unit: value));
  });
}
}


/// Adds pattern-matching-related methods to [FavoriteUnitEntity].
extension FavoriteUnitEntityPatterns on FavoriteUnitEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FavoriteUnitEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FavoriteUnitEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FavoriteUnitEntity value)  $default,){
final _that = this;
switch (_that) {
case _FavoriteUnitEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FavoriteUnitEntity value)?  $default,){
final _that = this;
switch (_that) {
case _FavoriteUnitEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  UnitEntity unit,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FavoriteUnitEntity() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  UnitEntity unit,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _FavoriteUnitEntity():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  UnitEntity unit,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _FavoriteUnitEntity() when $default != null:
return $default(_that.id,_that.unit,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc


class _FavoriteUnitEntity implements FavoriteUnitEntity {
  const _FavoriteUnitEntity({required this.id, required this.unit, required this.createdAt});
  

@override final  int id;
@override final  UnitEntity unit;
@override final  DateTime createdAt;

/// Create a copy of FavoriteUnitEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FavoriteUnitEntityCopyWith<_FavoriteUnitEntity> get copyWith => __$FavoriteUnitEntityCopyWithImpl<_FavoriteUnitEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FavoriteUnitEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,unit,createdAt);

@override
String toString() {
  return 'FavoriteUnitEntity(id: $id, unit: $unit, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$FavoriteUnitEntityCopyWith<$Res> implements $FavoriteUnitEntityCopyWith<$Res> {
  factory _$FavoriteUnitEntityCopyWith(_FavoriteUnitEntity value, $Res Function(_FavoriteUnitEntity) _then) = __$FavoriteUnitEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, UnitEntity unit, DateTime createdAt
});


@override $UnitEntityCopyWith<$Res> get unit;

}
/// @nodoc
class __$FavoriteUnitEntityCopyWithImpl<$Res>
    implements _$FavoriteUnitEntityCopyWith<$Res> {
  __$FavoriteUnitEntityCopyWithImpl(this._self, this._then);

  final _FavoriteUnitEntity _self;
  final $Res Function(_FavoriteUnitEntity) _then;

/// Create a copy of FavoriteUnitEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? unit = null,Object? createdAt = null,}) {
  return _then(_FavoriteUnitEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as UnitEntity,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

/// Create a copy of FavoriteUnitEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UnitEntityCopyWith<$Res> get unit {
  
  return $UnitEntityCopyWith<$Res>(_self.unit, (value) {
    return _then(_self.copyWith(unit: value));
  });
}
}

// dart format on
