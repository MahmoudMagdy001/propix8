// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nearby_units_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NearbyUnitsState {

 HomeRequestStatus get status; List<UnitEntity> get units; PaginationModel? get pagination; ViewType get viewType; String? get errorMessage; bool get isLoadingMore;
/// Create a copy of NearbyUnitsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NearbyUnitsStateCopyWith<NearbyUnitsState> get copyWith => _$NearbyUnitsStateCopyWithImpl<NearbyUnitsState>(this as NearbyUnitsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NearbyUnitsState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.units, units)&&(identical(other.pagination, pagination) || other.pagination == pagination)&&(identical(other.viewType, viewType) || other.viewType == viewType)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(units),pagination,viewType,errorMessage,isLoadingMore);

@override
String toString() {
  return 'NearbyUnitsState(status: $status, units: $units, pagination: $pagination, viewType: $viewType, errorMessage: $errorMessage, isLoadingMore: $isLoadingMore)';
}


}

/// @nodoc
abstract mixin class $NearbyUnitsStateCopyWith<$Res>  {
  factory $NearbyUnitsStateCopyWith(NearbyUnitsState value, $Res Function(NearbyUnitsState) _then) = _$NearbyUnitsStateCopyWithImpl;
@useResult
$Res call({
 HomeRequestStatus status, List<UnitEntity> units, PaginationModel? pagination, ViewType viewType, String? errorMessage, bool isLoadingMore
});




}
/// @nodoc
class _$NearbyUnitsStateCopyWithImpl<$Res>
    implements $NearbyUnitsStateCopyWith<$Res> {
  _$NearbyUnitsStateCopyWithImpl(this._self, this._then);

  final NearbyUnitsState _self;
  final $Res Function(NearbyUnitsState) _then;

/// Create a copy of NearbyUnitsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? units = null,Object? pagination = freezed,Object? viewType = null,Object? errorMessage = freezed,Object? isLoadingMore = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as HomeRequestStatus,units: null == units ? _self.units : units // ignore: cast_nullable_to_non_nullable
as List<UnitEntity>,pagination: freezed == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as PaginationModel?,viewType: null == viewType ? _self.viewType : viewType // ignore: cast_nullable_to_non_nullable
as ViewType,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [NearbyUnitsState].
extension NearbyUnitsStatePatterns on NearbyUnitsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NearbyUnitsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NearbyUnitsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NearbyUnitsState value)  $default,){
final _that = this;
switch (_that) {
case _NearbyUnitsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NearbyUnitsState value)?  $default,){
final _that = this;
switch (_that) {
case _NearbyUnitsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( HomeRequestStatus status,  List<UnitEntity> units,  PaginationModel? pagination,  ViewType viewType,  String? errorMessage,  bool isLoadingMore)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NearbyUnitsState() when $default != null:
return $default(_that.status,_that.units,_that.pagination,_that.viewType,_that.errorMessage,_that.isLoadingMore);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( HomeRequestStatus status,  List<UnitEntity> units,  PaginationModel? pagination,  ViewType viewType,  String? errorMessage,  bool isLoadingMore)  $default,) {final _that = this;
switch (_that) {
case _NearbyUnitsState():
return $default(_that.status,_that.units,_that.pagination,_that.viewType,_that.errorMessage,_that.isLoadingMore);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( HomeRequestStatus status,  List<UnitEntity> units,  PaginationModel? pagination,  ViewType viewType,  String? errorMessage,  bool isLoadingMore)?  $default,) {final _that = this;
switch (_that) {
case _NearbyUnitsState() when $default != null:
return $default(_that.status,_that.units,_that.pagination,_that.viewType,_that.errorMessage,_that.isLoadingMore);case _:
  return null;

}
}

}

/// @nodoc


class _NearbyUnitsState extends NearbyUnitsState {
  const _NearbyUnitsState({this.status = HomeRequestStatus.initial, final  List<UnitEntity> units = const [], this.pagination, this.viewType = ViewType.list, this.errorMessage, this.isLoadingMore = false}): _units = units,super._();
  

@override@JsonKey() final  HomeRequestStatus status;
 final  List<UnitEntity> _units;
@override@JsonKey() List<UnitEntity> get units {
  if (_units is EqualUnmodifiableListView) return _units;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_units);
}

@override final  PaginationModel? pagination;
@override@JsonKey() final  ViewType viewType;
@override final  String? errorMessage;
@override@JsonKey() final  bool isLoadingMore;

/// Create a copy of NearbyUnitsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NearbyUnitsStateCopyWith<_NearbyUnitsState> get copyWith => __$NearbyUnitsStateCopyWithImpl<_NearbyUnitsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NearbyUnitsState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._units, _units)&&(identical(other.pagination, pagination) || other.pagination == pagination)&&(identical(other.viewType, viewType) || other.viewType == viewType)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_units),pagination,viewType,errorMessage,isLoadingMore);

@override
String toString() {
  return 'NearbyUnitsState(status: $status, units: $units, pagination: $pagination, viewType: $viewType, errorMessage: $errorMessage, isLoadingMore: $isLoadingMore)';
}


}

/// @nodoc
abstract mixin class _$NearbyUnitsStateCopyWith<$Res> implements $NearbyUnitsStateCopyWith<$Res> {
  factory _$NearbyUnitsStateCopyWith(_NearbyUnitsState value, $Res Function(_NearbyUnitsState) _then) = __$NearbyUnitsStateCopyWithImpl;
@override @useResult
$Res call({
 HomeRequestStatus status, List<UnitEntity> units, PaginationModel? pagination, ViewType viewType, String? errorMessage, bool isLoadingMore
});




}
/// @nodoc
class __$NearbyUnitsStateCopyWithImpl<$Res>
    implements _$NearbyUnitsStateCopyWith<$Res> {
  __$NearbyUnitsStateCopyWithImpl(this._self, this._then);

  final _NearbyUnitsState _self;
  final $Res Function(_NearbyUnitsState) _then;

/// Create a copy of NearbyUnitsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? units = null,Object? pagination = freezed,Object? viewType = null,Object? errorMessage = freezed,Object? isLoadingMore = null,}) {
  return _then(_NearbyUnitsState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as HomeRequestStatus,units: null == units ? _self._units : units // ignore: cast_nullable_to_non_nullable
as List<UnitEntity>,pagination: freezed == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as PaginationModel?,viewType: null == viewType ? _self.viewType : viewType // ignore: cast_nullable_to_non_nullable
as ViewType,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
