import 'package:propix8/core/network/dio_client.dart';
import 'package:propix8/feature/settings/data/models/site_settings_model.dart';

abstract interface class SettingsRemoteDataSource {
  Future<SiteSettingsModel> getSiteSettings();
}

class SettingsRemoteDataSourceImpl implements SettingsRemoteDataSource {
  const SettingsRemoteDataSourceImpl(this._dioClient);

  final DioClient _dioClient;

  @override
  Future<SiteSettingsModel> getSiteSettings() async {
    final response = await _dioClient.get('settings');
    final data = response.data as Map<String, dynamic>;
    return SiteSettingsModel.fromJson(data['data'] as Map<String, dynamic>);
  }
}
