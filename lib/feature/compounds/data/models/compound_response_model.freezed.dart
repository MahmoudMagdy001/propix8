// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'compound_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CompoundResponseModel {

 bool get status; String get message; List<CompoundModel> get data;
/// Create a copy of CompoundResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CompoundResponseModelCopyWith<CompoundResponseModel> get copyWith => _$CompoundResponseModelCopyWithImpl<CompoundResponseModel>(this as CompoundResponseModel, _$identity);

  /// Serializes this CompoundResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CompoundResponseModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompoundResponseModel&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.message, _this.message) || other.message == _this.message)&&const DeepCollectionEquality().equals(other.data, _this.data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CompoundResponseModel;
  return Object.hash(runtimeType,_this.status,_this.message,const DeepCollectionEquality().hash(_this.data));
}

@override
String toString() {
  final _this = this as CompoundResponseModel;
  return 'CompoundResponseModel(status: ${_this.status}, message: ${_this.message}, data: ${_this.data})';
}


}

/// @nodoc
abstract mixin class $CompoundResponseModelCopyWith<$Res>  {
  factory $CompoundResponseModelCopyWith(CompoundResponseModel value, $Res Function(CompoundResponseModel) _then) = _$CompoundResponseModelCopyWithImpl;
@useResult
$Res call({
 bool status, String message, List<CompoundModel> data
});




}
/// @nodoc
class _$CompoundResponseModelCopyWithImpl<$Res>
    implements $CompoundResponseModelCopyWith<$Res> {
  _$CompoundResponseModelCopyWithImpl(this._self, this._then);

  final CompoundResponseModel _self;
  final $Res Function(CompoundResponseModel) _then;

/// Create a copy of CompoundResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? message = null,Object? data = null,}) {
  return _then(CompoundResponseModel(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<CompoundModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [CompoundResponseModel].
extension CompoundResponseModelPatterns on CompoundResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CompoundResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CompoundResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CompoundResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _CompoundResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CompoundResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _CompoundResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool status,  String message,  List<CompoundModel> data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CompoundResponseModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool status,  String message,  List<CompoundModel> data)  $default,) {final _that = this;
switch (_that) {
case _CompoundResponseModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool status,  String message,  List<CompoundModel> data)?  $default,) {final _that = this;
switch (_that) {
case _CompoundResponseModel() when $default != null:
return $default(_that.status,_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CompoundResponseModel implements CompoundResponseModel {
  const _CompoundResponseModel({this.status = false, this.message = '',  List<CompoundModel> data = const []}): _data = data;
  factory _CompoundResponseModel.fromJson(Map<String, dynamic> json) => _$CompoundResponseModelFromJson(json);

@override@JsonKey() final  bool status;
@override@JsonKey() final  String message;
 final  List<CompoundModel> _data;
@override@JsonKey() List<CompoundModel> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}


/// Create a copy of CompoundResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CompoundResponseModelCopyWith<_CompoundResponseModel> get copyWith => __$CompoundResponseModelCopyWithImpl<_CompoundResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CompoundResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CompoundResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,status,message,const DeepCollectionEquality().hash(_data));
}

@override
String toString() {
    return 'CompoundResponseModel(status: $status, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$CompoundResponseModelCopyWith<$Res> implements $CompoundResponseModelCopyWith<$Res> {
  factory _$CompoundResponseModelCopyWith(_CompoundResponseModel value, $Res Function(_CompoundResponseModel) _then) = __$CompoundResponseModelCopyWithImpl;
@override @useResult
$Res call({
 bool status, String message, List<CompoundModel> data
});




}
/// @nodoc
class __$CompoundResponseModelCopyWithImpl<$Res>
    implements _$CompoundResponseModelCopyWith<$Res> {
  __$CompoundResponseModelCopyWithImpl(this._self, this._then);

  final _CompoundResponseModel _self;
  final $Res Function(_CompoundResponseModel) _then;

/// Create a copy of CompoundResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? message = null,Object? data = null,}) {
  return _then(_CompoundResponseModel(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<CompoundModel>,
  ));
}


}

// dart format on
