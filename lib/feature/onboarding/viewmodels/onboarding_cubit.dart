import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../l10n/app_localizations.dart';
import '../repositories/onboarding_repository.dart';
import 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit(this._repository) : super(const OnboardingState());
  final OnboardingRepository _repository;

  void loadPages(AppLocalizations l10n, {List<String>? images}) {
    // This connects the Repo to the State
    final pages = _repository.getOnboardingData(l10n, images: images);
    emit(state.copyWith(pages: pages));
  }

  void updatePageIndex(int index) {
    emit(state.copyWith(pageIndex: index));
  }
}
