import 'package:propix8/core/functional/result.dart';
import 'package:propix8/feature/our_services/domain/entities/faq_entity.dart';
import 'package:propix8/feature/our_services/domain/repositories/our_services_repository.dart';

class GetFaqsUseCase {
  const GetFaqsUseCase(this._repository);

  final OurServicesRepository _repository;

  ResultFuture<List<FaqEntity>> call() => _repository.getFaqs();
}
