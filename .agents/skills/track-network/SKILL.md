---
name: track-network
description: Implement and test real-time network tracking and auto-retry in Blocs/Cubits.
---

When the user asks to implement or test network tracking / auto-retry when the internet connection is restored, follow these guidelines:

1. **Implementation Pattern in Blocs/Cubits**:
   - Declare a `StreamSubscription<void>? _connectivitySub` to hold the subscription.
   - In the constructor, subscribe to `sl<InternetConnectionService>().connectivityRestoredStream`.
   - When the stream fires, add events to refresh the data or sync pending offline actions.
   - Override the `close()` method of the Bloc/Cubit and cancel the subscription to prevent memory leaks.

   **Code Example**:
   ```dart
   class FeatureBloc extends Bloc<FeatureEvent, FeatureState> {
     final GetFeatureDataUseCase getFeatureData;
     StreamSubscription<void>? _connectivitySub;

     FeatureBloc(this.getFeatureData) : super(const FeatureState()) {
       on<GetFeatureDataEvent>(_onGetFeatureData);

       _connectivitySub = sl<InternetConnectionService>()
           .connectivityRestoredStream
           .listen((_) {
         add(const GetFeatureDataEvent());
       });
     }

     @override
     Future<void> close() async {
       await _connectivitySub?.cancel();
       return super.close();
     }
   }
   ```

2. **Testing the Network Tracking Behavior**:
   - When testing a Bloc that tracks network, you must mock `InternetConnectionService` and register it in the Service Locator (`sl`).
   - Stub `connectivityRestoredStream` to return a controlled `Stream<void>` (usually using a `StreamController<void>`).
   - Verify that when the stream emits a value, the Bloc executes the expected behavior (e.g., adds the event, which calls the UseCase again).

3. **Testing Code Template**:
```dart
import 'dart:async';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:wassaly/core/imports/imports.dart';
import 'package:wassaly/core/services/internet_connection_service.dart';
import 'package:wassaly/features/<feature_name>/domain/usecases/<usecase_name>.dart';
import 'package:wassaly/features/<feature_name>/presentation/bloc/<feature_name>_bloc.dart';

class MockInternetConnectionService extends Mock implements InternetConnectionService {}
class MockGetFeatureDataUseCase extends Mock implements GetFeatureDataUseCase {}

void main() {
  late MockInternetConnectionService mockConnectionService;
  late MockGetFeatureDataUseCase mockUseCase;
  late StreamController<void> connectivityController;
  late FeatureBloc bloc;

  setUp(() async {
    await sl.reset(); // Clear sl to avoid leakage
    mockConnectionService = MockInternetConnectionService();
    mockUseCase = MockGetFeatureDataUseCase();
    connectivityController = StreamController<void>.broadcast();

    // Stub the connectivityRestoredStream
    when(() => mockConnectionService.connectivityRestoredStream)
        .thenAnswer((_) => connectivityController.stream);

    // Register the mock service in GetIt
    sl.registerSingleton<InternetConnectionService>(mockConnectionService);

    bloc = FeatureBloc(mockUseCase);
  });

  tearDown(() async {
    await bloc.close();
    await connectivityController.close();
    await sl.reset();
  });

  test(
    'should trigger GetFeatureDataEvent and call UseCase when connectivity is restored',
    () async {
      // arrange
      when(() => mockUseCase(any()))
          .thenAnswer((_) async => const Right('data'));

      // act - simulate internet restoration
      connectivityController.add(null);
      
      // Wait for stream event to propagate through the microtask queue
      await Future.delayed(Duration.zero);

      // assert
      verify(() => mockUseCase(any())).called(1);
    },
  );
}
```
