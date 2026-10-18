// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'onboarding_page_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OnboardingPageEntity {

 String get title; String get subtitle; String get imagePath;
/// Create a copy of OnboardingPageEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnboardingPageEntityCopyWith<OnboardingPageEntity> get copyWith => _$OnboardingPageEntityCopyWithImpl<OnboardingPageEntity>(this as OnboardingPageEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnboardingPageEntity&&(identical(other.title, title) || other.title == title)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath));
}


@override
int get hashCode => Object.hash(runtimeType,title,subtitle,imagePath);

@override
String toString() {
  return 'OnboardingPageEntity(title: $title, subtitle: $subtitle, imagePath: $imagePath)';
}


}

/// @nodoc
abstract mixin class $OnboardingPageEntityCopyWith<$Res>  {
  factory $OnboardingPageEntityCopyWith(OnboardingPageEntity value, $Res Function(OnboardingPageEntity) _then) = _$OnboardingPageEntityCopyWithImpl;
@useResult
$Res call({
 String title, String subtitle, String imagePath
});




}
/// @nodoc
class _$OnboardingPageEntityCopyWithImpl<$Res>
    implements $OnboardingPageEntityCopyWith<$Res> {
  _$OnboardingPageEntityCopyWithImpl(this._self, this._then);

  final OnboardingPageEntity _self;
  final $Res Function(OnboardingPageEntity) _then;

/// Create a copy of OnboardingPageEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? subtitle = null,Object? imagePath = null,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,subtitle: null == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String,imagePath: null == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [OnboardingPageEntity].
extension OnboardingPageEntityPatterns on OnboardingPageEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OnboardingPageEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OnboardingPageEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OnboardingPageEntity value)  $default,){
final _that = this;
switch (_that) {
case _OnboardingPageEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OnboardingPageEntity value)?  $default,){
final _that = this;
switch (_that) {
case _OnboardingPageEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  String subtitle,  String imagePath)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OnboardingPageEntity() when $default != null:
return $default(_that.title,_that.subtitle,_that.imagePath);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  String subtitle,  String imagePath)  $default,) {final _that = this;
switch (_that) {
case _OnboardingPageEntity():
return $default(_that.title,_that.subtitle,_that.imagePath);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  String subtitle,  String imagePath)?  $default,) {final _that = this;
switch (_that) {
case _OnboardingPageEntity() when $default != null:
return $default(_that.title,_that.subtitle,_that.imagePath);case _:
  return null;

}
}

}

/// @nodoc


class _OnboardingPageEntity implements OnboardingPageEntity {
  const _OnboardingPageEntity({required this.title, required this.subtitle, required this.imagePath});
  

@override final  String title;
@override final  String subtitle;
@override final  String imagePath;

/// Create a copy of OnboardingPageEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OnboardingPageEntityCopyWith<_OnboardingPageEntity> get copyWith => __$OnboardingPageEntityCopyWithImpl<_OnboardingPageEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OnboardingPageEntity&&(identical(other.title, title) || other.title == title)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath));
}


@override
int get hashCode => Object.hash(runtimeType,title,subtitle,imagePath);

@override
String toString() {
  return 'OnboardingPageEntity(title: $title, subtitle: $subtitle, imagePath: $imagePath)';
}


}

/// @nodoc
abstract mixin class _$OnboardingPageEntityCopyWith<$Res> implements $OnboardingPageEntityCopyWith<$Res> {
  factory _$OnboardingPageEntityCopyWith(_OnboardingPageEntity value, $Res Function(_OnboardingPageEntity) _then) = __$OnboardingPageEntityCopyWithImpl;
@override @useResult
$Res call({
 String title, String subtitle, String imagePath
});




}
/// @nodoc
class __$OnboardingPageEntityCopyWithImpl<$Res>
    implements _$OnboardingPageEntityCopyWith<$Res> {
  __$OnboardingPageEntityCopyWithImpl(this._self, this._then);

  final _OnboardingPageEntity _self;
  final $Res Function(_OnboardingPageEntity) _then;

/// Create a copy of OnboardingPageEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? subtitle = null,Object? imagePath = null,}) {
  return _then(_OnboardingPageEntity(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,subtitle: null == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String,imagePath: null == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
