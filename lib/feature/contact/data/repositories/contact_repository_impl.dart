import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:propix8/core/error/failures.dart';
import 'package:propix8/feature/contact/data/datasources/contact_remote_data_source.dart';
import 'package:propix8/feature/contact/data/models/contact_request_model.dart';
import 'package:propix8/feature/contact/domain/entities/contact_request_entity.dart';
import 'package:propix8/feature/contact/domain/repositories/contact_repository.dart';

class ContactRepositoryImpl implements ContactRepository {
  const ContactRepositoryImpl(this._remoteDataSource);

  final ContactRemoteDataSource _remoteDataSource;

  @override
  Future<Either<Failure, void>> sendContactRequest(
    ContactRequestEntity request,
  ) async {
    try {
      final model = ContactRequestModel.fromDomain(request);
      await _remoteDataSource.sendContactRequest(model);
      return const Right(null);
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } on Object catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  Failure _handleDioError(DioException e) {
    final responseData = e.response?.data;
    if (responseData != null && responseData is Map) {
      final message = responseData['message'];
      if (message != null) return ServerFailure(message.toString());
    }
    return ServerFailure(e.message ?? 'Something went wrong');
  }
}
