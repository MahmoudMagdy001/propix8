import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:propix8/feature/onboarding/domain/entities/onboarding_page_entity.dart';

part 'onboarding_state.freezed.dart';

@freezed
abstract class OnboardingState with _$OnboardingState {
  const OnboardingState._();

  const factory OnboardingState({
    @Default(0) int pageIndex,
    @Default([]) List<OnboardingPageEntity> pages,
    @Default(false) bool isCompleted,
  }) = _OnboardingState;
}
