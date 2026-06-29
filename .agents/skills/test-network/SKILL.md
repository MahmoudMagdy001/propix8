---
name: test-network
description: Write unit tests for Remote DataSources that use DioService and the core network pattern.
---

When the user asks to write tests for a Remote DataSource or network-related code, follow these guidelines:

1. **File Location**:
   Place the test file at `test/features/<feature_name>/data/datasources/<feature_name>_remote_datasource_test.dart`.

2. **Core Network Pattern**:
   In this codebase, Remote DataSources do not use `Dio` directly. Instead, they depend on `DioService` from `core`.
   - `DioService` methods return `FutureEither<Response<dynamic>>`.
   - The Remote DataSource implementation folds the result:
     - On `Left(failure)`: It **throws** the `Failure`.
     - On `Right(response)`: It parses the JSON and returns the Model.

3. **Testing Strategy**:
   - Mock `DioService` using `mocktail`.
   - **Success Path**: Stub the `DioService` method to return `Right(Response(data: jsonMap, requestOptions: RequestOptions(...)))`. Assert that the datasource returns the correct Model.
   - **Failure Path**: Stub the `DioService` method to return `Left(SomeFailure)`. Assert that the datasource throws that exact `Failure`.

4. **Code Template**:
```dart
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:wassaly/core/services/dio_service.dart';
import 'package:wassaly/core/utils/failure.dart';
import 'package:wassaly/features/<feature_name>/data/datasources/<feature_name>_remote_datasource.dart';
import 'package:wassaly/features/<feature_name>/data/models/<feature_name>_model.dart';

class MockDioService extends Mock implements DioService {}

void main() {
  late MockDioService mockDioService;
  late FeatureRemoteDataSourceImpl dataSource;

  setUp(() {
    mockDioService = MockDioService();
    dataSource = FeatureRemoteDataSourceImpl(mockDioService);
  });

  group('getFeatureData', () {
    const tPath = '/api/feature-path';
    final tResponseData = {
      'status': true,
      'message': 'Success',
      'data': {'id': '1', 'name': 'Test Item'},
    };
    const tModel = FeatureModel(id: '1', name: 'Test Item');
    const tFailure = ServerFailure('Server Error');

    test(
      'should return FeatureModel when DioService returns Right(Response) with success status',
      () async {
        // arrange
        when(() => mockDioService.get(tPath, queryParameters: any(named: 'queryParameters')))
            .thenAnswer(
          (_) async => Right(
            Response(
              data: tResponseData,
              requestOptions: RequestOptions(path: tPath),
            ),
          ),
        );

        // act
        final result = await dataSource.getFeatureData();

        // assert
        expect(result, equals(tModel));
        verify(() => mockDioService.get(tPath, queryParameters: any(named: 'queryParameters'))).called(1);
      },
    );

    test(
      'should throw the Failure when DioService returns Left(Failure)',
      () async {
        // arrange
        when(() => mockDioService.get(tPath, queryParameters: any(named: 'queryParameters')))
            .thenAnswer((_) async => const Left(tFailure));

        // act
        final call = dataSource.getFeatureData;

        // assert
        expect(() => call(), throwsA(equals(tFailure)));
        verify(() => mockDioService.get(tPath, queryParameters: any(named: 'queryParameters'))).called(1);
      },
    );
  });
}
```
