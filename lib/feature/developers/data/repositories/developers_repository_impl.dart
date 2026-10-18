import 'package:dio/dio.dart';
import 'package:propix8/core/error/failures.dart';
import 'package:propix8/core/functional/result.dart';
import 'package:propix8/feature/developers/data/datasources/developers_remote_data_source.dart';
import 'package:propix8/feature/developers/domain/entities/developer_entity.dart';
import 'package:propix8/feature/developers/domain/repositories/developers_repository.dart';

class DevelopersRepositoryImpl implements DevelopersRepository {
  const DevelopersRepositoryImpl(this._remoteDataSource);

  final DevelopersRemoteDataSource _remoteDataSource;

  @override
  ResultFuture<List<DeveloperEntity>> getDevelopers() async {
    try {
      final response = await _remoteDataSource.getDevelopers();
      if (response.status) {
        return right(response.data.map((m) => m.toDomain()).toList());
      }
      return left(ServerFailure(response.message));
    } on DioException catch (e) {
      return left(ServerFailure(e.message ?? 'Server error'));
    } on Object catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
