// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comparison_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ComparisonEvent {

 int get baseUnitId; int get selectedUnitId; String Function(String) get getLocalizedLabel; String Function(String, String) get getLocalizedValue; String get meterSquared; String get currencySymbol;
/// Create a copy of ComparisonEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ComparisonEventCopyWith<ComparisonEvent> get copyWith => _$ComparisonEventCopyWithImpl<ComparisonEvent>(this as ComparisonEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ComparisonEvent&&(identical(other.baseUnitId, baseUnitId) || other.baseUnitId == baseUnitId)&&(identical(other.selectedUnitId, selectedUnitId) || other.selectedUnitId == selectedUnitId)&&(identical(other.getLocalizedLabel, getLocalizedLabel) || other.getLocalizedLabel == getLocalizedLabel)&&(identical(other.getLocalizedValue, getLocalizedValue) || other.getLocalizedValue == getLocalizedValue)&&(identical(other.meterSquared, meterSquared) || other.meterSquared == meterSquared)&&(identical(other.currencySymbol, currencySymbol) || other.currencySymbol == currencySymbol));
}


@override
int get hashCode => Object.hash(runtimeType,baseUnitId,selectedUnitId,getLocalizedLabel,getLocalizedValue,meterSquared,currencySymbol);

@override
String toString() {
  return 'ComparisonEvent(baseUnitId: $baseUnitId, selectedUnitId: $selectedUnitId, getLocalizedLabel: $getLocalizedLabel, getLocalizedValue: $getLocalizedValue, meterSquared: $meterSquared, currencySymbol: $currencySymbol)';
}


}

/// @nodoc
abstract mixin class $ComparisonEventCopyWith<$Res>  {
  factory $ComparisonEventCopyWith(ComparisonEvent value, $Res Function(ComparisonEvent) _then) = _$ComparisonEventCopyWithImpl;
@useResult
$Res call({
 int baseUnitId, int selectedUnitId, String Function(String) getLocalizedLabel, String Function(String, String) getLocalizedValue, String meterSquared, String currencySymbol
});




}
/// @nodoc
class _$ComparisonEventCopyWithImpl<$Res>
    implements $ComparisonEventCopyWith<$Res> {
  _$ComparisonEventCopyWithImpl(this._self, this._then);

  final ComparisonEvent _self;
  final $Res Function(ComparisonEvent) _then;

/// Create a copy of ComparisonEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? baseUnitId = null,Object? selectedUnitId = null,Object? getLocalizedLabel = null,Object? getLocalizedValue = null,Object? meterSquared = null,Object? currencySymbol = null,}) {
  return _then(_self.copyWith(
baseUnitId: null == baseUnitId ? _self.baseUnitId : baseUnitId // ignore: cast_nullable_to_non_nullable
as int,selectedUnitId: null == selectedUnitId ? _self.selectedUnitId : selectedUnitId // ignore: cast_nullable_to_non_nullable
as int,getLocalizedLabel: null == getLocalizedLabel ? _self.getLocalizedLabel : getLocalizedLabel // ignore: cast_nullable_to_non_nullable
as String Function(String),getLocalizedValue: null == getLocalizedValue ? _self.getLocalizedValue : getLocalizedValue // ignore: cast_nullable_to_non_nullable
as String Function(String, String),meterSquared: null == meterSquared ? _self.meterSquared : meterSquared // ignore: cast_nullable_to_non_nullable
as String,currencySymbol: null == currencySymbol ? _self.currencySymbol : currencySymbol // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ComparisonEvent].
extension ComparisonEventPatterns on ComparisonEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ComparisonRequested value)?  comparisonRequested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ComparisonRequested() when comparisonRequested != null:
return comparisonRequested(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ComparisonRequested value)  comparisonRequested,}){
final _that = this;
switch (_that) {
case ComparisonRequested():
return comparisonRequested(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ComparisonRequested value)?  comparisonRequested,}){
final _that = this;
switch (_that) {
case ComparisonRequested() when comparisonRequested != null:
return comparisonRequested(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int baseUnitId,  int selectedUnitId,  String Function(String) getLocalizedLabel,  String Function(String, String) getLocalizedValue,  String meterSquared,  String currencySymbol)?  comparisonRequested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ComparisonRequested() when comparisonRequested != null:
return comparisonRequested(_that.baseUnitId,_that.selectedUnitId,_that.getLocalizedLabel,_that.getLocalizedValue,_that.meterSquared,_that.currencySymbol);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int baseUnitId,  int selectedUnitId,  String Function(String) getLocalizedLabel,  String Function(String, String) getLocalizedValue,  String meterSquared,  String currencySymbol)  comparisonRequested,}) {final _that = this;
switch (_that) {
case ComparisonRequested():
return comparisonRequested(_that.baseUnitId,_that.selectedUnitId,_that.getLocalizedLabel,_that.getLocalizedValue,_that.meterSquared,_that.currencySymbol);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int baseUnitId,  int selectedUnitId,  String Function(String) getLocalizedLabel,  String Function(String, String) getLocalizedValue,  String meterSquared,  String currencySymbol)?  comparisonRequested,}) {final _that = this;
switch (_that) {
case ComparisonRequested() when comparisonRequested != null:
return comparisonRequested(_that.baseUnitId,_that.selectedUnitId,_that.getLocalizedLabel,_that.getLocalizedValue,_that.meterSquared,_that.currencySymbol);case _:
  return null;

}
}

}

/// @nodoc


class ComparisonRequested implements ComparisonEvent {
  const ComparisonRequested({required this.baseUnitId, required this.selectedUnitId, required this.getLocalizedLabel, required this.getLocalizedValue, required this.meterSquared, required this.currencySymbol});
  

@override final  int baseUnitId;
@override final  int selectedUnitId;
@override final  String Function(String) getLocalizedLabel;
@override final  String Function(String, String) getLocalizedValue;
@override final  String meterSquared;
@override final  String currencySymbol;

/// Create a copy of ComparisonEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ComparisonRequestedCopyWith<ComparisonRequested> get copyWith => _$ComparisonRequestedCopyWithImpl<ComparisonRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ComparisonRequested&&(identical(other.baseUnitId, baseUnitId) || other.baseUnitId == baseUnitId)&&(identical(other.selectedUnitId, selectedUnitId) || other.selectedUnitId == selectedUnitId)&&(identical(other.getLocalizedLabel, getLocalizedLabel) || other.getLocalizedLabel == getLocalizedLabel)&&(identical(other.getLocalizedValue, getLocalizedValue) || other.getLocalizedValue == getLocalizedValue)&&(identical(other.meterSquared, meterSquared) || other.meterSquared == meterSquared)&&(identical(other.currencySymbol, currencySymbol) || other.currencySymbol == currencySymbol));
}


@override
int get hashCode => Object.hash(runtimeType,baseUnitId,selectedUnitId,getLocalizedLabel,getLocalizedValue,meterSquared,currencySymbol);

@override
String toString() {
  return 'ComparisonEvent.comparisonRequested(baseUnitId: $baseUnitId, selectedUnitId: $selectedUnitId, getLocalizedLabel: $getLocalizedLabel, getLocalizedValue: $getLocalizedValue, meterSquared: $meterSquared, currencySymbol: $currencySymbol)';
}


}

/// @nodoc
abstract mixin class $ComparisonRequestedCopyWith<$Res> implements $ComparisonEventCopyWith<$Res> {
  factory $ComparisonRequestedCopyWith(ComparisonRequested value, $Res Function(ComparisonRequested) _then) = _$ComparisonRequestedCopyWithImpl;
@override @useResult
$Res call({
 int baseUnitId, int selectedUnitId, String Function(String) getLocalizedLabel, String Function(String, String) getLocalizedValue, String meterSquared, String currencySymbol
});




}
/// @nodoc
class _$ComparisonRequestedCopyWithImpl<$Res>
    implements $ComparisonRequestedCopyWith<$Res> {
  _$ComparisonRequestedCopyWithImpl(this._self, this._then);

  final ComparisonRequested _self;
  final $Res Function(ComparisonRequested) _then;

/// Create a copy of ComparisonEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? baseUnitId = null,Object? selectedUnitId = null,Object? getLocalizedLabel = null,Object? getLocalizedValue = null,Object? meterSquared = null,Object? currencySymbol = null,}) {
  return _then(ComparisonRequested(
baseUnitId: null == baseUnitId ? _self.baseUnitId : baseUnitId // ignore: cast_nullable_to_non_nullable
as int,selectedUnitId: null == selectedUnitId ? _self.selectedUnitId : selectedUnitId // ignore: cast_nullable_to_non_nullable
as int,getLocalizedLabel: null == getLocalizedLabel ? _self.getLocalizedLabel : getLocalizedLabel // ignore: cast_nullable_to_non_nullable
as String Function(String),getLocalizedValue: null == getLocalizedValue ? _self.getLocalizedValue : getLocalizedValue // ignore: cast_nullable_to_non_nullable
as String Function(String, String),meterSquared: null == meterSquared ? _self.meterSquared : meterSquared // ignore: cast_nullable_to_non_nullable
as String,currencySymbol: null == currencySymbol ? _self.currencySymbol : currencySymbol // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
