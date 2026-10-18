// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'address_setup_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AddressSetupEvent {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is AddressSetupEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'AddressSetupEvent()';
}


}

/// @nodoc
class $AddressSetupEventCopyWith<$Res>  {
$AddressSetupEventCopyWith(AddressSetupEvent _, $Res Function(AddressSetupEvent) __);
}


/// Adds pattern-matching-related methods to [AddressSetupEvent].
extension AddressSetupEventPatterns on AddressSetupEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AddressSetupCitiesRequested value)?  citiesRequested,TResult Function( AddressSetupLocationDetectionRequested value)?  locationDetectionRequested,TResult Function( AddressSetupCitySelected value)?  citySelected,TResult Function( AddressSetupLocationUpdated value)?  locationUpdated,TResult Function( AddressSetupSubmitted value)?  submitted,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AddressSetupCitiesRequested() when citiesRequested != null:
return citiesRequested(_that);case AddressSetupLocationDetectionRequested() when locationDetectionRequested != null:
return locationDetectionRequested(_that);case AddressSetupCitySelected() when citySelected != null:
return citySelected(_that);case AddressSetupLocationUpdated() when locationUpdated != null:
return locationUpdated(_that);case AddressSetupSubmitted() when submitted != null:
return submitted(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AddressSetupCitiesRequested value)  citiesRequested,required TResult Function( AddressSetupLocationDetectionRequested value)  locationDetectionRequested,required TResult Function( AddressSetupCitySelected value)  citySelected,required TResult Function( AddressSetupLocationUpdated value)  locationUpdated,required TResult Function( AddressSetupSubmitted value)  submitted,}){
final _that = this;
switch (_that) {
case AddressSetupCitiesRequested():
return citiesRequested(_that);case AddressSetupLocationDetectionRequested():
return locationDetectionRequested(_that);case AddressSetupCitySelected():
return citySelected(_that);case AddressSetupLocationUpdated():
return locationUpdated(_that);case AddressSetupSubmitted():
return submitted(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AddressSetupCitiesRequested value)?  citiesRequested,TResult? Function( AddressSetupLocationDetectionRequested value)?  locationDetectionRequested,TResult? Function( AddressSetupCitySelected value)?  citySelected,TResult? Function( AddressSetupLocationUpdated value)?  locationUpdated,TResult? Function( AddressSetupSubmitted value)?  submitted,}){
final _that = this;
switch (_that) {
case AddressSetupCitiesRequested() when citiesRequested != null:
return citiesRequested(_that);case AddressSetupLocationDetectionRequested() when locationDetectionRequested != null:
return locationDetectionRequested(_that);case AddressSetupCitySelected() when citySelected != null:
return citySelected(_that);case AddressSetupLocationUpdated() when locationUpdated != null:
return locationUpdated(_that);case AddressSetupSubmitted() when submitted != null:
return submitted(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  citiesRequested,TResult Function()?  locationDetectionRequested,TResult Function( int cityId)?  citySelected,TResult Function( LatLng location)?  locationUpdated,TResult Function()?  submitted,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AddressSetupCitiesRequested() when citiesRequested != null:
return citiesRequested();case AddressSetupLocationDetectionRequested() when locationDetectionRequested != null:
return locationDetectionRequested();case AddressSetupCitySelected() when citySelected != null:
return citySelected(_that.cityId);case AddressSetupLocationUpdated() when locationUpdated != null:
return locationUpdated(_that.location);case AddressSetupSubmitted() when submitted != null:
return submitted();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  citiesRequested,required TResult Function()  locationDetectionRequested,required TResult Function( int cityId)  citySelected,required TResult Function( LatLng location)  locationUpdated,required TResult Function()  submitted,}) {final _that = this;
switch (_that) {
case AddressSetupCitiesRequested():
return citiesRequested();case AddressSetupLocationDetectionRequested():
return locationDetectionRequested();case AddressSetupCitySelected():
return citySelected(_that.cityId);case AddressSetupLocationUpdated():
return locationUpdated(_that.location);case AddressSetupSubmitted():
return submitted();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  citiesRequested,TResult? Function()?  locationDetectionRequested,TResult? Function( int cityId)?  citySelected,TResult? Function( LatLng location)?  locationUpdated,TResult? Function()?  submitted,}) {final _that = this;
switch (_that) {
case AddressSetupCitiesRequested() when citiesRequested != null:
return citiesRequested();case AddressSetupLocationDetectionRequested() when locationDetectionRequested != null:
return locationDetectionRequested();case AddressSetupCitySelected() when citySelected != null:
return citySelected(_that.cityId);case AddressSetupLocationUpdated() when locationUpdated != null:
return locationUpdated(_that.location);case AddressSetupSubmitted() when submitted != null:
return submitted();case _:
  return null;

}
}

}

/// @nodoc


class AddressSetupCitiesRequested implements AddressSetupEvent {
  const AddressSetupCitiesRequested();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is AddressSetupCitiesRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'AddressSetupEvent.citiesRequested()';
}


}




/// @nodoc


class AddressSetupLocationDetectionRequested implements AddressSetupEvent {
  const AddressSetupLocationDetectionRequested();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is AddressSetupLocationDetectionRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'AddressSetupEvent.locationDetectionRequested()';
}


}




/// @nodoc


class AddressSetupCitySelected implements AddressSetupEvent {
  const AddressSetupCitySelected(this.cityId);
  

 final  int cityId;

/// Create a copy of AddressSetupEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddressSetupCitySelectedCopyWith<AddressSetupCitySelected> get copyWith => _$AddressSetupCitySelectedCopyWithImpl<AddressSetupCitySelected>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is AddressSetupCitySelected&&(identical(other.cityId, cityId) || other.cityId == cityId));
}


@override
int get hashCode {
    return Object.hash(runtimeType,cityId);
}

@override
String toString() {
    return 'AddressSetupEvent.citySelected(cityId: $cityId)';
}


}

/// @nodoc
abstract mixin class $AddressSetupCitySelectedCopyWith<$Res> implements $AddressSetupEventCopyWith<$Res> {
  factory $AddressSetupCitySelectedCopyWith(AddressSetupCitySelected value, $Res Function(AddressSetupCitySelected) _then) = _$AddressSetupCitySelectedCopyWithImpl;
@useResult
$Res call({
 int cityId
});




}
/// @nodoc
class _$AddressSetupCitySelectedCopyWithImpl<$Res>
    implements $AddressSetupCitySelectedCopyWith<$Res> {
  _$AddressSetupCitySelectedCopyWithImpl(this._self, this._then);

  final AddressSetupCitySelected _self;
  final $Res Function(AddressSetupCitySelected) _then;

/// Create a copy of AddressSetupEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? cityId = null,}) {
  return _then(AddressSetupCitySelected(
null == cityId ? _self.cityId : cityId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class AddressSetupLocationUpdated implements AddressSetupEvent {
  const AddressSetupLocationUpdated(this.location);
  

 final  LatLng location;

/// Create a copy of AddressSetupEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddressSetupLocationUpdatedCopyWith<AddressSetupLocationUpdated> get copyWith => _$AddressSetupLocationUpdatedCopyWithImpl<AddressSetupLocationUpdated>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is AddressSetupLocationUpdated&&(identical(other.location, location) || other.location == location));
}


@override
int get hashCode {
    return Object.hash(runtimeType,location);
}

@override
String toString() {
    return 'AddressSetupEvent.locationUpdated(location: $location)';
}


}

/// @nodoc
abstract mixin class $AddressSetupLocationUpdatedCopyWith<$Res> implements $AddressSetupEventCopyWith<$Res> {
  factory $AddressSetupLocationUpdatedCopyWith(AddressSetupLocationUpdated value, $Res Function(AddressSetupLocationUpdated) _then) = _$AddressSetupLocationUpdatedCopyWithImpl;
@useResult
$Res call({
 LatLng location
});




}
/// @nodoc
class _$AddressSetupLocationUpdatedCopyWithImpl<$Res>
    implements $AddressSetupLocationUpdatedCopyWith<$Res> {
  _$AddressSetupLocationUpdatedCopyWithImpl(this._self, this._then);

  final AddressSetupLocationUpdated _self;
  final $Res Function(AddressSetupLocationUpdated) _then;

/// Create a copy of AddressSetupEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? location = null,}) {
  return _then(AddressSetupLocationUpdated(
null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as LatLng,
  ));
}


}

/// @nodoc


class AddressSetupSubmitted implements AddressSetupEvent {
  const AddressSetupSubmitted();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is AddressSetupSubmitted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'AddressSetupEvent.submitted()';
}


}




// dart format on
