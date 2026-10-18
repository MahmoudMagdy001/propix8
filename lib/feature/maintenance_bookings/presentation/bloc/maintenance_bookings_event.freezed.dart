// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'maintenance_bookings_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MaintenanceBookingsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MaintenanceBookingsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MaintenanceBookingsEvent()';
}


}

/// @nodoc
class $MaintenanceBookingsEventCopyWith<$Res>  {
$MaintenanceBookingsEventCopyWith(MaintenanceBookingsEvent _, $Res Function(MaintenanceBookingsEvent) __);
}


/// Adds pattern-matching-related methods to [MaintenanceBookingsEvent].
extension MaintenanceBookingsEventPatterns on MaintenanceBookingsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( MaintenanceBookingsFetchInitial value)?  fetchInitial,TResult Function( MaintenanceBookingsLoadMore value)?  loadMore,TResult Function( MaintenanceBookingsSetNetworkFailure value)?  setNetworkFailure,TResult Function( MaintenanceBookingsDeleteBooking value)?  deleteBooking,TResult Function( MaintenanceBookingsUpdateBooking value)?  updateBooking,required TResult orElse(),}){
final _that = this;
switch (_that) {
case MaintenanceBookingsFetchInitial() when fetchInitial != null:
return fetchInitial(_that);case MaintenanceBookingsLoadMore() when loadMore != null:
return loadMore(_that);case MaintenanceBookingsSetNetworkFailure() when setNetworkFailure != null:
return setNetworkFailure(_that);case MaintenanceBookingsDeleteBooking() when deleteBooking != null:
return deleteBooking(_that);case MaintenanceBookingsUpdateBooking() when updateBooking != null:
return updateBooking(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( MaintenanceBookingsFetchInitial value)  fetchInitial,required TResult Function( MaintenanceBookingsLoadMore value)  loadMore,required TResult Function( MaintenanceBookingsSetNetworkFailure value)  setNetworkFailure,required TResult Function( MaintenanceBookingsDeleteBooking value)  deleteBooking,required TResult Function( MaintenanceBookingsUpdateBooking value)  updateBooking,}){
final _that = this;
switch (_that) {
case MaintenanceBookingsFetchInitial():
return fetchInitial(_that);case MaintenanceBookingsLoadMore():
return loadMore(_that);case MaintenanceBookingsSetNetworkFailure():
return setNetworkFailure(_that);case MaintenanceBookingsDeleteBooking():
return deleteBooking(_that);case MaintenanceBookingsUpdateBooking():
return updateBooking(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( MaintenanceBookingsFetchInitial value)?  fetchInitial,TResult? Function( MaintenanceBookingsLoadMore value)?  loadMore,TResult? Function( MaintenanceBookingsSetNetworkFailure value)?  setNetworkFailure,TResult? Function( MaintenanceBookingsDeleteBooking value)?  deleteBooking,TResult? Function( MaintenanceBookingsUpdateBooking value)?  updateBooking,}){
final _that = this;
switch (_that) {
case MaintenanceBookingsFetchInitial() when fetchInitial != null:
return fetchInitial(_that);case MaintenanceBookingsLoadMore() when loadMore != null:
return loadMore(_that);case MaintenanceBookingsSetNetworkFailure() when setNetworkFailure != null:
return setNetworkFailure(_that);case MaintenanceBookingsDeleteBooking() when deleteBooking != null:
return deleteBooking(_that);case MaintenanceBookingsUpdateBooking() when updateBooking != null:
return updateBooking(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  fetchInitial,TResult Function()?  loadMore,TResult Function()?  setNetworkFailure,TResult Function( int id)?  deleteBooking,TResult Function( int id,  String phone,  String address,  String message)?  updateBooking,required TResult orElse(),}) {final _that = this;
switch (_that) {
case MaintenanceBookingsFetchInitial() when fetchInitial != null:
return fetchInitial();case MaintenanceBookingsLoadMore() when loadMore != null:
return loadMore();case MaintenanceBookingsSetNetworkFailure() when setNetworkFailure != null:
return setNetworkFailure();case MaintenanceBookingsDeleteBooking() when deleteBooking != null:
return deleteBooking(_that.id);case MaintenanceBookingsUpdateBooking() when updateBooking != null:
return updateBooking(_that.id,_that.phone,_that.address,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  fetchInitial,required TResult Function()  loadMore,required TResult Function()  setNetworkFailure,required TResult Function( int id)  deleteBooking,required TResult Function( int id,  String phone,  String address,  String message)  updateBooking,}) {final _that = this;
switch (_that) {
case MaintenanceBookingsFetchInitial():
return fetchInitial();case MaintenanceBookingsLoadMore():
return loadMore();case MaintenanceBookingsSetNetworkFailure():
return setNetworkFailure();case MaintenanceBookingsDeleteBooking():
return deleteBooking(_that.id);case MaintenanceBookingsUpdateBooking():
return updateBooking(_that.id,_that.phone,_that.address,_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  fetchInitial,TResult? Function()?  loadMore,TResult? Function()?  setNetworkFailure,TResult? Function( int id)?  deleteBooking,TResult? Function( int id,  String phone,  String address,  String message)?  updateBooking,}) {final _that = this;
switch (_that) {
case MaintenanceBookingsFetchInitial() when fetchInitial != null:
return fetchInitial();case MaintenanceBookingsLoadMore() when loadMore != null:
return loadMore();case MaintenanceBookingsSetNetworkFailure() when setNetworkFailure != null:
return setNetworkFailure();case MaintenanceBookingsDeleteBooking() when deleteBooking != null:
return deleteBooking(_that.id);case MaintenanceBookingsUpdateBooking() when updateBooking != null:
return updateBooking(_that.id,_that.phone,_that.address,_that.message);case _:
  return null;

}
}

}

/// @nodoc


class MaintenanceBookingsFetchInitial implements MaintenanceBookingsEvent {
  const MaintenanceBookingsFetchInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MaintenanceBookingsFetchInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MaintenanceBookingsEvent.fetchInitial()';
}


}




/// @nodoc


class MaintenanceBookingsLoadMore implements MaintenanceBookingsEvent {
  const MaintenanceBookingsLoadMore();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MaintenanceBookingsLoadMore);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MaintenanceBookingsEvent.loadMore()';
}


}




/// @nodoc


class MaintenanceBookingsSetNetworkFailure implements MaintenanceBookingsEvent {
  const MaintenanceBookingsSetNetworkFailure();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MaintenanceBookingsSetNetworkFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MaintenanceBookingsEvent.setNetworkFailure()';
}


}




/// @nodoc


class MaintenanceBookingsDeleteBooking implements MaintenanceBookingsEvent {
  const MaintenanceBookingsDeleteBooking(this.id);
  

 final  int id;

/// Create a copy of MaintenanceBookingsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MaintenanceBookingsDeleteBookingCopyWith<MaintenanceBookingsDeleteBooking> get copyWith => _$MaintenanceBookingsDeleteBookingCopyWithImpl<MaintenanceBookingsDeleteBooking>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MaintenanceBookingsDeleteBooking&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'MaintenanceBookingsEvent.deleteBooking(id: $id)';
}


}

/// @nodoc
abstract mixin class $MaintenanceBookingsDeleteBookingCopyWith<$Res> implements $MaintenanceBookingsEventCopyWith<$Res> {
  factory $MaintenanceBookingsDeleteBookingCopyWith(MaintenanceBookingsDeleteBooking value, $Res Function(MaintenanceBookingsDeleteBooking) _then) = _$MaintenanceBookingsDeleteBookingCopyWithImpl;
@useResult
$Res call({
 int id
});




}
/// @nodoc
class _$MaintenanceBookingsDeleteBookingCopyWithImpl<$Res>
    implements $MaintenanceBookingsDeleteBookingCopyWith<$Res> {
  _$MaintenanceBookingsDeleteBookingCopyWithImpl(this._self, this._then);

  final MaintenanceBookingsDeleteBooking _self;
  final $Res Function(MaintenanceBookingsDeleteBooking) _then;

/// Create a copy of MaintenanceBookingsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(MaintenanceBookingsDeleteBooking(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class MaintenanceBookingsUpdateBooking implements MaintenanceBookingsEvent {
  const MaintenanceBookingsUpdateBooking({required this.id, required this.phone, required this.address, required this.message});
  

 final  int id;
 final  String phone;
 final  String address;
 final  String message;

/// Create a copy of MaintenanceBookingsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MaintenanceBookingsUpdateBookingCopyWith<MaintenanceBookingsUpdateBooking> get copyWith => _$MaintenanceBookingsUpdateBookingCopyWithImpl<MaintenanceBookingsUpdateBooking>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MaintenanceBookingsUpdateBooking&&(identical(other.id, id) || other.id == id)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.address, address) || other.address == address)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,id,phone,address,message);

@override
String toString() {
  return 'MaintenanceBookingsEvent.updateBooking(id: $id, phone: $phone, address: $address, message: $message)';
}


}

/// @nodoc
abstract mixin class $MaintenanceBookingsUpdateBookingCopyWith<$Res> implements $MaintenanceBookingsEventCopyWith<$Res> {
  factory $MaintenanceBookingsUpdateBookingCopyWith(MaintenanceBookingsUpdateBooking value, $Res Function(MaintenanceBookingsUpdateBooking) _then) = _$MaintenanceBookingsUpdateBookingCopyWithImpl;
@useResult
$Res call({
 int id, String phone, String address, String message
});




}
/// @nodoc
class _$MaintenanceBookingsUpdateBookingCopyWithImpl<$Res>
    implements $MaintenanceBookingsUpdateBookingCopyWith<$Res> {
  _$MaintenanceBookingsUpdateBookingCopyWithImpl(this._self, this._then);

  final MaintenanceBookingsUpdateBooking _self;
  final $Res Function(MaintenanceBookingsUpdateBooking) _then;

/// Create a copy of MaintenanceBookingsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,Object? phone = null,Object? address = null,Object? message = null,}) {
  return _then(MaintenanceBookingsUpdateBooking(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
