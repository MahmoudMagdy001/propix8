import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:propix8/core/error/failures.dart';
import 'package:propix8/feature/compounds/data/datasources/compounds_remote_data_source.dart';
import 'package:propix8/feature/compounds/domain/entities/compound_entity.dart';
import 'package:propix8/feature/compounds/domain/repositories/compounds_repository.dart';

class CompoundsRepositoryImpl implements CompoundsRepository {
  const CompoundsRepositoryImpl(this._remoteDataSource);

  final CompoundsRemoteDataSource _remoteDataSource;

  @override
  Future<Either<Failure, List<CompoundEntity>>> getCompounds() async {
    try {
      final response = await _remoteDataSource.getCompounds();
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
