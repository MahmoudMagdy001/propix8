import '../../../core/network/dio_client.dart';
import '../models/site_settings_model.dart';

class SettingsService {
  SettingsService(this._dioClient);
  final DioClient _dioClient;

  Future<SiteSettingsModel> getSiteSettings() async {
    final response = await _dioClient.get('settings');
    final data = response.data as Map<String, dynamic>;
    return SiteSettingsModel.fromJson(data['data'] as Map<String, dynamic>);
  }
}
