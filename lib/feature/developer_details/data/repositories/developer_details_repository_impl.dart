import 'package:dio/dio.dart';
import 'package:propix8/core/error/failures.dart';
import 'package:propix8/core/functional/result.dart';
import 'package:propix8/feature/developer_details/data/datasources/developer_details_remote_data_source.dart';
import 'package:propix8/feature/developer_details/domain/entities/developer_collection_entity.dart';
import 'package:propix8/feature/developer_details/domain/repositories/developer_details_repository.dart';

class DeveloperDetailsRepositoryImpl implements DeveloperDetailsRepository {
  const DeveloperDetailsRepositoryImpl(this._remoteDataSource);

  final DeveloperDetailsRemoteDataSource _remoteDataSource;

  @override
  ResultFuture<DeveloperCollectionEntity> getDeveloperUnits(
    int id, {
    int? page,
  }) async {
    try {
      final response =
          await _remoteDataSource.getDeveloperUnits(id, page: page);
      return right(response.toEntity());
    } on DioException catch (e) {
      return left(ServerFailure(e.message ?? 'Server error'));
    } on Object catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
