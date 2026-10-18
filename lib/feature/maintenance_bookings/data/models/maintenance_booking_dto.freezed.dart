// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'maintenance_booking_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MaintenanceBookingDto {

 int get id; MaintenanceServiceDto? get service; String get phone; String get address; String get message; String get status;@JsonKey(name: 'created_at') String get createdAt;
/// Create a copy of MaintenanceBookingDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MaintenanceBookingDtoCopyWith<MaintenanceBookingDto> get copyWith => _$MaintenanceBookingDtoCopyWithImpl<MaintenanceBookingDto>(this as MaintenanceBookingDto, _$identity);

  /// Serializes this MaintenanceBookingDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as MaintenanceBookingDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MaintenanceBookingDto&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.service, _this.service) || other.service == _this.service)&&(identical(other.phone, _this.phone) || other.phone == _this.phone)&&(identical(other.address, _this.address) || other.address == _this.address)&&(identical(other.message, _this.message) || other.message == _this.message)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as MaintenanceBookingDto;
  return Object.hash(runtimeType,_this.id,_this.service,_this.phone,_this.address,_this.message,_this.status,_this.createdAt);
}

@override
String toString() {
  final _this = this as MaintenanceBookingDto;
  return 'MaintenanceBookingDto(id: ${_this.id}, service: ${_this.service}, phone: ${_this.phone}, address: ${_this.address}, message: ${_this.message}, status: ${_this.status}, createdAt: ${_this.createdAt})';
}


}

/// @nodoc
abstract mixin class $MaintenanceBookingDtoCopyWith<$Res>  {
  factory $MaintenanceBookingDtoCopyWith(MaintenanceBookingDto value, $Res Function(MaintenanceBookingDto) _then) = _$MaintenanceBookingDtoCopyWithImpl;
@useResult
$Res call({
 int id, MaintenanceServiceDto? service, String phone, String address, String message, String status,@JsonKey(name: 'created_at') String createdAt
});


$MaintenanceServiceDtoCopyWith<$Res>? get service;

}
/// @nodoc
class _$MaintenanceBookingDtoCopyWithImpl<$Res>
    implements $MaintenanceBookingDtoCopyWith<$Res> {
  _$MaintenanceBookingDtoCopyWithImpl(this._self, this._then);

  final MaintenanceBookingDto _self;
  final $Res Function(MaintenanceBookingDto) _then;

/// Create a copy of MaintenanceBookingDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? service = freezed,Object? phone = null,Object? address = null,Object? message = null,Object? status = null,Object? createdAt = null,}) {
  return _then(MaintenanceBookingDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,service: freezed == service ? _self.service : service // ignore: cast_nullable_to_non_nullable
as MaintenanceServiceDto?,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of MaintenanceBookingDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MaintenanceServiceDtoCopyWith<$Res>? get service {
    if (_self.service == null) {
    return null;
  }

  return $MaintenanceServiceDtoCopyWith<$Res>(_self.service!, (value) {
    return _then(_self.copyWith(service: value));
  });
}
}


/// Adds pattern-matching-related methods to [MaintenanceBookingDto].
extension MaintenanceBookingDtoPatterns on MaintenanceBookingDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MaintenanceBookingDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MaintenanceBookingDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MaintenanceBookingDto value)  $default,){
final _that = this;
switch (_that) {
case _MaintenanceBookingDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MaintenanceBookingDto value)?  $default,){
final _that = this;
switch (_that) {
case _MaintenanceBookingDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  MaintenanceServiceDto? service,  String phone,  String address,  String message,  String status, @JsonKey(name: 'created_at')  String createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MaintenanceBookingDto() when $default != null:
return $default(_that.id,_that.service,_that.phone,_that.address,_that.message,_that.status,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  MaintenanceServiceDto? service,  String phone,  String address,  String message,  String status, @JsonKey(name: 'created_at')  String createdAt)  $default,) {final _that = this;
switch (_that) {
case _MaintenanceBookingDto():
return $default(_that.id,_that.service,_that.phone,_that.address,_that.message,_that.status,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  MaintenanceServiceDto? service,  String phone,  String address,  String message,  String status, @JsonKey(name: 'created_at')  String createdAt)?  $default,) {final _that = this;
switch (_that) {
case _MaintenanceBookingDto() when $default != null:
return $default(_that.id,_that.service,_that.phone,_that.address,_that.message,_that.status,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MaintenanceBookingDto extends MaintenanceBookingDto {
  const _MaintenanceBookingDto({this.id = 0, this.service, this.phone = '', this.address = '', this.message = '', this.status = '', @JsonKey(name: 'created_at') this.createdAt = ''}): super._();
  factory _MaintenanceBookingDto.fromJson(Map<String, dynamic> json) => _$MaintenanceBookingDtoFromJson(json);

@override@JsonKey() final  int id;
@override final  MaintenanceServiceDto? service;
@override@JsonKey() final  String phone;
@override@JsonKey() final  String address;
@override@JsonKey() final  String message;
@override@JsonKey() final  String status;
@override@JsonKey(name: 'created_at') final  String createdAt;

/// Create a copy of MaintenanceBookingDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MaintenanceBookingDtoCopyWith<_MaintenanceBookingDto> get copyWith => __$MaintenanceBookingDtoCopyWithImpl<_MaintenanceBookingDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MaintenanceBookingDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _MaintenanceBookingDto&&(identical(other.id, id) || other.id == id)&&(identical(other.service, service) || other.service == service)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.address, address) || other.address == address)&&(identical(other.message, message) || other.message == message)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,service,phone,address,message,status,createdAt);
}

@override
String toString() {
    return 'MaintenanceBookingDto(id: $id, service: $service, phone: $phone, address: $address, message: $message, status: $status, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$MaintenanceBookingDtoCopyWith<$Res> implements $MaintenanceBookingDtoCopyWith<$Res> {
  factory _$MaintenanceBookingDtoCopyWith(_MaintenanceBookingDto value, $Res Function(_MaintenanceBookingDto) _then) = __$MaintenanceBookingDtoCopyWithImpl;
@override @useResult
$Res call({
 int id, MaintenanceServiceDto? service, String phone, String address, String message, String status,@JsonKey(name: 'created_at') String createdAt
});


@override $MaintenanceServiceDtoCopyWith<$Res>? get service;

}
/// @nodoc
class __$MaintenanceBookingDtoCopyWithImpl<$Res>
    implements _$MaintenanceBookingDtoCopyWith<$Res> {
  __$MaintenanceBookingDtoCopyWithImpl(this._self, this._then);

  final _MaintenanceBookingDto _self;
  final $Res Function(_MaintenanceBookingDto) _then;

/// Create a copy of MaintenanceBookingDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? service = freezed,Object? phone = null,Object? address = null,Object? message = null,Object? status = null,Object? createdAt = null,}) {
  return _then(_MaintenanceBookingDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,service: freezed == service ? _self.service : service // ignore: cast_nullable_to_non_nullable
as MaintenanceServiceDto?,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of MaintenanceBookingDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MaintenanceServiceDtoCopyWith<$Res>? get service {
    if (_self.service == null) {
    return null;
  }

  return $MaintenanceServiceDtoCopyWith<$Res>(_self.service!, (value) {
    return _then(_self.copyWith(service: value));
  });
}
}


/// @nodoc
mixin _$MaintenanceBookingsListResponseDto {

 bool get status; String get message; List<MaintenanceBookingDto> get data; PaginationModel? get pagination;
/// Create a copy of MaintenanceBookingsListResponseDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MaintenanceBookingsListResponseDtoCopyWith<MaintenanceBookingsListResponseDto> get copyWith => _$MaintenanceBookingsListResponseDtoCopyWithImpl<MaintenanceBookingsListResponseDto>(this as MaintenanceBookingsListResponseDto, _$identity);

  /// Serializes this MaintenanceBookingsListResponseDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as MaintenanceBookingsListResponseDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MaintenanceBookingsListResponseDto&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.message, _this.message) || other.message == _this.message)&&const DeepCollectionEquality().equals(other.data, _this.data)&&(identical(other.pagination, _this.pagination) || other.pagination == _this.pagination));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as MaintenanceBookingsListResponseDto;
  return Object.hash(runtimeType,_this.status,_this.message,const DeepCollectionEquality().hash(_this.data),_this.pagination);
}

@override
String toString() {
  final _this = this as MaintenanceBookingsListResponseDto;
  return 'MaintenanceBookingsListResponseDto(status: ${_this.status}, message: ${_this.message}, data: ${_this.data}, pagination: ${_this.pagination})';
}


}

/// @nodoc
abstract mixin class $MaintenanceBookingsListResponseDtoCopyWith<$Res>  {
  factory $MaintenanceBookingsListResponseDtoCopyWith(MaintenanceBookingsListResponseDto value, $Res Function(MaintenanceBookingsListResponseDto) _then) = _$MaintenanceBookingsListResponseDtoCopyWithImpl;
@useResult
$Res call({
 bool status, String message, List<MaintenanceBookingDto> data, PaginationModel? pagination
});


$PaginationModelCopyWith<$Res>? get pagination;

}
/// @nodoc
class _$MaintenanceBookingsListResponseDtoCopyWithImpl<$Res>
    implements $MaintenanceBookingsListResponseDtoCopyWith<$Res> {
  _$MaintenanceBookingsListResponseDtoCopyWithImpl(this._self, this._then);

  final MaintenanceBookingsListResponseDto _self;
  final $Res Function(MaintenanceBookingsListResponseDto) _then;

/// Create a copy of MaintenanceBookingsListResponseDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? message = null,Object? data = null,Object? pagination = freezed,}) {
  return _then(MaintenanceBookingsListResponseDto(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<MaintenanceBookingDto>,pagination: freezed == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as PaginationModel?,
  ));
}
/// Create a copy of MaintenanceBookingsListResponseDto
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


/// Adds pattern-matching-related methods to [MaintenanceBookingsListResponseDto].
extension MaintenanceBookingsListResponseDtoPatterns on MaintenanceBookingsListResponseDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MaintenanceBookingsListResponseDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MaintenanceBookingsListResponseDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MaintenanceBookingsListResponseDto value)  $default,){
final _that = this;
switch (_that) {
case _MaintenanceBookingsListResponseDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MaintenanceBookingsListResponseDto value)?  $default,){
final _that = this;
switch (_that) {
case _MaintenanceBookingsListResponseDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool status,  String message,  List<MaintenanceBookingDto> data,  PaginationModel? pagination)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MaintenanceBookingsListResponseDto() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool status,  String message,  List<MaintenanceBookingDto> data,  PaginationModel? pagination)  $default,) {final _that = this;
switch (_that) {
case _MaintenanceBookingsListResponseDto():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool status,  String message,  List<MaintenanceBookingDto> data,  PaginationModel? pagination)?  $default,) {final _that = this;
switch (_that) {
case _MaintenanceBookingsListResponseDto() when $default != null:
return $default(_that.status,_that.message,_that.data,_that.pagination);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MaintenanceBookingsListResponseDto extends MaintenanceBookingsListResponseDto {
  const _MaintenanceBookingsListResponseDto({this.status = false, this.message = '',  List<MaintenanceBookingDto> data = const [], this.pagination}): _data = data,super._();
  factory _MaintenanceBookingsListResponseDto.fromJson(Map<String, dynamic> json) => _$MaintenanceBookingsListResponseDtoFromJson(json);

@override@JsonKey() final  bool status;
@override@JsonKey() final  String message;
 final  List<MaintenanceBookingDto> _data;
@override@JsonKey() List<MaintenanceBookingDto> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}

@override final  PaginationModel? pagination;

/// Create a copy of MaintenanceBookingsListResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MaintenanceBookingsListResponseDtoCopyWith<_MaintenanceBookingsListResponseDto> get copyWith => __$MaintenanceBookingsListResponseDtoCopyWithImpl<_MaintenanceBookingsListResponseDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MaintenanceBookingsListResponseDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _MaintenanceBookingsListResponseDto&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.data, _data)&&(identical(other.pagination, pagination) || other.pagination == pagination));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,status,message,const DeepCollectionEquality().hash(_data),pagination);
}

@override
String toString() {
    return 'MaintenanceBookingsListResponseDto(status: $status, message: $message, data: $data, pagination: $pagination)';
}


}

/// @nodoc
abstract mixin class _$MaintenanceBookingsListResponseDtoCopyWith<$Res> implements $MaintenanceBookingsListResponseDtoCopyWith<$Res> {
  factory _$MaintenanceBookingsListResponseDtoCopyWith(_MaintenanceBookingsListResponseDto value, $Res Function(_MaintenanceBookingsListResponseDto) _then) = __$MaintenanceBookingsListResponseDtoCopyWithImpl;
@override @useResult
$Res call({
 bool status, String message, List<MaintenanceBookingDto> data, PaginationModel? pagination
});


@override $PaginationModelCopyWith<$Res>? get pagination;

}
/// @nodoc
class __$MaintenanceBookingsListResponseDtoCopyWithImpl<$Res>
    implements _$MaintenanceBookingsListResponseDtoCopyWith<$Res> {
  __$MaintenanceBookingsListResponseDtoCopyWithImpl(this._self, this._then);

  final _MaintenanceBookingsListResponseDto _self;
  final $Res Function(_MaintenanceBookingsListResponseDto) _then;

/// Create a copy of MaintenanceBookingsListResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? message = null,Object? data = null,Object? pagination = freezed,}) {
  return _then(_MaintenanceBookingsListResponseDto(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<MaintenanceBookingDto>,pagination: freezed == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as PaginationModel?,
  ));
}

/// Create a copy of MaintenanceBookingsListResponseDto
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
