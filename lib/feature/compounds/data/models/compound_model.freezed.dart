// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'compound_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CompoundModel {

 int get id; String get name; String get description;
/// Create a copy of CompoundModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CompoundModelCopyWith<CompoundModel> get copyWith => _$CompoundModelCopyWithImpl<CompoundModel>(this as CompoundModel, _$identity);

  /// Serializes this CompoundModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CompoundModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompoundModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.description, _this.description) || other.description == _this.description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CompoundModel;
  return Object.hash(runtimeType,_this.id,_this.name,_this.description);
}

@override
String toString() {
  final _this = this as CompoundModel;
  return 'CompoundModel(id: ${_this.id}, name: ${_this.name}, description: ${_this.description})';
}


}

/// @nodoc
abstract mixin class $CompoundModelCopyWith<$Res>  {
  factory $CompoundModelCopyWith(CompoundModel value, $Res Function(CompoundModel) _then) = _$CompoundModelCopyWithImpl;
@useResult
$Res call({
 int id, String name, String description
});




}
/// @nodoc
class _$CompoundModelCopyWithImpl<$Res>
    implements $CompoundModelCopyWith<$Res> {
  _$CompoundModelCopyWithImpl(this._self, this._then);

  final CompoundModel _self;
  final $Res Function(CompoundModel) _then;

/// Create a copy of CompoundModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = null,}) {
  return _then(CompoundModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CompoundModel].
extension CompoundModelPatterns on CompoundModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CompoundModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CompoundModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CompoundModel value)  $default,){
final _that = this;
switch (_that) {
case _CompoundModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CompoundModel value)?  $default,){
final _that = this;
switch (_that) {
case _CompoundModel() when $default != null:
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
case _CompoundModel() when $default != null:
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
case _CompoundModel():
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
case _CompoundModel() when $default != null:
return $default(_that.id,_that.name,_that.description);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CompoundModel extends CompoundModel {
  const _CompoundModel({this.id = 0, this.name = '', this.description = ''}): super._();
  factory _CompoundModel.fromJson(Map<String, dynamic> json) => _$CompoundModelFromJson(json);

@override@JsonKey() final  int id;
@override@JsonKey() final  String name;
@override@JsonKey() final  String description;

/// Create a copy of CompoundModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CompoundModelCopyWith<_CompoundModel> get copyWith => __$CompoundModelCopyWithImpl<_CompoundModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CompoundModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CompoundModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,description);
}

@override
String toString() {
    return 'CompoundModel(id: $id, name: $name, description: $description)';
}


}

/// @nodoc
abstract mixin class _$CompoundModelCopyWith<$Res> implements $CompoundModelCopyWith<$Res> {
  factory _$CompoundModelCopyWith(_CompoundModel value, $Res Function(_CompoundModel) _then) = __$CompoundModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String description
});




}
/// @nodoc
class __$CompoundModelCopyWithImpl<$Res>
    implements _$CompoundModelCopyWith<$Res> {
  __$CompoundModelCopyWithImpl(this._self, this._then);

  final _CompoundModel _self;
  final $Res Function(_CompoundModel) _then;

/// Create a copy of CompoundModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = null,}) {
  return _then(_CompoundModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
