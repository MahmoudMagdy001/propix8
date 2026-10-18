import 'package:freezed_annotation/freezed_annotation.dart';

part 'site_settings_entity.freezed.dart';

@freezed
abstract class SiteSettingsEntity with _$SiteSettingsEntity {
  const factory SiteSettingsEntity({
    @Default([]) List<String> homeHeroImages,
    @Default('') String siteName,
    @Default('') String siteEmail,
    @Default('') String siteLogo,
    @Default('') String sitePhone,
    @Default('') String siteAddress,
    @Default('') String socialFacebook,
    @Default('') String socialInstagram,
    @Default('') String socialTwitter,
  }) = _SiteSettingsEntity;
}
