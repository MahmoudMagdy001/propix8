// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'unit_booking_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UnitBookingResponseEntity {

 bool get status; String get message; UnitBookingEntity? get data;
/// Create a copy of UnitBookingResponseEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnitBookingResponseEntityCopyWith<UnitBookingResponseEntity> get copyWith => _$UnitBookingResponseEntityCopyWithImpl<UnitBookingResponseEntity>(this as UnitBookingResponseEntity, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as UnitBookingResponseEntity;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnitBookingResponseEntity&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.message, _this.message) || other.message == _this.message)&&(identical(other.data, _this.data) || other.data == _this.data));
}


@override
int get hashCode {
  final _this = this as UnitBookingResponseEntity;
  return Object.hash(runtimeType,_this.status,_this.message,_this.data);
}

@override
String toString() {
  final _this = this as UnitBookingResponseEntity;
  return 'UnitBookingResponseEntity(status: ${_this.status}, message: ${_this.message}, data: ${_this.data})';
}


}

/// @nodoc
abstract mixin class $UnitBookingResponseEntityCopyWith<$Res>  {
  factory $UnitBookingResponseEntityCopyWith(UnitBookingResponseEntity value, $Res Function(UnitBookingResponseEntity) _then) = _$UnitBookingResponseEntityCopyWithImpl;
@useResult
$Res call({
 bool status, String message, UnitBookingEntity? data
});


$UnitBookingEntityCopyWith<$Res>? get data;

}
/// @nodoc
class _$UnitBookingResponseEntityCopyWithImpl<$Res>
    implements $UnitBookingResponseEntityCopyWith<$Res> {
  _$UnitBookingResponseEntityCopyWithImpl(this._self, this._then);

  final UnitBookingResponseEntity _self;
  final $Res Function(UnitBookingResponseEntity) _then;

/// Create a copy of UnitBookingResponseEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? message = null,Object? data = freezed,}) {
  return _then(UnitBookingResponseEntity(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as UnitBookingEntity?,
  ));
}
/// Create a copy of UnitBookingResponseEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UnitBookingEntityCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $UnitBookingEntityCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [UnitBookingResponseEntity].
extension UnitBookingResponseEntityPatterns on UnitBookingResponseEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UnitBookingResponseEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UnitBookingResponseEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UnitBookingResponseEntity value)  $default,){
final _that = this;
switch (_that) {
case _UnitBookingResponseEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UnitBookingResponseEntity value)?  $default,){
final _that = this;
switch (_that) {
case _UnitBookingResponseEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool status,  String message,  UnitBookingEntity? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UnitBookingResponseEntity() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool status,  String message,  UnitBookingEntity? data)  $default,) {final _that = this;
switch (_that) {
case _UnitBookingResponseEntity():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool status,  String message,  UnitBookingEntity? data)?  $default,) {final _that = this;
switch (_that) {
case _UnitBookingResponseEntity() when $default != null:
return $default(_that.status,_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc


class _UnitBookingResponseEntity implements UnitBookingResponseEntity {
  const _UnitBookingResponseEntity({required this.status, required this.message, this.data});
  

@override final  bool status;
@override final  String message;
@override final  UnitBookingEntity? data;

/// Create a copy of UnitBookingResponseEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UnitBookingResponseEntityCopyWith<_UnitBookingResponseEntity> get copyWith => __$UnitBookingResponseEntityCopyWithImpl<_UnitBookingResponseEntity>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _UnitBookingResponseEntity&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode {
    return Object.hash(runtimeType,status,message,data);
}

@override
String toString() {
    return 'UnitBookingResponseEntity(status: $status, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$UnitBookingResponseEntityCopyWith<$Res> implements $UnitBookingResponseEntityCopyWith<$Res> {
  factory _$UnitBookingResponseEntityCopyWith(_UnitBookingResponseEntity value, $Res Function(_UnitBookingResponseEntity) _then) = __$UnitBookingResponseEntityCopyWithImpl;
@override @useResult
$Res call({
 bool status, String message, UnitBookingEntity? data
});


@override $UnitBookingEntityCopyWith<$Res>? get data;

}
/// @nodoc
class __$UnitBookingResponseEntityCopyWithImpl<$Res>
    implements _$UnitBookingResponseEntityCopyWith<$Res> {
  __$UnitBookingResponseEntityCopyWithImpl(this._self, this._then);

  final _UnitBookingResponseEntity _self;
  final $Res Function(_UnitBookingResponseEntity) _then;

/// Create a copy of UnitBookingResponseEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? message = null,Object? data = freezed,}) {
  return _then(_UnitBookingResponseEntity(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as UnitBookingEntity?,
  ));
}

/// Create a copy of UnitBookingResponseEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UnitBookingEntityCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $UnitBookingEntityCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}

/// @nodoc
mixin _$UnitBookingEntity {

 int get id; int get userId; String get name; String get email; String get phone; String get date; String get time; String get status; String get notes; String get createdAt; UnitEntity? get unit;
/// Create a copy of UnitBookingEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnitBookingEntityCopyWith<UnitBookingEntity> get copyWith => _$UnitBookingEntityCopyWithImpl<UnitBookingEntity>(this as UnitBookingEntity, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as UnitBookingEntity;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnitBookingEntity&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.userId, _this.userId) || other.userId == _this.userId)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.email, _this.email) || other.email == _this.email)&&(identical(other.phone, _this.phone) || other.phone == _this.phone)&&(identical(other.date, _this.date) || other.date == _this.date)&&(identical(other.time, _this.time) || other.time == _this.time)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.notes, _this.notes) || other.notes == _this.notes)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.unit, _this.unit) || other.unit == _this.unit));
}


@override
int get hashCode {
  final _this = this as UnitBookingEntity;
  return Object.hash(runtimeType,_this.id,_this.userId,_this.name,_this.email,_this.phone,_this.date,_this.time,_this.status,_this.notes,_this.createdAt,_this.unit);
}

@override
String toString() {
  final _this = this as UnitBookingEntity;
  return 'UnitBookingEntity(id: ${_this.id}, userId: ${_this.userId}, name: ${_this.name}, email: ${_this.email}, phone: ${_this.phone}, date: ${_this.date}, time: ${_this.time}, status: ${_this.status}, notes: ${_this.notes}, createdAt: ${_this.createdAt}, unit: ${_this.unit})';
}


}

/// @nodoc
abstract mixin class $UnitBookingEntityCopyWith<$Res>  {
  factory $UnitBookingEntityCopyWith(UnitBookingEntity value, $Res Function(UnitBookingEntity) _then) = _$UnitBookingEntityCopyWithImpl;
@useResult
$Res call({
 int id, int userId, String name, String email, String phone, String date, String time, String status, String notes, String createdAt, UnitEntity? unit
});


$UnitEntityCopyWith<$Res>? get unit;

}
/// @nodoc
class _$UnitBookingEntityCopyWithImpl<$Res>
    implements $UnitBookingEntityCopyWith<$Res> {
  _$UnitBookingEntityCopyWithImpl(this._self, this._then);

  final UnitBookingEntity _self;
  final $Res Function(UnitBookingEntity) _then;

/// Create a copy of UnitBookingEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? name = null,Object? email = null,Object? phone = null,Object? date = null,Object? time = null,Object? status = null,Object? notes = null,Object? createdAt = null,Object? unit = freezed,}) {
  return _then(UnitBookingEntity(
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
as UnitEntity?,
  ));
}
/// Create a copy of UnitBookingEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UnitEntityCopyWith<$Res>? get unit {
    if (_self.unit == null) {
    return null;
  }

  return $UnitEntityCopyWith<$Res>(_self.unit!, (value) {
    return _then(_self.copyWith(unit: value));
  });
}
}


/// Adds pattern-matching-related methods to [UnitBookingEntity].
extension UnitBookingEntityPatterns on UnitBookingEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UnitBookingEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UnitBookingEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UnitBookingEntity value)  $default,){
final _that = this;
switch (_that) {
case _UnitBookingEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UnitBookingEntity value)?  $default,){
final _that = this;
switch (_that) {
case _UnitBookingEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int userId,  String name,  String email,  String phone,  String date,  String time,  String status,  String notes,  String createdAt,  UnitEntity? unit)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UnitBookingEntity() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int userId,  String name,  String email,  String phone,  String date,  String time,  String status,  String notes,  String createdAt,  UnitEntity? unit)  $default,) {final _that = this;
switch (_that) {
case _UnitBookingEntity():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int userId,  String name,  String email,  String phone,  String date,  String time,  String status,  String notes,  String createdAt,  UnitEntity? unit)?  $default,) {final _that = this;
switch (_that) {
case _UnitBookingEntity() when $default != null:
return $default(_that.id,_that.userId,_that.name,_that.email,_that.phone,_that.date,_that.time,_that.status,_that.notes,_that.createdAt,_that.unit);case _:
  return null;

}
}

}

/// @nodoc


class _UnitBookingEntity implements UnitBookingEntity {
  const _UnitBookingEntity({required this.id, required this.userId, required this.name, required this.email, required this.phone, required this.date, required this.time, required this.status, required this.notes, required this.createdAt, this.unit});
  

@override final  int id;
@override final  int userId;
@override final  String name;
@override final  String email;
@override final  String phone;
@override final  String date;
@override final  String time;
@override final  String status;
@override final  String notes;
@override final  String createdAt;
@override final  UnitEntity? unit;

/// Create a copy of UnitBookingEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UnitBookingEntityCopyWith<_UnitBookingEntity> get copyWith => __$UnitBookingEntityCopyWithImpl<_UnitBookingEntity>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _UnitBookingEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.date, date) || other.date == date)&&(identical(other.time, time) || other.time == time)&&(identical(other.status, status) || other.status == status)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.unit, unit) || other.unit == unit));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,userId,name,email,phone,date,time,status,notes,createdAt,unit);
}

@override
String toString() {
    return 'UnitBookingEntity(id: $id, userId: $userId, name: $name, email: $email, phone: $phone, date: $date, time: $time, status: $status, notes: $notes, createdAt: $createdAt, unit: $unit)';
}


}

/// @nodoc
abstract mixin class _$UnitBookingEntityCopyWith<$Res> implements $UnitBookingEntityCopyWith<$Res> {
  factory _$UnitBookingEntityCopyWith(_UnitBookingEntity value, $Res Function(_UnitBookingEntity) _then) = __$UnitBookingEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, int userId, String name, String email, String phone, String date, String time, String status, String notes, String createdAt, UnitEntity? unit
});


@override $UnitEntityCopyWith<$Res>? get unit;

}
/// @nodoc
class __$UnitBookingEntityCopyWithImpl<$Res>
    implements _$UnitBookingEntityCopyWith<$Res> {
  __$UnitBookingEntityCopyWithImpl(this._self, this._then);

  final _UnitBookingEntity _self;
  final $Res Function(_UnitBookingEntity) _then;

/// Create a copy of UnitBookingEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? name = null,Object? email = null,Object? phone = null,Object? date = null,Object? time = null,Object? status = null,Object? notes = null,Object? createdAt = null,Object? unit = freezed,}) {
  return _then(_UnitBookingEntity(
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
as UnitEntity?,
  ));
}

/// Create a copy of UnitBookingEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UnitEntityCopyWith<$Res>? get unit {
    if (_self.unit == null) {
    return null;
  }

  return $UnitEntityCopyWith<$Res>(_self.unit!, (value) {
    return _then(_self.copyWith(unit: value));
  });
}
}

// dart format on
