import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:propix8/core/error/failures.dart';
import 'package:propix8/core/models/pagination_model.dart';
import 'package:propix8/feature/our_services/data/datasources/our_services_remote_data_source.dart';
import 'package:propix8/feature/our_services/domain/entities/faq_entity.dart';
import 'package:propix8/feature/our_services/domain/entities/service_entity.dart';
import 'package:propix8/feature/our_services/domain/entities/testimonial_entity.dart';
import 'package:propix8/feature/our_services/domain/repositories/our_services_repository.dart';

class OurServicesRepositoryImpl implements OurServicesRepository {
  const OurServicesRepositoryImpl(this._remoteDataSource);

  final OurServicesRemoteDataSource _remoteDataSource;

  @override
  Future<Either<Failure, List<ServiceEntity>>> getOurServices() async {
    try {
      final models = await _remoteDataSource.getOurServices();
      return Right(models.map((m) => m.toDomain()).toList());
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Server error'));
    } on Object catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<FaqEntity>>> getFaqs() async {
    try {
      final models = await _remoteDataSource.getFaqs();
      return Right(models.map((m) => m.toDomain()).toList());
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Server error'));
    } on Object catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, PaginatedResponse<TestimonialEntity>>>
  getTestimonials({int page = 1}) async {
    try {
      final result = await _remoteDataSource.getTestimonials(page: page);
      return Right(
        PaginatedResponse(
          data: result.data.map((m) => m.toDomain()).toList(),
          pagination: result.pagination,
        ),
      );
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Server error'));
    } on Object catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> addTestimonial(String content) async {
    try {
      await _remoteDataSource.addTestimonial(content);
      return const Right(null);
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Server error'));
    } on Object catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateTestimonial(
    int id,
    String content,
  ) async {
    try {
      await _remoteDataSource.updateTestimonial(id, content);
      return const Right(null);
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Server error'));
    } on Object catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteTestimonial(int id) async {
    try {
      await _remoteDataSource.deleteTestimonial(id);
      return const Right(null);
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Server error'));
    } on Object catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
