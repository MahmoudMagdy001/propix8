import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:propix8/l10n/app_localizations.dart';

part 'onboarding_event.freezed.dart';

@freezed
abstract class OnboardingEvent with _$OnboardingEvent {
  const factory OnboardingEvent.pagesLoaded({
    required AppLocalizations l10n,
    List<String>? images,
  }) = OnboardingPagesLoaded;

  const factory OnboardingEvent.pageIndexChanged(int index) =
      OnboardingPageIndexChanged;

  const factory OnboardingEvent.onboardingCompleted() = OnboardingCompleted;
}
