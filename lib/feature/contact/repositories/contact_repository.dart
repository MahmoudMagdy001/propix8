import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:propix8/feature/contact/models/contact_request_model.dart';
import 'package:propix8/feature/contact/services/contact_service.dart';

abstract class ContactRepository {
  Future<Either<String, void>> sendContactRequest(ContactRequestModel request);
}

class ContactRepositoryImpl implements ContactRepository {
  ContactRepositoryImpl(this._contactService);
  final ContactService _contactService;

  @override
  Future<Either<String, void>> sendContactRequest(
    ContactRequestModel request,
  ) async {
    try {
      await _contactService.sendContactRequest(request);
      return const Right(null);
    } on DioException catch (e) {
      return Left(_handleError(e));
    } on Object catch (e) {
      return Left(e.toString());
    }
  }

  String _handleError(DioException e) {
    final responseData = e.response?.data;
    if (responseData != null && responseData is Map) {
      final message = responseData['message'];
      if (message != null) return message.toString();
    }
    return e.message ?? 'Something went wrong';
  }
}
