import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:propix8/core/error/failures.dart';
import 'package:propix8/feature/compound_details/data/datasources/compound_details_remote_data_source.dart';
import 'package:propix8/feature/compound_details/domain/entities/compound_collection_entity.dart';
import 'package:propix8/feature/compound_details/domain/repositories/compound_details_repository.dart';

class CompoundDetailsRepositoryImpl implements CompoundDetailsRepository {
  const CompoundDetailsRepositoryImpl(this._remoteDataSource);

  final CompoundDetailsRemoteDataSource _remoteDataSource;

  @override
  Future<Either<Failure, CompoundCollectionEntity>> getCompoundUnits(
    int id, {
    int? page,
  }) async {
    try {
      final response = await _remoteDataSource.getCompoundUnits(id, page: page);
      return Right(response);
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Server error'));
    } on Object catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
