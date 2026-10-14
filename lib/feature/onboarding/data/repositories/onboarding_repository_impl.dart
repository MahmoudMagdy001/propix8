import 'package:propix8/feature/onboarding/data/datasources/onboarding_local_data_source.dart';
import 'package:propix8/feature/onboarding/domain/entities/onboarding_page_entity.dart';
import 'package:propix8/feature/onboarding/domain/repositories/onboarding_repository.dart';
import 'package:propix8/l10n/app_localizations.dart';

class OnboardingRepositoryImpl implements OnboardingRepository {
  const OnboardingRepositoryImpl(this._localDataSource);

  final OnboardingLocalDataSource _localDataSource;

  @override
  List<OnboardingPageEntity> getOnboardingPages(
    AppLocalizations l10n, {
    List<String>? images,
  }) {
    const defaultImages = [
      'assets/images/onboarding.jpg',
      'assets/images/onboarding.jpg',
      'assets/images/onboarding.jpg',
    ];

    final hasCustomImages = images != null && images.isNotEmpty;
    String getImage(int index) {
      if (hasCustomImages) {
        return images[index % images.length];
      }
      return defaultImages[index];
    }

    return [
      OnboardingPageEntity(
        title: l10n.onboardingTitle1,
        subtitle: l10n.onboardingSubtitle1,
        imagePath: getImage(0),
      ),
      OnboardingPageEntity(
        title: l10n.onboardingTitle2,
        subtitle: l10n.onboardingSubtitle2,
        imagePath: getImage(1),
      ),
      OnboardingPageEntity(
        title: l10n.onboardingTitle3,
        subtitle: l10n.onboardingSubtitle3,
        imagePath: getImage(2),
      ),
    ];
  }

  @override
  Future<void> completeOnboarding() => _localDataSource.saveOnboardingSeen();
}
