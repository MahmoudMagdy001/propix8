// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'developer_units_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DeveloperUnitsState {

 HomeRequestStatus get status; DeveloperCollectionEntity? get developer; String? get errorMessage; ViewType get viewType; bool get isLoadingMore;
/// Create a copy of DeveloperUnitsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeveloperUnitsStateCopyWith<DeveloperUnitsState> get copyWith => _$DeveloperUnitsStateCopyWithImpl<DeveloperUnitsState>(this as DeveloperUnitsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeveloperUnitsState&&(identical(other.status, status) || other.status == status)&&(identical(other.developer, developer) || other.developer == developer)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.viewType, viewType) || other.viewType == viewType)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore));
}


@override
int get hashCode => Object.hash(runtimeType,status,developer,errorMessage,viewType,isLoadingMore);

@override
String toString() {
  return 'DeveloperUnitsState(status: $status, developer: $developer, errorMessage: $errorMessage, viewType: $viewType, isLoadingMore: $isLoadingMore)';
}


}

/// @nodoc
abstract mixin class $DeveloperUnitsStateCopyWith<$Res>  {
  factory $DeveloperUnitsStateCopyWith(DeveloperUnitsState value, $Res Function(DeveloperUnitsState) _then) = _$DeveloperUnitsStateCopyWithImpl;
@useResult
$Res call({
 HomeRequestStatus status, DeveloperCollectionEntity? developer, String? errorMessage, ViewType viewType, bool isLoadingMore
});


$DeveloperCollectionEntityCopyWith<$Res>? get developer;

}
/// @nodoc
class _$DeveloperUnitsStateCopyWithImpl<$Res>
    implements $DeveloperUnitsStateCopyWith<$Res> {
  _$DeveloperUnitsStateCopyWithImpl(this._self, this._then);

  final DeveloperUnitsState _self;
  final $Res Function(DeveloperUnitsState) _then;

/// Create a copy of DeveloperUnitsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? developer = freezed,Object? errorMessage = freezed,Object? viewType = null,Object? isLoadingMore = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as HomeRequestStatus,developer: freezed == developer ? _self.developer : developer // ignore: cast_nullable_to_non_nullable
as DeveloperCollectionEntity?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,viewType: null == viewType ? _self.viewType : viewType // ignore: cast_nullable_to_non_nullable
as ViewType,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of DeveloperUnitsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DeveloperCollectionEntityCopyWith<$Res>? get developer {
    if (_self.developer == null) {
    return null;
  }

  return $DeveloperCollectionEntityCopyWith<$Res>(_self.developer!, (value) {
    return _then(_self.copyWith(developer: value));
  });
}
}


/// Adds pattern-matching-related methods to [DeveloperUnitsState].
extension DeveloperUnitsStatePatterns on DeveloperUnitsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DeveloperUnitsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DeveloperUnitsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DeveloperUnitsState value)  $default,){
final _that = this;
switch (_that) {
case _DeveloperUnitsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DeveloperUnitsState value)?  $default,){
final _that = this;
switch (_that) {
case _DeveloperUnitsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( HomeRequestStatus status,  DeveloperCollectionEntity? developer,  String? errorMessage,  ViewType viewType,  bool isLoadingMore)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DeveloperUnitsState() when $default != null:
return $default(_that.status,_that.developer,_that.errorMessage,_that.viewType,_that.isLoadingMore);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( HomeRequestStatus status,  DeveloperCollectionEntity? developer,  String? errorMessage,  ViewType viewType,  bool isLoadingMore)  $default,) {final _that = this;
switch (_that) {
case _DeveloperUnitsState():
return $default(_that.status,_that.developer,_that.errorMessage,_that.viewType,_that.isLoadingMore);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( HomeRequestStatus status,  DeveloperCollectionEntity? developer,  String? errorMessage,  ViewType viewType,  bool isLoadingMore)?  $default,) {final _that = this;
switch (_that) {
case _DeveloperUnitsState() when $default != null:
return $default(_that.status,_that.developer,_that.errorMessage,_that.viewType,_that.isLoadingMore);case _:
  return null;

}
}

}

/// @nodoc


class _DeveloperUnitsState implements DeveloperUnitsState {
  const _DeveloperUnitsState({this.status = HomeRequestStatus.initial, this.developer, this.errorMessage, this.viewType = ViewType.grid, this.isLoadingMore = false});
  

@override@JsonKey() final  HomeRequestStatus status;
@override final  DeveloperCollectionEntity? developer;
@override final  String? errorMessage;
@override@JsonKey() final  ViewType viewType;
@override@JsonKey() final  bool isLoadingMore;

/// Create a copy of DeveloperUnitsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeveloperUnitsStateCopyWith<_DeveloperUnitsState> get copyWith => __$DeveloperUnitsStateCopyWithImpl<_DeveloperUnitsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeveloperUnitsState&&(identical(other.status, status) || other.status == status)&&(identical(other.developer, developer) || other.developer == developer)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.viewType, viewType) || other.viewType == viewType)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore));
}


@override
int get hashCode => Object.hash(runtimeType,status,developer,errorMessage,viewType,isLoadingMore);

@override
String toString() {
  return 'DeveloperUnitsState(status: $status, developer: $developer, errorMessage: $errorMessage, viewType: $viewType, isLoadingMore: $isLoadingMore)';
}


}

/// @nodoc
abstract mixin class _$DeveloperUnitsStateCopyWith<$Res> implements $DeveloperUnitsStateCopyWith<$Res> {
  factory _$DeveloperUnitsStateCopyWith(_DeveloperUnitsState value, $Res Function(_DeveloperUnitsState) _then) = __$DeveloperUnitsStateCopyWithImpl;
@override @useResult
$Res call({
 HomeRequestStatus status, DeveloperCollectionEntity? developer, String? errorMessage, ViewType viewType, bool isLoadingMore
});


@override $DeveloperCollectionEntityCopyWith<$Res>? get developer;

}
/// @nodoc
class __$DeveloperUnitsStateCopyWithImpl<$Res>
    implements _$DeveloperUnitsStateCopyWith<$Res> {
  __$DeveloperUnitsStateCopyWithImpl(this._self, this._then);

  final _DeveloperUnitsState _self;
  final $Res Function(_DeveloperUnitsState) _then;

/// Create a copy of DeveloperUnitsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? developer = freezed,Object? errorMessage = freezed,Object? viewType = null,Object? isLoadingMore = null,}) {
  return _then(_DeveloperUnitsState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as HomeRequestStatus,developer: freezed == developer ? _self.developer : developer // ignore: cast_nullable_to_non_nullable
as DeveloperCollectionEntity?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,viewType: null == viewType ? _self.viewType : viewType // ignore: cast_nullable_to_non_nullable
as ViewType,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of DeveloperUnitsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DeveloperCollectionEntityCopyWith<$Res>? get developer {
    if (_self.developer == null) {
    return null;
  }

  return $DeveloperCollectionEntityCopyWith<$Res>(_self.developer!, (value) {
    return _then(_self.copyWith(developer: value));
  });
}
}

// dart format on
