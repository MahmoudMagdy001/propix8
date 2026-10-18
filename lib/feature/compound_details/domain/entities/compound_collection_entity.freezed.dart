// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'compound_collection_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CompoundCollectionEntity {

 int get id; String get name; String get description; List<UnitEntity> get units; PaginationModel? get pagination;
/// Create a copy of CompoundCollectionEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CompoundCollectionEntityCopyWith<CompoundCollectionEntity> get copyWith => _$CompoundCollectionEntityCopyWithImpl<CompoundCollectionEntity>(this as CompoundCollectionEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompoundCollectionEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.units, units)&&(identical(other.pagination, pagination) || other.pagination == pagination));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,description,const DeepCollectionEquality().hash(units),pagination);

@override
String toString() {
  return 'CompoundCollectionEntity(id: $id, name: $name, description: $description, units: $units, pagination: $pagination)';
}


}

/// @nodoc
abstract mixin class $CompoundCollectionEntityCopyWith<$Res>  {
  factory $CompoundCollectionEntityCopyWith(CompoundCollectionEntity value, $Res Function(CompoundCollectionEntity) _then) = _$CompoundCollectionEntityCopyWithImpl;
@useResult
$Res call({
 int id, String name, String description, List<UnitEntity> units, PaginationModel? pagination
});


$PaginationModelCopyWith<$Res>? get pagination;

}
/// @nodoc
class _$CompoundCollectionEntityCopyWithImpl<$Res>
    implements $CompoundCollectionEntityCopyWith<$Res> {
  _$CompoundCollectionEntityCopyWithImpl(this._self, this._then);

  final CompoundCollectionEntity _self;
  final $Res Function(CompoundCollectionEntity) _then;

/// Create a copy of CompoundCollectionEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = null,Object? units = null,Object? pagination = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,units: null == units ? _self.units : units // ignore: cast_nullable_to_non_nullable
as List<UnitEntity>,pagination: freezed == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as PaginationModel?,
  ));
}
/// Create a copy of CompoundCollectionEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationModelCopyWith<$Res>? get pagination {
    if (_self.pagination == null) {
    return null;
  }

  return $PaginationModelCopyWith<$Res>(_self.pagination!, (value) {
    return _then(_self.copyWith(pagination: value));
  });
}
}


/// Adds pattern-matching-related methods to [CompoundCollectionEntity].
extension CompoundCollectionEntityPatterns on CompoundCollectionEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CompoundCollectionEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CompoundCollectionEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CompoundCollectionEntity value)  $default,){
final _that = this;
switch (_that) {
case _CompoundCollectionEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CompoundCollectionEntity value)?  $default,){
final _that = this;
switch (_that) {
case _CompoundCollectionEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String description,  List<UnitEntity> units,  PaginationModel? pagination)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CompoundCollectionEntity() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.units,_that.pagination);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String description,  List<UnitEntity> units,  PaginationModel? pagination)  $default,) {final _that = this;
switch (_that) {
case _CompoundCollectionEntity():
return $default(_that.id,_that.name,_that.description,_that.units,_that.pagination);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String description,  List<UnitEntity> units,  PaginationModel? pagination)?  $default,) {final _that = this;
switch (_that) {
case _CompoundCollectionEntity() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.units,_that.pagination);case _:
  return null;

}
}

}

/// @nodoc


class _CompoundCollectionEntity extends CompoundCollectionEntity {
  const _CompoundCollectionEntity({required this.id, required this.name, required this.description, required final  List<UnitEntity> units, this.pagination}): _units = units,super._();
  

@override final  int id;
@override final  String name;
@override final  String description;
 final  List<UnitEntity> _units;
@override List<UnitEntity> get units {
  if (_units is EqualUnmodifiableListView) return _units;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_units);
}

@override final  PaginationModel? pagination;

/// Create a copy of CompoundCollectionEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CompoundCollectionEntityCopyWith<_CompoundCollectionEntity> get copyWith => __$CompoundCollectionEntityCopyWithImpl<_CompoundCollectionEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CompoundCollectionEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._units, _units)&&(identical(other.pagination, pagination) || other.pagination == pagination));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,description,const DeepCollectionEquality().hash(_units),pagination);

@override
String toString() {
  return 'CompoundCollectionEntity(id: $id, name: $name, description: $description, units: $units, pagination: $pagination)';
}


}

/// @nodoc
abstract mixin class _$CompoundCollectionEntityCopyWith<$Res> implements $CompoundCollectionEntityCopyWith<$Res> {
  factory _$CompoundCollectionEntityCopyWith(_CompoundCollectionEntity value, $Res Function(_CompoundCollectionEntity) _then) = __$CompoundCollectionEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String description, List<UnitEntity> units, PaginationModel? pagination
});


@override $PaginationModelCopyWith<$Res>? get pagination;

}
/// @nodoc
class __$CompoundCollectionEntityCopyWithImpl<$Res>
    implements _$CompoundCollectionEntityCopyWith<$Res> {
  __$CompoundCollectionEntityCopyWithImpl(this._self, this._then);

  final _CompoundCollectionEntity _self;
  final $Res Function(_CompoundCollectionEntity) _then;

/// Create a copy of CompoundCollectionEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = null,Object? units = null,Object? pagination = freezed,}) {
  return _then(_CompoundCollectionEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,units: null == units ? _self._units : units // ignore: cast_nullable_to_non_nullable
as List<UnitEntity>,pagination: freezed == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as PaginationModel?,
  ));
}

/// Create a copy of CompoundCollectionEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationModelCopyWith<$Res>? get pagination {
    if (_self.pagination == null) {
    return null;
  }

  return $PaginationModelCopyWith<$Res>(_self.pagination!, (value) {
    return _then(_self.copyWith(pagination: value));
  });
}
}

// dart format on
