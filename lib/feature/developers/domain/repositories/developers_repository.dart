import 'package:propix8/core/functional/result.dart';
import 'package:propix8/feature/developers/domain/entities/developer_entity.dart';

abstract class DevelopersRepository {
  ResultFuture<List<DeveloperEntity>> getDevelopers();
}
