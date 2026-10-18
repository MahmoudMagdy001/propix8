// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'maintenance_services_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MaintenanceServicesEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MaintenanceServicesEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MaintenanceServicesEvent()';
}


}

/// @nodoc
class $MaintenanceServicesEventCopyWith<$Res>  {
$MaintenanceServicesEventCopyWith(MaintenanceServicesEvent _, $Res Function(MaintenanceServicesEvent) __);
}


/// Adds pattern-matching-related methods to [MaintenanceServicesEvent].
extension MaintenanceServicesEventPatterns on MaintenanceServicesEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( MaintenanceServicesStarted value)?  started,TResult Function( MaintenanceServicesRefreshed value)?  refreshed,TResult Function( MaintenanceServicesServiceBooked value)?  serviceBooked,TResult Function( MaintenanceServicesServiceUnbooked value)?  serviceUnbooked,required TResult orElse(),}){
final _that = this;
switch (_that) {
case MaintenanceServicesStarted() when started != null:
return started(_that);case MaintenanceServicesRefreshed() when refreshed != null:
return refreshed(_that);case MaintenanceServicesServiceBooked() when serviceBooked != null:
return serviceBooked(_that);case MaintenanceServicesServiceUnbooked() when serviceUnbooked != null:
return serviceUnbooked(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( MaintenanceServicesStarted value)  started,required TResult Function( MaintenanceServicesRefreshed value)  refreshed,required TResult Function( MaintenanceServicesServiceBooked value)  serviceBooked,required TResult Function( MaintenanceServicesServiceUnbooked value)  serviceUnbooked,}){
final _that = this;
switch (_that) {
case MaintenanceServicesStarted():
return started(_that);case MaintenanceServicesRefreshed():
return refreshed(_that);case MaintenanceServicesServiceBooked():
return serviceBooked(_that);case MaintenanceServicesServiceUnbooked():
return serviceUnbooked(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( MaintenanceServicesStarted value)?  started,TResult? Function( MaintenanceServicesRefreshed value)?  refreshed,TResult? Function( MaintenanceServicesServiceBooked value)?  serviceBooked,TResult? Function( MaintenanceServicesServiceUnbooked value)?  serviceUnbooked,}){
final _that = this;
switch (_that) {
case MaintenanceServicesStarted() when started != null:
return started(_that);case MaintenanceServicesRefreshed() when refreshed != null:
return refreshed(_that);case MaintenanceServicesServiceBooked() when serviceBooked != null:
return serviceBooked(_that);case MaintenanceServicesServiceUnbooked() when serviceUnbooked != null:
return serviceUnbooked(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function()?  refreshed,TResult Function( int serviceId)?  serviceBooked,TResult Function( int serviceId)?  serviceUnbooked,required TResult orElse(),}) {final _that = this;
switch (_that) {
case MaintenanceServicesStarted() when started != null:
return started();case MaintenanceServicesRefreshed() when refreshed != null:
return refreshed();case MaintenanceServicesServiceBooked() when serviceBooked != null:
return serviceBooked(_that.serviceId);case MaintenanceServicesServiceUnbooked() when serviceUnbooked != null:
return serviceUnbooked(_that.serviceId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function()  refreshed,required TResult Function( int serviceId)  serviceBooked,required TResult Function( int serviceId)  serviceUnbooked,}) {final _that = this;
switch (_that) {
case MaintenanceServicesStarted():
return started();case MaintenanceServicesRefreshed():
return refreshed();case MaintenanceServicesServiceBooked():
return serviceBooked(_that.serviceId);case MaintenanceServicesServiceUnbooked():
return serviceUnbooked(_that.serviceId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function()?  refreshed,TResult? Function( int serviceId)?  serviceBooked,TResult? Function( int serviceId)?  serviceUnbooked,}) {final _that = this;
switch (_that) {
case MaintenanceServicesStarted() when started != null:
return started();case MaintenanceServicesRefreshed() when refreshed != null:
return refreshed();case MaintenanceServicesServiceBooked() when serviceBooked != null:
return serviceBooked(_that.serviceId);case MaintenanceServicesServiceUnbooked() when serviceUnbooked != null:
return serviceUnbooked(_that.serviceId);case _:
  return null;

}
}

}

/// @nodoc


class MaintenanceServicesStarted implements MaintenanceServicesEvent {
  const MaintenanceServicesStarted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MaintenanceServicesStarted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MaintenanceServicesEvent.started()';
}


}




/// @nodoc


class MaintenanceServicesRefreshed implements MaintenanceServicesEvent {
  const MaintenanceServicesRefreshed();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MaintenanceServicesRefreshed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MaintenanceServicesEvent.refreshed()';
}


}




/// @nodoc


class MaintenanceServicesServiceBooked implements MaintenanceServicesEvent {
  const MaintenanceServicesServiceBooked(this.serviceId);
  

 final  int serviceId;

/// Create a copy of MaintenanceServicesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MaintenanceServicesServiceBookedCopyWith<MaintenanceServicesServiceBooked> get copyWith => _$MaintenanceServicesServiceBookedCopyWithImpl<MaintenanceServicesServiceBooked>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MaintenanceServicesServiceBooked&&(identical(other.serviceId, serviceId) || other.serviceId == serviceId));
}


@override
int get hashCode => Object.hash(runtimeType,serviceId);

@override
String toString() {
  return 'MaintenanceServicesEvent.serviceBooked(serviceId: $serviceId)';
}


}

/// @nodoc
abstract mixin class $MaintenanceServicesServiceBookedCopyWith<$Res> implements $MaintenanceServicesEventCopyWith<$Res> {
  factory $MaintenanceServicesServiceBookedCopyWith(MaintenanceServicesServiceBooked value, $Res Function(MaintenanceServicesServiceBooked) _then) = _$MaintenanceServicesServiceBookedCopyWithImpl;
@useResult
$Res call({
 int serviceId
});




}
/// @nodoc
class _$MaintenanceServicesServiceBookedCopyWithImpl<$Res>
    implements $MaintenanceServicesServiceBookedCopyWith<$Res> {
  _$MaintenanceServicesServiceBookedCopyWithImpl(this._self, this._then);

  final MaintenanceServicesServiceBooked _self;
  final $Res Function(MaintenanceServicesServiceBooked) _then;

/// Create a copy of MaintenanceServicesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? serviceId = null,}) {
  return _then(MaintenanceServicesServiceBooked(
null == serviceId ? _self.serviceId : serviceId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class MaintenanceServicesServiceUnbooked implements MaintenanceServicesEvent {
  const MaintenanceServicesServiceUnbooked(this.serviceId);
  

 final  int serviceId;

/// Create a copy of MaintenanceServicesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MaintenanceServicesServiceUnbookedCopyWith<MaintenanceServicesServiceUnbooked> get copyWith => _$MaintenanceServicesServiceUnbookedCopyWithImpl<MaintenanceServicesServiceUnbooked>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MaintenanceServicesServiceUnbooked&&(identical(other.serviceId, serviceId) || other.serviceId == serviceId));
}


@override
int get hashCode => Object.hash(runtimeType,serviceId);

@override
String toString() {
  return 'MaintenanceServicesEvent.serviceUnbooked(serviceId: $serviceId)';
}


}

/// @nodoc
abstract mixin class $MaintenanceServicesServiceUnbookedCopyWith<$Res> implements $MaintenanceServicesEventCopyWith<$Res> {
  factory $MaintenanceServicesServiceUnbookedCopyWith(MaintenanceServicesServiceUnbooked value, $Res Function(MaintenanceServicesServiceUnbooked) _then) = _$MaintenanceServicesServiceUnbookedCopyWithImpl;
@useResult
$Res call({
 int serviceId
});




}
/// @nodoc
class _$MaintenanceServicesServiceUnbookedCopyWithImpl<$Res>
    implements $MaintenanceServicesServiceUnbookedCopyWith<$Res> {
  _$MaintenanceServicesServiceUnbookedCopyWithImpl(this._self, this._then);

  final MaintenanceServicesServiceUnbooked _self;
  final $Res Function(MaintenanceServicesServiceUnbooked) _then;

/// Create a copy of MaintenanceServicesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? serviceId = null,}) {
  return _then(MaintenanceServicesServiceUnbooked(
null == serviceId ? _self.serviceId : serviceId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
