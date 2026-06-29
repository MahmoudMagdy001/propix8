---
name: test-repo
description: Write unit tests for Repository implementations, mocking data sources and verifying Either results.
---

When the user asks to write tests for a Repository, follow these guidelines and structure:

1. **File Location**:
   Place the test file at `test/features/<feature_name>/data/repositories/<feature_name>_repository_impl_test.dart`.

2. **Dependencies**:
   Use `mocktail` for mocking data sources.

3. **Key Guidelines**:
   - **Mocking DataSources**: Mock the Remote and/or Local DataSources.
   - **Entity vs Model**: DataSources return Models (DTOs), while Repositories return Entities. In the success test, ensure the mock DataSource returns a Model, and assert that the Repository returns `Right(Entity)`. (Remember: Models extend Entities in Clean Architecture).
   - **Error Handling**: Since the repository implementation catches `Failure`s thrown by DataSources, mock the DataSource to throw a specific `Failure` (e.g., `ServerFailure`), and assert that the Repository returns `Left(Failure)`.
   - **Unidirectional Dependency**: Ensure the test only references the repository implementation, its data sources, and the domain entities/failures.

4. **Code Template**:
```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:wassaly/core/utils/failure.dart';
import 'package:wassaly/features/<feature_name>/data/datasources/<feature_name>_remote_datasource.dart';
import 'package:wassaly/features/<feature_name>/data/models/<feature_name>_model.dart';
import 'package:wassaly/features/<feature_name>/data/repositories/<feature_name>_repository_impl.dart';
import 'package:wassaly/features/<feature_name>/domain/entities/<feature_name>.dart';

class MockFeatureRemoteDataSource extends Mock implements FeatureRemoteDataSource {}

void main() {
  late MockFeatureRemoteDataSource mockRemoteDataSource;
  late FeatureRepositoryImpl repository;

  setUp(() {
    mockRemoteDataSource = MockFeatureRemoteDataSource();
    repository = FeatureRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
    );
  });

  group('getFeatureData', () {
    const tModel = FeatureModel(id: '1', name: 'Test');
    const tEntity = Feature(id: '1', name: 'Test');
    const tFailure = ServerFailure('Server Error');

    test(
      'should return remote data (Entity) when the call to remote data source is successful',
      () async {
        // arrange
        when(() => mockRemoteDataSource.getData())
            .thenAnswer((_) async => tModel);

        // act
        final result = await repository.getFeatureData();

        // assert
        verify(() => mockRemoteDataSource.getData()).called(1);
        expect(result, equals(const Right(tEntity)));
      },
    );

    test(
      'should return Left(Failure) when the call to remote data source throws a Failure',
      () async {
        // arrange
        when(() => mockRemoteDataSource.getData())
            .thenThrow(tFailure);

        // act
        final result = await repository.getFeatureData();

        // assert
        verify(() => mockRemoteDataSource.getData()).called(1);
        expect(result, equals(const Left(tFailure)));
      },
    );
  });
}
```
