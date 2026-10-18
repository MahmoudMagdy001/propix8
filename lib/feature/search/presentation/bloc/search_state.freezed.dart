// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SearchState {

 HomeRequestStatus get status; HomeRequestStatus get loadMoreStatus; List<UnitEntity> get results; String get query; int get currentPage; int get lastPage; String? get errorMessage; ViewType get viewType;
/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchStateCopyWith<SearchState> get copyWith => _$SearchStateCopyWithImpl<SearchState>(this as SearchState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as SearchState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchState&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.loadMoreStatus, _this.loadMoreStatus) || other.loadMoreStatus == _this.loadMoreStatus)&&const DeepCollectionEquality().equals(other.results, _this.results)&&(identical(other.query, _this.query) || other.query == _this.query)&&(identical(other.currentPage, _this.currentPage) || other.currentPage == _this.currentPage)&&(identical(other.lastPage, _this.lastPage) || other.lastPage == _this.lastPage)&&(identical(other.errorMessage, _this.errorMessage) || other.errorMessage == _this.errorMessage)&&(identical(other.viewType, _this.viewType) || other.viewType == _this.viewType));
}


@override
int get hashCode {
  final _this = this as SearchState;
  return Object.hash(runtimeType,_this.status,_this.loadMoreStatus,const DeepCollectionEquality().hash(_this.results),_this.query,_this.currentPage,_this.lastPage,_this.errorMessage,_this.viewType);
}

@override
String toString() {
  final _this = this as SearchState;
  return 'SearchState(status: ${_this.status}, loadMoreStatus: ${_this.loadMoreStatus}, results: ${_this.results}, query: ${_this.query}, currentPage: ${_this.currentPage}, lastPage: ${_this.lastPage}, errorMessage: ${_this.errorMessage}, viewType: ${_this.viewType})';
}


}

/// @nodoc
abstract mixin class $SearchStateCopyWith<$Res>  {
  factory $SearchStateCopyWith(SearchState value, $Res Function(SearchState) _then) = _$SearchStateCopyWithImpl;
@useResult
$Res call({
 HomeRequestStatus status, HomeRequestStatus loadMoreStatus, List<UnitEntity> results, String query, int currentPage, int lastPage, String? errorMessage, ViewType viewType
});




}
/// @nodoc
class _$SearchStateCopyWithImpl<$Res>
    implements $SearchStateCopyWith<$Res> {
  _$SearchStateCopyWithImpl(this._self, this._then);

  final SearchState _self;
  final $Res Function(SearchState) _then;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? loadMoreStatus = null,Object? results = null,Object? query = null,Object? currentPage = null,Object? lastPage = null,Object? errorMessage = freezed,Object? viewType = null,}) {
  return _then(SearchState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as HomeRequestStatus,loadMoreStatus: null == loadMoreStatus ? _self.loadMoreStatus : loadMoreStatus // ignore: cast_nullable_to_non_nullable
as HomeRequestStatus,results: null == results ? _self.results : results // ignore: cast_nullable_to_non_nullable
as List<UnitEntity>,query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,lastPage: null == lastPage ? _self.lastPage : lastPage // ignore: cast_nullable_to_non_nullable
as int,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,viewType: null == viewType ? _self.viewType : viewType // ignore: cast_nullable_to_non_nullable
as ViewType,
  ));
}

}


/// Adds pattern-matching-related methods to [SearchState].
extension SearchStatePatterns on SearchState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchState value)  $default,){
final _that = this;
switch (_that) {
case _SearchState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchState value)?  $default,){
final _that = this;
switch (_that) {
case _SearchState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( HomeRequestStatus status,  HomeRequestStatus loadMoreStatus,  List<UnitEntity> results,  String query,  int currentPage,  int lastPage,  String? errorMessage,  ViewType viewType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchState() when $default != null:
return $default(_that.status,_that.loadMoreStatus,_that.results,_that.query,_that.currentPage,_that.lastPage,_that.errorMessage,_that.viewType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( HomeRequestStatus status,  HomeRequestStatus loadMoreStatus,  List<UnitEntity> results,  String query,  int currentPage,  int lastPage,  String? errorMessage,  ViewType viewType)  $default,) {final _that = this;
switch (_that) {
case _SearchState():
return $default(_that.status,_that.loadMoreStatus,_that.results,_that.query,_that.currentPage,_that.lastPage,_that.errorMessage,_that.viewType);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( HomeRequestStatus status,  HomeRequestStatus loadMoreStatus,  List<UnitEntity> results,  String query,  int currentPage,  int lastPage,  String? errorMessage,  ViewType viewType)?  $default,) {final _that = this;
switch (_that) {
case _SearchState() when $default != null:
return $default(_that.status,_that.loadMoreStatus,_that.results,_that.query,_that.currentPage,_that.lastPage,_that.errorMessage,_that.viewType);case _:
  return null;

}
}

}

/// @nodoc


class _SearchState extends SearchState {
  const _SearchState({this.status = HomeRequestStatus.initial, this.loadMoreStatus = HomeRequestStatus.initial,  List<UnitEntity> results = const <UnitEntity>[], this.query = '', this.currentPage = 1, this.lastPage = 1, this.errorMessage, this.viewType = ViewType.grid}): _results = results,super._();
  

@override@JsonKey() final  HomeRequestStatus status;
@override@JsonKey() final  HomeRequestStatus loadMoreStatus;
 final  List<UnitEntity> _results;
@override@JsonKey() List<UnitEntity> get results {
  if (_results is EqualUnmodifiableListView) return _results;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_results);
}

@override@JsonKey() final  String query;
@override@JsonKey() final  int currentPage;
@override@JsonKey() final  int lastPage;
@override final  String? errorMessage;
@override@JsonKey() final  ViewType viewType;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchStateCopyWith<_SearchState> get copyWith => __$SearchStateCopyWithImpl<_SearchState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchState&&(identical(other.status, status) || other.status == status)&&(identical(other.loadMoreStatus, loadMoreStatus) || other.loadMoreStatus == loadMoreStatus)&&const DeepCollectionEquality().equals(other.results, _results)&&(identical(other.query, query) || other.query == query)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.lastPage, lastPage) || other.lastPage == lastPage)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.viewType, viewType) || other.viewType == viewType));
}


@override
int get hashCode {
    return Object.hash(runtimeType,status,loadMoreStatus,const DeepCollectionEquality().hash(_results),query,currentPage,lastPage,errorMessage,viewType);
}

@override
String toString() {
    return 'SearchState(status: $status, loadMoreStatus: $loadMoreStatus, results: $results, query: $query, currentPage: $currentPage, lastPage: $lastPage, errorMessage: $errorMessage, viewType: $viewType)';
}


}

/// @nodoc
abstract mixin class _$SearchStateCopyWith<$Res> implements $SearchStateCopyWith<$Res> {
  factory _$SearchStateCopyWith(_SearchState value, $Res Function(_SearchState) _then) = __$SearchStateCopyWithImpl;
@override @useResult
$Res call({
 HomeRequestStatus status, HomeRequestStatus loadMoreStatus, List<UnitEntity> results, String query, int currentPage, int lastPage, String? errorMessage, ViewType viewType
});




}
/// @nodoc
class __$SearchStateCopyWithImpl<$Res>
    implements _$SearchStateCopyWith<$Res> {
  __$SearchStateCopyWithImpl(this._self, this._then);

  final _SearchState _self;
  final $Res Function(_SearchState) _then;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? loadMoreStatus = null,Object? results = null,Object? query = null,Object? currentPage = null,Object? lastPage = null,Object? errorMessage = freezed,Object? viewType = null,}) {
  return _then(_SearchState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as HomeRequestStatus,loadMoreStatus: null == loadMoreStatus ? _self.loadMoreStatus : loadMoreStatus // ignore: cast_nullable_to_non_nullable
as HomeRequestStatus,results: null == results ? _self._results : results // ignore: cast_nullable_to_non_nullable
as List<UnitEntity>,query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,lastPage: null == lastPage ? _self.lastPage : lastPage // ignore: cast_nullable_to_non_nullable
as int,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,viewType: null == viewType ? _self.viewType : viewType // ignore: cast_nullable_to_non_nullable
as ViewType,
  ));
}


}

// dart format on
