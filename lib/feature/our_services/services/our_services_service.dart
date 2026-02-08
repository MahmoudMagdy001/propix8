import '../../../../core/models/pagination_model.dart';
import '../../../../core/network/dio_client.dart';
import '../models/faq_model.dart';
import '../models/service_model.dart';
import '../models/testimonial_model.dart';

class OurServicesService {
  OurServicesService(this._dioClient);
  final DioClient _dioClient;

  Future<List<ServiceModel>> getOurServices() async {
    final response = await _dioClient.get('services');
    final responseData = response.data as Map<String, dynamic>;
    final List data = responseData['data'];
    return data
        .map((json) => ServiceModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  Future<List<FaqModel>> getFaqs() async {
    final response = await _dioClient.get('faqs');
    final responseData = response.data as Map<String, dynamic>;
    final List data = responseData['data'];
    return data
        .map((json) => FaqModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  Future<PaginatedResponse<TestimonialModel>> getTestimonials({
    int page = 1,
  }) async {
    final response = await _dioClient.get(
      'testimonials',
      queryParameters: {'page': page},
    );
    final responseData = response.data as Map<String, dynamic>;
    final List data = responseData['data'];
    final paginationJson = responseData['pagination'] as Map<String, dynamic>?;

    return PaginatedResponse(
      data: data
          .map(
            (json) => TestimonialModel.fromJson(json as Map<String, dynamic>),
          )
          .toList(),
      pagination: PaginationModel.fromJson(paginationJson),
    );
  }

  Future<void> addTestimonial(String content) async {
    await _dioClient.post('testimonials', data: {'content': content});
  }

  Future<void> updateTestimonial(int id, String content) async {
    await _dioClient.post(
      'testimonials/$id',
      data: {'content': content, '_method': 'PUT'},
    );
  }

  Future<void> deleteTestimonial(int id) async {
    await _dioClient.delete('testimonials/$id');
  }
}
