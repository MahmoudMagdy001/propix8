// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'compound_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CompoundEntity {

 int get id; String get name; String get description;
/// Create a copy of CompoundEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CompoundEntityCopyWith<CompoundEntity> get copyWith => _$CompoundEntityCopyWithImpl<CompoundEntity>(this as CompoundEntity, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as CompoundEntity;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompoundEntity&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.description, _this.description) || other.description == _this.description));
}


@override
int get hashCode {
  final _this = this as CompoundEntity;
  return Object.hash(runtimeType,_this.id,_this.name,_this.description);
}

@override
String toString() {
  final _this = this as CompoundEntity;
  return 'CompoundEntity(id: ${_this.id}, name: ${_this.name}, description: ${_this.description})';
}


}

/// @nodoc
abstract mixin class $CompoundEntityCopyWith<$Res>  {
  factory $CompoundEntityCopyWith(CompoundEntity value, $Res Function(CompoundEntity) _then) = _$CompoundEntityCopyWithImpl;
@useResult
$Res call({
 int id, String name, String description
});




}
/// @nodoc
class _$CompoundEntityCopyWithImpl<$Res>
    implements $CompoundEntityCopyWith<$Res> {
  _$CompoundEntityCopyWithImpl(this._self, this._then);

  final CompoundEntity _self;
  final $Res Function(CompoundEntity) _then;

/// Create a copy of CompoundEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = null,}) {
  return _then(CompoundEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CompoundEntity].
extension CompoundEntityPatterns on CompoundEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CompoundEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CompoundEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CompoundEntity value)  $default,){
final _that = this;
switch (_that) {
case _CompoundEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CompoundEntity value)?  $default,){
final _that = this;
switch (_that) {
case _CompoundEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CompoundEntity() when $default != null:
return $default(_that.id,_that.name,_that.description);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String description)  $default,) {final _that = this;
switch (_that) {
case _CompoundEntity():
return $default(_that.id,_that.name,_that.description);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String description)?  $default,) {final _that = this;
switch (_that) {
case _CompoundEntity() when $default != null:
return $default(_that.id,_that.name,_that.description);case _:
  return null;

}
}

}

/// @nodoc


class _CompoundEntity implements CompoundEntity {
  const _CompoundEntity({required this.id, required this.name, required this.description});
  

@override final  int id;
@override final  String name;
@override final  String description;

/// Create a copy of CompoundEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CompoundEntityCopyWith<_CompoundEntity> get copyWith => __$CompoundEntityCopyWithImpl<_CompoundEntity>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CompoundEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,name,description);
}

@override
String toString() {
    return 'CompoundEntity(id: $id, name: $name, description: $description)';
}


}

/// @nodoc
abstract mixin class _$CompoundEntityCopyWith<$Res> implements $CompoundEntityCopyWith<$Res> {
  factory _$CompoundEntityCopyWith(_CompoundEntity value, $Res Function(_CompoundEntity) _then) = __$CompoundEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String description
});




}
/// @nodoc
class __$CompoundEntityCopyWithImpl<$Res>
    implements _$CompoundEntityCopyWith<$Res> {
  __$CompoundEntityCopyWithImpl(this._self, this._then);

  final _CompoundEntity _self;
  final $Res Function(_CompoundEntity) _then;

/// Create a copy of CompoundEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = null,}) {
  return _then(_CompoundEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
