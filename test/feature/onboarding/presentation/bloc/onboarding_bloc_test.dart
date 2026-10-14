import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:propix8/feature/onboarding/domain/entities/onboarding_page_entity.dart';
import 'package:propix8/feature/onboarding/domain/usecases/complete_onboarding_usecase.dart';
import 'package:propix8/feature/onboarding/domain/usecases/get_onboarding_pages_usecase.dart';
import 'package:propix8/feature/onboarding/presentation/bloc/onboarding_bloc.dart';
import 'package:propix8/feature/onboarding/presentation/bloc/onboarding_event.dart';
import 'package:propix8/feature/onboarding/presentation/bloc/onboarding_state.dart';
import 'package:propix8/l10n/app_localizations.dart';

class MockGetOnboardingPagesUseCase extends Mock
    implements GetOnboardingPagesUseCase {}

class MockCompleteOnboardingUseCase extends Mock
    implements CompleteOnboardingUseCase {}

class MockAppLocalizations extends Mock implements AppLocalizations {}

void main() {
  late MockGetOnboardingPagesUseCase mockGetOnboardingPagesUseCase;
  late MockCompleteOnboardingUseCase mockCompleteOnboardingUseCase;
  late MockAppLocalizations mockAppLocalizations;
  late OnboardingBloc bloc;

  setUp(() {
    mockGetOnboardingPagesUseCase = MockGetOnboardingPagesUseCase();
    mockCompleteOnboardingUseCase = MockCompleteOnboardingUseCase();
    mockAppLocalizations = MockAppLocalizations();
    bloc = OnboardingBloc(
      getOnboardingPagesUseCase: mockGetOnboardingPagesUseCase,
      completeOnboardingUseCase: mockCompleteOnboardingUseCase,
    );
  });

  tearDown(() async {
    await bloc.close();
  });

  const tPages = [
    OnboardingPageEntity(
      title: 'Find Your Dream Home',
      subtitle: 'Explore thousands of verified listings.',
      imagePath: 'assets/images/onboarding.jpg',
    ),
    OnboardingPageEntity(
      title: 'Connect Directly',
      subtitle: 'Reach out to top developers.',
      imagePath: 'assets/images/onboarding.jpg',
    ),
  ];

  test(
    'initial state should be OnboardingState() with 0 pageIndex and empty pages',
    () {
      expect(bloc.state.pageIndex, equals(0));
      expect(bloc.state.pages, isEmpty);
      expect(bloc.state.isCompleted, isFalse);
    },
  );

  group('OnboardingPagesLoaded event', () {
    blocTest<OnboardingBloc, OnboardingState>(
      'emits state with loaded pages',
      build: () {
        when(
          () => mockGetOnboardingPagesUseCase(
            mockAppLocalizations,
            images: any(named: 'images'),
          ),
        ).thenReturn(tPages);
        return bloc;
      },
      act: (bloc) => bloc.add(
        OnboardingEvent.pagesLoaded(
          l10n: mockAppLocalizations,
          images: const ['img1.png'],
        ),
      ),
      expect: () => [const OnboardingState(pages: tPages)],
      verify: (_) {
        verify(
          () => mockGetOnboardingPagesUseCase(
            mockAppLocalizations,
            images: const ['img1.png'],
          ),
        ).called(1);
      },
    );
  });

  group('OnboardingPageIndexChanged event', () {
    blocTest<OnboardingBloc, OnboardingState>(
      'emits state with updated pageIndex',
      build: () => bloc,
      act: (bloc) => bloc.add(const OnboardingEvent.pageIndexChanged(2)),
      expect: () => [const OnboardingState(pageIndex: 2)],
    );
  });

  group('OnboardingCompleted event', () {
    blocTest<OnboardingBloc, OnboardingState>(
      'calls completeOnboardingUseCase and emits isCompleted = true',
      build: () {
        when(() => mockCompleteOnboardingUseCase()).thenAnswer((_) async {});
        return bloc;
      },
      act: (bloc) => bloc.add(const OnboardingEvent.onboardingCompleted()),
      expect: () => [const OnboardingState(isCompleted: true)],
      verify: (_) {
        verify(() => mockCompleteOnboardingUseCase()).called(1);
      },
    );
  });
}
