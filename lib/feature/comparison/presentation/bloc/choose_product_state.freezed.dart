// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'choose_product_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChooseProductState {

 ChooseProductStatus get status; List<UnitEntity> get units; ViewType get viewType; String? get errorMessage; int get currentPage; int get lastPage;
/// Create a copy of ChooseProductState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChooseProductStateCopyWith<ChooseProductState> get copyWith => _$ChooseProductStateCopyWithImpl<ChooseProductState>(this as ChooseProductState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ChooseProductState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChooseProductState&&(identical(other.status, _this.status) || other.status == _this.status)&&const DeepCollectionEquality().equals(other.units, _this.units)&&(identical(other.viewType, _this.viewType) || other.viewType == _this.viewType)&&(identical(other.errorMessage, _this.errorMessage) || other.errorMessage == _this.errorMessage)&&(identical(other.currentPage, _this.currentPage) || other.currentPage == _this.currentPage)&&(identical(other.lastPage, _this.lastPage) || other.lastPage == _this.lastPage));
}


@override
int get hashCode {
  final _this = this as ChooseProductState;
  return Object.hash(runtimeType,_this.status,const DeepCollectionEquality().hash(_this.units),_this.viewType,_this.errorMessage,_this.currentPage,_this.lastPage);
}

@override
String toString() {
  final _this = this as ChooseProductState;
  return 'ChooseProductState(status: ${_this.status}, units: ${_this.units}, viewType: ${_this.viewType}, errorMessage: ${_this.errorMessage}, currentPage: ${_this.currentPage}, lastPage: ${_this.lastPage})';
}


}

/// @nodoc
abstract mixin class $ChooseProductStateCopyWith<$Res>  {
  factory $ChooseProductStateCopyWith(ChooseProductState value, $Res Function(ChooseProductState) _then) = _$ChooseProductStateCopyWithImpl;
@useResult
$Res call({
 ChooseProductStatus status, List<UnitEntity> units, ViewType viewType, String? errorMessage, int currentPage, int lastPage
});




}
/// @nodoc
class _$ChooseProductStateCopyWithImpl<$Res>
    implements $ChooseProductStateCopyWith<$Res> {
  _$ChooseProductStateCopyWithImpl(this._self, this._then);

  final ChooseProductState _self;
  final $Res Function(ChooseProductState) _then;

/// Create a copy of ChooseProductState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? units = null,Object? viewType = null,Object? errorMessage = freezed,Object? currentPage = null,Object? lastPage = null,}) {
  return _then(ChooseProductState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ChooseProductStatus,units: null == units ? _self.units : units // ignore: cast_nullable_to_non_nullable
as List<UnitEntity>,viewType: null == viewType ? _self.viewType : viewType // ignore: cast_nullable_to_non_nullable
as ViewType,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,lastPage: null == lastPage ? _self.lastPage : lastPage // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ChooseProductState].
extension ChooseProductStatePatterns on ChooseProductState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChooseProductState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChooseProductState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChooseProductState value)  $default,){
final _that = this;
switch (_that) {
case _ChooseProductState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChooseProductState value)?  $default,){
final _that = this;
switch (_that) {
case _ChooseProductState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ChooseProductStatus status,  List<UnitEntity> units,  ViewType viewType,  String? errorMessage,  int currentPage,  int lastPage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChooseProductState() when $default != null:
return $default(_that.status,_that.units,_that.viewType,_that.errorMessage,_that.currentPage,_that.lastPage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ChooseProductStatus status,  List<UnitEntity> units,  ViewType viewType,  String? errorMessage,  int currentPage,  int lastPage)  $default,) {final _that = this;
switch (_that) {
case _ChooseProductState():
return $default(_that.status,_that.units,_that.viewType,_that.errorMessage,_that.currentPage,_that.lastPage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ChooseProductStatus status,  List<UnitEntity> units,  ViewType viewType,  String? errorMessage,  int currentPage,  int lastPage)?  $default,) {final _that = this;
switch (_that) {
case _ChooseProductState() when $default != null:
return $default(_that.status,_that.units,_that.viewType,_that.errorMessage,_that.currentPage,_that.lastPage);case _:
  return null;

}
}

}

/// @nodoc


class _ChooseProductState extends ChooseProductState {
  const _ChooseProductState({this.status = ChooseProductStatus.initial,  List<UnitEntity> units = const [], this.viewType = ViewType.grid, this.errorMessage, this.currentPage = 1, this.lastPage = 1}): _units = units,super._();
  

@override@JsonKey() final  ChooseProductStatus status;
 final  List<UnitEntity> _units;
@override@JsonKey() List<UnitEntity> get units {
  if (_units is EqualUnmodifiableListView) return _units;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_units);
}

@override@JsonKey() final  ViewType viewType;
@override final  String? errorMessage;
@override@JsonKey() final  int currentPage;
@override@JsonKey() final  int lastPage;

/// Create a copy of ChooseProductState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChooseProductStateCopyWith<_ChooseProductState> get copyWith => __$ChooseProductStateCopyWithImpl<_ChooseProductState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChooseProductState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.units, _units)&&(identical(other.viewType, viewType) || other.viewType == viewType)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.lastPage, lastPage) || other.lastPage == lastPage));
}


@override
int get hashCode {
    return Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_units),viewType,errorMessage,currentPage,lastPage);
}

@override
String toString() {
    return 'ChooseProductState(status: $status, units: $units, viewType: $viewType, errorMessage: $errorMessage, currentPage: $currentPage, lastPage: $lastPage)';
}


}

/// @nodoc
abstract mixin class _$ChooseProductStateCopyWith<$Res> implements $ChooseProductStateCopyWith<$Res> {
  factory _$ChooseProductStateCopyWith(_ChooseProductState value, $Res Function(_ChooseProductState) _then) = __$ChooseProductStateCopyWithImpl;
@override @useResult
$Res call({
 ChooseProductStatus status, List<UnitEntity> units, ViewType viewType, String? errorMessage, int currentPage, int lastPage
});




}
/// @nodoc
class __$ChooseProductStateCopyWithImpl<$Res>
    implements _$ChooseProductStateCopyWith<$Res> {
  __$ChooseProductStateCopyWithImpl(this._self, this._then);

  final _ChooseProductState _self;
  final $Res Function(_ChooseProductState) _then;

/// Create a copy of ChooseProductState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? units = null,Object? viewType = null,Object? errorMessage = freezed,Object? currentPage = null,Object? lastPage = null,}) {
  return _then(_ChooseProductState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ChooseProductStatus,units: null == units ? _self._units : units // ignore: cast_nullable_to_non_nullable
as List<UnitEntity>,viewType: null == viewType ? _self.viewType : viewType // ignore: cast_nullable_to_non_nullable
as ViewType,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,lastPage: null == lastPage ? _self.lastPage : lastPage // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
