import 'package:freezed_annotation/freezed_annotation.dart';

part 'onboarding_page_entity.freezed.dart';

@freezed
abstract class OnboardingPageEntity with _$OnboardingPageEntity {
  const factory OnboardingPageEntity({
    required String title,
    required String subtitle,
    required String imagePath,
  }) = _OnboardingPageEntity;
}
