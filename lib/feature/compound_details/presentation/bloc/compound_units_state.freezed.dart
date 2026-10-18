// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'compound_units_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CompoundUnitsState {

 HomeRequestStatus get status; CompoundCollectionEntity? get compound; String? get errorMessage; ViewType get viewType; bool get isLoadingMore;
/// Create a copy of CompoundUnitsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CompoundUnitsStateCopyWith<CompoundUnitsState> get copyWith => _$CompoundUnitsStateCopyWithImpl<CompoundUnitsState>(this as CompoundUnitsState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as CompoundUnitsState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompoundUnitsState&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.compound, _this.compound) || other.compound == _this.compound)&&(identical(other.errorMessage, _this.errorMessage) || other.errorMessage == _this.errorMessage)&&(identical(other.viewType, _this.viewType) || other.viewType == _this.viewType)&&(identical(other.isLoadingMore, _this.isLoadingMore) || other.isLoadingMore == _this.isLoadingMore));
}


@override
int get hashCode {
  final _this = this as CompoundUnitsState;
  return Object.hash(runtimeType,_this.status,_this.compound,_this.errorMessage,_this.viewType,_this.isLoadingMore);
}

@override
String toString() {
  final _this = this as CompoundUnitsState;
  return 'CompoundUnitsState(status: ${_this.status}, compound: ${_this.compound}, errorMessage: ${_this.errorMessage}, viewType: ${_this.viewType}, isLoadingMore: ${_this.isLoadingMore})';
}


}

/// @nodoc
abstract mixin class $CompoundUnitsStateCopyWith<$Res>  {
  factory $CompoundUnitsStateCopyWith(CompoundUnitsState value, $Res Function(CompoundUnitsState) _then) = _$CompoundUnitsStateCopyWithImpl;
@useResult
$Res call({
 HomeRequestStatus status, CompoundCollectionEntity? compound, String? errorMessage, ViewType viewType, bool isLoadingMore
});


$CompoundCollectionEntityCopyWith<$Res>? get compound;

}
/// @nodoc
class _$CompoundUnitsStateCopyWithImpl<$Res>
    implements $CompoundUnitsStateCopyWith<$Res> {
  _$CompoundUnitsStateCopyWithImpl(this._self, this._then);

  final CompoundUnitsState _self;
  final $Res Function(CompoundUnitsState) _then;

/// Create a copy of CompoundUnitsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? compound = freezed,Object? errorMessage = freezed,Object? viewType = null,Object? isLoadingMore = null,}) {
  return _then(CompoundUnitsState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as HomeRequestStatus,compound: freezed == compound ? _self.compound : compound // ignore: cast_nullable_to_non_nullable
as CompoundCollectionEntity?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,viewType: null == viewType ? _self.viewType : viewType // ignore: cast_nullable_to_non_nullable
as ViewType,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of CompoundUnitsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CompoundCollectionEntityCopyWith<$Res>? get compound {
    if (_self.compound == null) {
    return null;
  }

  return $CompoundCollectionEntityCopyWith<$Res>(_self.compound!, (value) {
    return _then(_self.copyWith(compound: value));
  });
}
}


/// Adds pattern-matching-related methods to [CompoundUnitsState].
extension CompoundUnitsStatePatterns on CompoundUnitsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CompoundUnitsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CompoundUnitsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CompoundUnitsState value)  $default,){
final _that = this;
switch (_that) {
case _CompoundUnitsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CompoundUnitsState value)?  $default,){
final _that = this;
switch (_that) {
case _CompoundUnitsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( HomeRequestStatus status,  CompoundCollectionEntity? compound,  String? errorMessage,  ViewType viewType,  bool isLoadingMore)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CompoundUnitsState() when $default != null:
return $default(_that.status,_that.compound,_that.errorMessage,_that.viewType,_that.isLoadingMore);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( HomeRequestStatus status,  CompoundCollectionEntity? compound,  String? errorMessage,  ViewType viewType,  bool isLoadingMore)  $default,) {final _that = this;
switch (_that) {
case _CompoundUnitsState():
return $default(_that.status,_that.compound,_that.errorMessage,_that.viewType,_that.isLoadingMore);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( HomeRequestStatus status,  CompoundCollectionEntity? compound,  String? errorMessage,  ViewType viewType,  bool isLoadingMore)?  $default,) {final _that = this;
switch (_that) {
case _CompoundUnitsState() when $default != null:
return $default(_that.status,_that.compound,_that.errorMessage,_that.viewType,_that.isLoadingMore);case _:
  return null;

}
}

}

/// @nodoc


class _CompoundUnitsState implements CompoundUnitsState {
  const _CompoundUnitsState({this.status = HomeRequestStatus.initial, this.compound, this.errorMessage, this.viewType = ViewType.grid, this.isLoadingMore = false});
  

@override@JsonKey() final  HomeRequestStatus status;
@override final  CompoundCollectionEntity? compound;
@override final  String? errorMessage;
@override@JsonKey() final  ViewType viewType;
@override@JsonKey() final  bool isLoadingMore;

/// Create a copy of CompoundUnitsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CompoundUnitsStateCopyWith<_CompoundUnitsState> get copyWith => __$CompoundUnitsStateCopyWithImpl<_CompoundUnitsState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CompoundUnitsState&&(identical(other.status, status) || other.status == status)&&(identical(other.compound, compound) || other.compound == compound)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.viewType, viewType) || other.viewType == viewType)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore));
}


@override
int get hashCode {
    return Object.hash(runtimeType,status,compound,errorMessage,viewType,isLoadingMore);
}

@override
String toString() {
    return 'CompoundUnitsState(status: $status, compound: $compound, errorMessage: $errorMessage, viewType: $viewType, isLoadingMore: $isLoadingMore)';
}


}

/// @nodoc
abstract mixin class _$CompoundUnitsStateCopyWith<$Res> implements $CompoundUnitsStateCopyWith<$Res> {
  factory _$CompoundUnitsStateCopyWith(_CompoundUnitsState value, $Res Function(_CompoundUnitsState) _then) = __$CompoundUnitsStateCopyWithImpl;
@override @useResult
$Res call({
 HomeRequestStatus status, CompoundCollectionEntity? compound, String? errorMessage, ViewType viewType, bool isLoadingMore
});


@override $CompoundCollectionEntityCopyWith<$Res>? get compound;

}
/// @nodoc
class __$CompoundUnitsStateCopyWithImpl<$Res>
    implements _$CompoundUnitsStateCopyWith<$Res> {
  __$CompoundUnitsStateCopyWithImpl(this._self, this._then);

  final _CompoundUnitsState _self;
  final $Res Function(_CompoundUnitsState) _then;

/// Create a copy of CompoundUnitsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? compound = freezed,Object? errorMessage = freezed,Object? viewType = null,Object? isLoadingMore = null,}) {
  return _then(_CompoundUnitsState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as HomeRequestStatus,compound: freezed == compound ? _self.compound : compound // ignore: cast_nullable_to_non_nullable
as CompoundCollectionEntity?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,viewType: null == viewType ? _self.viewType : viewType // ignore: cast_nullable_to_non_nullable
as ViewType,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of CompoundUnitsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CompoundCollectionEntityCopyWith<$Res>? get compound {
    if (_self.compound == null) {
    return null;
  }

  return $CompoundCollectionEntityCopyWith<$Res>(_self.compound!, (value) {
    return _then(_self.copyWith(compound: value));
  });
}
}

// dart format on
