// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'site_settings_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SiteSettingsModel {

@JsonKey(name: 'home_hero_image', fromJson: _heroImagesFromJson) List<String> get homeHeroImages;@JsonKey(name: 'site_name') String get siteName;@JsonKey(name: 'site_email') String get siteEmail;@JsonKey(name: 'site_logo') String get siteLogo;@JsonKey(name: 'site_phone') String get sitePhone;@JsonKey(name: 'site_address') String get siteAddress;@JsonKey(name: 'social_facebook') String get socialFacebook;@JsonKey(name: 'social_instagram') String get socialInstagram;@JsonKey(name: 'social_twitter') String get socialTwitter;
/// Create a copy of SiteSettingsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SiteSettingsModelCopyWith<SiteSettingsModel> get copyWith => _$SiteSettingsModelCopyWithImpl<SiteSettingsModel>(this as SiteSettingsModel, _$identity);

  /// Serializes this SiteSettingsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SiteSettingsModel&&const DeepCollectionEquality().equals(other.homeHeroImages, homeHeroImages)&&(identical(other.siteName, siteName) || other.siteName == siteName)&&(identical(other.siteEmail, siteEmail) || other.siteEmail == siteEmail)&&(identical(other.siteLogo, siteLogo) || other.siteLogo == siteLogo)&&(identical(other.sitePhone, sitePhone) || other.sitePhone == sitePhone)&&(identical(other.siteAddress, siteAddress) || other.siteAddress == siteAddress)&&(identical(other.socialFacebook, socialFacebook) || other.socialFacebook == socialFacebook)&&(identical(other.socialInstagram, socialInstagram) || other.socialInstagram == socialInstagram)&&(identical(other.socialTwitter, socialTwitter) || other.socialTwitter == socialTwitter));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(homeHeroImages),siteName,siteEmail,siteLogo,sitePhone,siteAddress,socialFacebook,socialInstagram,socialTwitter);

@override
String toString() {
  return 'SiteSettingsModel(homeHeroImages: $homeHeroImages, siteName: $siteName, siteEmail: $siteEmail, siteLogo: $siteLogo, sitePhone: $sitePhone, siteAddress: $siteAddress, socialFacebook: $socialFacebook, socialInstagram: $socialInstagram, socialTwitter: $socialTwitter)';
}


}

/// @nodoc
abstract mixin class $SiteSettingsModelCopyWith<$Res>  {
  factory $SiteSettingsModelCopyWith(SiteSettingsModel value, $Res Function(SiteSettingsModel) _then) = _$SiteSettingsModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'home_hero_image', fromJson: _heroImagesFromJson) List<String> homeHeroImages,@JsonKey(name: 'site_name') String siteName,@JsonKey(name: 'site_email') String siteEmail,@JsonKey(name: 'site_logo') String siteLogo,@JsonKey(name: 'site_phone') String sitePhone,@JsonKey(name: 'site_address') String siteAddress,@JsonKey(name: 'social_facebook') String socialFacebook,@JsonKey(name: 'social_instagram') String socialInstagram,@JsonKey(name: 'social_twitter') String socialTwitter
});




}
/// @nodoc
class _$SiteSettingsModelCopyWithImpl<$Res>
    implements $SiteSettingsModelCopyWith<$Res> {
  _$SiteSettingsModelCopyWithImpl(this._self, this._then);

  final SiteSettingsModel _self;
  final $Res Function(SiteSettingsModel) _then;

/// Create a copy of SiteSettingsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? homeHeroImages = null,Object? siteName = null,Object? siteEmail = null,Object? siteLogo = null,Object? sitePhone = null,Object? siteAddress = null,Object? socialFacebook = null,Object? socialInstagram = null,Object? socialTwitter = null,}) {
  return _then(_self.copyWith(
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


/// Adds pattern-matching-related methods to [SiteSettingsModel].
extension SiteSettingsModelPatterns on SiteSettingsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SiteSettingsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SiteSettingsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SiteSettingsModel value)  $default,){
final _that = this;
switch (_that) {
case _SiteSettingsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SiteSettingsModel value)?  $default,){
final _that = this;
switch (_that) {
case _SiteSettingsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'home_hero_image', fromJson: _heroImagesFromJson)  List<String> homeHeroImages, @JsonKey(name: 'site_name')  String siteName, @JsonKey(name: 'site_email')  String siteEmail, @JsonKey(name: 'site_logo')  String siteLogo, @JsonKey(name: 'site_phone')  String sitePhone, @JsonKey(name: 'site_address')  String siteAddress, @JsonKey(name: 'social_facebook')  String socialFacebook, @JsonKey(name: 'social_instagram')  String socialInstagram, @JsonKey(name: 'social_twitter')  String socialTwitter)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SiteSettingsModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'home_hero_image', fromJson: _heroImagesFromJson)  List<String> homeHeroImages, @JsonKey(name: 'site_name')  String siteName, @JsonKey(name: 'site_email')  String siteEmail, @JsonKey(name: 'site_logo')  String siteLogo, @JsonKey(name: 'site_phone')  String sitePhone, @JsonKey(name: 'site_address')  String siteAddress, @JsonKey(name: 'social_facebook')  String socialFacebook, @JsonKey(name: 'social_instagram')  String socialInstagram, @JsonKey(name: 'social_twitter')  String socialTwitter)  $default,) {final _that = this;
switch (_that) {
case _SiteSettingsModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'home_hero_image', fromJson: _heroImagesFromJson)  List<String> homeHeroImages, @JsonKey(name: 'site_name')  String siteName, @JsonKey(name: 'site_email')  String siteEmail, @JsonKey(name: 'site_logo')  String siteLogo, @JsonKey(name: 'site_phone')  String sitePhone, @JsonKey(name: 'site_address')  String siteAddress, @JsonKey(name: 'social_facebook')  String socialFacebook, @JsonKey(name: 'social_instagram')  String socialInstagram, @JsonKey(name: 'social_twitter')  String socialTwitter)?  $default,) {final _that = this;
switch (_that) {
case _SiteSettingsModel() when $default != null:
return $default(_that.homeHeroImages,_that.siteName,_that.siteEmail,_that.siteLogo,_that.sitePhone,_that.siteAddress,_that.socialFacebook,_that.socialInstagram,_that.socialTwitter);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SiteSettingsModel extends SiteSettingsModel {
  const _SiteSettingsModel({@JsonKey(name: 'home_hero_image', fromJson: _heroImagesFromJson) final  List<String> homeHeroImages = const [], @JsonKey(name: 'site_name') this.siteName = '', @JsonKey(name: 'site_email') this.siteEmail = '', @JsonKey(name: 'site_logo') this.siteLogo = '', @JsonKey(name: 'site_phone') this.sitePhone = '', @JsonKey(name: 'site_address') this.siteAddress = '', @JsonKey(name: 'social_facebook') this.socialFacebook = '', @JsonKey(name: 'social_instagram') this.socialInstagram = '', @JsonKey(name: 'social_twitter') this.socialTwitter = ''}): _homeHeroImages = homeHeroImages,super._();
  factory _SiteSettingsModel.fromJson(Map<String, dynamic> json) => _$SiteSettingsModelFromJson(json);

 final  List<String> _homeHeroImages;
@override@JsonKey(name: 'home_hero_image', fromJson: _heroImagesFromJson) List<String> get homeHeroImages {
  if (_homeHeroImages is EqualUnmodifiableListView) return _homeHeroImages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_homeHeroImages);
}

@override@JsonKey(name: 'site_name') final  String siteName;
@override@JsonKey(name: 'site_email') final  String siteEmail;
@override@JsonKey(name: 'site_logo') final  String siteLogo;
@override@JsonKey(name: 'site_phone') final  String sitePhone;
@override@JsonKey(name: 'site_address') final  String siteAddress;
@override@JsonKey(name: 'social_facebook') final  String socialFacebook;
@override@JsonKey(name: 'social_instagram') final  String socialInstagram;
@override@JsonKey(name: 'social_twitter') final  String socialTwitter;

/// Create a copy of SiteSettingsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SiteSettingsModelCopyWith<_SiteSettingsModel> get copyWith => __$SiteSettingsModelCopyWithImpl<_SiteSettingsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SiteSettingsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SiteSettingsModel&&const DeepCollectionEquality().equals(other._homeHeroImages, _homeHeroImages)&&(identical(other.siteName, siteName) || other.siteName == siteName)&&(identical(other.siteEmail, siteEmail) || other.siteEmail == siteEmail)&&(identical(other.siteLogo, siteLogo) || other.siteLogo == siteLogo)&&(identical(other.sitePhone, sitePhone) || other.sitePhone == sitePhone)&&(identical(other.siteAddress, siteAddress) || other.siteAddress == siteAddress)&&(identical(other.socialFacebook, socialFacebook) || other.socialFacebook == socialFacebook)&&(identical(other.socialInstagram, socialInstagram) || other.socialInstagram == socialInstagram)&&(identical(other.socialTwitter, socialTwitter) || other.socialTwitter == socialTwitter));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_homeHeroImages),siteName,siteEmail,siteLogo,sitePhone,siteAddress,socialFacebook,socialInstagram,socialTwitter);

@override
String toString() {
  return 'SiteSettingsModel(homeHeroImages: $homeHeroImages, siteName: $siteName, siteEmail: $siteEmail, siteLogo: $siteLogo, sitePhone: $sitePhone, siteAddress: $siteAddress, socialFacebook: $socialFacebook, socialInstagram: $socialInstagram, socialTwitter: $socialTwitter)';
}


}

/// @nodoc
abstract mixin class _$SiteSettingsModelCopyWith<$Res> implements $SiteSettingsModelCopyWith<$Res> {
  factory _$SiteSettingsModelCopyWith(_SiteSettingsModel value, $Res Function(_SiteSettingsModel) _then) = __$SiteSettingsModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'home_hero_image', fromJson: _heroImagesFromJson) List<String> homeHeroImages,@JsonKey(name: 'site_name') String siteName,@JsonKey(name: 'site_email') String siteEmail,@JsonKey(name: 'site_logo') String siteLogo,@JsonKey(name: 'site_phone') String sitePhone,@JsonKey(name: 'site_address') String siteAddress,@JsonKey(name: 'social_facebook') String socialFacebook,@JsonKey(name: 'social_instagram') String socialInstagram,@JsonKey(name: 'social_twitter') String socialTwitter
});




}
/// @nodoc
class __$SiteSettingsModelCopyWithImpl<$Res>
    implements _$SiteSettingsModelCopyWith<$Res> {
  __$SiteSettingsModelCopyWithImpl(this._self, this._then);

  final _SiteSettingsModel _self;
  final $Res Function(_SiteSettingsModel) _then;

/// Create a copy of SiteSettingsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? homeHeroImages = null,Object? siteName = null,Object? siteEmail = null,Object? siteLogo = null,Object? sitePhone = null,Object? siteAddress = null,Object? socialFacebook = null,Object? socialInstagram = null,Object? socialTwitter = null,}) {
  return _then(_SiteSettingsModel(
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
