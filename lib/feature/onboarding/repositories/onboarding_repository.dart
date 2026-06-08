import 'package:propix8/feature/onboarding/models/onboarding_model.dart';
import 'package:propix8/l10n/app_localizations.dart';

abstract class OnboardingRepository {
  List<OnboardingModel> getOnboardingData(
    AppLocalizations l10n, {
    List<String>? images,
  });
}

class OnboardingRepositoryImpl implements OnboardingRepository {
  @override
  List<OnboardingModel> getOnboardingData(
    AppLocalizations l10n, {
    List<String>? images,
  }) {
    // Default images if none provided
    final defaultImages = [
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
      OnboardingModel(
        title: l10n.onboardingTitle1,
        subtitle: l10n.onboardingSubtitle1,
        imagePath: getImage(0),
      ),
      OnboardingModel(
        title: l10n.onboardingTitle2,
        subtitle: l10n.onboardingSubtitle2,
        imagePath: getImage(1),
      ),
      OnboardingModel(
        title: l10n.onboardingTitle3,
        subtitle: l10n.onboardingSubtitle3,
        imagePath: getImage(2),
      ),
    ];
  }
}
