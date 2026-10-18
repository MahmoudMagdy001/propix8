// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'compounds_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CompoundsEvent {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is CompoundsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'CompoundsEvent()';
}


}

/// @nodoc
class $CompoundsEventCopyWith<$Res>  {
$CompoundsEventCopyWith(CompoundsEvent _, $Res Function(CompoundsEvent) __);
}


/// Adds pattern-matching-related methods to [CompoundsEvent].
extension CompoundsEventPatterns on CompoundsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CompoundsRequested value)?  compoundsRequested,TResult Function( CompoundsRefreshed value)?  refreshed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CompoundsRequested() when compoundsRequested != null:
return compoundsRequested(_that);case CompoundsRefreshed() when refreshed != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CompoundsRequested value)  compoundsRequested,required TResult Function( CompoundsRefreshed value)  refreshed,}){
final _that = this;
switch (_that) {
case CompoundsRequested():
return compoundsRequested(_that);case CompoundsRefreshed():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CompoundsRequested value)?  compoundsRequested,TResult? Function( CompoundsRefreshed value)?  refreshed,}){
final _that = this;
switch (_that) {
case CompoundsRequested() when compoundsRequested != null:
return compoundsRequested(_that);case CompoundsRefreshed() when refreshed != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  compoundsRequested,TResult Function()?  refreshed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CompoundsRequested() when compoundsRequested != null:
return compoundsRequested();case CompoundsRefreshed() when refreshed != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  compoundsRequested,required TResult Function()  refreshed,}) {final _that = this;
switch (_that) {
case CompoundsRequested():
return compoundsRequested();case CompoundsRefreshed():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  compoundsRequested,TResult? Function()?  refreshed,}) {final _that = this;
switch (_that) {
case CompoundsRequested() when compoundsRequested != null:
return compoundsRequested();case CompoundsRefreshed() when refreshed != null:
return refreshed();case _:
  return null;

}
}

}

/// @nodoc


class CompoundsRequested implements CompoundsEvent {
  const CompoundsRequested();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is CompoundsRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'CompoundsEvent.compoundsRequested()';
}


}




/// @nodoc


class CompoundsRefreshed implements CompoundsEvent {
  const CompoundsRefreshed();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is CompoundsRefreshed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'CompoundsEvent.refreshed()';
}


}




// dart format on
