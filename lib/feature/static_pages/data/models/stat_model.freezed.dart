// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stat_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StatModel {

 String get label; String get value; String get icon;
/// Create a copy of StatModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StatModelCopyWith<StatModel> get copyWith => _$StatModelCopyWithImpl<StatModel>(this as StatModel, _$identity);

  /// Serializes this StatModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as StatModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StatModel&&(identical(other.label, _this.label) || other.label == _this.label)&&(identical(other.value, _this.value) || other.value == _this.value)&&(identical(other.icon, _this.icon) || other.icon == _this.icon));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as StatModel;
  return Object.hash(runtimeType,_this.label,_this.value,_this.icon);
}

@override
String toString() {
  final _this = this as StatModel;
  return 'StatModel(label: ${_this.label}, value: ${_this.value}, icon: ${_this.icon})';
}


}

/// @nodoc
abstract mixin class $StatModelCopyWith<$Res>  {
  factory $StatModelCopyWith(StatModel value, $Res Function(StatModel) _then) = _$StatModelCopyWithImpl;
@useResult
$Res call({
 String label, String value, String icon
});




}
/// @nodoc
class _$StatModelCopyWithImpl<$Res>
    implements $StatModelCopyWith<$Res> {
  _$StatModelCopyWithImpl(this._self, this._then);

  final StatModel _self;
  final $Res Function(StatModel) _then;

/// Create a copy of StatModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? label = null,Object? value = null,Object? icon = null,}) {
  return _then(StatModel(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [StatModel].
extension StatModelPatterns on StatModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StatModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StatModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StatModel value)  $default,){
final _that = this;
switch (_that) {
case _StatModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StatModel value)?  $default,){
final _that = this;
switch (_that) {
case _StatModel() when $default != null:
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
case _StatModel() when $default != null:
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
case _StatModel():
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
case _StatModel() when $default != null:
return $default(_that.label,_that.value,_that.icon);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StatModel extends StatModel {
  const _StatModel({this.label = '', this.value = '', this.icon = ''}): super._();
  factory _StatModel.fromJson(Map<String, dynamic> json) => _$StatModelFromJson(json);

@override@JsonKey() final  String label;
@override@JsonKey() final  String value;
@override@JsonKey() final  String icon;

/// Create a copy of StatModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StatModelCopyWith<_StatModel> get copyWith => __$StatModelCopyWithImpl<_StatModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StatModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _StatModel&&(identical(other.label, label) || other.label == label)&&(identical(other.value, value) || other.value == value)&&(identical(other.icon, icon) || other.icon == icon));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,label,value,icon);
}

@override
String toString() {
    return 'StatModel(label: $label, value: $value, icon: $icon)';
}


}

/// @nodoc
abstract mixin class _$StatModelCopyWith<$Res> implements $StatModelCopyWith<$Res> {
  factory _$StatModelCopyWith(_StatModel value, $Res Function(_StatModel) _then) = __$StatModelCopyWithImpl;
@override @useResult
$Res call({
 String label, String value, String icon
});




}
/// @nodoc
class __$StatModelCopyWithImpl<$Res>
    implements _$StatModelCopyWith<$Res> {
  __$StatModelCopyWithImpl(this._self, this._then);

  final _StatModel _self;
  final $Res Function(_StatModel) _then;

/// Create a copy of StatModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? label = null,Object? value = null,Object? icon = null,}) {
  return _then(_StatModel(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
