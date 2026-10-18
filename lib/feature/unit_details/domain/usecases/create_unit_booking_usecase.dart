import 'package:propix8/core/functional/result.dart';
import 'package:propix8/feature/unit_details/domain/entities/unit_booking_entity.dart';
import 'package:propix8/feature/unit_details/domain/repositories/unit_details_repository.dart';

class CreateUnitBookingUseCase {
  const CreateUnitBookingUseCase(this._repository);
  final UnitDetailsRepository _repository;

  ResultFuture<UnitBookingResponseEntity> call({
    required int unitId,
    required String name,
    required String email,
    required String phone,
    required String date,
    required String time,
    required String notes,
  }) =>
      _repository.createBooking(
        unitId: unitId,
        name: name,
        email: email,
        phone: phone,
        date: date,
        time: time,
        notes: notes,
      );
}
