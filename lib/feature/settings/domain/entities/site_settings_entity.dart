class SiteSettingsEntity {
  const SiteSettingsEntity({
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

  final List<String> homeHeroImages;
  final String siteName;
  final String siteEmail;
  final String siteLogo;
  final String sitePhone;
  final String siteAddress;
  final String socialFacebook;
  final String socialInstagram;
  final String socialTwitter;
}
