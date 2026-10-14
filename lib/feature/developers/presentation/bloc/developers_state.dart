import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:propix8/feature/developers/domain/entities/developer_entity.dart';

part 'developers_state.freezed.dart';

enum DevelopersStatus { initial, loading, success, failure }

@freezed
abstract class DevelopersState with _$DevelopersState {
  const DevelopersState._();

  const factory DevelopersState({
    @Default(DevelopersStatus.initial) DevelopersStatus status,
    @Default([]) List<DeveloperEntity> developers,
    String? errorMessage,
  }) = _DevelopersState;
}
