// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nearby_units_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NearbyUnitsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NearbyUnitsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NearbyUnitsEvent()';
}


}

/// @nodoc
class $NearbyUnitsEventCopyWith<$Res>  {
$NearbyUnitsEventCopyWith(NearbyUnitsEvent _, $Res Function(NearbyUnitsEvent) __);
}


/// Adds pattern-matching-related methods to [NearbyUnitsEvent].
extension NearbyUnitsEventPatterns on NearbyUnitsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( NearbyUnitsRequested value)?  unitsRequested,TResult Function( NearbyUnitsMoreUnitsRequested value)?  moreUnitsRequested,TResult Function( NearbyUnitsViewTypeToggled value)?  viewTypeToggled,TResult Function( NearbyUnitsFavoriteToggled value)?  favoriteToggled,TResult Function( NearbyUnitsRefreshed value)?  refreshed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case NearbyUnitsRequested() when unitsRequested != null:
return unitsRequested(_that);case NearbyUnitsMoreUnitsRequested() when moreUnitsRequested != null:
return moreUnitsRequested(_that);case NearbyUnitsViewTypeToggled() when viewTypeToggled != null:
return viewTypeToggled(_that);case NearbyUnitsFavoriteToggled() when favoriteToggled != null:
return favoriteToggled(_that);case NearbyUnitsRefreshed() when refreshed != null:
return refreshed(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( NearbyUnitsRequested value)  unitsRequested,required TResult Function( NearbyUnitsMoreUnitsRequested value)  moreUnitsRequested,required TResult Function( NearbyUnitsViewTypeToggled value)  viewTypeToggled,required TResult Function( NearbyUnitsFavoriteToggled value)  favoriteToggled,required TResult Function( NearbyUnitsRefreshed value)  refreshed,}){
final _that = this;
switch (_that) {
case NearbyUnitsRequested():
return unitsRequested(_that);case NearbyUnitsMoreUnitsRequested():
return moreUnitsRequested(_that);case NearbyUnitsViewTypeToggled():
return viewTypeToggled(_that);case NearbyUnitsFavoriteToggled():
return favoriteToggled(_that);case NearbyUnitsRefreshed():
return refreshed(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( NearbyUnitsRequested value)?  unitsRequested,TResult? Function( NearbyUnitsMoreUnitsRequested value)?  moreUnitsRequested,TResult? Function( NearbyUnitsViewTypeToggled value)?  viewTypeToggled,TResult? Function( NearbyUnitsFavoriteToggled value)?  favoriteToggled,TResult? Function( NearbyUnitsRefreshed value)?  refreshed,}){
final _that = this;
switch (_that) {
case NearbyUnitsRequested() when unitsRequested != null:
return unitsRequested(_that);case NearbyUnitsMoreUnitsRequested() when moreUnitsRequested != null:
return moreUnitsRequested(_that);case NearbyUnitsViewTypeToggled() when viewTypeToggled != null:
return viewTypeToggled(_that);case NearbyUnitsFavoriteToggled() when favoriteToggled != null:
return favoriteToggled(_that);case NearbyUnitsRefreshed() when refreshed != null:
return refreshed(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  unitsRequested,TResult Function()?  moreUnitsRequested,TResult Function()?  viewTypeToggled,TResult Function( int unitId)?  favoriteToggled,TResult Function()?  refreshed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case NearbyUnitsRequested() when unitsRequested != null:
return unitsRequested();case NearbyUnitsMoreUnitsRequested() when moreUnitsRequested != null:
return moreUnitsRequested();case NearbyUnitsViewTypeToggled() when viewTypeToggled != null:
return viewTypeToggled();case NearbyUnitsFavoriteToggled() when favoriteToggled != null:
return favoriteToggled(_that.unitId);case NearbyUnitsRefreshed() when refreshed != null:
return refreshed();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  unitsRequested,required TResult Function()  moreUnitsRequested,required TResult Function()  viewTypeToggled,required TResult Function( int unitId)  favoriteToggled,required TResult Function()  refreshed,}) {final _that = this;
switch (_that) {
case NearbyUnitsRequested():
return unitsRequested();case NearbyUnitsMoreUnitsRequested():
return moreUnitsRequested();case NearbyUnitsViewTypeToggled():
return viewTypeToggled();case NearbyUnitsFavoriteToggled():
return favoriteToggled(_that.unitId);case NearbyUnitsRefreshed():
return refreshed();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  unitsRequested,TResult? Function()?  moreUnitsRequested,TResult? Function()?  viewTypeToggled,TResult? Function( int unitId)?  favoriteToggled,TResult? Function()?  refreshed,}) {final _that = this;
switch (_that) {
case NearbyUnitsRequested() when unitsRequested != null:
return unitsRequested();case NearbyUnitsMoreUnitsRequested() when moreUnitsRequested != null:
return moreUnitsRequested();case NearbyUnitsViewTypeToggled() when viewTypeToggled != null:
return viewTypeToggled();case NearbyUnitsFavoriteToggled() when favoriteToggled != null:
return favoriteToggled(_that.unitId);case NearbyUnitsRefreshed() when refreshed != null:
return refreshed();case _:
  return null;

}
}

}

/// @nodoc


class NearbyUnitsRequested implements NearbyUnitsEvent {
  const NearbyUnitsRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NearbyUnitsRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NearbyUnitsEvent.unitsRequested()';
}


}




/// @nodoc


class NearbyUnitsMoreUnitsRequested implements NearbyUnitsEvent {
  const NearbyUnitsMoreUnitsRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NearbyUnitsMoreUnitsRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NearbyUnitsEvent.moreUnitsRequested()';
}


}




/// @nodoc


class NearbyUnitsViewTypeToggled implements NearbyUnitsEvent {
  const NearbyUnitsViewTypeToggled();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NearbyUnitsViewTypeToggled);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NearbyUnitsEvent.viewTypeToggled()';
}


}




/// @nodoc


class NearbyUnitsFavoriteToggled implements NearbyUnitsEvent {
  const NearbyUnitsFavoriteToggled(this.unitId);
  

 final  int unitId;

/// Create a copy of NearbyUnitsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NearbyUnitsFavoriteToggledCopyWith<NearbyUnitsFavoriteToggled> get copyWith => _$NearbyUnitsFavoriteToggledCopyWithImpl<NearbyUnitsFavoriteToggled>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NearbyUnitsFavoriteToggled&&(identical(other.unitId, unitId) || other.unitId == unitId));
}


@override
int get hashCode => Object.hash(runtimeType,unitId);

@override
String toString() {
  return 'NearbyUnitsEvent.favoriteToggled(unitId: $unitId)';
}


}

/// @nodoc
abstract mixin class $NearbyUnitsFavoriteToggledCopyWith<$Res> implements $NearbyUnitsEventCopyWith<$Res> {
  factory $NearbyUnitsFavoriteToggledCopyWith(NearbyUnitsFavoriteToggled value, $Res Function(NearbyUnitsFavoriteToggled) _then) = _$NearbyUnitsFavoriteToggledCopyWithImpl;
@useResult
$Res call({
 int unitId
});




}
/// @nodoc
class _$NearbyUnitsFavoriteToggledCopyWithImpl<$Res>
    implements $NearbyUnitsFavoriteToggledCopyWith<$Res> {
  _$NearbyUnitsFavoriteToggledCopyWithImpl(this._self, this._then);

  final NearbyUnitsFavoriteToggled _self;
  final $Res Function(NearbyUnitsFavoriteToggled) _then;

/// Create a copy of NearbyUnitsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? unitId = null,}) {
  return _then(NearbyUnitsFavoriteToggled(
null == unitId ? _self.unitId : unitId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class NearbyUnitsRefreshed implements NearbyUnitsEvent {
  const NearbyUnitsRefreshed();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NearbyUnitsRefreshed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NearbyUnitsEvent.refreshed()';
}


}




// dart format on
