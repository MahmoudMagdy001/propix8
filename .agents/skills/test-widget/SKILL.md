---
name: test-widget
description: Write widget and UI tests in Flutter, handling ScreenUtil, localization, and mocked Blocs.
---

When the user asks to write tests for a Widget or Screen, follow these guidelines and structure:

1. **File Location**:
   Place the test file under `test/features/<feature_name>/presentation/widgets/` or `test/features/<feature_name>/presentation/screens/`.

2. **Dependencies**:
   - Ensure `mocktail` and `bloc_test` are used if mocking Blocs/Cubits.
   - Use `flutter_screenutil` and `wassaly/l10n/app_localizations.dart` (represented by `S.delegate`).

3. **Key Guidelines**:
   - **ScreenUtil & Responsiveness**: Since the project strictly forbids hard-coded pixels and uses `.w`, `.h`, etc., all widget tests **must** be wrapped in `ScreenUtilInit` with a design size matching the project configuration.
   - **Localization**: Widgets use `context.l10n`. Ensure the testable widget wrapper includes `S.localizationsDelegates` and `S.supportedLocales`.
   - **Mocking Blocs**: If the widget/screen reads a Bloc/Cubit:
     - Extend `MockBloc<Event, State>` or `MockCubit<State>`.
     - Always stub both `state` and `stream` before pumping the widget:
       ```dart
       when(() => mockBloc.state).thenReturn(const FeatureState(status: AppStatus.success));
       when(() => mockBloc.stream).thenAnswer((_) => Stream.value(const FeatureState(status: AppStatus.success)));
       ```
   - **Helper Wrapper**: Define a helper `makeTestableWidget` in the test file or a shared test helper to reduce boilerplate.

4. **Code Template**:
```dart
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:wassaly/core/shared/enums/app_status.dart';
import 'package:wassaly/features/<feature_name>/presentation/bloc/<feature_name>_bloc.dart';
import 'package:wassaly/features/<feature_name>/presentation/widgets/<widget_name>.dart';
import 'package:wassaly/l10n/app_localizations.dart';

class MockFeatureBloc extends MockBloc<FeatureEvent, FeatureState> implements FeatureBloc {}

void main() {
  late MockFeatureBloc mockFeatureBloc;

  setUp(() {
    mockFeatureBloc = MockFeatureBloc();
  });

  Widget makeTestableWidget(Widget body) {
    return ScreenUtilInit(
      designSize: const Size(375, 812), // Match project design size
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          localizationsDelegates: S.localizationsDelegates,
          supportedLocales: S.supportedLocales,
          locale: const Locale('en'), // Or default locale
          home: Scaffold(
            body: BlocProvider<FeatureBloc>.value(
              value: mockFeatureBloc,
              child: body,
            ),
          ),
        );
      },
    );
  }

  testWidgets('should render widget with data when state is success', (tester) async {
    // arrange
    when(() => mockFeatureBloc.state).thenReturn(
      const FeatureState(status: AppStatus.success, data: 'Hello World'),
    );
    when(() => mockFeatureBloc.stream).thenAnswer(
      (_) => Stream.value(const FeatureState(status: AppStatus.success, data: 'Hello World')),
    );

    // act
    await tester.pumpWidget(makeTestableWidget(const MyWidget()));
    await tester.pumpAndSettle();

    // assert
    expect(find.text('Hello World'), findsOneWidget);
  });

  testWidgets('should show loading indicator when state is loading', (tester) async {
    // arrange
    when(() => mockFeatureBloc.state).thenReturn(
      const FeatureState(status: AppStatus.loading),
    );
    when(() => mockFeatureBloc.stream).thenAnswer(
      (_) => Stream.value(const FeatureState(status: AppStatus.loading)),
    );

    // act
    await tester.pumpWidget(makeTestableWidget(const MyWidget()));

    // assert
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}
```
