import '../../../core/network/dio_client.dart';
import '../models/contact_request_model.dart';

class ContactService {
  ContactService(this._dioClient);
  final DioClient _dioClient;

  Future<void> sendContactRequest(ContactRequestModel request) async {
    try {
      await _dioClient.post('contact', data: request.toJson());
    } catch (e) {
      rethrow;
    }
  }
}
