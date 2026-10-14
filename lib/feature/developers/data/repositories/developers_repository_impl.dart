import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:propix8/core/error/failures.dart';
import 'package:propix8/feature/developers/data/datasources/developers_remote_data_source.dart';
import 'package:propix8/feature/developers/domain/entities/developer_entity.dart';
import 'package:propix8/feature/developers/domain/repositories/developers_repository.dart';

class DevelopersRepositoryImpl implements DevelopersRepository {
  const DevelopersRepositoryImpl(this._remoteDataSource);

  final DevelopersRemoteDataSource _remoteDataSource;

  @override
  Future<Either<Failure, List<DeveloperEntity>>> getDevelopers() async {
    try {
      final response = await _remoteDataSource.getDevelopers();
      if (response.status) {
        return Right(response.data.map((m) => m.toDomain()).toList());
      }
      return Left(ServerFailure(response.message));
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Server error'));
    } on Object catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
