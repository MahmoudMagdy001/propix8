// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorite_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FavoriteEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FavoriteEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FavoriteEvent()';
}


}

/// @nodoc
class $FavoriteEventCopyWith<$Res>  {
$FavoriteEventCopyWith(FavoriteEvent _, $Res Function(FavoriteEvent) __);
}


/// Adds pattern-matching-related methods to [FavoriteEvent].
extension FavoriteEventPatterns on FavoriteEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( GetFavoritesRequested value)?  getFavoritesRequested,TResult Function( FavoriteToggled value)?  favoriteToggled,TResult Function( FavoriteStatusUpdated value)?  favoriteStatusUpdated,TResult Function( FavoritesInitialized value)?  favoritesInitialized,TResult Function( FavoriteViewTypeToggled value)?  favoriteViewTypeToggled,required TResult orElse(),}){
final _that = this;
switch (_that) {
case GetFavoritesRequested() when getFavoritesRequested != null:
return getFavoritesRequested(_that);case FavoriteToggled() when favoriteToggled != null:
return favoriteToggled(_that);case FavoriteStatusUpdated() when favoriteStatusUpdated != null:
return favoriteStatusUpdated(_that);case FavoritesInitialized() when favoritesInitialized != null:
return favoritesInitialized(_that);case FavoriteViewTypeToggled() when favoriteViewTypeToggled != null:
return favoriteViewTypeToggled(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( GetFavoritesRequested value)  getFavoritesRequested,required TResult Function( FavoriteToggled value)  favoriteToggled,required TResult Function( FavoriteStatusUpdated value)  favoriteStatusUpdated,required TResult Function( FavoritesInitialized value)  favoritesInitialized,required TResult Function( FavoriteViewTypeToggled value)  favoriteViewTypeToggled,}){
final _that = this;
switch (_that) {
case GetFavoritesRequested():
return getFavoritesRequested(_that);case FavoriteToggled():
return favoriteToggled(_that);case FavoriteStatusUpdated():
return favoriteStatusUpdated(_that);case FavoritesInitialized():
return favoritesInitialized(_that);case FavoriteViewTypeToggled():
return favoriteViewTypeToggled(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( GetFavoritesRequested value)?  getFavoritesRequested,TResult? Function( FavoriteToggled value)?  favoriteToggled,TResult? Function( FavoriteStatusUpdated value)?  favoriteStatusUpdated,TResult? Function( FavoritesInitialized value)?  favoritesInitialized,TResult? Function( FavoriteViewTypeToggled value)?  favoriteViewTypeToggled,}){
final _that = this;
switch (_that) {
case GetFavoritesRequested() when getFavoritesRequested != null:
return getFavoritesRequested(_that);case FavoriteToggled() when favoriteToggled != null:
return favoriteToggled(_that);case FavoriteStatusUpdated() when favoriteStatusUpdated != null:
return favoriteStatusUpdated(_that);case FavoritesInitialized() when favoritesInitialized != null:
return favoritesInitialized(_that);case FavoriteViewTypeToggled() when favoriteViewTypeToggled != null:
return favoriteViewTypeToggled(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( bool isLoadMore,  bool forceRefresh)?  getFavoritesRequested,TResult Function( UnitEntity unit)?  favoriteToggled,TResult Function( int unitId,  bool isFavorite)?  favoriteStatusUpdated,TResult Function( Map<int, bool> initialFavorites)?  favoritesInitialized,TResult Function()?  favoriteViewTypeToggled,required TResult orElse(),}) {final _that = this;
switch (_that) {
case GetFavoritesRequested() when getFavoritesRequested != null:
return getFavoritesRequested(_that.isLoadMore,_that.forceRefresh);case FavoriteToggled() when favoriteToggled != null:
return favoriteToggled(_that.unit);case FavoriteStatusUpdated() when favoriteStatusUpdated != null:
return favoriteStatusUpdated(_that.unitId,_that.isFavorite);case FavoritesInitialized() when favoritesInitialized != null:
return favoritesInitialized(_that.initialFavorites);case FavoriteViewTypeToggled() when favoriteViewTypeToggled != null:
return favoriteViewTypeToggled();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( bool isLoadMore,  bool forceRefresh)  getFavoritesRequested,required TResult Function( UnitEntity unit)  favoriteToggled,required TResult Function( int unitId,  bool isFavorite)  favoriteStatusUpdated,required TResult Function( Map<int, bool> initialFavorites)  favoritesInitialized,required TResult Function()  favoriteViewTypeToggled,}) {final _that = this;
switch (_that) {
case GetFavoritesRequested():
return getFavoritesRequested(_that.isLoadMore,_that.forceRefresh);case FavoriteToggled():
return favoriteToggled(_that.unit);case FavoriteStatusUpdated():
return favoriteStatusUpdated(_that.unitId,_that.isFavorite);case FavoritesInitialized():
return favoritesInitialized(_that.initialFavorites);case FavoriteViewTypeToggled():
return favoriteViewTypeToggled();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( bool isLoadMore,  bool forceRefresh)?  getFavoritesRequested,TResult? Function( UnitEntity unit)?  favoriteToggled,TResult? Function( int unitId,  bool isFavorite)?  favoriteStatusUpdated,TResult? Function( Map<int, bool> initialFavorites)?  favoritesInitialized,TResult? Function()?  favoriteViewTypeToggled,}) {final _that = this;
switch (_that) {
case GetFavoritesRequested() when getFavoritesRequested != null:
return getFavoritesRequested(_that.isLoadMore,_that.forceRefresh);case FavoriteToggled() when favoriteToggled != null:
return favoriteToggled(_that.unit);case FavoriteStatusUpdated() when favoriteStatusUpdated != null:
return favoriteStatusUpdated(_that.unitId,_that.isFavorite);case FavoritesInitialized() when favoritesInitialized != null:
return favoritesInitialized(_that.initialFavorites);case FavoriteViewTypeToggled() when favoriteViewTypeToggled != null:
return favoriteViewTypeToggled();case _:
  return null;

}
}

}

/// @nodoc


class GetFavoritesRequested implements FavoriteEvent {
  const GetFavoritesRequested({this.isLoadMore = false, this.forceRefresh = false});
  

@JsonKey() final  bool isLoadMore;
@JsonKey() final  bool forceRefresh;

/// Create a copy of FavoriteEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetFavoritesRequestedCopyWith<GetFavoritesRequested> get copyWith => _$GetFavoritesRequestedCopyWithImpl<GetFavoritesRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetFavoritesRequested&&(identical(other.isLoadMore, isLoadMore) || other.isLoadMore == isLoadMore)&&(identical(other.forceRefresh, forceRefresh) || other.forceRefresh == forceRefresh));
}


@override
int get hashCode => Object.hash(runtimeType,isLoadMore,forceRefresh);

@override
String toString() {
  return 'FavoriteEvent.getFavoritesRequested(isLoadMore: $isLoadMore, forceRefresh: $forceRefresh)';
}


}

/// @nodoc
abstract mixin class $GetFavoritesRequestedCopyWith<$Res> implements $FavoriteEventCopyWith<$Res> {
  factory $GetFavoritesRequestedCopyWith(GetFavoritesRequested value, $Res Function(GetFavoritesRequested) _then) = _$GetFavoritesRequestedCopyWithImpl;
@useResult
$Res call({
 bool isLoadMore, bool forceRefresh
});




}
/// @nodoc
class _$GetFavoritesRequestedCopyWithImpl<$Res>
    implements $GetFavoritesRequestedCopyWith<$Res> {
  _$GetFavoritesRequestedCopyWithImpl(this._self, this._then);

  final GetFavoritesRequested _self;
  final $Res Function(GetFavoritesRequested) _then;

/// Create a copy of FavoriteEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? isLoadMore = null,Object? forceRefresh = null,}) {
  return _then(GetFavoritesRequested(
isLoadMore: null == isLoadMore ? _self.isLoadMore : isLoadMore // ignore: cast_nullable_to_non_nullable
as bool,forceRefresh: null == forceRefresh ? _self.forceRefresh : forceRefresh // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class FavoriteToggled implements FavoriteEvent {
  const FavoriteToggled(this.unit);
  

 final  UnitEntity unit;

/// Create a copy of FavoriteEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FavoriteToggledCopyWith<FavoriteToggled> get copyWith => _$FavoriteToggledCopyWithImpl<FavoriteToggled>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FavoriteToggled&&(identical(other.unit, unit) || other.unit == unit));
}


@override
int get hashCode => Object.hash(runtimeType,unit);

@override
String toString() {
  return 'FavoriteEvent.favoriteToggled(unit: $unit)';
}


}

/// @nodoc
abstract mixin class $FavoriteToggledCopyWith<$Res> implements $FavoriteEventCopyWith<$Res> {
  factory $FavoriteToggledCopyWith(FavoriteToggled value, $Res Function(FavoriteToggled) _then) = _$FavoriteToggledCopyWithImpl;
@useResult
$Res call({
 UnitEntity unit
});




}
/// @nodoc
class _$FavoriteToggledCopyWithImpl<$Res>
    implements $FavoriteToggledCopyWith<$Res> {
  _$FavoriteToggledCopyWithImpl(this._self, this._then);

  final FavoriteToggled _self;
  final $Res Function(FavoriteToggled) _then;

/// Create a copy of FavoriteEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? unit = null,}) {
  return _then(FavoriteToggled(
null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as UnitEntity,
  ));
}


}

/// @nodoc


class FavoriteStatusUpdated implements FavoriteEvent {
  const FavoriteStatusUpdated({required this.unitId, required this.isFavorite});
  

 final  int unitId;
 final  bool isFavorite;

/// Create a copy of FavoriteEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FavoriteStatusUpdatedCopyWith<FavoriteStatusUpdated> get copyWith => _$FavoriteStatusUpdatedCopyWithImpl<FavoriteStatusUpdated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FavoriteStatusUpdated&&(identical(other.unitId, unitId) || other.unitId == unitId)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite));
}


@override
int get hashCode => Object.hash(runtimeType,unitId,isFavorite);

@override
String toString() {
  return 'FavoriteEvent.favoriteStatusUpdated(unitId: $unitId, isFavorite: $isFavorite)';
}


}

/// @nodoc
abstract mixin class $FavoriteStatusUpdatedCopyWith<$Res> implements $FavoriteEventCopyWith<$Res> {
  factory $FavoriteStatusUpdatedCopyWith(FavoriteStatusUpdated value, $Res Function(FavoriteStatusUpdated) _then) = _$FavoriteStatusUpdatedCopyWithImpl;
@useResult
$Res call({
 int unitId, bool isFavorite
});




}
/// @nodoc
class _$FavoriteStatusUpdatedCopyWithImpl<$Res>
    implements $FavoriteStatusUpdatedCopyWith<$Res> {
  _$FavoriteStatusUpdatedCopyWithImpl(this._self, this._then);

  final FavoriteStatusUpdated _self;
  final $Res Function(FavoriteStatusUpdated) _then;

/// Create a copy of FavoriteEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? unitId = null,Object? isFavorite = null,}) {
  return _then(FavoriteStatusUpdated(
unitId: null == unitId ? _self.unitId : unitId // ignore: cast_nullable_to_non_nullable
as int,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class FavoritesInitialized implements FavoriteEvent {
  const FavoritesInitialized(final  Map<int, bool> initialFavorites): _initialFavorites = initialFavorites;
  

 final  Map<int, bool> _initialFavorites;
 Map<int, bool> get initialFavorites {
  if (_initialFavorites is EqualUnmodifiableMapView) return _initialFavorites;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_initialFavorites);
}


/// Create a copy of FavoriteEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FavoritesInitializedCopyWith<FavoritesInitialized> get copyWith => _$FavoritesInitializedCopyWithImpl<FavoritesInitialized>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FavoritesInitialized&&const DeepCollectionEquality().equals(other._initialFavorites, _initialFavorites));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_initialFavorites));

@override
String toString() {
  return 'FavoriteEvent.favoritesInitialized(initialFavorites: $initialFavorites)';
}


}

/// @nodoc
abstract mixin class $FavoritesInitializedCopyWith<$Res> implements $FavoriteEventCopyWith<$Res> {
  factory $FavoritesInitializedCopyWith(FavoritesInitialized value, $Res Function(FavoritesInitialized) _then) = _$FavoritesInitializedCopyWithImpl;
@useResult
$Res call({
 Map<int, bool> initialFavorites
});




}
/// @nodoc
class _$FavoritesInitializedCopyWithImpl<$Res>
    implements $FavoritesInitializedCopyWith<$Res> {
  _$FavoritesInitializedCopyWithImpl(this._self, this._then);

  final FavoritesInitialized _self;
  final $Res Function(FavoritesInitialized) _then;

/// Create a copy of FavoriteEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? initialFavorites = null,}) {
  return _then(FavoritesInitialized(
null == initialFavorites ? _self._initialFavorites : initialFavorites // ignore: cast_nullable_to_non_nullable
as Map<int, bool>,
  ));
}


}

/// @nodoc


class FavoriteViewTypeToggled implements FavoriteEvent {
  const FavoriteViewTypeToggled();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FavoriteViewTypeToggled);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FavoriteEvent.favoriteViewTypeToggled()';
}


}




// dart format on
