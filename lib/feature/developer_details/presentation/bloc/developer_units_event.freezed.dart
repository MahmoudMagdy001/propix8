// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'developer_units_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DeveloperUnitsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeveloperUnitsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DeveloperUnitsEvent()';
}


}

/// @nodoc
class $DeveloperUnitsEventCopyWith<$Res>  {
$DeveloperUnitsEventCopyWith(DeveloperUnitsEvent _, $Res Function(DeveloperUnitsEvent) __);
}


/// Adds pattern-matching-related methods to [DeveloperUnitsEvent].
extension DeveloperUnitsEventPatterns on DeveloperUnitsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( DeveloperUnitsRequested value)?  developerUnitsRequested,TResult Function( DeveloperUnitsMoreRequested value)?  developerUnitsMoreRequested,TResult Function( DeveloperUnitsViewTypeToggled value)?  developerUnitsViewTypeToggled,required TResult orElse(),}){
final _that = this;
switch (_that) {
case DeveloperUnitsRequested() when developerUnitsRequested != null:
return developerUnitsRequested(_that);case DeveloperUnitsMoreRequested() when developerUnitsMoreRequested != null:
return developerUnitsMoreRequested(_that);case DeveloperUnitsViewTypeToggled() when developerUnitsViewTypeToggled != null:
return developerUnitsViewTypeToggled(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( DeveloperUnitsRequested value)  developerUnitsRequested,required TResult Function( DeveloperUnitsMoreRequested value)  developerUnitsMoreRequested,required TResult Function( DeveloperUnitsViewTypeToggled value)  developerUnitsViewTypeToggled,}){
final _that = this;
switch (_that) {
case DeveloperUnitsRequested():
return developerUnitsRequested(_that);case DeveloperUnitsMoreRequested():
return developerUnitsMoreRequested(_that);case DeveloperUnitsViewTypeToggled():
return developerUnitsViewTypeToggled(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( DeveloperUnitsRequested value)?  developerUnitsRequested,TResult? Function( DeveloperUnitsMoreRequested value)?  developerUnitsMoreRequested,TResult? Function( DeveloperUnitsViewTypeToggled value)?  developerUnitsViewTypeToggled,}){
final _that = this;
switch (_that) {
case DeveloperUnitsRequested() when developerUnitsRequested != null:
return developerUnitsRequested(_that);case DeveloperUnitsMoreRequested() when developerUnitsMoreRequested != null:
return developerUnitsMoreRequested(_that);case DeveloperUnitsViewTypeToggled() when developerUnitsViewTypeToggled != null:
return developerUnitsViewTypeToggled(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int id)?  developerUnitsRequested,TResult Function( int id)?  developerUnitsMoreRequested,TResult Function()?  developerUnitsViewTypeToggled,required TResult orElse(),}) {final _that = this;
switch (_that) {
case DeveloperUnitsRequested() when developerUnitsRequested != null:
return developerUnitsRequested(_that.id);case DeveloperUnitsMoreRequested() when developerUnitsMoreRequested != null:
return developerUnitsMoreRequested(_that.id);case DeveloperUnitsViewTypeToggled() when developerUnitsViewTypeToggled != null:
return developerUnitsViewTypeToggled();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int id)  developerUnitsRequested,required TResult Function( int id)  developerUnitsMoreRequested,required TResult Function()  developerUnitsViewTypeToggled,}) {final _that = this;
switch (_that) {
case DeveloperUnitsRequested():
return developerUnitsRequested(_that.id);case DeveloperUnitsMoreRequested():
return developerUnitsMoreRequested(_that.id);case DeveloperUnitsViewTypeToggled():
return developerUnitsViewTypeToggled();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int id)?  developerUnitsRequested,TResult? Function( int id)?  developerUnitsMoreRequested,TResult? Function()?  developerUnitsViewTypeToggled,}) {final _that = this;
switch (_that) {
case DeveloperUnitsRequested() when developerUnitsRequested != null:
return developerUnitsRequested(_that.id);case DeveloperUnitsMoreRequested() when developerUnitsMoreRequested != null:
return developerUnitsMoreRequested(_that.id);case DeveloperUnitsViewTypeToggled() when developerUnitsViewTypeToggled != null:
return developerUnitsViewTypeToggled();case _:
  return null;

}
}

}

/// @nodoc


class DeveloperUnitsRequested implements DeveloperUnitsEvent {
  const DeveloperUnitsRequested(this.id);
  

 final  int id;

/// Create a copy of DeveloperUnitsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeveloperUnitsRequestedCopyWith<DeveloperUnitsRequested> get copyWith => _$DeveloperUnitsRequestedCopyWithImpl<DeveloperUnitsRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeveloperUnitsRequested&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'DeveloperUnitsEvent.developerUnitsRequested(id: $id)';
}


}

/// @nodoc
abstract mixin class $DeveloperUnitsRequestedCopyWith<$Res> implements $DeveloperUnitsEventCopyWith<$Res> {
  factory $DeveloperUnitsRequestedCopyWith(DeveloperUnitsRequested value, $Res Function(DeveloperUnitsRequested) _then) = _$DeveloperUnitsRequestedCopyWithImpl;
@useResult
$Res call({
 int id
});




}
/// @nodoc
class _$DeveloperUnitsRequestedCopyWithImpl<$Res>
    implements $DeveloperUnitsRequestedCopyWith<$Res> {
  _$DeveloperUnitsRequestedCopyWithImpl(this._self, this._then);

  final DeveloperUnitsRequested _self;
  final $Res Function(DeveloperUnitsRequested) _then;

/// Create a copy of DeveloperUnitsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(DeveloperUnitsRequested(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class DeveloperUnitsMoreRequested implements DeveloperUnitsEvent {
  const DeveloperUnitsMoreRequested(this.id);
  

 final  int id;

/// Create a copy of DeveloperUnitsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeveloperUnitsMoreRequestedCopyWith<DeveloperUnitsMoreRequested> get copyWith => _$DeveloperUnitsMoreRequestedCopyWithImpl<DeveloperUnitsMoreRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeveloperUnitsMoreRequested&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'DeveloperUnitsEvent.developerUnitsMoreRequested(id: $id)';
}


}

/// @nodoc
abstract mixin class $DeveloperUnitsMoreRequestedCopyWith<$Res> implements $DeveloperUnitsEventCopyWith<$Res> {
  factory $DeveloperUnitsMoreRequestedCopyWith(DeveloperUnitsMoreRequested value, $Res Function(DeveloperUnitsMoreRequested) _then) = _$DeveloperUnitsMoreRequestedCopyWithImpl;
@useResult
$Res call({
 int id
});




}
/// @nodoc
class _$DeveloperUnitsMoreRequestedCopyWithImpl<$Res>
    implements $DeveloperUnitsMoreRequestedCopyWith<$Res> {
  _$DeveloperUnitsMoreRequestedCopyWithImpl(this._self, this._then);

  final DeveloperUnitsMoreRequested _self;
  final $Res Function(DeveloperUnitsMoreRequested) _then;

/// Create a copy of DeveloperUnitsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(DeveloperUnitsMoreRequested(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class DeveloperUnitsViewTypeToggled implements DeveloperUnitsEvent {
  const DeveloperUnitsViewTypeToggled();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeveloperUnitsViewTypeToggled);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DeveloperUnitsEvent.developerUnitsViewTypeToggled()';
}


}




// dart format on
