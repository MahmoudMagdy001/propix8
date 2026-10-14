import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:propix8/feature/onboarding/domain/entities/onboarding_page_entity.dart';

part 'onboarding_page_model.freezed.dart';
part 'onboarding_page_model.g.dart';

@freezed
abstract class OnboardingPageModel with _$OnboardingPageModel {
  const OnboardingPageModel._();

  const factory OnboardingPageModel({
    required String title,
    required String subtitle,
    required String imagePath,
  }) = _OnboardingPageModel;

  factory OnboardingPageModel.fromJson(Map<String, dynamic> json) =>
      _$OnboardingPageModelFromJson(json);

  factory OnboardingPageModel.fromDomain(OnboardingPageEntity entity) =>
      OnboardingPageModel(
        title: entity.title,
        subtitle: entity.subtitle,
        imagePath: entity.imagePath,
      );

  OnboardingPageEntity toDomain() => OnboardingPageEntity(
    title: title,
    subtitle: subtitle,
    imagePath: imagePath,
  );
}
