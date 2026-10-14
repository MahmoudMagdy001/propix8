// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'developers_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DevelopersState {

 DevelopersStatus get status; List<DeveloperEntity> get developers; String? get errorMessage;
/// Create a copy of DevelopersState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DevelopersStateCopyWith<DevelopersState> get copyWith => _$DevelopersStateCopyWithImpl<DevelopersState>(this as DevelopersState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DevelopersState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.developers, developers)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(developers),errorMessage);

@override
String toString() {
  return 'DevelopersState(status: $status, developers: $developers, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $DevelopersStateCopyWith<$Res>  {
  factory $DevelopersStateCopyWith(DevelopersState value, $Res Function(DevelopersState) _then) = _$DevelopersStateCopyWithImpl;
@useResult
$Res call({
 DevelopersStatus status, List<DeveloperEntity> developers, String? errorMessage
});




}
/// @nodoc
class _$DevelopersStateCopyWithImpl<$Res>
    implements $DevelopersStateCopyWith<$Res> {
  _$DevelopersStateCopyWithImpl(this._self, this._then);

  final DevelopersState _self;
  final $Res Function(DevelopersState) _then;

/// Create a copy of DevelopersState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? developers = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as DevelopersStatus,developers: null == developers ? _self.developers : developers // ignore: cast_nullable_to_non_nullable
as List<DeveloperEntity>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [DevelopersState].
extension DevelopersStatePatterns on DevelopersState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DevelopersState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DevelopersState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DevelopersState value)  $default,){
final _that = this;
switch (_that) {
case _DevelopersState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DevelopersState value)?  $default,){
final _that = this;
switch (_that) {
case _DevelopersState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DevelopersStatus status,  List<DeveloperEntity> developers,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DevelopersState() when $default != null:
return $default(_that.status,_that.developers,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DevelopersStatus status,  List<DeveloperEntity> developers,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _DevelopersState():
return $default(_that.status,_that.developers,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DevelopersStatus status,  List<DeveloperEntity> developers,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _DevelopersState() when $default != null:
return $default(_that.status,_that.developers,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _DevelopersState extends DevelopersState {
  const _DevelopersState({this.status = DevelopersStatus.initial, final  List<DeveloperEntity> developers = const [], this.errorMessage}): _developers = developers,super._();
  

@override@JsonKey() final  DevelopersStatus status;
 final  List<DeveloperEntity> _developers;
@override@JsonKey() List<DeveloperEntity> get developers {
  if (_developers is EqualUnmodifiableListView) return _developers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_developers);
}

@override final  String? errorMessage;

/// Create a copy of DevelopersState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DevelopersStateCopyWith<_DevelopersState> get copyWith => __$DevelopersStateCopyWithImpl<_DevelopersState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DevelopersState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._developers, _developers)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_developers),errorMessage);

@override
String toString() {
  return 'DevelopersState(status: $status, developers: $developers, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$DevelopersStateCopyWith<$Res> implements $DevelopersStateCopyWith<$Res> {
  factory _$DevelopersStateCopyWith(_DevelopersState value, $Res Function(_DevelopersState) _then) = __$DevelopersStateCopyWithImpl;
@override @useResult
$Res call({
 DevelopersStatus status, List<DeveloperEntity> developers, String? errorMessage
});




}
/// @nodoc
class __$DevelopersStateCopyWithImpl<$Res>
    implements _$DevelopersStateCopyWith<$Res> {
  __$DevelopersStateCopyWithImpl(this._self, this._then);

  final _DevelopersState _self;
  final $Res Function(_DevelopersState) _then;

/// Create a copy of DevelopersState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? developers = null,Object? errorMessage = freezed,}) {
  return _then(_DevelopersState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as DevelopersStatus,developers: null == developers ? _self._developers : developers // ignore: cast_nullable_to_non_nullable
as List<DeveloperEntity>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
