// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'maintenance_booking_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MaintenanceBookingEntity {

 int get id; MaintenanceServiceEntity? get service; String get phone; String get address; String get message; String get status; String get createdAt;
/// Create a copy of MaintenanceBookingEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MaintenanceBookingEntityCopyWith<MaintenanceBookingEntity> get copyWith => _$MaintenanceBookingEntityCopyWithImpl<MaintenanceBookingEntity>(this as MaintenanceBookingEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MaintenanceBookingEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.service, service) || other.service == service)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.address, address) || other.address == address)&&(identical(other.message, message) || other.message == message)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,service,phone,address,message,status,createdAt);

@override
String toString() {
  return 'MaintenanceBookingEntity(id: $id, service: $service, phone: $phone, address: $address, message: $message, status: $status, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $MaintenanceBookingEntityCopyWith<$Res>  {
  factory $MaintenanceBookingEntityCopyWith(MaintenanceBookingEntity value, $Res Function(MaintenanceBookingEntity) _then) = _$MaintenanceBookingEntityCopyWithImpl;
@useResult
$Res call({
 int id, MaintenanceServiceEntity? service, String phone, String address, String message, String status, String createdAt
});


$MaintenanceServiceEntityCopyWith<$Res>? get service;

}
/// @nodoc
class _$MaintenanceBookingEntityCopyWithImpl<$Res>
    implements $MaintenanceBookingEntityCopyWith<$Res> {
  _$MaintenanceBookingEntityCopyWithImpl(this._self, this._then);

  final MaintenanceBookingEntity _self;
  final $Res Function(MaintenanceBookingEntity) _then;

/// Create a copy of MaintenanceBookingEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? service = freezed,Object? phone = null,Object? address = null,Object? message = null,Object? status = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,service: freezed == service ? _self.service : service // ignore: cast_nullable_to_non_nullable
as MaintenanceServiceEntity?,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of MaintenanceBookingEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MaintenanceServiceEntityCopyWith<$Res>? get service {
    if (_self.service == null) {
    return null;
  }

  return $MaintenanceServiceEntityCopyWith<$Res>(_self.service!, (value) {
    return _then(_self.copyWith(service: value));
  });
}
}


/// Adds pattern-matching-related methods to [MaintenanceBookingEntity].
extension MaintenanceBookingEntityPatterns on MaintenanceBookingEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MaintenanceBookingEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MaintenanceBookingEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MaintenanceBookingEntity value)  $default,){
final _that = this;
switch (_that) {
case _MaintenanceBookingEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MaintenanceBookingEntity value)?  $default,){
final _that = this;
switch (_that) {
case _MaintenanceBookingEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  MaintenanceServiceEntity? service,  String phone,  String address,  String message,  String status,  String createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MaintenanceBookingEntity() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  MaintenanceServiceEntity? service,  String phone,  String address,  String message,  String status,  String createdAt)  $default,) {final _that = this;
switch (_that) {
case _MaintenanceBookingEntity():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  MaintenanceServiceEntity? service,  String phone,  String address,  String message,  String status,  String createdAt)?  $default,) {final _that = this;
switch (_that) {
case _MaintenanceBookingEntity() when $default != null:
return $default(_that.id,_that.service,_that.phone,_that.address,_that.message,_that.status,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc


class _MaintenanceBookingEntity implements MaintenanceBookingEntity {
  const _MaintenanceBookingEntity({required this.id, required this.service, required this.phone, required this.address, required this.message, required this.status, required this.createdAt});
  

@override final  int id;
@override final  MaintenanceServiceEntity? service;
@override final  String phone;
@override final  String address;
@override final  String message;
@override final  String status;
@override final  String createdAt;

/// Create a copy of MaintenanceBookingEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MaintenanceBookingEntityCopyWith<_MaintenanceBookingEntity> get copyWith => __$MaintenanceBookingEntityCopyWithImpl<_MaintenanceBookingEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MaintenanceBookingEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.service, service) || other.service == service)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.address, address) || other.address == address)&&(identical(other.message, message) || other.message == message)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,service,phone,address,message,status,createdAt);

@override
String toString() {
  return 'MaintenanceBookingEntity(id: $id, service: $service, phone: $phone, address: $address, message: $message, status: $status, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$MaintenanceBookingEntityCopyWith<$Res> implements $MaintenanceBookingEntityCopyWith<$Res> {
  factory _$MaintenanceBookingEntityCopyWith(_MaintenanceBookingEntity value, $Res Function(_MaintenanceBookingEntity) _then) = __$MaintenanceBookingEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, MaintenanceServiceEntity? service, String phone, String address, String message, String status, String createdAt
});


@override $MaintenanceServiceEntityCopyWith<$Res>? get service;

}
/// @nodoc
class __$MaintenanceBookingEntityCopyWithImpl<$Res>
    implements _$MaintenanceBookingEntityCopyWith<$Res> {
  __$MaintenanceBookingEntityCopyWithImpl(this._self, this._then);

  final _MaintenanceBookingEntity _self;
  final $Res Function(_MaintenanceBookingEntity) _then;

/// Create a copy of MaintenanceBookingEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? service = freezed,Object? phone = null,Object? address = null,Object? message = null,Object? status = null,Object? createdAt = null,}) {
  return _then(_MaintenanceBookingEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,service: freezed == service ? _self.service : service // ignore: cast_nullable_to_non_nullable
as MaintenanceServiceEntity?,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of MaintenanceBookingEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MaintenanceServiceEntityCopyWith<$Res>? get service {
    if (_self.service == null) {
    return null;
  }

  return $MaintenanceServiceEntityCopyWith<$Res>(_self.service!, (value) {
    return _then(_self.copyWith(service: value));
  });
}
}

/// @nodoc
mixin _$MaintenanceBookingsDataEntity {

 List<MaintenanceBookingEntity> get bookings; PaginationModel? get pagination;
/// Create a copy of MaintenanceBookingsDataEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MaintenanceBookingsDataEntityCopyWith<MaintenanceBookingsDataEntity> get copyWith => _$MaintenanceBookingsDataEntityCopyWithImpl<MaintenanceBookingsDataEntity>(this as MaintenanceBookingsDataEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MaintenanceBookingsDataEntity&&const DeepCollectionEquality().equals(other.bookings, bookings)&&(identical(other.pagination, pagination) || other.pagination == pagination));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(bookings),pagination);

@override
String toString() {
  return 'MaintenanceBookingsDataEntity(bookings: $bookings, pagination: $pagination)';
}


}

/// @nodoc
abstract mixin class $MaintenanceBookingsDataEntityCopyWith<$Res>  {
  factory $MaintenanceBookingsDataEntityCopyWith(MaintenanceBookingsDataEntity value, $Res Function(MaintenanceBookingsDataEntity) _then) = _$MaintenanceBookingsDataEntityCopyWithImpl;
@useResult
$Res call({
 List<MaintenanceBookingEntity> bookings, PaginationModel? pagination
});


$PaginationModelCopyWith<$Res>? get pagination;

}
/// @nodoc
class _$MaintenanceBookingsDataEntityCopyWithImpl<$Res>
    implements $MaintenanceBookingsDataEntityCopyWith<$Res> {
  _$MaintenanceBookingsDataEntityCopyWithImpl(this._self, this._then);

  final MaintenanceBookingsDataEntity _self;
  final $Res Function(MaintenanceBookingsDataEntity) _then;

/// Create a copy of MaintenanceBookingsDataEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? bookings = null,Object? pagination = freezed,}) {
  return _then(_self.copyWith(
bookings: null == bookings ? _self.bookings : bookings // ignore: cast_nullable_to_non_nullable
as List<MaintenanceBookingEntity>,pagination: freezed == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as PaginationModel?,
  ));
}
/// Create a copy of MaintenanceBookingsDataEntity
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


/// Adds pattern-matching-related methods to [MaintenanceBookingsDataEntity].
extension MaintenanceBookingsDataEntityPatterns on MaintenanceBookingsDataEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MaintenanceBookingsDataEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MaintenanceBookingsDataEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MaintenanceBookingsDataEntity value)  $default,){
final _that = this;
switch (_that) {
case _MaintenanceBookingsDataEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MaintenanceBookingsDataEntity value)?  $default,){
final _that = this;
switch (_that) {
case _MaintenanceBookingsDataEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<MaintenanceBookingEntity> bookings,  PaginationModel? pagination)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MaintenanceBookingsDataEntity() when $default != null:
return $default(_that.bookings,_that.pagination);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<MaintenanceBookingEntity> bookings,  PaginationModel? pagination)  $default,) {final _that = this;
switch (_that) {
case _MaintenanceBookingsDataEntity():
return $default(_that.bookings,_that.pagination);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<MaintenanceBookingEntity> bookings,  PaginationModel? pagination)?  $default,) {final _that = this;
switch (_that) {
case _MaintenanceBookingsDataEntity() when $default != null:
return $default(_that.bookings,_that.pagination);case _:
  return null;

}
}

}

/// @nodoc


class _MaintenanceBookingsDataEntity implements MaintenanceBookingsDataEntity {
  const _MaintenanceBookingsDataEntity({required final  List<MaintenanceBookingEntity> bookings, required this.pagination}): _bookings = bookings;
  

 final  List<MaintenanceBookingEntity> _bookings;
@override List<MaintenanceBookingEntity> get bookings {
  if (_bookings is EqualUnmodifiableListView) return _bookings;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_bookings);
}

@override final  PaginationModel? pagination;

/// Create a copy of MaintenanceBookingsDataEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MaintenanceBookingsDataEntityCopyWith<_MaintenanceBookingsDataEntity> get copyWith => __$MaintenanceBookingsDataEntityCopyWithImpl<_MaintenanceBookingsDataEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MaintenanceBookingsDataEntity&&const DeepCollectionEquality().equals(other._bookings, _bookings)&&(identical(other.pagination, pagination) || other.pagination == pagination));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_bookings),pagination);

@override
String toString() {
  return 'MaintenanceBookingsDataEntity(bookings: $bookings, pagination: $pagination)';
}


}

/// @nodoc
abstract mixin class _$MaintenanceBookingsDataEntityCopyWith<$Res> implements $MaintenanceBookingsDataEntityCopyWith<$Res> {
  factory _$MaintenanceBookingsDataEntityCopyWith(_MaintenanceBookingsDataEntity value, $Res Function(_MaintenanceBookingsDataEntity) _then) = __$MaintenanceBookingsDataEntityCopyWithImpl;
@override @useResult
$Res call({
 List<MaintenanceBookingEntity> bookings, PaginationModel? pagination
});


@override $PaginationModelCopyWith<$Res>? get pagination;

}
/// @nodoc
class __$MaintenanceBookingsDataEntityCopyWithImpl<$Res>
    implements _$MaintenanceBookingsDataEntityCopyWith<$Res> {
  __$MaintenanceBookingsDataEntityCopyWithImpl(this._self, this._then);

  final _MaintenanceBookingsDataEntity _self;
  final $Res Function(_MaintenanceBookingsDataEntity) _then;

/// Create a copy of MaintenanceBookingsDataEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? bookings = null,Object? pagination = freezed,}) {
  return _then(_MaintenanceBookingsDataEntity(
bookings: null == bookings ? _self._bookings : bookings // ignore: cast_nullable_to_non_nullable
as List<MaintenanceBookingEntity>,pagination: freezed == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as PaginationModel?,
  ));
}

/// Create a copy of MaintenanceBookingsDataEntity
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
