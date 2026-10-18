// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SettingsEvent {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is SettingsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'SettingsEvent()';
}


}

/// @nodoc
class $SettingsEventCopyWith<$Res>  {
$SettingsEventCopyWith(SettingsEvent _, $Res Function(SettingsEvent) __);
}


/// Adds pattern-matching-related methods to [SettingsEvent].
extension SettingsEventPatterns on SettingsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SettingsStarted value)?  started,TResult Function( SiteSettingsRequested value)?  siteSettingsRequested,TResult Function( ThemeChanged value)?  themeChanged,TResult Function( LocaleChanged value)?  localeChanged,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SettingsStarted() when started != null:
return started(_that);case SiteSettingsRequested() when siteSettingsRequested != null:
return siteSettingsRequested(_that);case ThemeChanged() when themeChanged != null:
return themeChanged(_that);case LocaleChanged() when localeChanged != null:
return localeChanged(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SettingsStarted value)  started,required TResult Function( SiteSettingsRequested value)  siteSettingsRequested,required TResult Function( ThemeChanged value)  themeChanged,required TResult Function( LocaleChanged value)  localeChanged,}){
final _that = this;
switch (_that) {
case SettingsStarted():
return started(_that);case SiteSettingsRequested():
return siteSettingsRequested(_that);case ThemeChanged():
return themeChanged(_that);case LocaleChanged():
return localeChanged(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SettingsStarted value)?  started,TResult? Function( SiteSettingsRequested value)?  siteSettingsRequested,TResult? Function( ThemeChanged value)?  themeChanged,TResult? Function( LocaleChanged value)?  localeChanged,}){
final _that = this;
switch (_that) {
case SettingsStarted() when started != null:
return started(_that);case SiteSettingsRequested() when siteSettingsRequested != null:
return siteSettingsRequested(_that);case ThemeChanged() when themeChanged != null:
return themeChanged(_that);case LocaleChanged() when localeChanged != null:
return localeChanged(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function()?  siteSettingsRequested,TResult Function( ThemeMode themeMode)?  themeChanged,TResult Function( Locale locale)?  localeChanged,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SettingsStarted() when started != null:
return started();case SiteSettingsRequested() when siteSettingsRequested != null:
return siteSettingsRequested();case ThemeChanged() when themeChanged != null:
return themeChanged(_that.themeMode);case LocaleChanged() when localeChanged != null:
return localeChanged(_that.locale);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function()  siteSettingsRequested,required TResult Function( ThemeMode themeMode)  themeChanged,required TResult Function( Locale locale)  localeChanged,}) {final _that = this;
switch (_that) {
case SettingsStarted():
return started();case SiteSettingsRequested():
return siteSettingsRequested();case ThemeChanged():
return themeChanged(_that.themeMode);case LocaleChanged():
return localeChanged(_that.locale);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function()?  siteSettingsRequested,TResult? Function( ThemeMode themeMode)?  themeChanged,TResult? Function( Locale locale)?  localeChanged,}) {final _that = this;
switch (_that) {
case SettingsStarted() when started != null:
return started();case SiteSettingsRequested() when siteSettingsRequested != null:
return siteSettingsRequested();case ThemeChanged() when themeChanged != null:
return themeChanged(_that.themeMode);case LocaleChanged() when localeChanged != null:
return localeChanged(_that.locale);case _:
  return null;

}
}

}

/// @nodoc


class SettingsStarted implements SettingsEvent {
  const SettingsStarted();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is SettingsStarted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'SettingsEvent.started()';
}


}




/// @nodoc


class SiteSettingsRequested implements SettingsEvent {
  const SiteSettingsRequested();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is SiteSettingsRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'SettingsEvent.siteSettingsRequested()';
}


}




/// @nodoc


class ThemeChanged implements SettingsEvent {
  const ThemeChanged(this.themeMode);
  

 final  ThemeMode themeMode;

/// Create a copy of SettingsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ThemeChangedCopyWith<ThemeChanged> get copyWith => _$ThemeChangedCopyWithImpl<ThemeChanged>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ThemeChanged&&(identical(other.themeMode, themeMode) || other.themeMode == themeMode));
}


@override
int get hashCode {
    return Object.hash(runtimeType,themeMode);
}

@override
String toString() {
    return 'SettingsEvent.themeChanged(themeMode: $themeMode)';
}


}

/// @nodoc
abstract mixin class $ThemeChangedCopyWith<$Res> implements $SettingsEventCopyWith<$Res> {
  factory $ThemeChangedCopyWith(ThemeChanged value, $Res Function(ThemeChanged) _then) = _$ThemeChangedCopyWithImpl;
@useResult
$Res call({
 ThemeMode themeMode
});




}
/// @nodoc
class _$ThemeChangedCopyWithImpl<$Res>
    implements $ThemeChangedCopyWith<$Res> {
  _$ThemeChangedCopyWithImpl(this._self, this._then);

  final ThemeChanged _self;
  final $Res Function(ThemeChanged) _then;

/// Create a copy of SettingsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? themeMode = null,}) {
  return _then(ThemeChanged(
null == themeMode ? _self.themeMode : themeMode // ignore: cast_nullable_to_non_nullable
as ThemeMode,
  ));
}


}

/// @nodoc


class LocaleChanged implements SettingsEvent {
  const LocaleChanged(this.locale);
  

 final  Locale locale;

/// Create a copy of SettingsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LocaleChangedCopyWith<LocaleChanged> get copyWith => _$LocaleChangedCopyWithImpl<LocaleChanged>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is LocaleChanged&&(identical(other.locale, locale) || other.locale == locale));
}


@override
int get hashCode {
    return Object.hash(runtimeType,locale);
}

@override
String toString() {
    return 'SettingsEvent.localeChanged(locale: $locale)';
}


}

/// @nodoc
abstract mixin class $LocaleChangedCopyWith<$Res> implements $SettingsEventCopyWith<$Res> {
  factory $LocaleChangedCopyWith(LocaleChanged value, $Res Function(LocaleChanged) _then) = _$LocaleChangedCopyWithImpl;
@useResult
$Res call({
 Locale locale
});




}
/// @nodoc
class _$LocaleChangedCopyWithImpl<$Res>
    implements $LocaleChangedCopyWith<$Res> {
  _$LocaleChangedCopyWithImpl(this._self, this._then);

  final LocaleChanged _self;
  final $Res Function(LocaleChanged) _then;

/// Create a copy of SettingsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? locale = null,}) {
  return _then(LocaleChanged(
null == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as Locale,
  ));
}


}

// dart format on
