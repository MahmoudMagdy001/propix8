// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SearchEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SearchEvent()';
}


}

/// @nodoc
class $SearchEventCopyWith<$Res>  {
$SearchEventCopyWith(SearchEvent _, $Res Function(SearchEvent) __);
}


/// Adds pattern-matching-related methods to [SearchEvent].
extension SearchEventPatterns on SearchEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SearchQueryChanged value)?  queryChanged,TResult Function( SearchLoadMoreRequested value)?  loadMoreRequested,TResult Function( SearchViewTypeToggled value)?  viewTypeToggled,TResult Function( SearchCleared value)?  searchCleared,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SearchQueryChanged() when queryChanged != null:
return queryChanged(_that);case SearchLoadMoreRequested() when loadMoreRequested != null:
return loadMoreRequested(_that);case SearchViewTypeToggled() when viewTypeToggled != null:
return viewTypeToggled(_that);case SearchCleared() when searchCleared != null:
return searchCleared(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SearchQueryChanged value)  queryChanged,required TResult Function( SearchLoadMoreRequested value)  loadMoreRequested,required TResult Function( SearchViewTypeToggled value)  viewTypeToggled,required TResult Function( SearchCleared value)  searchCleared,}){
final _that = this;
switch (_that) {
case SearchQueryChanged():
return queryChanged(_that);case SearchLoadMoreRequested():
return loadMoreRequested(_that);case SearchViewTypeToggled():
return viewTypeToggled(_that);case SearchCleared():
return searchCleared(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SearchQueryChanged value)?  queryChanged,TResult? Function( SearchLoadMoreRequested value)?  loadMoreRequested,TResult? Function( SearchViewTypeToggled value)?  viewTypeToggled,TResult? Function( SearchCleared value)?  searchCleared,}){
final _that = this;
switch (_that) {
case SearchQueryChanged() when queryChanged != null:
return queryChanged(_that);case SearchLoadMoreRequested() when loadMoreRequested != null:
return loadMoreRequested(_that);case SearchViewTypeToggled() when viewTypeToggled != null:
return viewTypeToggled(_that);case SearchCleared() when searchCleared != null:
return searchCleared(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String query)?  queryChanged,TResult Function()?  loadMoreRequested,TResult Function()?  viewTypeToggled,TResult Function()?  searchCleared,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SearchQueryChanged() when queryChanged != null:
return queryChanged(_that.query);case SearchLoadMoreRequested() when loadMoreRequested != null:
return loadMoreRequested();case SearchViewTypeToggled() when viewTypeToggled != null:
return viewTypeToggled();case SearchCleared() when searchCleared != null:
return searchCleared();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String query)  queryChanged,required TResult Function()  loadMoreRequested,required TResult Function()  viewTypeToggled,required TResult Function()  searchCleared,}) {final _that = this;
switch (_that) {
case SearchQueryChanged():
return queryChanged(_that.query);case SearchLoadMoreRequested():
return loadMoreRequested();case SearchViewTypeToggled():
return viewTypeToggled();case SearchCleared():
return searchCleared();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String query)?  queryChanged,TResult? Function()?  loadMoreRequested,TResult? Function()?  viewTypeToggled,TResult? Function()?  searchCleared,}) {final _that = this;
switch (_that) {
case SearchQueryChanged() when queryChanged != null:
return queryChanged(_that.query);case SearchLoadMoreRequested() when loadMoreRequested != null:
return loadMoreRequested();case SearchViewTypeToggled() when viewTypeToggled != null:
return viewTypeToggled();case SearchCleared() when searchCleared != null:
return searchCleared();case _:
  return null;

}
}

}

/// @nodoc


class SearchQueryChanged implements SearchEvent {
  const SearchQueryChanged(this.query);
  

 final  String query;

/// Create a copy of SearchEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchQueryChangedCopyWith<SearchQueryChanged> get copyWith => _$SearchQueryChangedCopyWithImpl<SearchQueryChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchQueryChanged&&(identical(other.query, query) || other.query == query));
}


@override
int get hashCode => Object.hash(runtimeType,query);

@override
String toString() {
  return 'SearchEvent.queryChanged(query: $query)';
}


}

/// @nodoc
abstract mixin class $SearchQueryChangedCopyWith<$Res> implements $SearchEventCopyWith<$Res> {
  factory $SearchQueryChangedCopyWith(SearchQueryChanged value, $Res Function(SearchQueryChanged) _then) = _$SearchQueryChangedCopyWithImpl;
@useResult
$Res call({
 String query
});




}
/// @nodoc
class _$SearchQueryChangedCopyWithImpl<$Res>
    implements $SearchQueryChangedCopyWith<$Res> {
  _$SearchQueryChangedCopyWithImpl(this._self, this._then);

  final SearchQueryChanged _self;
  final $Res Function(SearchQueryChanged) _then;

/// Create a copy of SearchEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? query = null,}) {
  return _then(SearchQueryChanged(
null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SearchLoadMoreRequested implements SearchEvent {
  const SearchLoadMoreRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchLoadMoreRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SearchEvent.loadMoreRequested()';
}


}




/// @nodoc


class SearchViewTypeToggled implements SearchEvent {
  const SearchViewTypeToggled();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchViewTypeToggled);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SearchEvent.viewTypeToggled()';
}


}




/// @nodoc


class SearchCleared implements SearchEvent {
  const SearchCleared();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchCleared);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SearchEvent.searchCleared()';
}


}




// dart format on
