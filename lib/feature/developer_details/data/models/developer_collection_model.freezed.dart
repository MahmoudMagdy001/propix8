// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'developer_collection_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DeveloperCollectionModel {

 int get id; String get name; String get description; String get logo; String get email; String get phone; String get address; List<UnitModel> get units; PaginationModel? get pagination;
/// Create a copy of DeveloperCollectionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeveloperCollectionModelCopyWith<DeveloperCollectionModel> get copyWith => _$DeveloperCollectionModelCopyWithImpl<DeveloperCollectionModel>(this as DeveloperCollectionModel, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as DeveloperCollectionModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeveloperCollectionModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.description, _this.description) || other.description == _this.description)&&(identical(other.logo, _this.logo) || other.logo == _this.logo)&&(identical(other.email, _this.email) || other.email == _this.email)&&(identical(other.phone, _this.phone) || other.phone == _this.phone)&&(identical(other.address, _this.address) || other.address == _this.address)&&const DeepCollectionEquality().equals(other.units, _this.units)&&(identical(other.pagination, _this.pagination) || other.pagination == _this.pagination));
}


@override
int get hashCode {
  final _this = this as DeveloperCollectionModel;
  return Object.hash(runtimeType,_this.id,_this.name,_this.description,_this.logo,_this.email,_this.phone,_this.address,const DeepCollectionEquality().hash(_this.units),_this.pagination);
}

@override
String toString() {
  final _this = this as DeveloperCollectionModel;
  return 'DeveloperCollectionModel(id: ${_this.id}, name: ${_this.name}, description: ${_this.description}, logo: ${_this.logo}, email: ${_this.email}, phone: ${_this.phone}, address: ${_this.address}, units: ${_this.units}, pagination: ${_this.pagination})';
}


}

/// @nodoc
abstract mixin class $DeveloperCollectionModelCopyWith<$Res>  {
  factory $DeveloperCollectionModelCopyWith(DeveloperCollectionModel value, $Res Function(DeveloperCollectionModel) _then) = _$DeveloperCollectionModelCopyWithImpl;
@useResult
$Res call({
 int id, String name, String description, String logo, String email, String phone, String address, List<UnitModel> units, PaginationModel? pagination
});


$PaginationModelCopyWith<$Res>? get pagination;

}
/// @nodoc
class _$DeveloperCollectionModelCopyWithImpl<$Res>
    implements $DeveloperCollectionModelCopyWith<$Res> {
  _$DeveloperCollectionModelCopyWithImpl(this._self, this._then);

  final DeveloperCollectionModel _self;
  final $Res Function(DeveloperCollectionModel) _then;

/// Create a copy of DeveloperCollectionModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = null,Object? logo = null,Object? email = null,Object? phone = null,Object? address = null,Object? units = null,Object? pagination = freezed,}) {
  return _then(DeveloperCollectionModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,logo: null == logo ? _self.logo : logo // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,units: null == units ? _self.units : units // ignore: cast_nullable_to_non_nullable
as List<UnitModel>,pagination: freezed == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as PaginationModel?,
  ));
}
/// Create a copy of DeveloperCollectionModel
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


/// Adds pattern-matching-related methods to [DeveloperCollectionModel].
extension DeveloperCollectionModelPatterns on DeveloperCollectionModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DeveloperCollectionModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DeveloperCollectionModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DeveloperCollectionModel value)  $default,){
final _that = this;
switch (_that) {
case _DeveloperCollectionModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DeveloperCollectionModel value)?  $default,){
final _that = this;
switch (_that) {
case _DeveloperCollectionModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String description,  String logo,  String email,  String phone,  String address,  List<UnitModel> units,  PaginationModel? pagination)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DeveloperCollectionModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String description,  String logo,  String email,  String phone,  String address,  List<UnitModel> units,  PaginationModel? pagination)  $default,) {final _that = this;
switch (_that) {
case _DeveloperCollectionModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String description,  String logo,  String email,  String phone,  String address,  List<UnitModel> units,  PaginationModel? pagination)?  $default,) {final _that = this;
switch (_that) {
case _DeveloperCollectionModel() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.logo,_that.email,_that.phone,_that.address,_that.units,_that.pagination);case _:
  return null;

}
}

}

/// @nodoc


class _DeveloperCollectionModel extends DeveloperCollectionModel {
  const _DeveloperCollectionModel({required this.id, required this.name, required this.description, required this.logo, required this.email, required this.phone, required this.address, required  List<UnitModel> units, this.pagination}): _units = units,super._();
  

@override final  int id;
@override final  String name;
@override final  String description;
@override final  String logo;
@override final  String email;
@override final  String phone;
@override final  String address;
 final  List<UnitModel> _units;
@override List<UnitModel> get units {
  if (_units is EqualUnmodifiableListView) return _units;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_units);
}

@override final  PaginationModel? pagination;

/// Create a copy of DeveloperCollectionModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeveloperCollectionModelCopyWith<_DeveloperCollectionModel> get copyWith => __$DeveloperCollectionModelCopyWithImpl<_DeveloperCollectionModel>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeveloperCollectionModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.logo, logo) || other.logo == logo)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.address, address) || other.address == address)&&const DeepCollectionEquality().equals(other.units, _units)&&(identical(other.pagination, pagination) || other.pagination == pagination));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,name,description,logo,email,phone,address,const DeepCollectionEquality().hash(_units),pagination);
}

@override
String toString() {
    return 'DeveloperCollectionModel(id: $id, name: $name, description: $description, logo: $logo, email: $email, phone: $phone, address: $address, units: $units, pagination: $pagination)';
}


}

/// @nodoc
abstract mixin class _$DeveloperCollectionModelCopyWith<$Res> implements $DeveloperCollectionModelCopyWith<$Res> {
  factory _$DeveloperCollectionModelCopyWith(_DeveloperCollectionModel value, $Res Function(_DeveloperCollectionModel) _then) = __$DeveloperCollectionModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String description, String logo, String email, String phone, String address, List<UnitModel> units, PaginationModel? pagination
});


@override $PaginationModelCopyWith<$Res>? get pagination;

}
/// @nodoc
class __$DeveloperCollectionModelCopyWithImpl<$Res>
    implements _$DeveloperCollectionModelCopyWith<$Res> {
  __$DeveloperCollectionModelCopyWithImpl(this._self, this._then);

  final _DeveloperCollectionModel _self;
  final $Res Function(_DeveloperCollectionModel) _then;

/// Create a copy of DeveloperCollectionModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = null,Object? logo = null,Object? email = null,Object? phone = null,Object? address = null,Object? units = null,Object? pagination = freezed,}) {
  return _then(_DeveloperCollectionModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,logo: null == logo ? _self.logo : logo // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,units: null == units ? _self._units : units // ignore: cast_nullable_to_non_nullable
as List<UnitModel>,pagination: freezed == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as PaginationModel?,
  ));
}

/// Create a copy of DeveloperCollectionModel
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
