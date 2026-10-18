// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'developer_collection_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DeveloperCollectionEntity {

 int get id; String get name; String get description; String get logo; String get email; String get phone; String get address; List<UnitEntity> get units; PaginationModel? get pagination;
/// Create a copy of DeveloperCollectionEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeveloperCollectionEntityCopyWith<DeveloperCollectionEntity> get copyWith => _$DeveloperCollectionEntityCopyWithImpl<DeveloperCollectionEntity>(this as DeveloperCollectionEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeveloperCollectionEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.logo, logo) || other.logo == logo)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.address, address) || other.address == address)&&const DeepCollectionEquality().equals(other.units, units)&&(identical(other.pagination, pagination) || other.pagination == pagination));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,description,logo,email,phone,address,const DeepCollectionEquality().hash(units),pagination);

@override
String toString() {
  return 'DeveloperCollectionEntity(id: $id, name: $name, description: $description, logo: $logo, email: $email, phone: $phone, address: $address, units: $units, pagination: $pagination)';
}


}

/// @nodoc
abstract mixin class $DeveloperCollectionEntityCopyWith<$Res>  {
  factory $DeveloperCollectionEntityCopyWith(DeveloperCollectionEntity value, $Res Function(DeveloperCollectionEntity) _then) = _$DeveloperCollectionEntityCopyWithImpl;
@useResult
$Res call({
 int id, String name, String description, String logo, String email, String phone, String address, List<UnitEntity> units, PaginationModel? pagination
});


$PaginationModelCopyWith<$Res>? get pagination;

}
/// @nodoc
class _$DeveloperCollectionEntityCopyWithImpl<$Res>
    implements $DeveloperCollectionEntityCopyWith<$Res> {
  _$DeveloperCollectionEntityCopyWithImpl(this._self, this._then);

  final DeveloperCollectionEntity _self;
  final $Res Function(DeveloperCollectionEntity) _then;

/// Create a copy of DeveloperCollectionEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = null,Object? logo = null,Object? email = null,Object? phone = null,Object? address = null,Object? units = null,Object? pagination = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,logo: null == logo ? _self.logo : logo // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,units: null == units ? _self.units : units // ignore: cast_nullable_to_non_nullable
as List<UnitEntity>,pagination: freezed == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as PaginationModel?,
  ));
}
/// Create a copy of DeveloperCollectionEntity
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


/// Adds pattern-matching-related methods to [DeveloperCollectionEntity].
extension DeveloperCollectionEntityPatterns on DeveloperCollectionEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DeveloperCollectionEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DeveloperCollectionEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DeveloperCollectionEntity value)  $default,){
final _that = this;
switch (_that) {
case _DeveloperCollectionEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DeveloperCollectionEntity value)?  $default,){
final _that = this;
switch (_that) {
case _DeveloperCollectionEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String description,  String logo,  String email,  String phone,  String address,  List<UnitEntity> units,  PaginationModel? pagination)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DeveloperCollectionEntity() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.logo,_that.email,_that.phone,_that.address,_that.units,_that.pagination);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String description,  String logo,  String email,  String phone,  String address,  List<UnitEntity> units,  PaginationModel? pagination)  $default,) {final _that = this;
switch (_that) {
case _DeveloperCollectionEntity():
return $default(_that.id,_that.name,_that.description,_that.logo,_that.email,_that.phone,_that.address,_that.units,_that.pagination);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String description,  String logo,  String email,  String phone,  String address,  List<UnitEntity> units,  PaginationModel? pagination)?  $default,) {final _that = this;
switch (_that) {
case _DeveloperCollectionEntity() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.logo,_that.email,_that.phone,_that.address,_that.units,_that.pagination);case _:
  return null;

}
}

}

/// @nodoc


class _DeveloperCollectionEntity extends DeveloperCollectionEntity {
  const _DeveloperCollectionEntity({required this.id, required this.name, required this.description, required this.logo, required this.email, required this.phone, required this.address, required final  List<UnitEntity> units, this.pagination}): _units = units,super._();
  

@override final  int id;
@override final  String name;
@override final  String description;
@override final  String logo;
@override final  String email;
@override final  String phone;
@override final  String address;
 final  List<UnitEntity> _units;
@override List<UnitEntity> get units {
  if (_units is EqualUnmodifiableListView) return _units;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_units);
}

@override final  PaginationModel? pagination;

/// Create a copy of DeveloperCollectionEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeveloperCollectionEntityCopyWith<_DeveloperCollectionEntity> get copyWith => __$DeveloperCollectionEntityCopyWithImpl<_DeveloperCollectionEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeveloperCollectionEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.logo, logo) || other.logo == logo)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.address, address) || other.address == address)&&const DeepCollectionEquality().equals(other._units, _units)&&(identical(other.pagination, pagination) || other.pagination == pagination));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,description,logo,email,phone,address,const DeepCollectionEquality().hash(_units),pagination);

@override
String toString() {
  return 'DeveloperCollectionEntity(id: $id, name: $name, description: $description, logo: $logo, email: $email, phone: $phone, address: $address, units: $units, pagination: $pagination)';
}


}

/// @nodoc
abstract mixin class _$DeveloperCollectionEntityCopyWith<$Res> implements $DeveloperCollectionEntityCopyWith<$Res> {
  factory _$DeveloperCollectionEntityCopyWith(_DeveloperCollectionEntity value, $Res Function(_DeveloperCollectionEntity) _then) = __$DeveloperCollectionEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String description, String logo, String email, String phone, String address, List<UnitEntity> units, PaginationModel? pagination
});


@override $PaginationModelCopyWith<$Res>? get pagination;

}
/// @nodoc
class __$DeveloperCollectionEntityCopyWithImpl<$Res>
    implements _$DeveloperCollectionEntityCopyWith<$Res> {
  __$DeveloperCollectionEntityCopyWithImpl(this._self, this._then);

  final _DeveloperCollectionEntity _self;
  final $Res Function(_DeveloperCollectionEntity) _then;

/// Create a copy of DeveloperCollectionEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = null,Object? logo = null,Object? email = null,Object? phone = null,Object? address = null,Object? units = null,Object? pagination = freezed,}) {
  return _then(_DeveloperCollectionEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,logo: null == logo ? _self.logo : logo // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,units: null == units ? _self._units : units // ignore: cast_nullable_to_non_nullable
as List<UnitEntity>,pagination: freezed == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as PaginationModel?,
  ));
}

/// Create a copy of DeveloperCollectionEntity
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
