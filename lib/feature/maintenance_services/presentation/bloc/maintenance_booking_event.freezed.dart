// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'maintenance_booking_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MaintenanceBookingEvent {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is MaintenanceBookingEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'MaintenanceBookingEvent()';
}


}

/// @nodoc
class $MaintenanceBookingEventCopyWith<$Res>  {
$MaintenanceBookingEventCopyWith(MaintenanceBookingEvent _, $Res Function(MaintenanceBookingEvent) __);
}


/// Adds pattern-matching-related methods to [MaintenanceBookingEvent].
extension MaintenanceBookingEventPatterns on MaintenanceBookingEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( MaintenanceBookingSubmitted value)?  submitted,TResult Function( MaintenanceBookingReset value)?  reset,required TResult orElse(),}){
final _that = this;
switch (_that) {
case MaintenanceBookingSubmitted() when submitted != null:
return submitted(_that);case MaintenanceBookingReset() when reset != null:
return reset(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( MaintenanceBookingSubmitted value)  submitted,required TResult Function( MaintenanceBookingReset value)  reset,}){
final _that = this;
switch (_that) {
case MaintenanceBookingSubmitted():
return submitted(_that);case MaintenanceBookingReset():
return reset(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( MaintenanceBookingSubmitted value)?  submitted,TResult? Function( MaintenanceBookingReset value)?  reset,}){
final _that = this;
switch (_that) {
case MaintenanceBookingSubmitted() when submitted != null:
return submitted(_that);case MaintenanceBookingReset() when reset != null:
return reset(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int maintenanceServiceId,  String phone,  String address,  String message)?  submitted,TResult Function()?  reset,required TResult orElse(),}) {final _that = this;
switch (_that) {
case MaintenanceBookingSubmitted() when submitted != null:
return submitted(_that.maintenanceServiceId,_that.phone,_that.address,_that.message);case MaintenanceBookingReset() when reset != null:
return reset();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int maintenanceServiceId,  String phone,  String address,  String message)  submitted,required TResult Function()  reset,}) {final _that = this;
switch (_that) {
case MaintenanceBookingSubmitted():
return submitted(_that.maintenanceServiceId,_that.phone,_that.address,_that.message);case MaintenanceBookingReset():
return reset();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int maintenanceServiceId,  String phone,  String address,  String message)?  submitted,TResult? Function()?  reset,}) {final _that = this;
switch (_that) {
case MaintenanceBookingSubmitted() when submitted != null:
return submitted(_that.maintenanceServiceId,_that.phone,_that.address,_that.message);case MaintenanceBookingReset() when reset != null:
return reset();case _:
  return null;

}
}

}

/// @nodoc


class MaintenanceBookingSubmitted implements MaintenanceBookingEvent {
  const MaintenanceBookingSubmitted({required this.maintenanceServiceId, required this.phone, required this.address, required this.message});
  

 final  int maintenanceServiceId;
 final  String phone;
 final  String address;
 final  String message;

/// Create a copy of MaintenanceBookingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MaintenanceBookingSubmittedCopyWith<MaintenanceBookingSubmitted> get copyWith => _$MaintenanceBookingSubmittedCopyWithImpl<MaintenanceBookingSubmitted>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is MaintenanceBookingSubmitted&&(identical(other.maintenanceServiceId, maintenanceServiceId) || other.maintenanceServiceId == maintenanceServiceId)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.address, address) || other.address == address)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode {
    return Object.hash(runtimeType,maintenanceServiceId,phone,address,message);
}

@override
String toString() {
    return 'MaintenanceBookingEvent.submitted(maintenanceServiceId: $maintenanceServiceId, phone: $phone, address: $address, message: $message)';
}


}

/// @nodoc
abstract mixin class $MaintenanceBookingSubmittedCopyWith<$Res> implements $MaintenanceBookingEventCopyWith<$Res> {
  factory $MaintenanceBookingSubmittedCopyWith(MaintenanceBookingSubmitted value, $Res Function(MaintenanceBookingSubmitted) _then) = _$MaintenanceBookingSubmittedCopyWithImpl;
@useResult
$Res call({
 int maintenanceServiceId, String phone, String address, String message
});




}
/// @nodoc
class _$MaintenanceBookingSubmittedCopyWithImpl<$Res>
    implements $MaintenanceBookingSubmittedCopyWith<$Res> {
  _$MaintenanceBookingSubmittedCopyWithImpl(this._self, this._then);

  final MaintenanceBookingSubmitted _self;
  final $Res Function(MaintenanceBookingSubmitted) _then;

/// Create a copy of MaintenanceBookingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? maintenanceServiceId = null,Object? phone = null,Object? address = null,Object? message = null,}) {
  return _then(MaintenanceBookingSubmitted(
maintenanceServiceId: null == maintenanceServiceId ? _self.maintenanceServiceId : maintenanceServiceId // ignore: cast_nullable_to_non_nullable
as int,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class MaintenanceBookingReset implements MaintenanceBookingEvent {
  const MaintenanceBookingReset();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is MaintenanceBookingReset);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'MaintenanceBookingEvent.reset()';
}


}




// dart format on
