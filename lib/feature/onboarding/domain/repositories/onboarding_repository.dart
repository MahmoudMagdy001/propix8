import 'package:propix8/feature/onboarding/domain/entities/onboarding_page_entity.dart';
import 'package:propix8/l10n/app_localizations.dart';

abstract class OnboardingRepository {
  List<OnboardingPageEntity> getOnboardingPages(
    AppLocalizations l10n, {
    List<String>? images,
  });

  Future<void> completeOnboarding();
}
