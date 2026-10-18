import 'package:propix8/core/functional/result.dart';
import 'package:propix8/feature/settings/domain/entities/site_settings_entity.dart';
import 'package:propix8/feature/settings/domain/repositories/settings_repository.dart';

class GetSiteSettingsUseCase {
  const GetSiteSettingsUseCase(this._repository);

  final SettingsRepository _repository;

  ResultFuture<SiteSettingsEntity> call() =>
      _repository.getSiteSettings();
}
