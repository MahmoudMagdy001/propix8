// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'address_setup_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AddressSetupState {

 AddressSetupStatus get status; List<City> get cities; int? get selectedCityId; LatLng? get selectedLocation; String get address; String? get errorMessage;
/// Create a copy of AddressSetupState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddressSetupStateCopyWith<AddressSetupState> get copyWith => _$AddressSetupStateCopyWithImpl<AddressSetupState>(this as AddressSetupState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as AddressSetupState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddressSetupState&&(identical(other.status, _this.status) || other.status == _this.status)&&const DeepCollectionEquality().equals(other.cities, _this.cities)&&(identical(other.selectedCityId, _this.selectedCityId) || other.selectedCityId == _this.selectedCityId)&&(identical(other.selectedLocation, _this.selectedLocation) || other.selectedLocation == _this.selectedLocation)&&(identical(other.address, _this.address) || other.address == _this.address)&&(identical(other.errorMessage, _this.errorMessage) || other.errorMessage == _this.errorMessage));
}


@override
int get hashCode {
  final _this = this as AddressSetupState;
  return Object.hash(runtimeType,_this.status,const DeepCollectionEquality().hash(_this.cities),_this.selectedCityId,_this.selectedLocation,_this.address,_this.errorMessage);
}

@override
String toString() {
  final _this = this as AddressSetupState;
  return 'AddressSetupState(status: ${_this.status}, cities: ${_this.cities}, selectedCityId: ${_this.selectedCityId}, selectedLocation: ${_this.selectedLocation}, address: ${_this.address}, errorMessage: ${_this.errorMessage})';
}


}

/// @nodoc
abstract mixin class $AddressSetupStateCopyWith<$Res>  {
  factory $AddressSetupStateCopyWith(AddressSetupState value, $Res Function(AddressSetupState) _then) = _$AddressSetupStateCopyWithImpl;
@useResult
$Res call({
 AddressSetupStatus status, List<City> cities, int? selectedCityId, LatLng? selectedLocation, String address, String? errorMessage
});




}
/// @nodoc
class _$AddressSetupStateCopyWithImpl<$Res>
    implements $AddressSetupStateCopyWith<$Res> {
  _$AddressSetupStateCopyWithImpl(this._self, this._then);

  final AddressSetupState _self;
  final $Res Function(AddressSetupState) _then;

/// Create a copy of AddressSetupState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? cities = null,Object? selectedCityId = freezed,Object? selectedLocation = freezed,Object? address = null,Object? errorMessage = freezed,}) {
  return _then(AddressSetupState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AddressSetupStatus,cities: null == cities ? _self.cities : cities // ignore: cast_nullable_to_non_nullable
as List<City>,selectedCityId: freezed == selectedCityId ? _self.selectedCityId : selectedCityId // ignore: cast_nullable_to_non_nullable
as int?,selectedLocation: freezed == selectedLocation ? _self.selectedLocation : selectedLocation // ignore: cast_nullable_to_non_nullable
as LatLng?,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AddressSetupState].
extension AddressSetupStatePatterns on AddressSetupState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AddressSetupState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AddressSetupState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AddressSetupState value)  $default,){
final _that = this;
switch (_that) {
case _AddressSetupState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AddressSetupState value)?  $default,){
final _that = this;
switch (_that) {
case _AddressSetupState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AddressSetupStatus status,  List<City> cities,  int? selectedCityId,  LatLng? selectedLocation,  String address,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AddressSetupState() when $default != null:
return $default(_that.status,_that.cities,_that.selectedCityId,_that.selectedLocation,_that.address,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AddressSetupStatus status,  List<City> cities,  int? selectedCityId,  LatLng? selectedLocation,  String address,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _AddressSetupState():
return $default(_that.status,_that.cities,_that.selectedCityId,_that.selectedLocation,_that.address,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AddressSetupStatus status,  List<City> cities,  int? selectedCityId,  LatLng? selectedLocation,  String address,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _AddressSetupState() when $default != null:
return $default(_that.status,_that.cities,_that.selectedCityId,_that.selectedLocation,_that.address,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _AddressSetupState extends AddressSetupState {
  const _AddressSetupState({this.status = AddressSetupStatus.initial,  List<City> cities = const <City>[], this.selectedCityId, this.selectedLocation, this.address = '', this.errorMessage}): _cities = cities,super._();
  

@override@JsonKey() final  AddressSetupStatus status;
 final  List<City> _cities;
@override@JsonKey() List<City> get cities {
  if (_cities is EqualUnmodifiableListView) return _cities;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_cities);
}

@override final  int? selectedCityId;
@override final  LatLng? selectedLocation;
@override@JsonKey() final  String address;
@override final  String? errorMessage;

/// Create a copy of AddressSetupState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddressSetupStateCopyWith<_AddressSetupState> get copyWith => __$AddressSetupStateCopyWithImpl<_AddressSetupState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddressSetupState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.cities, _cities)&&(identical(other.selectedCityId, selectedCityId) || other.selectedCityId == selectedCityId)&&(identical(other.selectedLocation, selectedLocation) || other.selectedLocation == selectedLocation)&&(identical(other.address, address) || other.address == address)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode {
    return Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_cities),selectedCityId,selectedLocation,address,errorMessage);
}

@override
String toString() {
    return 'AddressSetupState(status: $status, cities: $cities, selectedCityId: $selectedCityId, selectedLocation: $selectedLocation, address: $address, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$AddressSetupStateCopyWith<$Res> implements $AddressSetupStateCopyWith<$Res> {
  factory _$AddressSetupStateCopyWith(_AddressSetupState value, $Res Function(_AddressSetupState) _then) = __$AddressSetupStateCopyWithImpl;
@override @useResult
$Res call({
 AddressSetupStatus status, List<City> cities, int? selectedCityId, LatLng? selectedLocation, String address, String? errorMessage
});




}
/// @nodoc
class __$AddressSetupStateCopyWithImpl<$Res>
    implements _$AddressSetupStateCopyWith<$Res> {
  __$AddressSetupStateCopyWithImpl(this._self, this._then);

  final _AddressSetupState _self;
  final $Res Function(_AddressSetupState) _then;

/// Create a copy of AddressSetupState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? cities = null,Object? selectedCityId = freezed,Object? selectedLocation = freezed,Object? address = null,Object? errorMessage = freezed,}) {
  return _then(_AddressSetupState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AddressSetupStatus,cities: null == cities ? _self._cities : cities // ignore: cast_nullable_to_non_nullable
as List<City>,selectedCityId: freezed == selectedCityId ? _self.selectedCityId : selectedCityId // ignore: cast_nullable_to_non_nullable
as int?,selectedLocation: freezed == selectedLocation ? _self.selectedLocation : selectedLocation // ignore: cast_nullable_to_non_nullable
as LatLng?,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
