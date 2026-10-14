// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'compound_collection_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CompoundCollectionModel {

 int get id; String get name; String get description; List<UnitModel> get units; PaginationModel? get pagination;
/// Create a copy of CompoundCollectionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CompoundCollectionModelCopyWith<CompoundCollectionModel> get copyWith => _$CompoundCollectionModelCopyWithImpl<CompoundCollectionModel>(this as CompoundCollectionModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompoundCollectionModel&&super == other&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.units, units)&&(identical(other.pagination, pagination) || other.pagination == pagination));
}


@override
int get hashCode => Object.hash(runtimeType,super.hashCode,id,name,description,const DeepCollectionEquality().hash(units),pagination);

@override
String toString() {
  return 'CompoundCollectionModel(id: $id, name: $name, description: $description, units: $units, pagination: $pagination)';
}


}

/// @nodoc
abstract mixin class $CompoundCollectionModelCopyWith<$Res>  {
  factory $CompoundCollectionModelCopyWith(CompoundCollectionModel value, $Res Function(CompoundCollectionModel) _then) = _$CompoundCollectionModelCopyWithImpl;
@useResult
$Res call({
 int id, String name, String description, List<UnitModel> units, PaginationModel? pagination
});




}
/// @nodoc
class _$CompoundCollectionModelCopyWithImpl<$Res>
    implements $CompoundCollectionModelCopyWith<$Res> {
  _$CompoundCollectionModelCopyWithImpl(this._self, this._then);

  final CompoundCollectionModel _self;
  final $Res Function(CompoundCollectionModel) _then;

/// Create a copy of CompoundCollectionModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = null,Object? units = null,Object? pagination = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,units: null == units ? _self.units : units // ignore: cast_nullable_to_non_nullable
as List<UnitModel>,pagination: freezed == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as PaginationModel?,
  ));
}

}


/// Adds pattern-matching-related methods to [CompoundCollectionModel].
extension CompoundCollectionModelPatterns on CompoundCollectionModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CompoundCollectionModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CompoundCollectionModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CompoundCollectionModel value)  $default,){
final _that = this;
switch (_that) {
case _CompoundCollectionModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CompoundCollectionModel value)?  $default,){
final _that = this;
switch (_that) {
case _CompoundCollectionModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String description,  List<UnitModel> units,  PaginationModel? pagination)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CompoundCollectionModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String description,  List<UnitModel> units,  PaginationModel? pagination)  $default,) {final _that = this;
switch (_that) {
case _CompoundCollectionModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String description,  List<UnitModel> units,  PaginationModel? pagination)?  $default,) {final _that = this;
switch (_that) {
case _CompoundCollectionModel() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.units,_that.pagination);case _:
  return null;

}
}

}

/// @nodoc


class _CompoundCollectionModel implements CompoundCollectionModel {
  const _CompoundCollectionModel({required this.id, required this.name, required this.description, required final  List<UnitModel> units, this.pagination}): _units = units;
  

@override final  int id;
@override final  String name;
@override final  String description;
 final  List<UnitModel> _units;
@override List<UnitModel> get units {
  if (_units is EqualUnmodifiableListView) return _units;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_units);
}

@override final  PaginationModel? pagination;

/// Create a copy of CompoundCollectionModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CompoundCollectionModelCopyWith<_CompoundCollectionModel> get copyWith => __$CompoundCollectionModelCopyWithImpl<_CompoundCollectionModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CompoundCollectionModel&&super == other&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._units, _units)&&(identical(other.pagination, pagination) || other.pagination == pagination));
}


@override
int get hashCode => Object.hash(runtimeType,super.hashCode,id,name,description,const DeepCollectionEquality().hash(_units),pagination);

@override
String toString() {
  return 'CompoundCollectionModel(id: $id, name: $name, description: $description, units: $units, pagination: $pagination)';
}


}

/// @nodoc
abstract mixin class _$CompoundCollectionModelCopyWith<$Res> implements $CompoundCollectionModelCopyWith<$Res> {
  factory _$CompoundCollectionModelCopyWith(_CompoundCollectionModel value, $Res Function(_CompoundCollectionModel) _then) = __$CompoundCollectionModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String description, List<UnitModel> units, PaginationModel? pagination
});




}
/// @nodoc
class __$CompoundCollectionModelCopyWithImpl<$Res>
    implements _$CompoundCollectionModelCopyWith<$Res> {
  __$CompoundCollectionModelCopyWithImpl(this._self, this._then);

  final _CompoundCollectionModel _self;
  final $Res Function(_CompoundCollectionModel) _then;

/// Create a copy of CompoundCollectionModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = null,Object? units = null,Object? pagination = freezed,}) {
  return _then(_CompoundCollectionModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,units: null == units ? _self._units : units // ignore: cast_nullable_to_non_nullable
as List<UnitModel>,pagination: freezed == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as PaginationModel?,
  ));
}


}

// dart format on
