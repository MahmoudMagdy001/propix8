import 'package:propix8/core/network/dio_client.dart';
import 'package:propix8/feature/contact/data/models/contact_request_model.dart';

abstract class ContactRemoteDataSource {
  Future<void> sendContactRequest(ContactRequestModel request);
}

class ContactRemoteDataSourceImpl implements ContactRemoteDataSource {
  const ContactRemoteDataSourceImpl(this._dioClient);

  final DioClient _dioClient;

  @override
  Future<void> sendContactRequest(ContactRequestModel request) async {
    await _dioClient.post('contact', data: request.toJson());
  }
}
