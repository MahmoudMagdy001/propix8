// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comparison_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ComparisonState {

 ComparisonStatus get status; String? get errorMessage; UnitDetailsEntity? get baseUnit; UnitDetailsEntity? get selectedUnit; List<ComparisonItem> get comparisonItems;
/// Create a copy of ComparisonState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ComparisonStateCopyWith<ComparisonState> get copyWith => _$ComparisonStateCopyWithImpl<ComparisonState>(this as ComparisonState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ComparisonState&&(identical(other.status, status) || other.status == status)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.baseUnit, baseUnit) || other.baseUnit == baseUnit)&&(identical(other.selectedUnit, selectedUnit) || other.selectedUnit == selectedUnit)&&const DeepCollectionEquality().equals(other.comparisonItems, comparisonItems));
}


@override
int get hashCode => Object.hash(runtimeType,status,errorMessage,baseUnit,selectedUnit,const DeepCollectionEquality().hash(comparisonItems));

@override
String toString() {
  return 'ComparisonState(status: $status, errorMessage: $errorMessage, baseUnit: $baseUnit, selectedUnit: $selectedUnit, comparisonItems: $comparisonItems)';
}


}

/// @nodoc
abstract mixin class $ComparisonStateCopyWith<$Res>  {
  factory $ComparisonStateCopyWith(ComparisonState value, $Res Function(ComparisonState) _then) = _$ComparisonStateCopyWithImpl;
@useResult
$Res call({
 ComparisonStatus status, String? errorMessage, UnitDetailsEntity? baseUnit, UnitDetailsEntity? selectedUnit, List<ComparisonItem> comparisonItems
});


$UnitDetailsEntityCopyWith<$Res>? get baseUnit;$UnitDetailsEntityCopyWith<$Res>? get selectedUnit;

}
/// @nodoc
class _$ComparisonStateCopyWithImpl<$Res>
    implements $ComparisonStateCopyWith<$Res> {
  _$ComparisonStateCopyWithImpl(this._self, this._then);

  final ComparisonState _self;
  final $Res Function(ComparisonState) _then;

/// Create a copy of ComparisonState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? errorMessage = freezed,Object? baseUnit = freezed,Object? selectedUnit = freezed,Object? comparisonItems = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ComparisonStatus,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,baseUnit: freezed == baseUnit ? _self.baseUnit : baseUnit // ignore: cast_nullable_to_non_nullable
as UnitDetailsEntity?,selectedUnit: freezed == selectedUnit ? _self.selectedUnit : selectedUnit // ignore: cast_nullable_to_non_nullable
as UnitDetailsEntity?,comparisonItems: null == comparisonItems ? _self.comparisonItems : comparisonItems // ignore: cast_nullable_to_non_nullable
as List<ComparisonItem>,
  ));
}
/// Create a copy of ComparisonState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UnitDetailsEntityCopyWith<$Res>? get baseUnit {
    if (_self.baseUnit == null) {
    return null;
  }

  return $UnitDetailsEntityCopyWith<$Res>(_self.baseUnit!, (value) {
    return _then(_self.copyWith(baseUnit: value));
  });
}/// Create a copy of ComparisonState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UnitDetailsEntityCopyWith<$Res>? get selectedUnit {
    if (_self.selectedUnit == null) {
    return null;
  }

  return $UnitDetailsEntityCopyWith<$Res>(_self.selectedUnit!, (value) {
    return _then(_self.copyWith(selectedUnit: value));
  });
}
}


/// Adds pattern-matching-related methods to [ComparisonState].
extension ComparisonStatePatterns on ComparisonState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ComparisonState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ComparisonState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ComparisonState value)  $default,){
final _that = this;
switch (_that) {
case _ComparisonState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ComparisonState value)?  $default,){
final _that = this;
switch (_that) {
case _ComparisonState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ComparisonStatus status,  String? errorMessage,  UnitDetailsEntity? baseUnit,  UnitDetailsEntity? selectedUnit,  List<ComparisonItem> comparisonItems)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ComparisonState() when $default != null:
return $default(_that.status,_that.errorMessage,_that.baseUnit,_that.selectedUnit,_that.comparisonItems);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ComparisonStatus status,  String? errorMessage,  UnitDetailsEntity? baseUnit,  UnitDetailsEntity? selectedUnit,  List<ComparisonItem> comparisonItems)  $default,) {final _that = this;
switch (_that) {
case _ComparisonState():
return $default(_that.status,_that.errorMessage,_that.baseUnit,_that.selectedUnit,_that.comparisonItems);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ComparisonStatus status,  String? errorMessage,  UnitDetailsEntity? baseUnit,  UnitDetailsEntity? selectedUnit,  List<ComparisonItem> comparisonItems)?  $default,) {final _that = this;
switch (_that) {
case _ComparisonState() when $default != null:
return $default(_that.status,_that.errorMessage,_that.baseUnit,_that.selectedUnit,_that.comparisonItems);case _:
  return null;

}
}

}

/// @nodoc


class _ComparisonState implements ComparisonState {
  const _ComparisonState({this.status = ComparisonStatus.initial, this.errorMessage, this.baseUnit, this.selectedUnit, final  List<ComparisonItem> comparisonItems = const []}): _comparisonItems = comparisonItems;
  

@override@JsonKey() final  ComparisonStatus status;
@override final  String? errorMessage;
@override final  UnitDetailsEntity? baseUnit;
@override final  UnitDetailsEntity? selectedUnit;
 final  List<ComparisonItem> _comparisonItems;
@override@JsonKey() List<ComparisonItem> get comparisonItems {
  if (_comparisonItems is EqualUnmodifiableListView) return _comparisonItems;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_comparisonItems);
}


/// Create a copy of ComparisonState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ComparisonStateCopyWith<_ComparisonState> get copyWith => __$ComparisonStateCopyWithImpl<_ComparisonState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ComparisonState&&(identical(other.status, status) || other.status == status)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.baseUnit, baseUnit) || other.baseUnit == baseUnit)&&(identical(other.selectedUnit, selectedUnit) || other.selectedUnit == selectedUnit)&&const DeepCollectionEquality().equals(other._comparisonItems, _comparisonItems));
}


@override
int get hashCode => Object.hash(runtimeType,status,errorMessage,baseUnit,selectedUnit,const DeepCollectionEquality().hash(_comparisonItems));

@override
String toString() {
  return 'ComparisonState(status: $status, errorMessage: $errorMessage, baseUnit: $baseUnit, selectedUnit: $selectedUnit, comparisonItems: $comparisonItems)';
}


}

/// @nodoc
abstract mixin class _$ComparisonStateCopyWith<$Res> implements $ComparisonStateCopyWith<$Res> {
  factory _$ComparisonStateCopyWith(_ComparisonState value, $Res Function(_ComparisonState) _then) = __$ComparisonStateCopyWithImpl;
@override @useResult
$Res call({
 ComparisonStatus status, String? errorMessage, UnitDetailsEntity? baseUnit, UnitDetailsEntity? selectedUnit, List<ComparisonItem> comparisonItems
});


@override $UnitDetailsEntityCopyWith<$Res>? get baseUnit;@override $UnitDetailsEntityCopyWith<$Res>? get selectedUnit;

}
/// @nodoc
class __$ComparisonStateCopyWithImpl<$Res>
    implements _$ComparisonStateCopyWith<$Res> {
  __$ComparisonStateCopyWithImpl(this._self, this._then);

  final _ComparisonState _self;
  final $Res Function(_ComparisonState) _then;

/// Create a copy of ComparisonState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? errorMessage = freezed,Object? baseUnit = freezed,Object? selectedUnit = freezed,Object? comparisonItems = null,}) {
  return _then(_ComparisonState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ComparisonStatus,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,baseUnit: freezed == baseUnit ? _self.baseUnit : baseUnit // ignore: cast_nullable_to_non_nullable
as UnitDetailsEntity?,selectedUnit: freezed == selectedUnit ? _self.selectedUnit : selectedUnit // ignore: cast_nullable_to_non_nullable
as UnitDetailsEntity?,comparisonItems: null == comparisonItems ? _self._comparisonItems : comparisonItems // ignore: cast_nullable_to_non_nullable
as List<ComparisonItem>,
  ));
}

/// Create a copy of ComparisonState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UnitDetailsEntityCopyWith<$Res>? get baseUnit {
    if (_self.baseUnit == null) {
    return null;
  }

  return $UnitDetailsEntityCopyWith<$Res>(_self.baseUnit!, (value) {
    return _then(_self.copyWith(baseUnit: value));
  });
}/// Create a copy of ComparisonState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UnitDetailsEntityCopyWith<$Res>? get selectedUnit {
    if (_self.selectedUnit == null) {
    return null;
  }

  return $UnitDetailsEntityCopyWith<$Res>(_self.selectedUnit!, (value) {
    return _then(_self.copyWith(selectedUnit: value));
  });
}
}

// dart format on
