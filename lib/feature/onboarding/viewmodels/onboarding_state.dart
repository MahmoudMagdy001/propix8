import 'package:equatable/equatable.dart';
import '../models/onboarding_model.dart';

class OnboardingState extends Equatable {
  const OnboardingState({this.pageIndex = 0, this.pages = const []});
  final int pageIndex;
  final List<OnboardingModel> pages;

  OnboardingState copyWith({int? pageIndex, List<OnboardingModel>? pages}) =>
      OnboardingState(
        pageIndex: pageIndex ?? this.pageIndex,
        pages: pages ?? this.pages,
      );

  @override
  List<Object> get props => [pageIndex, pages];
}
