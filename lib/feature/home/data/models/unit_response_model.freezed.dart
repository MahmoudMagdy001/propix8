// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'unit_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UnitResponseModel {

 List<UnitModel> get units; PaginationModel? get pagination;
/// Create a copy of UnitResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnitResponseModelCopyWith<UnitResponseModel> get copyWith => _$UnitResponseModelCopyWithImpl<UnitResponseModel>(this as UnitResponseModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnitResponseModel&&const DeepCollectionEquality().equals(other.units, units)&&(identical(other.pagination, pagination) || other.pagination == pagination));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(units),pagination);

@override
String toString() {
  return 'UnitResponseModel(units: $units, pagination: $pagination)';
}


}

/// @nodoc
abstract mixin class $UnitResponseModelCopyWith<$Res>  {
  factory $UnitResponseModelCopyWith(UnitResponseModel value, $Res Function(UnitResponseModel) _then) = _$UnitResponseModelCopyWithImpl;
@useResult
$Res call({
 List<UnitModel> units, PaginationModel? pagination
});


$PaginationModelCopyWith<$Res>? get pagination;

}
/// @nodoc
class _$UnitResponseModelCopyWithImpl<$Res>
    implements $UnitResponseModelCopyWith<$Res> {
  _$UnitResponseModelCopyWithImpl(this._self, this._then);

  final UnitResponseModel _self;
  final $Res Function(UnitResponseModel) _then;

/// Create a copy of UnitResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? units = null,Object? pagination = freezed,}) {
  return _then(_self.copyWith(
units: null == units ? _self.units : units // ignore: cast_nullable_to_non_nullable
as List<UnitModel>,pagination: freezed == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as PaginationModel?,
  ));
}
/// Create a copy of UnitResponseModel
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


/// Adds pattern-matching-related methods to [UnitResponseModel].
extension UnitResponseModelPatterns on UnitResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UnitResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UnitResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UnitResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _UnitResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UnitResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _UnitResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<UnitModel> units,  PaginationModel? pagination)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UnitResponseModel() when $default != null:
return $default(_that.units,_that.pagination);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<UnitModel> units,  PaginationModel? pagination)  $default,) {final _that = this;
switch (_that) {
case _UnitResponseModel():
return $default(_that.units,_that.pagination);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<UnitModel> units,  PaginationModel? pagination)?  $default,) {final _that = this;
switch (_that) {
case _UnitResponseModel() when $default != null:
return $default(_that.units,_that.pagination);case _:
  return null;

}
}

}

/// @nodoc


class _UnitResponseModel extends UnitResponseModel {
  const _UnitResponseModel({final  List<UnitModel> units = const [], this.pagination}): _units = units,super._();
  

 final  List<UnitModel> _units;
@override@JsonKey() List<UnitModel> get units {
  if (_units is EqualUnmodifiableListView) return _units;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_units);
}

@override final  PaginationModel? pagination;

/// Create a copy of UnitResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UnitResponseModelCopyWith<_UnitResponseModel> get copyWith => __$UnitResponseModelCopyWithImpl<_UnitResponseModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UnitResponseModel&&const DeepCollectionEquality().equals(other._units, _units)&&(identical(other.pagination, pagination) || other.pagination == pagination));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_units),pagination);

@override
String toString() {
  return 'UnitResponseModel(units: $units, pagination: $pagination)';
}


}

/// @nodoc
abstract mixin class _$UnitResponseModelCopyWith<$Res> implements $UnitResponseModelCopyWith<$Res> {
  factory _$UnitResponseModelCopyWith(_UnitResponseModel value, $Res Function(_UnitResponseModel) _then) = __$UnitResponseModelCopyWithImpl;
@override @useResult
$Res call({
 List<UnitModel> units, PaginationModel? pagination
});


@override $PaginationModelCopyWith<$Res>? get pagination;

}
/// @nodoc
class __$UnitResponseModelCopyWithImpl<$Res>
    implements _$UnitResponseModelCopyWith<$Res> {
  __$UnitResponseModelCopyWithImpl(this._self, this._then);

  final _UnitResponseModel _self;
  final $Res Function(_UnitResponseModel) _then;

/// Create a copy of UnitResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? units = null,Object? pagination = freezed,}) {
  return _then(_UnitResponseModel(
units: null == units ? _self._units : units // ignore: cast_nullable_to_non_nullable
as List<UnitModel>,pagination: freezed == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as PaginationModel?,
  ));
}

/// Create a copy of UnitResponseModel
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
