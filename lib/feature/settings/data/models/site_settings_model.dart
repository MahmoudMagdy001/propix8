import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:propix8/feature/settings/domain/entities/site_settings_entity.dart';

part 'site_settings_model.freezed.dart';
part 'site_settings_model.g.dart';

List<String> _heroImagesFromJson(dynamic json) {
  if (json is List) {
    return List<String>.from(json);
  } else if (json is String) {
    return [json];
  }
  return const [];
}

@freezed
abstract class SiteSettingsModel with _$SiteSettingsModel {
  const SiteSettingsModel._();

  const factory SiteSettingsModel({
    @JsonKey(name: 'home_hero_image', fromJson: _heroImagesFromJson)
    @Default([])
    List<String> homeHeroImages,
    @JsonKey(name: 'site_name') @Default('') String siteName,
    @JsonKey(name: 'site_email') @Default('') String siteEmail,
    @JsonKey(name: 'site_logo') @Default('') String siteLogo,
    @JsonKey(name: 'site_phone') @Default('') String sitePhone,
    @JsonKey(name: 'site_address') @Default('') String siteAddress,
    @JsonKey(name: 'social_facebook') @Default('') String socialFacebook,
    @JsonKey(name: 'social_instagram') @Default('') String socialInstagram,
    @JsonKey(name: 'social_twitter') @Default('') String socialTwitter,
  }) = _SiteSettingsModel;

  factory SiteSettingsModel.fromJson(Map<String, dynamic> json) =>
      _$SiteSettingsModelFromJson(json);

  SiteSettingsEntity toDomain() => SiteSettingsEntity(
    homeHeroImages: homeHeroImages,
    siteName: siteName,
    siteEmail: siteEmail,
    siteLogo: siteLogo,
    sitePhone: sitePhone,
    siteAddress: siteAddress,
    socialFacebook: socialFacebook,
    socialInstagram: socialInstagram,
    socialTwitter: socialTwitter,
  );
}
