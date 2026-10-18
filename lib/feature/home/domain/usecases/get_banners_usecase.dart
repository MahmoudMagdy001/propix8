import 'package:propix8/core/functional/result.dart';
import 'package:propix8/feature/home/domain/entities/banner_entity.dart';
import 'package:propix8/feature/home/domain/repositories/unit_repository.dart';

class GetBannersUseCase {
  const GetBannersUseCase(this._repository);

  final UnitRepository _repository;

  ResultFuture<List<BannerEntity>> call() => _repository.getBanners();
}
