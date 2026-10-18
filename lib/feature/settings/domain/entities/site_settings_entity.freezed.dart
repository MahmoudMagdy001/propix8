// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'site_settings_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SiteSettingsEntity {

 List<String> get homeHeroImages; String get siteName; String get siteEmail; String get siteLogo; String get sitePhone; String get siteAddress; String get socialFacebook; String get socialInstagram; String get socialTwitter;
/// Create a copy of SiteSettingsEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SiteSettingsEntityCopyWith<SiteSettingsEntity> get copyWith => _$SiteSettingsEntityCopyWithImpl<SiteSettingsEntity>(this as SiteSettingsEntity, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as SiteSettingsEntity;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SiteSettingsEntity&&const DeepCollectionEquality().equals(other.homeHeroImages, _this.homeHeroImages)&&(identical(other.siteName, _this.siteName) || other.siteName == _this.siteName)&&(identical(other.siteEmail, _this.siteEmail) || other.siteEmail == _this.siteEmail)&&(identical(other.siteLogo, _this.siteLogo) || other.siteLogo == _this.siteLogo)&&(identical(other.sitePhone, _this.sitePhone) || other.sitePhone == _this.sitePhone)&&(identical(other.siteAddress, _this.siteAddress) || other.siteAddress == _this.siteAddress)&&(identical(other.socialFacebook, _this.socialFacebook) || other.socialFacebook == _this.socialFacebook)&&(identical(other.socialInstagram, _this.socialInstagram) || other.socialInstagram == _this.socialInstagram)&&(identical(other.socialTwitter, _this.socialTwitter) || other.socialTwitter == _this.socialTwitter));
}


@override
int get hashCode {
  final _this = this as SiteSettingsEntity;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.homeHeroImages),_this.siteName,_this.siteEmail,_this.siteLogo,_this.sitePhone,_this.siteAddress,_this.socialFacebook,_this.socialInstagram,_this.socialTwitter);
}

@override
String toString() {
  final _this = this as SiteSettingsEntity;
  return 'SiteSettingsEntity(homeHeroImages: ${_this.homeHeroImages}, siteName: ${_this.siteName}, siteEmail: ${_this.siteEmail}, siteLogo: ${_this.siteLogo}, sitePhone: ${_this.sitePhone}, siteAddress: ${_this.siteAddress}, socialFacebook: ${_this.socialFacebook}, socialInstagram: ${_this.socialInstagram}, socialTwitter: ${_this.socialTwitter})';
}


}

/// @nodoc
abstract mixin class $SiteSettingsEntityCopyWith<$Res>  {
  factory $SiteSettingsEntityCopyWith(SiteSettingsEntity value, $Res Function(SiteSettingsEntity) _then) = _$SiteSettingsEntityCopyWithImpl;
@useResult
$Res call({
 List<String> homeHeroImages, String siteName, String siteEmail, String siteLogo, String sitePhone, String siteAddress, String socialFacebook, String socialInstagram, String socialTwitter
});




}
/// @nodoc
class _$SiteSettingsEntityCopyWithImpl<$Res>
    implements $SiteSettingsEntityCopyWith<$Res> {
  _$SiteSettingsEntityCopyWithImpl(this._self, this._then);

  final SiteSettingsEntity _self;
  final $Res Function(SiteSettingsEntity) _then;

/// Create a copy of SiteSettingsEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? homeHeroImages = null,Object? siteName = null,Object? siteEmail = null,Object? siteLogo = null,Object? sitePhone = null,Object? siteAddress = null,Object? socialFacebook = null,Object? socialInstagram = null,Object? socialTwitter = null,}) {
  return _then(SiteSettingsEntity(
homeHeroImages: null == homeHeroImages ? _self.homeHeroImages : homeHeroImages // ignore: cast_nullable_to_non_nullable
as List<String>,siteName: null == siteName ? _self.siteName : siteName // ignore: cast_nullable_to_non_nullable
as String,siteEmail: null == siteEmail ? _self.siteEmail : siteEmail // ignore: cast_nullable_to_non_nullable
as String,siteLogo: null == siteLogo ? _self.siteLogo : siteLogo // ignore: cast_nullable_to_non_nullable
as String,sitePhone: null == sitePhone ? _self.sitePhone : sitePhone // ignore: cast_nullable_to_non_nullable
as String,siteAddress: null == siteAddress ? _self.siteAddress : siteAddress // ignore: cast_nullable_to_non_nullable
as String,socialFacebook: null == socialFacebook ? _self.socialFacebook : socialFacebook // ignore: cast_nullable_to_non_nullable
as String,socialInstagram: null == socialInstagram ? _self.socialInstagram : socialInstagram // ignore: cast_nullable_to_non_nullable
as String,socialTwitter: null == socialTwitter ? _self.socialTwitter : socialTwitter // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SiteSettingsEntity].
extension SiteSettingsEntityPatterns on SiteSettingsEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SiteSettingsEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SiteSettingsEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SiteSettingsEntity value)  $default,){
final _that = this;
switch (_that) {
case _SiteSettingsEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SiteSettingsEntity value)?  $default,){
final _that = this;
switch (_that) {
case _SiteSettingsEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<String> homeHeroImages,  String siteName,  String siteEmail,  String siteLogo,  String sitePhone,  String siteAddress,  String socialFacebook,  String socialInstagram,  String socialTwitter)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SiteSettingsEntity() when $default != null:
return $default(_that.homeHeroImages,_that.siteName,_that.siteEmail,_that.siteLogo,_that.sitePhone,_that.siteAddress,_that.socialFacebook,_that.socialInstagram,_that.socialTwitter);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<String> homeHeroImages,  String siteName,  String siteEmail,  String siteLogo,  String sitePhone,  String siteAddress,  String socialFacebook,  String socialInstagram,  String socialTwitter)  $default,) {final _that = this;
switch (_that) {
case _SiteSettingsEntity():
return $default(_that.homeHeroImages,_that.siteName,_that.siteEmail,_that.siteLogo,_that.sitePhone,_that.siteAddress,_that.socialFacebook,_that.socialInstagram,_that.socialTwitter);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<String> homeHeroImages,  String siteName,  String siteEmail,  String siteLogo,  String sitePhone,  String siteAddress,  String socialFacebook,  String socialInstagram,  String socialTwitter)?  $default,) {final _that = this;
switch (_that) {
case _SiteSettingsEntity() when $default != null:
return $default(_that.homeHeroImages,_that.siteName,_that.siteEmail,_that.siteLogo,_that.sitePhone,_that.siteAddress,_that.socialFacebook,_that.socialInstagram,_that.socialTwitter);case _:
  return null;

}
}

}

/// @nodoc


class _SiteSettingsEntity implements SiteSettingsEntity {
  const _SiteSettingsEntity({ List<String> homeHeroImages = const [], this.siteName = '', this.siteEmail = '', this.siteLogo = '', this.sitePhone = '', this.siteAddress = '', this.socialFacebook = '', this.socialInstagram = '', this.socialTwitter = ''}): _homeHeroImages = homeHeroImages;
  

 final  List<String> _homeHeroImages;
@override@JsonKey() List<String> get homeHeroImages {
  if (_homeHeroImages is EqualUnmodifiableListView) return _homeHeroImages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_homeHeroImages);
}

@override@JsonKey() final  String siteName;
@override@JsonKey() final  String siteEmail;
@override@JsonKey() final  String siteLogo;
@override@JsonKey() final  String sitePhone;
@override@JsonKey() final  String siteAddress;
@override@JsonKey() final  String socialFacebook;
@override@JsonKey() final  String socialInstagram;
@override@JsonKey() final  String socialTwitter;

/// Create a copy of SiteSettingsEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SiteSettingsEntityCopyWith<_SiteSettingsEntity> get copyWith => __$SiteSettingsEntityCopyWithImpl<_SiteSettingsEntity>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SiteSettingsEntity&&const DeepCollectionEquality().equals(other.homeHeroImages, _homeHeroImages)&&(identical(other.siteName, siteName) || other.siteName == siteName)&&(identical(other.siteEmail, siteEmail) || other.siteEmail == siteEmail)&&(identical(other.siteLogo, siteLogo) || other.siteLogo == siteLogo)&&(identical(other.sitePhone, sitePhone) || other.sitePhone == sitePhone)&&(identical(other.siteAddress, siteAddress) || other.siteAddress == siteAddress)&&(identical(other.socialFacebook, socialFacebook) || other.socialFacebook == socialFacebook)&&(identical(other.socialInstagram, socialInstagram) || other.socialInstagram == socialInstagram)&&(identical(other.socialTwitter, socialTwitter) || other.socialTwitter == socialTwitter));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_homeHeroImages),siteName,siteEmail,siteLogo,sitePhone,siteAddress,socialFacebook,socialInstagram,socialTwitter);
}

@override
String toString() {
    return 'SiteSettingsEntity(homeHeroImages: $homeHeroImages, siteName: $siteName, siteEmail: $siteEmail, siteLogo: $siteLogo, sitePhone: $sitePhone, siteAddress: $siteAddress, socialFacebook: $socialFacebook, socialInstagram: $socialInstagram, socialTwitter: $socialTwitter)';
}


}

/// @nodoc
abstract mixin class _$SiteSettingsEntityCopyWith<$Res> implements $SiteSettingsEntityCopyWith<$Res> {
  factory _$SiteSettingsEntityCopyWith(_SiteSettingsEntity value, $Res Function(_SiteSettingsEntity) _then) = __$SiteSettingsEntityCopyWithImpl;
@override @useResult
$Res call({
 List<String> homeHeroImages, String siteName, String siteEmail, String siteLogo, String sitePhone, String siteAddress, String socialFacebook, String socialInstagram, String socialTwitter
});




}
/// @nodoc
class __$SiteSettingsEntityCopyWithImpl<$Res>
    implements _$SiteSettingsEntityCopyWith<$Res> {
  __$SiteSettingsEntityCopyWithImpl(this._self, this._then);

  final _SiteSettingsEntity _self;
  final $Res Function(_SiteSettingsEntity) _then;

/// Create a copy of SiteSettingsEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? homeHeroImages = null,Object? siteName = null,Object? siteEmail = null,Object? siteLogo = null,Object? sitePhone = null,Object? siteAddress = null,Object? socialFacebook = null,Object? socialInstagram = null,Object? socialTwitter = null,}) {
  return _then(_SiteSettingsEntity(
homeHeroImages: null == homeHeroImages ? _self._homeHeroImages : homeHeroImages // ignore: cast_nullable_to_non_nullable
as List<String>,siteName: null == siteName ? _self.siteName : siteName // ignore: cast_nullable_to_non_nullable
as String,siteEmail: null == siteEmail ? _self.siteEmail : siteEmail // ignore: cast_nullable_to_non_nullable
as String,siteLogo: null == siteLogo ? _self.siteLogo : siteLogo // ignore: cast_nullable_to_non_nullable
as String,sitePhone: null == sitePhone ? _self.sitePhone : sitePhone // ignore: cast_nullable_to_non_nullable
as String,siteAddress: null == siteAddress ? _self.siteAddress : siteAddress // ignore: cast_nullable_to_non_nullable
as String,socialFacebook: null == socialFacebook ? _self.socialFacebook : socialFacebook // ignore: cast_nullable_to_non_nullable
as String,socialInstagram: null == socialInstagram ? _self.socialInstagram : socialInstagram // ignore: cast_nullable_to_non_nullable
as String,socialTwitter: null == socialTwitter ? _self.socialTwitter : socialTwitter // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
