// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorite_response_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FavoriteResponseEntity {

 bool get status; String get message; List<FavoriteUnitEntity> get data; PaginationModel? get pagination;
/// Create a copy of FavoriteResponseEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FavoriteResponseEntityCopyWith<FavoriteResponseEntity> get copyWith => _$FavoriteResponseEntityCopyWithImpl<FavoriteResponseEntity>(this as FavoriteResponseEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FavoriteResponseEntity&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.pagination, pagination) || other.pagination == pagination));
}


@override
int get hashCode => Object.hash(runtimeType,status,message,const DeepCollectionEquality().hash(data),pagination);

@override
String toString() {
  return 'FavoriteResponseEntity(status: $status, message: $message, data: $data, pagination: $pagination)';
}


}

/// @nodoc
abstract mixin class $FavoriteResponseEntityCopyWith<$Res>  {
  factory $FavoriteResponseEntityCopyWith(FavoriteResponseEntity value, $Res Function(FavoriteResponseEntity) _then) = _$FavoriteResponseEntityCopyWithImpl;
@useResult
$Res call({
 bool status, String message, List<FavoriteUnitEntity> data, PaginationModel? pagination
});


$PaginationModelCopyWith<$Res>? get pagination;

}
/// @nodoc
class _$FavoriteResponseEntityCopyWithImpl<$Res>
    implements $FavoriteResponseEntityCopyWith<$Res> {
  _$FavoriteResponseEntityCopyWithImpl(this._self, this._then);

  final FavoriteResponseEntity _self;
  final $Res Function(FavoriteResponseEntity) _then;

/// Create a copy of FavoriteResponseEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? message = null,Object? data = null,Object? pagination = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<FavoriteUnitEntity>,pagination: freezed == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as PaginationModel?,
  ));
}
/// Create a copy of FavoriteResponseEntity
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


/// Adds pattern-matching-related methods to [FavoriteResponseEntity].
extension FavoriteResponseEntityPatterns on FavoriteResponseEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FavoriteResponseEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FavoriteResponseEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FavoriteResponseEntity value)  $default,){
final _that = this;
switch (_that) {
case _FavoriteResponseEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FavoriteResponseEntity value)?  $default,){
final _that = this;
switch (_that) {
case _FavoriteResponseEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool status,  String message,  List<FavoriteUnitEntity> data,  PaginationModel? pagination)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FavoriteResponseEntity() when $default != null:
return $default(_that.status,_that.message,_that.data,_that.pagination);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool status,  String message,  List<FavoriteUnitEntity> data,  PaginationModel? pagination)  $default,) {final _that = this;
switch (_that) {
case _FavoriteResponseEntity():
return $default(_that.status,_that.message,_that.data,_that.pagination);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool status,  String message,  List<FavoriteUnitEntity> data,  PaginationModel? pagination)?  $default,) {final _that = this;
switch (_that) {
case _FavoriteResponseEntity() when $default != null:
return $default(_that.status,_that.message,_that.data,_that.pagination);case _:
  return null;

}
}

}

/// @nodoc


class _FavoriteResponseEntity implements FavoriteResponseEntity {
  const _FavoriteResponseEntity({required this.status, required this.message, required final  List<FavoriteUnitEntity> data, this.pagination}): _data = data;
  

@override final  bool status;
@override final  String message;
 final  List<FavoriteUnitEntity> _data;
@override List<FavoriteUnitEntity> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}

@override final  PaginationModel? pagination;

/// Create a copy of FavoriteResponseEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FavoriteResponseEntityCopyWith<_FavoriteResponseEntity> get copyWith => __$FavoriteResponseEntityCopyWithImpl<_FavoriteResponseEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FavoriteResponseEntity&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other._data, _data)&&(identical(other.pagination, pagination) || other.pagination == pagination));
}


@override
int get hashCode => Object.hash(runtimeType,status,message,const DeepCollectionEquality().hash(_data),pagination);

@override
String toString() {
  return 'FavoriteResponseEntity(status: $status, message: $message, data: $data, pagination: $pagination)';
}


}

/// @nodoc
abstract mixin class _$FavoriteResponseEntityCopyWith<$Res> implements $FavoriteResponseEntityCopyWith<$Res> {
  factory _$FavoriteResponseEntityCopyWith(_FavoriteResponseEntity value, $Res Function(_FavoriteResponseEntity) _then) = __$FavoriteResponseEntityCopyWithImpl;
@override @useResult
$Res call({
 bool status, String message, List<FavoriteUnitEntity> data, PaginationModel? pagination
});


@override $PaginationModelCopyWith<$Res>? get pagination;

}
/// @nodoc
class __$FavoriteResponseEntityCopyWithImpl<$Res>
    implements _$FavoriteResponseEntityCopyWith<$Res> {
  __$FavoriteResponseEntityCopyWithImpl(this._self, this._then);

  final _FavoriteResponseEntity _self;
  final $Res Function(_FavoriteResponseEntity) _then;

/// Create a copy of FavoriteResponseEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? message = null,Object? data = null,Object? pagination = freezed,}) {
  return _then(_FavoriteResponseEntity(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<FavoriteUnitEntity>,pagination: freezed == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as PaginationModel?,
  ));
}

/// Create a copy of FavoriteResponseEntity
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
