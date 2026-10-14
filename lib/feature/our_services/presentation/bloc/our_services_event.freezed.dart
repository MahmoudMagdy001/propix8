// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'our_services_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OurServicesEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OurServicesEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OurServicesEvent()';
}


}

/// @nodoc
class $OurServicesEventCopyWith<$Res>  {
$OurServicesEventCopyWith(OurServicesEvent _, $Res Function(OurServicesEvent) __);
}


/// Adds pattern-matching-related methods to [OurServicesEvent].
extension OurServicesEventPatterns on OurServicesEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( OurServicesDataRequested value)?  dataRequested,TResult Function( OurServicesMoreTestimonialsRequested value)?  moreTestimonialsRequested,TResult Function( OurServicesTestimonialAdded value)?  testimonialAdded,TResult Function( OurServicesTestimonialUpdated value)?  testimonialUpdated,TResult Function( OurServicesTestimonialDeleted value)?  testimonialDeleted,TResult Function( OurServicesRefreshed value)?  refreshed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case OurServicesDataRequested() when dataRequested != null:
return dataRequested(_that);case OurServicesMoreTestimonialsRequested() when moreTestimonialsRequested != null:
return moreTestimonialsRequested(_that);case OurServicesTestimonialAdded() when testimonialAdded != null:
return testimonialAdded(_that);case OurServicesTestimonialUpdated() when testimonialUpdated != null:
return testimonialUpdated(_that);case OurServicesTestimonialDeleted() when testimonialDeleted != null:
return testimonialDeleted(_that);case OurServicesRefreshed() when refreshed != null:
return refreshed(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( OurServicesDataRequested value)  dataRequested,required TResult Function( OurServicesMoreTestimonialsRequested value)  moreTestimonialsRequested,required TResult Function( OurServicesTestimonialAdded value)  testimonialAdded,required TResult Function( OurServicesTestimonialUpdated value)  testimonialUpdated,required TResult Function( OurServicesTestimonialDeleted value)  testimonialDeleted,required TResult Function( OurServicesRefreshed value)  refreshed,}){
final _that = this;
switch (_that) {
case OurServicesDataRequested():
return dataRequested(_that);case OurServicesMoreTestimonialsRequested():
return moreTestimonialsRequested(_that);case OurServicesTestimonialAdded():
return testimonialAdded(_that);case OurServicesTestimonialUpdated():
return testimonialUpdated(_that);case OurServicesTestimonialDeleted():
return testimonialDeleted(_that);case OurServicesRefreshed():
return refreshed(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( OurServicesDataRequested value)?  dataRequested,TResult? Function( OurServicesMoreTestimonialsRequested value)?  moreTestimonialsRequested,TResult? Function( OurServicesTestimonialAdded value)?  testimonialAdded,TResult? Function( OurServicesTestimonialUpdated value)?  testimonialUpdated,TResult? Function( OurServicesTestimonialDeleted value)?  testimonialDeleted,TResult? Function( OurServicesRefreshed value)?  refreshed,}){
final _that = this;
switch (_that) {
case OurServicesDataRequested() when dataRequested != null:
return dataRequested(_that);case OurServicesMoreTestimonialsRequested() when moreTestimonialsRequested != null:
return moreTestimonialsRequested(_that);case OurServicesTestimonialAdded() when testimonialAdded != null:
return testimonialAdded(_that);case OurServicesTestimonialUpdated() when testimonialUpdated != null:
return testimonialUpdated(_that);case OurServicesTestimonialDeleted() when testimonialDeleted != null:
return testimonialDeleted(_that);case OurServicesRefreshed() when refreshed != null:
return refreshed(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( bool isRefreshing,  bool loadServices,  bool loadFaqs,  bool loadTestimonials)?  dataRequested,TResult Function()?  moreTestimonialsRequested,TResult Function( String content)?  testimonialAdded,TResult Function( int id,  String content)?  testimonialUpdated,TResult Function( int id)?  testimonialDeleted,TResult Function()?  refreshed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case OurServicesDataRequested() when dataRequested != null:
return dataRequested(_that.isRefreshing,_that.loadServices,_that.loadFaqs,_that.loadTestimonials);case OurServicesMoreTestimonialsRequested() when moreTestimonialsRequested != null:
return moreTestimonialsRequested();case OurServicesTestimonialAdded() when testimonialAdded != null:
return testimonialAdded(_that.content);case OurServicesTestimonialUpdated() when testimonialUpdated != null:
return testimonialUpdated(_that.id,_that.content);case OurServicesTestimonialDeleted() when testimonialDeleted != null:
return testimonialDeleted(_that.id);case OurServicesRefreshed() when refreshed != null:
return refreshed();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( bool isRefreshing,  bool loadServices,  bool loadFaqs,  bool loadTestimonials)  dataRequested,required TResult Function()  moreTestimonialsRequested,required TResult Function( String content)  testimonialAdded,required TResult Function( int id,  String content)  testimonialUpdated,required TResult Function( int id)  testimonialDeleted,required TResult Function()  refreshed,}) {final _that = this;
switch (_that) {
case OurServicesDataRequested():
return dataRequested(_that.isRefreshing,_that.loadServices,_that.loadFaqs,_that.loadTestimonials);case OurServicesMoreTestimonialsRequested():
return moreTestimonialsRequested();case OurServicesTestimonialAdded():
return testimonialAdded(_that.content);case OurServicesTestimonialUpdated():
return testimonialUpdated(_that.id,_that.content);case OurServicesTestimonialDeleted():
return testimonialDeleted(_that.id);case OurServicesRefreshed():
return refreshed();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( bool isRefreshing,  bool loadServices,  bool loadFaqs,  bool loadTestimonials)?  dataRequested,TResult? Function()?  moreTestimonialsRequested,TResult? Function( String content)?  testimonialAdded,TResult? Function( int id,  String content)?  testimonialUpdated,TResult? Function( int id)?  testimonialDeleted,TResult? Function()?  refreshed,}) {final _that = this;
switch (_that) {
case OurServicesDataRequested() when dataRequested != null:
return dataRequested(_that.isRefreshing,_that.loadServices,_that.loadFaqs,_that.loadTestimonials);case OurServicesMoreTestimonialsRequested() when moreTestimonialsRequested != null:
return moreTestimonialsRequested();case OurServicesTestimonialAdded() when testimonialAdded != null:
return testimonialAdded(_that.content);case OurServicesTestimonialUpdated() when testimonialUpdated != null:
return testimonialUpdated(_that.id,_that.content);case OurServicesTestimonialDeleted() when testimonialDeleted != null:
return testimonialDeleted(_that.id);case OurServicesRefreshed() when refreshed != null:
return refreshed();case _:
  return null;

}
}

}

/// @nodoc


class OurServicesDataRequested implements OurServicesEvent {
  const OurServicesDataRequested({this.isRefreshing = false, this.loadServices = true, this.loadFaqs = true, this.loadTestimonials = true});
  

@JsonKey() final  bool isRefreshing;
@JsonKey() final  bool loadServices;
@JsonKey() final  bool loadFaqs;
@JsonKey() final  bool loadTestimonials;

/// Create a copy of OurServicesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OurServicesDataRequestedCopyWith<OurServicesDataRequested> get copyWith => _$OurServicesDataRequestedCopyWithImpl<OurServicesDataRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OurServicesDataRequested&&(identical(other.isRefreshing, isRefreshing) || other.isRefreshing == isRefreshing)&&(identical(other.loadServices, loadServices) || other.loadServices == loadServices)&&(identical(other.loadFaqs, loadFaqs) || other.loadFaqs == loadFaqs)&&(identical(other.loadTestimonials, loadTestimonials) || other.loadTestimonials == loadTestimonials));
}


@override
int get hashCode => Object.hash(runtimeType,isRefreshing,loadServices,loadFaqs,loadTestimonials);

@override
String toString() {
  return 'OurServicesEvent.dataRequested(isRefreshing: $isRefreshing, loadServices: $loadServices, loadFaqs: $loadFaqs, loadTestimonials: $loadTestimonials)';
}


}

/// @nodoc
abstract mixin class $OurServicesDataRequestedCopyWith<$Res> implements $OurServicesEventCopyWith<$Res> {
  factory $OurServicesDataRequestedCopyWith(OurServicesDataRequested value, $Res Function(OurServicesDataRequested) _then) = _$OurServicesDataRequestedCopyWithImpl;
@useResult
$Res call({
 bool isRefreshing, bool loadServices, bool loadFaqs, bool loadTestimonials
});




}
/// @nodoc
class _$OurServicesDataRequestedCopyWithImpl<$Res>
    implements $OurServicesDataRequestedCopyWith<$Res> {
  _$OurServicesDataRequestedCopyWithImpl(this._self, this._then);

  final OurServicesDataRequested _self;
  final $Res Function(OurServicesDataRequested) _then;

/// Create a copy of OurServicesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? isRefreshing = null,Object? loadServices = null,Object? loadFaqs = null,Object? loadTestimonials = null,}) {
  return _then(OurServicesDataRequested(
isRefreshing: null == isRefreshing ? _self.isRefreshing : isRefreshing // ignore: cast_nullable_to_non_nullable
as bool,loadServices: null == loadServices ? _self.loadServices : loadServices // ignore: cast_nullable_to_non_nullable
as bool,loadFaqs: null == loadFaqs ? _self.loadFaqs : loadFaqs // ignore: cast_nullable_to_non_nullable
as bool,loadTestimonials: null == loadTestimonials ? _self.loadTestimonials : loadTestimonials // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class OurServicesMoreTestimonialsRequested implements OurServicesEvent {
  const OurServicesMoreTestimonialsRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OurServicesMoreTestimonialsRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OurServicesEvent.moreTestimonialsRequested()';
}


}




/// @nodoc


class OurServicesTestimonialAdded implements OurServicesEvent {
  const OurServicesTestimonialAdded(this.content);
  

 final  String content;

/// Create a copy of OurServicesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OurServicesTestimonialAddedCopyWith<OurServicesTestimonialAdded> get copyWith => _$OurServicesTestimonialAddedCopyWithImpl<OurServicesTestimonialAdded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OurServicesTestimonialAdded&&(identical(other.content, content) || other.content == content));
}


@override
int get hashCode => Object.hash(runtimeType,content);

@override
String toString() {
  return 'OurServicesEvent.testimonialAdded(content: $content)';
}


}

/// @nodoc
abstract mixin class $OurServicesTestimonialAddedCopyWith<$Res> implements $OurServicesEventCopyWith<$Res> {
  factory $OurServicesTestimonialAddedCopyWith(OurServicesTestimonialAdded value, $Res Function(OurServicesTestimonialAdded) _then) = _$OurServicesTestimonialAddedCopyWithImpl;
@useResult
$Res call({
 String content
});




}
/// @nodoc
class _$OurServicesTestimonialAddedCopyWithImpl<$Res>
    implements $OurServicesTestimonialAddedCopyWith<$Res> {
  _$OurServicesTestimonialAddedCopyWithImpl(this._self, this._then);

  final OurServicesTestimonialAdded _self;
  final $Res Function(OurServicesTestimonialAdded) _then;

/// Create a copy of OurServicesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? content = null,}) {
  return _then(OurServicesTestimonialAdded(
null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class OurServicesTestimonialUpdated implements OurServicesEvent {
  const OurServicesTestimonialUpdated({required this.id, required this.content});
  

 final  int id;
 final  String content;

/// Create a copy of OurServicesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OurServicesTestimonialUpdatedCopyWith<OurServicesTestimonialUpdated> get copyWith => _$OurServicesTestimonialUpdatedCopyWithImpl<OurServicesTestimonialUpdated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OurServicesTestimonialUpdated&&(identical(other.id, id) || other.id == id)&&(identical(other.content, content) || other.content == content));
}


@override
int get hashCode => Object.hash(runtimeType,id,content);

@override
String toString() {
  return 'OurServicesEvent.testimonialUpdated(id: $id, content: $content)';
}


}

/// @nodoc
abstract mixin class $OurServicesTestimonialUpdatedCopyWith<$Res> implements $OurServicesEventCopyWith<$Res> {
  factory $OurServicesTestimonialUpdatedCopyWith(OurServicesTestimonialUpdated value, $Res Function(OurServicesTestimonialUpdated) _then) = _$OurServicesTestimonialUpdatedCopyWithImpl;
@useResult
$Res call({
 int id, String content
});




}
/// @nodoc
class _$OurServicesTestimonialUpdatedCopyWithImpl<$Res>
    implements $OurServicesTestimonialUpdatedCopyWith<$Res> {
  _$OurServicesTestimonialUpdatedCopyWithImpl(this._self, this._then);

  final OurServicesTestimonialUpdated _self;
  final $Res Function(OurServicesTestimonialUpdated) _then;

/// Create a copy of OurServicesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,Object? content = null,}) {
  return _then(OurServicesTestimonialUpdated(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class OurServicesTestimonialDeleted implements OurServicesEvent {
  const OurServicesTestimonialDeleted(this.id);
  

 final  int id;

/// Create a copy of OurServicesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OurServicesTestimonialDeletedCopyWith<OurServicesTestimonialDeleted> get copyWith => _$OurServicesTestimonialDeletedCopyWithImpl<OurServicesTestimonialDeleted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OurServicesTestimonialDeleted&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'OurServicesEvent.testimonialDeleted(id: $id)';
}


}

/// @nodoc
abstract mixin class $OurServicesTestimonialDeletedCopyWith<$Res> implements $OurServicesEventCopyWith<$Res> {
  factory $OurServicesTestimonialDeletedCopyWith(OurServicesTestimonialDeleted value, $Res Function(OurServicesTestimonialDeleted) _then) = _$OurServicesTestimonialDeletedCopyWithImpl;
@useResult
$Res call({
 int id
});




}
/// @nodoc
class _$OurServicesTestimonialDeletedCopyWithImpl<$Res>
    implements $OurServicesTestimonialDeletedCopyWith<$Res> {
  _$OurServicesTestimonialDeletedCopyWithImpl(this._self, this._then);

  final OurServicesTestimonialDeleted _self;
  final $Res Function(OurServicesTestimonialDeleted) _then;

/// Create a copy of OurServicesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(OurServicesTestimonialDeleted(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class OurServicesRefreshed implements OurServicesEvent {
  const OurServicesRefreshed();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OurServicesRefreshed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OurServicesEvent.refreshed()';
}


}




// dart format on
