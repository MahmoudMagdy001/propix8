import 'package:dartz/dartz.dart';
import 'package:propix8/core/error/failures.dart';
import 'package:propix8/feature/settings/domain/entities/site_settings_entity.dart';
import 'package:propix8/feature/settings/domain/repositories/settings_repository.dart';

class GetSiteSettingsUseCase {
  const GetSiteSettingsUseCase(this._repository);

  final SettingsRepository _repository;

  Future<Either<Failure, SiteSettingsEntity>> call() =>
      _repository.getSiteSettings();
}
