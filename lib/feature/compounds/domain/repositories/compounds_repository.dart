import 'package:propix8/core/functional/result.dart';
import 'package:propix8/feature/compounds/domain/entities/compound_entity.dart';

abstract class CompoundsRepository {
  ResultFuture<List<CompoundEntity>> getCompounds();
}
