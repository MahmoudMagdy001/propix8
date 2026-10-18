// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pages_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PagesEvent {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is PagesEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'PagesEvent()';
}


}

/// @nodoc
class $PagesEventCopyWith<$Res>  {
$PagesEventCopyWith(PagesEvent _, $Res Function(PagesEvent) __);
}


/// Adds pattern-matching-related methods to [PagesEvent].
extension PagesEventPatterns on PagesEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( PagesRequested value)?  pagesRequested,TResult Function( StatsRequested value)?  statsRequested,TResult Function( PagesAllDataRequested value)?  allDataRequested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case PagesRequested() when pagesRequested != null:
return pagesRequested(_that);case StatsRequested() when statsRequested != null:
return statsRequested(_that);case PagesAllDataRequested() when allDataRequested != null:
return allDataRequested(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( PagesRequested value)  pagesRequested,required TResult Function( StatsRequested value)  statsRequested,required TResult Function( PagesAllDataRequested value)  allDataRequested,}){
final _that = this;
switch (_that) {
case PagesRequested():
return pagesRequested(_that);case StatsRequested():
return statsRequested(_that);case PagesAllDataRequested():
return allDataRequested(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( PagesRequested value)?  pagesRequested,TResult? Function( StatsRequested value)?  statsRequested,TResult? Function( PagesAllDataRequested value)?  allDataRequested,}){
final _that = this;
switch (_that) {
case PagesRequested() when pagesRequested != null:
return pagesRequested(_that);case StatsRequested() when statsRequested != null:
return statsRequested(_that);case PagesAllDataRequested() when allDataRequested != null:
return allDataRequested(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  pagesRequested,TResult Function()?  statsRequested,TResult Function()?  allDataRequested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case PagesRequested() when pagesRequested != null:
return pagesRequested();case StatsRequested() when statsRequested != null:
return statsRequested();case PagesAllDataRequested() when allDataRequested != null:
return allDataRequested();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  pagesRequested,required TResult Function()  statsRequested,required TResult Function()  allDataRequested,}) {final _that = this;
switch (_that) {
case PagesRequested():
return pagesRequested();case StatsRequested():
return statsRequested();case PagesAllDataRequested():
return allDataRequested();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  pagesRequested,TResult? Function()?  statsRequested,TResult? Function()?  allDataRequested,}) {final _that = this;
switch (_that) {
case PagesRequested() when pagesRequested != null:
return pagesRequested();case StatsRequested() when statsRequested != null:
return statsRequested();case PagesAllDataRequested() when allDataRequested != null:
return allDataRequested();case _:
  return null;

}
}

}

/// @nodoc


class PagesRequested implements PagesEvent {
  const PagesRequested();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is PagesRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'PagesEvent.pagesRequested()';
}


}




/// @nodoc


class StatsRequested implements PagesEvent {
  const StatsRequested();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is StatsRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'PagesEvent.statsRequested()';
}


}




/// @nodoc


class PagesAllDataRequested implements PagesEvent {
  const PagesAllDataRequested();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is PagesAllDataRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'PagesEvent.allDataRequested()';
}


}




// dart format on
