// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'site_settings_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SiteSettingsModel _$SiteSettingsModelFromJson(Map<String, dynamic> json) =>
    _SiteSettingsModel(
      homeHeroImages: json['home_hero_image'] == null
          ? const []
          : _heroImagesFromJson(json['home_hero_image']),
      siteName: json['site_name'] as String? ?? '',
      siteEmail: json['site_email'] as String? ?? '',
      siteLogo: json['site_logo'] as String? ?? '',
      sitePhone: json['site_phone'] as String? ?? '',
      siteAddress: json['site_address'] as String? ?? '',
      socialFacebook: json['social_facebook'] as String? ?? '',
      socialInstagram: json['social_instagram'] as String? ?? '',
      socialTwitter: json['social_twitter'] as String? ?? '',
    );

Map<String, dynamic> _$SiteSettingsModelToJson(_SiteSettingsModel instance) =>
    <String, dynamic>{
      'home_hero_image': instance.homeHeroImages,
      'site_name': instance.siteName,
      'site_email': instance.siteEmail,
      'site_logo': instance.siteLogo,
      'site_phone': instance.sitePhone,
      'site_address': instance.siteAddress,
      'social_facebook': instance.socialFacebook,
      'social_instagram': instance.socialInstagram,
      'social_twitter': instance.socialTwitter,
    };
