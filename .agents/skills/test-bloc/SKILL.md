---
name: test-bloc
description: Write unit tests for Blocs and Cubits using bloc_test and mocktail.
---

When the user asks to write tests for a Bloc or Cubit, follow these guidelines and structure:

1. **File Location**:
   Place the test file at `test/features/<feature_name>/presentation/bloc/<feature_name>_bloc_test.dart` (or `_cubit_test.dart`).

2. **Dependencies**:
   Ensure `bloc_test` and `mocktail` are used. If they are not present in `pubspec.yaml` under `dev_dependencies`, prompt the user to add them.
   - Use `mocktail` for type-safe mocking without code generation.

3. **Key Guidelines**:
   - **Mocking UseCases**: Mock the UseCases that the Bloc depends on.
   - **Either Type Mocking**: Since UseCases return `Either<Failure, T>`, register fallback values in `setUpAll` if you need to use `any()` with `Either`.
   - **`blocTest` Usage**: Always use `blocTest<MyBloc, MyState>` from `package:bloc_test/bloc_test.dart` to verify state emissions.
   - **State Progression**: Ensure you test the full flow: `initial` -> `loading` -> `success` (or `failure`).
   - **Service Locator (`sl`)**: If the Bloc uses `sl` (e.g. via `SafeBlocMixin` which checks `CancelRequestService`), ensure you either mock/register the service or handle `sl` initialization in `setUp` and reset in `tearDown`.

4. **Code Template**:
```dart
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:wassaly/core/utils/failure.dart';
import 'package:wassaly/core/shared/enums/app_status.dart';
import 'package:wassaly/features/<feature_name>/domain/usecases/<usecase_name>.dart';
import 'package:wassaly/features/<feature_name>/presentation/bloc/<feature_name>_bloc.dart';

class MockGetFeatureDataUseCase extends Mock implements GetFeatureDataUseCase {}

void main() {
  late MockGetFeatureDataUseCase mockUseCase;
  late FeatureBloc bloc;

  setUp(() {
    mockUseCase = MockGetFeatureDataUseCase();
    bloc = FeatureBloc(getFeatureData: mockUseCase);
  });

  tearDown(() {
    bloc.close();
  });

  test('initial state should be FeatureState.initial', () {
    expect(bloc.state.status, equals(AppStatus.initial));
  });

  group('GetFeatureDataEvent', () {
    const tData = 'some data';
    const tFailure = ServerFailure('Server Error');

    blocTest<FeatureBloc, FeatureState>(
      'emits [loading, success] when data is fetched successfully',
      build: () {
        when(() => mockUseCase(any()))
            .thenAnswer((_) async => const Right(tData));
        return bloc;
      },
      act: (bloc) => bloc.add(const GetFeatureDataEvent()),
      expect: () => [
        const FeatureState(status: AppStatus.loading),
        const FeatureState(status: AppStatus.success, data: tData),
      ],
      verify: (_) {
        verify(() => mockUseCase(any())).called(1);
      },
    );

    blocTest<FeatureBloc, FeatureState>(
      'emits [loading, failure] when fetching data fails',
      build: () {
        when(() => mockUseCase(any()))
            .thenAnswer((_) async => const Left(tFailure));
        return bloc;
      },
      act: (bloc) => bloc.add(const GetFeatureDataEvent()),
      expect: () => [
        const FeatureState(status: AppStatus.loading),
        const FeatureState(
          status: AppStatus.failure,
          errorMessage: 'Server Error',
        ),
      ],
    );
  });
}
```
