import 'package:dartz/dartz.dart';
import 'package:propix8/core/error/failures.dart';
import 'package:propix8/feature/our_services/domain/entities/service_entity.dart';
import 'package:propix8/feature/our_services/domain/repositories/our_services_repository.dart';

class GetServicesUseCase {
  const GetServicesUseCase(this._repository);

  final OurServicesRepository _repository;

  Future<Either<Failure, List<ServiceEntity>>> call() =>
      _repository.getOurServices();
}
