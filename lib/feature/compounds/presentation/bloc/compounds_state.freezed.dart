// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'compounds_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CompoundsState {

 CompoundsStatus get status; List<CompoundEntity> get compounds; String? get errorMessage;
/// Create a copy of CompoundsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CompoundsStateCopyWith<CompoundsState> get copyWith => _$CompoundsStateCopyWithImpl<CompoundsState>(this as CompoundsState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as CompoundsState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompoundsState&&(identical(other.status, _this.status) || other.status == _this.status)&&const DeepCollectionEquality().equals(other.compounds, _this.compounds)&&(identical(other.errorMessage, _this.errorMessage) || other.errorMessage == _this.errorMessage));
}


@override
int get hashCode {
  final _this = this as CompoundsState;
  return Object.hash(runtimeType,_this.status,const DeepCollectionEquality().hash(_this.compounds),_this.errorMessage);
}

@override
String toString() {
  final _this = this as CompoundsState;
  return 'CompoundsState(status: ${_this.status}, compounds: ${_this.compounds}, errorMessage: ${_this.errorMessage})';
}


}

/// @nodoc
abstract mixin class $CompoundsStateCopyWith<$Res>  {
  factory $CompoundsStateCopyWith(CompoundsState value, $Res Function(CompoundsState) _then) = _$CompoundsStateCopyWithImpl;
@useResult
$Res call({
 CompoundsStatus status, List<CompoundEntity> compounds, String? errorMessage
});




}
/// @nodoc
class _$CompoundsStateCopyWithImpl<$Res>
    implements $CompoundsStateCopyWith<$Res> {
  _$CompoundsStateCopyWithImpl(this._self, this._then);

  final CompoundsState _self;
  final $Res Function(CompoundsState) _then;

/// Create a copy of CompoundsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? compounds = null,Object? errorMessage = freezed,}) {
  return _then(CompoundsState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CompoundsStatus,compounds: null == compounds ? _self.compounds : compounds // ignore: cast_nullable_to_non_nullable
as List<CompoundEntity>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CompoundsState].
extension CompoundsStatePatterns on CompoundsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CompoundsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CompoundsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CompoundsState value)  $default,){
final _that = this;
switch (_that) {
case _CompoundsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CompoundsState value)?  $default,){
final _that = this;
switch (_that) {
case _CompoundsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CompoundsStatus status,  List<CompoundEntity> compounds,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CompoundsState() when $default != null:
return $default(_that.status,_that.compounds,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CompoundsStatus status,  List<CompoundEntity> compounds,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _CompoundsState():
return $default(_that.status,_that.compounds,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CompoundsStatus status,  List<CompoundEntity> compounds,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _CompoundsState() when $default != null:
return $default(_that.status,_that.compounds,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _CompoundsState extends CompoundsState {
  const _CompoundsState({this.status = CompoundsStatus.initial,  List<CompoundEntity> compounds = const [], this.errorMessage}): _compounds = compounds,super._();
  

@override@JsonKey() final  CompoundsStatus status;
 final  List<CompoundEntity> _compounds;
@override@JsonKey() List<CompoundEntity> get compounds {
  if (_compounds is EqualUnmodifiableListView) return _compounds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_compounds);
}

@override final  String? errorMessage;

/// Create a copy of CompoundsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CompoundsStateCopyWith<_CompoundsState> get copyWith => __$CompoundsStateCopyWithImpl<_CompoundsState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CompoundsState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.compounds, _compounds)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode {
    return Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_compounds),errorMessage);
}

@override
String toString() {
    return 'CompoundsState(status: $status, compounds: $compounds, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$CompoundsStateCopyWith<$Res> implements $CompoundsStateCopyWith<$Res> {
  factory _$CompoundsStateCopyWith(_CompoundsState value, $Res Function(_CompoundsState) _then) = __$CompoundsStateCopyWithImpl;
@override @useResult
$Res call({
 CompoundsStatus status, List<CompoundEntity> compounds, String? errorMessage
});




}
/// @nodoc
class __$CompoundsStateCopyWithImpl<$Res>
    implements _$CompoundsStateCopyWith<$Res> {
  __$CompoundsStateCopyWithImpl(this._self, this._then);

  final _CompoundsState _self;
  final $Res Function(_CompoundsState) _then;

/// Create a copy of CompoundsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? compounds = null,Object? errorMessage = freezed,}) {
  return _then(_CompoundsState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CompoundsStatus,compounds: null == compounds ? _self._compounds : compounds // ignore: cast_nullable_to_non_nullable
as List<CompoundEntity>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
