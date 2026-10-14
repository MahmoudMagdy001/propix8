// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pages_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PagesState {

 PagesStatus get status; List<PageEntity> get pages; List<StatEntity> get stats; String? get errorMessage;
/// Create a copy of PagesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PagesStateCopyWith<PagesState> get copyWith => _$PagesStateCopyWithImpl<PagesState>(this as PagesState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PagesState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.pages, pages)&&const DeepCollectionEquality().equals(other.stats, stats)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(pages),const DeepCollectionEquality().hash(stats),errorMessage);

@override
String toString() {
  return 'PagesState(status: $status, pages: $pages, stats: $stats, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $PagesStateCopyWith<$Res>  {
  factory $PagesStateCopyWith(PagesState value, $Res Function(PagesState) _then) = _$PagesStateCopyWithImpl;
@useResult
$Res call({
 PagesStatus status, List<PageEntity> pages, List<StatEntity> stats, String? errorMessage
});




}
/// @nodoc
class _$PagesStateCopyWithImpl<$Res>
    implements $PagesStateCopyWith<$Res> {
  _$PagesStateCopyWithImpl(this._self, this._then);

  final PagesState _self;
  final $Res Function(PagesState) _then;

/// Create a copy of PagesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? pages = null,Object? stats = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PagesStatus,pages: null == pages ? _self.pages : pages // ignore: cast_nullable_to_non_nullable
as List<PageEntity>,stats: null == stats ? _self.stats : stats // ignore: cast_nullable_to_non_nullable
as List<StatEntity>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PagesState].
extension PagesStatePatterns on PagesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PagesState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PagesState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PagesState value)  $default,){
final _that = this;
switch (_that) {
case _PagesState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PagesState value)?  $default,){
final _that = this;
switch (_that) {
case _PagesState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PagesStatus status,  List<PageEntity> pages,  List<StatEntity> stats,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PagesState() when $default != null:
return $default(_that.status,_that.pages,_that.stats,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PagesStatus status,  List<PageEntity> pages,  List<StatEntity> stats,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _PagesState():
return $default(_that.status,_that.pages,_that.stats,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PagesStatus status,  List<PageEntity> pages,  List<StatEntity> stats,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _PagesState() when $default != null:
return $default(_that.status,_that.pages,_that.stats,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _PagesState extends PagesState {
  const _PagesState({this.status = PagesStatus.initial, final  List<PageEntity> pages = const [], final  List<StatEntity> stats = const [], this.errorMessage}): _pages = pages,_stats = stats,super._();
  

@override@JsonKey() final  PagesStatus status;
 final  List<PageEntity> _pages;
@override@JsonKey() List<PageEntity> get pages {
  if (_pages is EqualUnmodifiableListView) return _pages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_pages);
}

 final  List<StatEntity> _stats;
@override@JsonKey() List<StatEntity> get stats {
  if (_stats is EqualUnmodifiableListView) return _stats;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_stats);
}

@override final  String? errorMessage;

/// Create a copy of PagesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PagesStateCopyWith<_PagesState> get copyWith => __$PagesStateCopyWithImpl<_PagesState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PagesState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._pages, _pages)&&const DeepCollectionEquality().equals(other._stats, _stats)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_pages),const DeepCollectionEquality().hash(_stats),errorMessage);

@override
String toString() {
  return 'PagesState(status: $status, pages: $pages, stats: $stats, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$PagesStateCopyWith<$Res> implements $PagesStateCopyWith<$Res> {
  factory _$PagesStateCopyWith(_PagesState value, $Res Function(_PagesState) _then) = __$PagesStateCopyWithImpl;
@override @useResult
$Res call({
 PagesStatus status, List<PageEntity> pages, List<StatEntity> stats, String? errorMessage
});




}
/// @nodoc
class __$PagesStateCopyWithImpl<$Res>
    implements _$PagesStateCopyWith<$Res> {
  __$PagesStateCopyWithImpl(this._self, this._then);

  final _PagesState _self;
  final $Res Function(_PagesState) _then;

/// Create a copy of PagesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? pages = null,Object? stats = null,Object? errorMessage = freezed,}) {
  return _then(_PagesState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PagesStatus,pages: null == pages ? _self._pages : pages // ignore: cast_nullable_to_non_nullable
as List<PageEntity>,stats: null == stats ? _self._stats : stats // ignore: cast_nullable_to_non_nullable
as List<StatEntity>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
