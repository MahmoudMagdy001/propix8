import 'package:propix8/core/functional/result.dart';
import 'package:propix8/feature/unit_details/domain/entities/unit_details_entity.dart';
import 'package:propix8/feature/unit_details/domain/usecases/get_unit_details_usecase.dart';

class CompareUnitsUseCase {
  const CompareUnitsUseCase(this._getUnitDetailsUseCase);

  final GetUnitDetailsUseCase _getUnitDetailsUseCase;

  ResultFuture<(UnitDetailsEntity, UnitDetailsEntity)> call({
    required int baseUnitId,
    required int selectedUnitId,
  }) async {
    final results = await Future.wait([
      _getUnitDetailsUseCase(baseUnitId),
      _getUnitDetailsUseCase(selectedUnitId),
    ]);

    final baseResult = results[0];
    final selectedResult = results[1];

    return baseResult.fold(
      Left.new,
      (baseUnit) => selectedResult.fold(
        Left.new,
        (selectedUnit) => Right((baseUnit, selectedUnit)),
      ),
    );
  }
}
