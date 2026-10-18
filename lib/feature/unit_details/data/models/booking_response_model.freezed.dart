// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BookingResponseModel {

 bool get status; String get message; BookingDataModel? get data;
/// Create a copy of BookingResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookingResponseModelCopyWith<BookingResponseModel> get copyWith => _$BookingResponseModelCopyWithImpl<BookingResponseModel>(this as BookingResponseModel, _$identity);

  /// Serializes this BookingResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as BookingResponseModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingResponseModel&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.message, _this.message) || other.message == _this.message)&&(identical(other.data, _this.data) || other.data == _this.data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as BookingResponseModel;
  return Object.hash(runtimeType,_this.status,_this.message,_this.data);
}

@override
String toString() {
  final _this = this as BookingResponseModel;
  return 'BookingResponseModel(status: ${_this.status}, message: ${_this.message}, data: ${_this.data})';
}


}

/// @nodoc
abstract mixin class $BookingResponseModelCopyWith<$Res>  {
  factory $BookingResponseModelCopyWith(BookingResponseModel value, $Res Function(BookingResponseModel) _then) = _$BookingResponseModelCopyWithImpl;
@useResult
$Res call({
 bool status, String message, BookingDataModel? data
});


$BookingDataModelCopyWith<$Res>? get data;

}
/// @nodoc
class _$BookingResponseModelCopyWithImpl<$Res>
    implements $BookingResponseModelCopyWith<$Res> {
  _$BookingResponseModelCopyWithImpl(this._self, this._then);

  final BookingResponseModel _self;
  final $Res Function(BookingResponseModel) _then;

/// Create a copy of BookingResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? message = null,Object? data = freezed,}) {
  return _then(BookingResponseModel(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as BookingDataModel?,
  ));
}
/// Create a copy of BookingResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookingDataModelCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $BookingDataModelCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [BookingResponseModel].
extension BookingResponseModelPatterns on BookingResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookingResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookingResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookingResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _BookingResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookingResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _BookingResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool status,  String message,  BookingDataModel? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BookingResponseModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool status,  String message,  BookingDataModel? data)  $default,) {final _that = this;
switch (_that) {
case _BookingResponseModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool status,  String message,  BookingDataModel? data)?  $default,) {final _that = this;
switch (_that) {
case _BookingResponseModel() when $default != null:
return $default(_that.status,_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BookingResponseModel extends BookingResponseModel {
  const _BookingResponseModel({this.status = false, this.message = '', this.data}): super._();
  factory _BookingResponseModel.fromJson(Map<String, dynamic> json) => _$BookingResponseModelFromJson(json);

@override@JsonKey() final  bool status;
@override@JsonKey() final  String message;
@override final  BookingDataModel? data;

/// Create a copy of BookingResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookingResponseModelCopyWith<_BookingResponseModel> get copyWith => __$BookingResponseModelCopyWithImpl<_BookingResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BookingResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookingResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,status,message,data);
}

@override
String toString() {
    return 'BookingResponseModel(status: $status, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$BookingResponseModelCopyWith<$Res> implements $BookingResponseModelCopyWith<$Res> {
  factory _$BookingResponseModelCopyWith(_BookingResponseModel value, $Res Function(_BookingResponseModel) _then) = __$BookingResponseModelCopyWithImpl;
@override @useResult
$Res call({
 bool status, String message, BookingDataModel? data
});


@override $BookingDataModelCopyWith<$Res>? get data;

}
/// @nodoc
class __$BookingResponseModelCopyWithImpl<$Res>
    implements _$BookingResponseModelCopyWith<$Res> {
  __$BookingResponseModelCopyWithImpl(this._self, this._then);

  final _BookingResponseModel _self;
  final $Res Function(_BookingResponseModel) _then;

/// Create a copy of BookingResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? message = null,Object? data = freezed,}) {
  return _then(_BookingResponseModel(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as BookingDataModel?,
  ));
}

/// Create a copy of BookingResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookingDataModelCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $BookingDataModelCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$BookingDataModel {

@JsonKey(fromJson: _parseInt) int get id;@JsonKey(name: 'user_id', fromJson: _parseInt) int get userId; String get name; String get email; String get phone; String get date; String get time; String get status; String get notes;@JsonKey(name: 'created_at') String get createdAt; UnitModel? get unit;
/// Create a copy of BookingDataModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookingDataModelCopyWith<BookingDataModel> get copyWith => _$BookingDataModelCopyWithImpl<BookingDataModel>(this as BookingDataModel, _$identity);

  /// Serializes this BookingDataModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as BookingDataModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingDataModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.userId, _this.userId) || other.userId == _this.userId)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.email, _this.email) || other.email == _this.email)&&(identical(other.phone, _this.phone) || other.phone == _this.phone)&&(identical(other.date, _this.date) || other.date == _this.date)&&(identical(other.time, _this.time) || other.time == _this.time)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.notes, _this.notes) || other.notes == _this.notes)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.unit, _this.unit) || other.unit == _this.unit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as BookingDataModel;
  return Object.hash(runtimeType,_this.id,_this.userId,_this.name,_this.email,_this.phone,_this.date,_this.time,_this.status,_this.notes,_this.createdAt,_this.unit);
}

@override
String toString() {
  final _this = this as BookingDataModel;
  return 'BookingDataModel(id: ${_this.id}, userId: ${_this.userId}, name: ${_this.name}, email: ${_this.email}, phone: ${_this.phone}, date: ${_this.date}, time: ${_this.time}, status: ${_this.status}, notes: ${_this.notes}, createdAt: ${_this.createdAt}, unit: ${_this.unit})';
}


}

/// @nodoc
abstract mixin class $BookingDataModelCopyWith<$Res>  {
  factory $BookingDataModelCopyWith(BookingDataModel value, $Res Function(BookingDataModel) _then) = _$BookingDataModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: _parseInt) int id,@JsonKey(name: 'user_id', fromJson: _parseInt) int userId, String name, String email, String phone, String date, String time, String status, String notes,@JsonKey(name: 'created_at') String createdAt, UnitModel? unit
});


$UnitModelCopyWith<$Res>? get unit;

}
/// @nodoc
class _$BookingDataModelCopyWithImpl<$Res>
    implements $BookingDataModelCopyWith<$Res> {
  _$BookingDataModelCopyWithImpl(this._self, this._then);

  final BookingDataModel _self;
  final $Res Function(BookingDataModel) _then;

/// Create a copy of BookingDataModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? name = null,Object? email = null,Object? phone = null,Object? date = null,Object? time = null,Object? status = null,Object? notes = null,Object? createdAt = null,Object? unit = freezed,}) {
  return _then(BookingDataModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,unit: freezed == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as UnitModel?,
  ));
}
/// Create a copy of BookingDataModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UnitModelCopyWith<$Res>? get unit {
    if (_self.unit == null) {
    return null;
  }

  return $UnitModelCopyWith<$Res>(_self.unit!, (value) {
    return _then(_self.copyWith(unit: value));
  });
}
}


/// Adds pattern-matching-related methods to [BookingDataModel].
extension BookingDataModelPatterns on BookingDataModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookingDataModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookingDataModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookingDataModel value)  $default,){
final _that = this;
switch (_that) {
case _BookingDataModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookingDataModel value)?  $default,){
final _that = this;
switch (_that) {
case _BookingDataModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _parseInt)  int id, @JsonKey(name: 'user_id', fromJson: _parseInt)  int userId,  String name,  String email,  String phone,  String date,  String time,  String status,  String notes, @JsonKey(name: 'created_at')  String createdAt,  UnitModel? unit)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BookingDataModel() when $default != null:
return $default(_that.id,_that.userId,_that.name,_that.email,_that.phone,_that.date,_that.time,_that.status,_that.notes,_that.createdAt,_that.unit);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _parseInt)  int id, @JsonKey(name: 'user_id', fromJson: _parseInt)  int userId,  String name,  String email,  String phone,  String date,  String time,  String status,  String notes, @JsonKey(name: 'created_at')  String createdAt,  UnitModel? unit)  $default,) {final _that = this;
switch (_that) {
case _BookingDataModel():
return $default(_that.id,_that.userId,_that.name,_that.email,_that.phone,_that.date,_that.time,_that.status,_that.notes,_that.createdAt,_that.unit);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: _parseInt)  int id, @JsonKey(name: 'user_id', fromJson: _parseInt)  int userId,  String name,  String email,  String phone,  String date,  String time,  String status,  String notes, @JsonKey(name: 'created_at')  String createdAt,  UnitModel? unit)?  $default,) {final _that = this;
switch (_that) {
case _BookingDataModel() when $default != null:
return $default(_that.id,_that.userId,_that.name,_that.email,_that.phone,_that.date,_that.time,_that.status,_that.notes,_that.createdAt,_that.unit);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BookingDataModel extends BookingDataModel {
  const _BookingDataModel({@JsonKey(fromJson: _parseInt) this.id = 0, @JsonKey(name: 'user_id', fromJson: _parseInt) this.userId = 0, this.name = '', this.email = '', this.phone = '', this.date = '', this.time = '', this.status = '', this.notes = '', @JsonKey(name: 'created_at') this.createdAt = '', this.unit}): super._();
  factory _BookingDataModel.fromJson(Map<String, dynamic> json) => _$BookingDataModelFromJson(json);

@override@JsonKey(fromJson: _parseInt) final  int id;
@override@JsonKey(name: 'user_id', fromJson: _parseInt) final  int userId;
@override@JsonKey() final  String name;
@override@JsonKey() final  String email;
@override@JsonKey() final  String phone;
@override@JsonKey() final  String date;
@override@JsonKey() final  String time;
@override@JsonKey() final  String status;
@override@JsonKey() final  String notes;
@override@JsonKey(name: 'created_at') final  String createdAt;
@override final  UnitModel? unit;

/// Create a copy of BookingDataModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookingDataModelCopyWith<_BookingDataModel> get copyWith => __$BookingDataModelCopyWithImpl<_BookingDataModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BookingDataModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookingDataModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.date, date) || other.date == date)&&(identical(other.time, time) || other.time == time)&&(identical(other.status, status) || other.status == status)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.unit, unit) || other.unit == unit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,userId,name,email,phone,date,time,status,notes,createdAt,unit);
}

@override
String toString() {
    return 'BookingDataModel(id: $id, userId: $userId, name: $name, email: $email, phone: $phone, date: $date, time: $time, status: $status, notes: $notes, createdAt: $createdAt, unit: $unit)';
}


}

/// @nodoc
abstract mixin class _$BookingDataModelCopyWith<$Res> implements $BookingDataModelCopyWith<$Res> {
  factory _$BookingDataModelCopyWith(_BookingDataModel value, $Res Function(_BookingDataModel) _then) = __$BookingDataModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: _parseInt) int id,@JsonKey(name: 'user_id', fromJson: _parseInt) int userId, String name, String email, String phone, String date, String time, String status, String notes,@JsonKey(name: 'created_at') String createdAt, UnitModel? unit
});


@override $UnitModelCopyWith<$Res>? get unit;

}
/// @nodoc
class __$BookingDataModelCopyWithImpl<$Res>
    implements _$BookingDataModelCopyWith<$Res> {
  __$BookingDataModelCopyWithImpl(this._self, this._then);

  final _BookingDataModel _self;
  final $Res Function(_BookingDataModel) _then;

/// Create a copy of BookingDataModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? name = null,Object? email = null,Object? phone = null,Object? date = null,Object? time = null,Object? status = null,Object? notes = null,Object? createdAt = null,Object? unit = freezed,}) {
  return _then(_BookingDataModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,unit: freezed == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as UnitModel?,
  ));
}

/// Create a copy of BookingDataModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UnitModelCopyWith<$Res>? get unit {
    if (_self.unit == null) {
    return null;
  }

  return $UnitModelCopyWith<$Res>(_self.unit!, (value) {
    return _then(_self.copyWith(unit: value));
  });
}
}

// dart format on
