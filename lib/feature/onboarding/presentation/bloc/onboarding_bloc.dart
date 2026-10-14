import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:propix8/core/shared/bloc/safe_bloc.dart';
import 'package:propix8/feature/onboarding/domain/usecases/complete_onboarding_usecase.dart';
import 'package:propix8/feature/onboarding/domain/usecases/get_onboarding_pages_usecase.dart';
import 'package:propix8/feature/onboarding/presentation/bloc/onboarding_event.dart';
import 'package:propix8/feature/onboarding/presentation/bloc/onboarding_state.dart';

class OnboardingBloc extends SafeBloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc({
    required GetOnboardingPagesUseCase getOnboardingPagesUseCase,
    required CompleteOnboardingUseCase completeOnboardingUseCase,
  }) : _getOnboardingPagesUseCase = getOnboardingPagesUseCase,
       _completeOnboardingUseCase = completeOnboardingUseCase,
       super(const OnboardingState()) {
    on<OnboardingPagesLoaded>(_onPagesLoaded);
    on<OnboardingPageIndexChanged>(_onPageIndexChanged);
    on<OnboardingCompleted>(_onCompleted);
  }

  final GetOnboardingPagesUseCase _getOnboardingPagesUseCase;
  final CompleteOnboardingUseCase _completeOnboardingUseCase;

  void _onPagesLoaded(
    OnboardingPagesLoaded event,
    Emitter<OnboardingState> emit,
  ) {
    final pages = _getOnboardingPagesUseCase(event.l10n, images: event.images);
    emit(state.copyWith(pages: pages));
  }

  void _onPageIndexChanged(
    OnboardingPageIndexChanged event,
    Emitter<OnboardingState> emit,
  ) {
    emit(state.copyWith(pageIndex: event.index));
  }

  Future<void> _onCompleted(
    OnboardingCompleted event,
    Emitter<OnboardingState> emit,
  ) async {
    await _completeOnboardingUseCase();
    emit(state.copyWith(isCompleted: true));
  }
}
