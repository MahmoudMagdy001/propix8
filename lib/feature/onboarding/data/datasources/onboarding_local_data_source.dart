import 'package:propix8/core/storage/storage_service.dart';

abstract class OnboardingLocalDataSource {
  Future<void> saveOnboardingSeen();
}

class OnboardingLocalDataSourceImpl implements OnboardingLocalDataSource {
  const OnboardingLocalDataSourceImpl(this._storageService);

  final StorageService _storageService;

  @override
  Future<void> saveOnboardingSeen() => _storageService.saveOnboardingSeen();
}
