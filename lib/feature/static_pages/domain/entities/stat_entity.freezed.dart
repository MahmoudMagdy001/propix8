// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stat_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$StatEntity {

 String get label; String get value; String get icon;
/// Create a copy of StatEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StatEntityCopyWith<StatEntity> get copyWith => _$StatEntityCopyWithImpl<StatEntity>(this as StatEntity, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as StatEntity;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StatEntity&&(identical(other.label, _this.label) || other.label == _this.label)&&(identical(other.value, _this.value) || other.value == _this.value)&&(identical(other.icon, _this.icon) || other.icon == _this.icon));
}


@override
int get hashCode {
  final _this = this as StatEntity;
  return Object.hash(runtimeType,_this.label,_this.value,_this.icon);
}

@override
String toString() {
  final _this = this as StatEntity;
  return 'StatEntity(label: ${_this.label}, value: ${_this.value}, icon: ${_this.icon})';
}


}

/// @nodoc
abstract mixin class $StatEntityCopyWith<$Res>  {
  factory $StatEntityCopyWith(StatEntity value, $Res Function(StatEntity) _then) = _$StatEntityCopyWithImpl;
@useResult
$Res call({
 String label, String value, String icon
});




}
/// @nodoc
class _$StatEntityCopyWithImpl<$Res>
    implements $StatEntityCopyWith<$Res> {
  _$StatEntityCopyWithImpl(this._self, this._then);

  final StatEntity _self;
  final $Res Function(StatEntity) _then;

/// Create a copy of StatEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? label = null,Object? value = null,Object? icon = null,}) {
  return _then(StatEntity(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [StatEntity].
extension StatEntityPatterns on StatEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StatEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StatEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StatEntity value)  $default,){
final _that = this;
switch (_that) {
case _StatEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StatEntity value)?  $default,){
final _that = this;
switch (_that) {
case _StatEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String label,  String value,  String icon)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StatEntity() when $default != null:
return $default(_that.label,_that.value,_that.icon);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String label,  String value,  String icon)  $default,) {final _that = this;
switch (_that) {
case _StatEntity():
return $default(_that.label,_that.value,_that.icon);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String label,  String value,  String icon)?  $default,) {final _that = this;
switch (_that) {
case _StatEntity() when $default != null:
return $default(_that.label,_that.value,_that.icon);case _:
  return null;

}
}

}

/// @nodoc


class _StatEntity implements StatEntity {
  const _StatEntity({required this.label, required this.value, required this.icon});
  

@override final  String label;
@override final  String value;
@override final  String icon;

/// Create a copy of StatEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StatEntityCopyWith<_StatEntity> get copyWith => __$StatEntityCopyWithImpl<_StatEntity>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _StatEntity&&(identical(other.label, label) || other.label == label)&&(identical(other.value, value) || other.value == value)&&(identical(other.icon, icon) || other.icon == icon));
}


@override
int get hashCode {
    return Object.hash(runtimeType,label,value,icon);
}

@override
String toString() {
    return 'StatEntity(label: $label, value: $value, icon: $icon)';
}


}

/// @nodoc
abstract mixin class _$StatEntityCopyWith<$Res> implements $StatEntityCopyWith<$Res> {
  factory _$StatEntityCopyWith(_StatEntity value, $Res Function(_StatEntity) _then) = __$StatEntityCopyWithImpl;
@override @useResult
$Res call({
 String label, String value, String icon
});




}
/// @nodoc
class __$StatEntityCopyWithImpl<$Res>
    implements _$StatEntityCopyWith<$Res> {
  __$StatEntityCopyWithImpl(this._self, this._then);

  final _StatEntity _self;
  final $Res Function(_StatEntity) _then;

/// Create a copy of StatEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? label = null,Object? value = null,Object? icon = null,}) {
  return _then(_StatEntity(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
