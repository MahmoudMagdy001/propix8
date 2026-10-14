// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'onboarding_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OnboardingEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnboardingEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OnboardingEvent()';
}


}

/// @nodoc
class $OnboardingEventCopyWith<$Res>  {
$OnboardingEventCopyWith(OnboardingEvent _, $Res Function(OnboardingEvent) __);
}


/// Adds pattern-matching-related methods to [OnboardingEvent].
extension OnboardingEventPatterns on OnboardingEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( OnboardingPagesLoaded value)?  pagesLoaded,TResult Function( OnboardingPageIndexChanged value)?  pageIndexChanged,TResult Function( OnboardingCompleted value)?  onboardingCompleted,required TResult orElse(),}){
final _that = this;
switch (_that) {
case OnboardingPagesLoaded() when pagesLoaded != null:
return pagesLoaded(_that);case OnboardingPageIndexChanged() when pageIndexChanged != null:
return pageIndexChanged(_that);case OnboardingCompleted() when onboardingCompleted != null:
return onboardingCompleted(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( OnboardingPagesLoaded value)  pagesLoaded,required TResult Function( OnboardingPageIndexChanged value)  pageIndexChanged,required TResult Function( OnboardingCompleted value)  onboardingCompleted,}){
final _that = this;
switch (_that) {
case OnboardingPagesLoaded():
return pagesLoaded(_that);case OnboardingPageIndexChanged():
return pageIndexChanged(_that);case OnboardingCompleted():
return onboardingCompleted(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( OnboardingPagesLoaded value)?  pagesLoaded,TResult? Function( OnboardingPageIndexChanged value)?  pageIndexChanged,TResult? Function( OnboardingCompleted value)?  onboardingCompleted,}){
final _that = this;
switch (_that) {
case OnboardingPagesLoaded() when pagesLoaded != null:
return pagesLoaded(_that);case OnboardingPageIndexChanged() when pageIndexChanged != null:
return pageIndexChanged(_that);case OnboardingCompleted() when onboardingCompleted != null:
return onboardingCompleted(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( AppLocalizations l10n,  List<String>? images)?  pagesLoaded,TResult Function( int index)?  pageIndexChanged,TResult Function()?  onboardingCompleted,required TResult orElse(),}) {final _that = this;
switch (_that) {
case OnboardingPagesLoaded() when pagesLoaded != null:
return pagesLoaded(_that.l10n,_that.images);case OnboardingPageIndexChanged() when pageIndexChanged != null:
return pageIndexChanged(_that.index);case OnboardingCompleted() when onboardingCompleted != null:
return onboardingCompleted();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( AppLocalizations l10n,  List<String>? images)  pagesLoaded,required TResult Function( int index)  pageIndexChanged,required TResult Function()  onboardingCompleted,}) {final _that = this;
switch (_that) {
case OnboardingPagesLoaded():
return pagesLoaded(_that.l10n,_that.images);case OnboardingPageIndexChanged():
return pageIndexChanged(_that.index);case OnboardingCompleted():
return onboardingCompleted();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( AppLocalizations l10n,  List<String>? images)?  pagesLoaded,TResult? Function( int index)?  pageIndexChanged,TResult? Function()?  onboardingCompleted,}) {final _that = this;
switch (_that) {
case OnboardingPagesLoaded() when pagesLoaded != null:
return pagesLoaded(_that.l10n,_that.images);case OnboardingPageIndexChanged() when pageIndexChanged != null:
return pageIndexChanged(_that.index);case OnboardingCompleted() when onboardingCompleted != null:
return onboardingCompleted();case _:
  return null;

}
}

}

/// @nodoc


class OnboardingPagesLoaded implements OnboardingEvent {
  const OnboardingPagesLoaded({required this.l10n, final  List<String>? images}): _images = images;
  

 final  AppLocalizations l10n;
 final  List<String>? _images;
 List<String>? get images {
  final value = _images;
  if (value == null) return null;
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of OnboardingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnboardingPagesLoadedCopyWith<OnboardingPagesLoaded> get copyWith => _$OnboardingPagesLoadedCopyWithImpl<OnboardingPagesLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnboardingPagesLoaded&&(identical(other.l10n, l10n) || other.l10n == l10n)&&const DeepCollectionEquality().equals(other._images, _images));
}


@override
int get hashCode => Object.hash(runtimeType,l10n,const DeepCollectionEquality().hash(_images));

@override
String toString() {
  return 'OnboardingEvent.pagesLoaded(l10n: $l10n, images: $images)';
}


}

/// @nodoc
abstract mixin class $OnboardingPagesLoadedCopyWith<$Res> implements $OnboardingEventCopyWith<$Res> {
  factory $OnboardingPagesLoadedCopyWith(OnboardingPagesLoaded value, $Res Function(OnboardingPagesLoaded) _then) = _$OnboardingPagesLoadedCopyWithImpl;
@useResult
$Res call({
 AppLocalizations l10n, List<String>? images
});




}
/// @nodoc
class _$OnboardingPagesLoadedCopyWithImpl<$Res>
    implements $OnboardingPagesLoadedCopyWith<$Res> {
  _$OnboardingPagesLoadedCopyWithImpl(this._self, this._then);

  final OnboardingPagesLoaded _self;
  final $Res Function(OnboardingPagesLoaded) _then;

/// Create a copy of OnboardingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? l10n = null,Object? images = freezed,}) {
  return _then(OnboardingPagesLoaded(
l10n: null == l10n ? _self.l10n : l10n // ignore: cast_nullable_to_non_nullable
as AppLocalizations,images: freezed == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}


}

/// @nodoc


class OnboardingPageIndexChanged implements OnboardingEvent {
  const OnboardingPageIndexChanged(this.index);
  

 final  int index;

/// Create a copy of OnboardingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnboardingPageIndexChangedCopyWith<OnboardingPageIndexChanged> get copyWith => _$OnboardingPageIndexChangedCopyWithImpl<OnboardingPageIndexChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnboardingPageIndexChanged&&(identical(other.index, index) || other.index == index));
}


@override
int get hashCode => Object.hash(runtimeType,index);

@override
String toString() {
  return 'OnboardingEvent.pageIndexChanged(index: $index)';
}


}

/// @nodoc
abstract mixin class $OnboardingPageIndexChangedCopyWith<$Res> implements $OnboardingEventCopyWith<$Res> {
  factory $OnboardingPageIndexChangedCopyWith(OnboardingPageIndexChanged value, $Res Function(OnboardingPageIndexChanged) _then) = _$OnboardingPageIndexChangedCopyWithImpl;
@useResult
$Res call({
 int index
});




}
/// @nodoc
class _$OnboardingPageIndexChangedCopyWithImpl<$Res>
    implements $OnboardingPageIndexChangedCopyWith<$Res> {
  _$OnboardingPageIndexChangedCopyWithImpl(this._self, this._then);

  final OnboardingPageIndexChanged _self;
  final $Res Function(OnboardingPageIndexChanged) _then;

/// Create a copy of OnboardingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? index = null,}) {
  return _then(OnboardingPageIndexChanged(
null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class OnboardingCompleted implements OnboardingEvent {
  const OnboardingCompleted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnboardingCompleted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OnboardingEvent.onboardingCompleted()';
}


}




// dart format on
