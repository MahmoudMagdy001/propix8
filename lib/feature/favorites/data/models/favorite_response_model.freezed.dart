// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorite_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FavoriteResponseModel {

 bool get status; String get message; List<FavoriteUnitModel> get data; PaginationModel? get pagination;
/// Create a copy of FavoriteResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FavoriteResponseModelCopyWith<FavoriteResponseModel> get copyWith => _$FavoriteResponseModelCopyWithImpl<FavoriteResponseModel>(this as FavoriteResponseModel, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as FavoriteResponseModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FavoriteResponseModel&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.message, _this.message) || other.message == _this.message)&&const DeepCollectionEquality().equals(other.data, _this.data)&&(identical(other.pagination, _this.pagination) || other.pagination == _this.pagination));
}


@override
int get hashCode {
  final _this = this as FavoriteResponseModel;
  return Object.hash(runtimeType,_this.status,_this.message,const DeepCollectionEquality().hash(_this.data),_this.pagination);
}

@override
String toString() {
  final _this = this as FavoriteResponseModel;
  return 'FavoriteResponseModel(status: ${_this.status}, message: ${_this.message}, data: ${_this.data}, pagination: ${_this.pagination})';
}


}

/// @nodoc
abstract mixin class $FavoriteResponseModelCopyWith<$Res>  {
  factory $FavoriteResponseModelCopyWith(FavoriteResponseModel value, $Res Function(FavoriteResponseModel) _then) = _$FavoriteResponseModelCopyWithImpl;
@useResult
$Res call({
 bool status, String message, List<FavoriteUnitModel> data, PaginationModel? pagination
});


$PaginationModelCopyWith<$Res>? get pagination;

}
/// @nodoc
class _$FavoriteResponseModelCopyWithImpl<$Res>
    implements $FavoriteResponseModelCopyWith<$Res> {
  _$FavoriteResponseModelCopyWithImpl(this._self, this._then);

  final FavoriteResponseModel _self;
  final $Res Function(FavoriteResponseModel) _then;

/// Create a copy of FavoriteResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? message = null,Object? data = null,Object? pagination = freezed,}) {
  return _then(FavoriteResponseModel(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<FavoriteUnitModel>,pagination: freezed == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as PaginationModel?,
  ));
}
/// Create a copy of FavoriteResponseModel
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


/// Adds pattern-matching-related methods to [FavoriteResponseModel].
extension FavoriteResponseModelPatterns on FavoriteResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FavoriteResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FavoriteResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FavoriteResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _FavoriteResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FavoriteResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _FavoriteResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool status,  String message,  List<FavoriteUnitModel> data,  PaginationModel? pagination)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FavoriteResponseModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool status,  String message,  List<FavoriteUnitModel> data,  PaginationModel? pagination)  $default,) {final _that = this;
switch (_that) {
case _FavoriteResponseModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool status,  String message,  List<FavoriteUnitModel> data,  PaginationModel? pagination)?  $default,) {final _that = this;
switch (_that) {
case _FavoriteResponseModel() when $default != null:
return $default(_that.status,_that.message,_that.data,_that.pagination);case _:
  return null;

}
}

}

/// @nodoc


class _FavoriteResponseModel extends FavoriteResponseModel {
  const _FavoriteResponseModel({this.status = false, this.message = '',  List<FavoriteUnitModel> data = const [], this.pagination}): _data = data,super._();
  

@override@JsonKey() final  bool status;
@override@JsonKey() final  String message;
 final  List<FavoriteUnitModel> _data;
@override@JsonKey() List<FavoriteUnitModel> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}

@override final  PaginationModel? pagination;

/// Create a copy of FavoriteResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FavoriteResponseModelCopyWith<_FavoriteResponseModel> get copyWith => __$FavoriteResponseModelCopyWithImpl<_FavoriteResponseModel>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _FavoriteResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.data, _data)&&(identical(other.pagination, pagination) || other.pagination == pagination));
}


@override
int get hashCode {
    return Object.hash(runtimeType,status,message,const DeepCollectionEquality().hash(_data),pagination);
}

@override
String toString() {
    return 'FavoriteResponseModel(status: $status, message: $message, data: $data, pagination: $pagination)';
}


}

/// @nodoc
abstract mixin class _$FavoriteResponseModelCopyWith<$Res> implements $FavoriteResponseModelCopyWith<$Res> {
  factory _$FavoriteResponseModelCopyWith(_FavoriteResponseModel value, $Res Function(_FavoriteResponseModel) _then) = __$FavoriteResponseModelCopyWithImpl;
@override @useResult
$Res call({
 bool status, String message, List<FavoriteUnitModel> data, PaginationModel? pagination
});


@override $PaginationModelCopyWith<$Res>? get pagination;

}
/// @nodoc
class __$FavoriteResponseModelCopyWithImpl<$Res>
    implements _$FavoriteResponseModelCopyWith<$Res> {
  __$FavoriteResponseModelCopyWithImpl(this._self, this._then);

  final _FavoriteResponseModel _self;
  final $Res Function(_FavoriteResponseModel) _then;

/// Create a copy of FavoriteResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? message = null,Object? data = null,Object? pagination = freezed,}) {
  return _then(_FavoriteResponseModel(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<FavoriteUnitModel>,pagination: freezed == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as PaginationModel?,
  ));
}

/// Create a copy of FavoriteResponseModel
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
