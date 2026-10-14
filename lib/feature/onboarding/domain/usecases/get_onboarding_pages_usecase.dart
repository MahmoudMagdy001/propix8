import 'package:propix8/feature/onboarding/domain/entities/onboarding_page_entity.dart';
import 'package:propix8/feature/onboarding/domain/repositories/onboarding_repository.dart';
import 'package:propix8/l10n/app_localizations.dart';

class GetOnboardingPagesUseCase {
  const GetOnboardingPagesUseCase(this._repository);

  final OnboardingRepository _repository;

  List<OnboardingPageEntity> call(
    AppLocalizations l10n, {
    List<String>? images,
  }) => _repository.getOnboardingPages(l10n, images: images);
}
