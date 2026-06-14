import 'package:equatable/equatable.dart';

class SiteSettingsModel extends Equatable {
  const SiteSettingsModel({
    this.homeHeroImages = const [],
    this.siteName = '',
    this.siteEmail = '',
    this.siteLogo = '',
    this.sitePhone = '',
    this.siteAddress = '',
    this.socialFacebook = '',
    this.socialInstagram = '',
    this.socialTwitter = '',
  });

  factory SiteSettingsModel.fromJson(Map<String, dynamic> json) {
    var heroImages = <String>[];
    if (json['home_hero_image'] is List) {
      heroImages = List<String>.from(
          json['home_hero_image'] as Iterable<dynamic>);
    } else if (json['home_hero_image'] is String) {
      heroImages = [json['home_hero_image'] as String];
    }

    return SiteSettingsModel(
      homeHeroImages: heroImages,
      siteName: (json['site_name'] as String?) ?? '',
      siteEmail: (json['site_email'] as String?) ?? '',
      siteLogo: (json['site_logo'] as String?) ?? '',
      sitePhone: (json['site_phone'] as String?) ?? '',
      siteAddress: (json['site_address'] as String?) ?? '',
      socialFacebook: (json['social_facebook'] as String?) ?? '',
      socialInstagram: (json['social_instagram'] as String?) ?? '',
      socialTwitter: (json['social_twitter'] as String?) ?? '',
    );
  }
  final List<String> homeHeroImages;
  final String siteName;
  final String siteEmail;
  final String siteLogo;
  final String sitePhone;
  final String siteAddress;
  final String socialFacebook;
  final String socialInstagram;
  final String socialTwitter;

  @override
  List<Object?> get props => [
    homeHeroImages,
    siteName,
    siteEmail,
    siteLogo,
    sitePhone,
    siteAddress,
    socialFacebook,
    socialInstagram,
    socialTwitter,
  ];
}
