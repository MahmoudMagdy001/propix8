// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'developer_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DeveloperResponseModel {

 bool get status; String get message; List<DeveloperModel> get data;
/// Create a copy of DeveloperResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeveloperResponseModelCopyWith<DeveloperResponseModel> get copyWith => _$DeveloperResponseModelCopyWithImpl<DeveloperResponseModel>(this as DeveloperResponseModel, _$identity);

  /// Serializes this DeveloperResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as DeveloperResponseModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeveloperResponseModel&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.message, _this.message) || other.message == _this.message)&&const DeepCollectionEquality().equals(other.data, _this.data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as DeveloperResponseModel;
  return Object.hash(runtimeType,_this.status,_this.message,const DeepCollectionEquality().hash(_this.data));
}

@override
String toString() {
  final _this = this as DeveloperResponseModel;
  return 'DeveloperResponseModel(status: ${_this.status}, message: ${_this.message}, data: ${_this.data})';
}


}

/// @nodoc
abstract mixin class $DeveloperResponseModelCopyWith<$Res>  {
  factory $DeveloperResponseModelCopyWith(DeveloperResponseModel value, $Res Function(DeveloperResponseModel) _then) = _$DeveloperResponseModelCopyWithImpl;
@useResult
$Res call({
 bool status, String message, List<DeveloperModel> data
});




}
/// @nodoc
class _$DeveloperResponseModelCopyWithImpl<$Res>
    implements $DeveloperResponseModelCopyWith<$Res> {
  _$DeveloperResponseModelCopyWithImpl(this._self, this._then);

  final DeveloperResponseModel _self;
  final $Res Function(DeveloperResponseModel) _then;

/// Create a copy of DeveloperResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? message = null,Object? data = null,}) {
  return _then(DeveloperResponseModel(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<DeveloperModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [DeveloperResponseModel].
extension DeveloperResponseModelPatterns on DeveloperResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DeveloperResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DeveloperResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DeveloperResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _DeveloperResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DeveloperResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _DeveloperResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool status,  String message,  List<DeveloperModel> data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DeveloperResponseModel() when $default != null:
return $default(_that.status,_that.message,_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool status,  String message,  List<DeveloperModel> data)  $default,) {final _that = this;
switch (_that) {
case _DeveloperResponseModel():
return $default(_that.status,_that.message,_that.data);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool status,  String message,  List<DeveloperModel> data)?  $default,) {final _that = this;
switch (_that) {
case _DeveloperResponseModel() when $default != null:
return $default(_that.status,_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DeveloperResponseModel implements DeveloperResponseModel {
  const _DeveloperResponseModel({this.status = false, this.message = '',  List<DeveloperModel> data = const []}): _data = data;
  factory _DeveloperResponseModel.fromJson(Map<String, dynamic> json) => _$DeveloperResponseModelFromJson(json);

@override@JsonKey() final  bool status;
@override@JsonKey() final  String message;
 final  List<DeveloperModel> _data;
@override@JsonKey() List<DeveloperModel> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}


/// Create a copy of DeveloperResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeveloperResponseModelCopyWith<_DeveloperResponseModel> get copyWith => __$DeveloperResponseModelCopyWithImpl<_DeveloperResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DeveloperResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeveloperResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,status,message,const DeepCollectionEquality().hash(_data));
}

@override
String toString() {
    return 'DeveloperResponseModel(status: $status, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$DeveloperResponseModelCopyWith<$Res> implements $DeveloperResponseModelCopyWith<$Res> {
  factory _$DeveloperResponseModelCopyWith(_DeveloperResponseModel value, $Res Function(_DeveloperResponseModel) _then) = __$DeveloperResponseModelCopyWithImpl;
@override @useResult
$Res call({
 bool status, String message, List<DeveloperModel> data
});




}
/// @nodoc
class __$DeveloperResponseModelCopyWithImpl<$Res>
    implements _$DeveloperResponseModelCopyWith<$Res> {
  __$DeveloperResponseModelCopyWithImpl(this._self, this._then);

  final _DeveloperResponseModel _self;
  final $Res Function(_DeveloperResponseModel) _then;

/// Create a copy of DeveloperResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? message = null,Object? data = null,}) {
  return _then(_DeveloperResponseModel(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<DeveloperModel>,
  ));
}


}

// dart format on
