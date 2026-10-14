// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorite_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FavoriteState {

 FavoriteStatus get status; FavoriteStatus get listStatus; Map<int, bool> get favorites; List<FavoriteUnitEntity> get favoriteUnits; String? get errorMessage; int get currentPage; int get lastPage; ViewType get viewType;
/// Create a copy of FavoriteState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FavoriteStateCopyWith<FavoriteState> get copyWith => _$FavoriteStateCopyWithImpl<FavoriteState>(this as FavoriteState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FavoriteState&&(identical(other.status, status) || other.status == status)&&(identical(other.listStatus, listStatus) || other.listStatus == listStatus)&&const DeepCollectionEquality().equals(other.favorites, favorites)&&const DeepCollectionEquality().equals(other.favoriteUnits, favoriteUnits)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.lastPage, lastPage) || other.lastPage == lastPage)&&(identical(other.viewType, viewType) || other.viewType == viewType));
}


@override
int get hashCode => Object.hash(runtimeType,status,listStatus,const DeepCollectionEquality().hash(favorites),const DeepCollectionEquality().hash(favoriteUnits),errorMessage,currentPage,lastPage,viewType);

@override
String toString() {
  return 'FavoriteState(status: $status, listStatus: $listStatus, favorites: $favorites, favoriteUnits: $favoriteUnits, errorMessage: $errorMessage, currentPage: $currentPage, lastPage: $lastPage, viewType: $viewType)';
}


}

/// @nodoc
abstract mixin class $FavoriteStateCopyWith<$Res>  {
  factory $FavoriteStateCopyWith(FavoriteState value, $Res Function(FavoriteState) _then) = _$FavoriteStateCopyWithImpl;
@useResult
$Res call({
 FavoriteStatus status, FavoriteStatus listStatus, Map<int, bool> favorites, List<FavoriteUnitEntity> favoriteUnits, String? errorMessage, int currentPage, int lastPage, ViewType viewType
});




}
/// @nodoc
class _$FavoriteStateCopyWithImpl<$Res>
    implements $FavoriteStateCopyWith<$Res> {
  _$FavoriteStateCopyWithImpl(this._self, this._then);

  final FavoriteState _self;
  final $Res Function(FavoriteState) _then;

/// Create a copy of FavoriteState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? listStatus = null,Object? favorites = null,Object? favoriteUnits = null,Object? errorMessage = freezed,Object? currentPage = null,Object? lastPage = null,Object? viewType = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as FavoriteStatus,listStatus: null == listStatus ? _self.listStatus : listStatus // ignore: cast_nullable_to_non_nullable
as FavoriteStatus,favorites: null == favorites ? _self.favorites : favorites // ignore: cast_nullable_to_non_nullable
as Map<int, bool>,favoriteUnits: null == favoriteUnits ? _self.favoriteUnits : favoriteUnits // ignore: cast_nullable_to_non_nullable
as List<FavoriteUnitEntity>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,lastPage: null == lastPage ? _self.lastPage : lastPage // ignore: cast_nullable_to_non_nullable
as int,viewType: null == viewType ? _self.viewType : viewType // ignore: cast_nullable_to_non_nullable
as ViewType,
  ));
}

}


/// Adds pattern-matching-related methods to [FavoriteState].
extension FavoriteStatePatterns on FavoriteState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FavoriteState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FavoriteState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FavoriteState value)  $default,){
final _that = this;
switch (_that) {
case _FavoriteState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FavoriteState value)?  $default,){
final _that = this;
switch (_that) {
case _FavoriteState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( FavoriteStatus status,  FavoriteStatus listStatus,  Map<int, bool> favorites,  List<FavoriteUnitEntity> favoriteUnits,  String? errorMessage,  int currentPage,  int lastPage,  ViewType viewType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FavoriteState() when $default != null:
return $default(_that.status,_that.listStatus,_that.favorites,_that.favoriteUnits,_that.errorMessage,_that.currentPage,_that.lastPage,_that.viewType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( FavoriteStatus status,  FavoriteStatus listStatus,  Map<int, bool> favorites,  List<FavoriteUnitEntity> favoriteUnits,  String? errorMessage,  int currentPage,  int lastPage,  ViewType viewType)  $default,) {final _that = this;
switch (_that) {
case _FavoriteState():
return $default(_that.status,_that.listStatus,_that.favorites,_that.favoriteUnits,_that.errorMessage,_that.currentPage,_that.lastPage,_that.viewType);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( FavoriteStatus status,  FavoriteStatus listStatus,  Map<int, bool> favorites,  List<FavoriteUnitEntity> favoriteUnits,  String? errorMessage,  int currentPage,  int lastPage,  ViewType viewType)?  $default,) {final _that = this;
switch (_that) {
case _FavoriteState() when $default != null:
return $default(_that.status,_that.listStatus,_that.favorites,_that.favoriteUnits,_that.errorMessage,_that.currentPage,_that.lastPage,_that.viewType);case _:
  return null;

}
}

}

/// @nodoc


class _FavoriteState extends FavoriteState {
  const _FavoriteState({this.status = FavoriteStatus.initial, this.listStatus = FavoriteStatus.initial, final  Map<int, bool> favorites = const {}, final  List<FavoriteUnitEntity> favoriteUnits = const [], this.errorMessage, this.currentPage = 1, this.lastPage = 1, this.viewType = ViewType.grid}): _favorites = favorites,_favoriteUnits = favoriteUnits,super._();
  

@override@JsonKey() final  FavoriteStatus status;
@override@JsonKey() final  FavoriteStatus listStatus;
 final  Map<int, bool> _favorites;
@override@JsonKey() Map<int, bool> get favorites {
  if (_favorites is EqualUnmodifiableMapView) return _favorites;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_favorites);
}

 final  List<FavoriteUnitEntity> _favoriteUnits;
@override@JsonKey() List<FavoriteUnitEntity> get favoriteUnits {
  if (_favoriteUnits is EqualUnmodifiableListView) return _favoriteUnits;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_favoriteUnits);
}

@override final  String? errorMessage;
@override@JsonKey() final  int currentPage;
@override@JsonKey() final  int lastPage;
@override@JsonKey() final  ViewType viewType;

/// Create a copy of FavoriteState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FavoriteStateCopyWith<_FavoriteState> get copyWith => __$FavoriteStateCopyWithImpl<_FavoriteState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FavoriteState&&(identical(other.status, status) || other.status == status)&&(identical(other.listStatus, listStatus) || other.listStatus == listStatus)&&const DeepCollectionEquality().equals(other._favorites, _favorites)&&const DeepCollectionEquality().equals(other._favoriteUnits, _favoriteUnits)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.lastPage, lastPage) || other.lastPage == lastPage)&&(identical(other.viewType, viewType) || other.viewType == viewType));
}


@override
int get hashCode => Object.hash(runtimeType,status,listStatus,const DeepCollectionEquality().hash(_favorites),const DeepCollectionEquality().hash(_favoriteUnits),errorMessage,currentPage,lastPage,viewType);

@override
String toString() {
  return 'FavoriteState(status: $status, listStatus: $listStatus, favorites: $favorites, favoriteUnits: $favoriteUnits, errorMessage: $errorMessage, currentPage: $currentPage, lastPage: $lastPage, viewType: $viewType)';
}


}

/// @nodoc
abstract mixin class _$FavoriteStateCopyWith<$Res> implements $FavoriteStateCopyWith<$Res> {
  factory _$FavoriteStateCopyWith(_FavoriteState value, $Res Function(_FavoriteState) _then) = __$FavoriteStateCopyWithImpl;
@override @useResult
$Res call({
 FavoriteStatus status, FavoriteStatus listStatus, Map<int, bool> favorites, List<FavoriteUnitEntity> favoriteUnits, String? errorMessage, int currentPage, int lastPage, ViewType viewType
});




}
/// @nodoc
class __$FavoriteStateCopyWithImpl<$Res>
    implements _$FavoriteStateCopyWith<$Res> {
  __$FavoriteStateCopyWithImpl(this._self, this._then);

  final _FavoriteState _self;
  final $Res Function(_FavoriteState) _then;

/// Create a copy of FavoriteState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? listStatus = null,Object? favorites = null,Object? favoriteUnits = null,Object? errorMessage = freezed,Object? currentPage = null,Object? lastPage = null,Object? viewType = null,}) {
  return _then(_FavoriteState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as FavoriteStatus,listStatus: null == listStatus ? _self.listStatus : listStatus // ignore: cast_nullable_to_non_nullable
as FavoriteStatus,favorites: null == favorites ? _self._favorites : favorites // ignore: cast_nullable_to_non_nullable
as Map<int, bool>,favoriteUnits: null == favoriteUnits ? _self._favoriteUnits : favoriteUnits // ignore: cast_nullable_to_non_nullable
as List<FavoriteUnitEntity>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,lastPage: null == lastPage ? _self.lastPage : lastPage // ignore: cast_nullable_to_non_nullable
as int,viewType: null == viewType ? _self.viewType : viewType // ignore: cast_nullable_to_non_nullable
as ViewType,
  ));
}


}

// dart format on
