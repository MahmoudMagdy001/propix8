import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:propix8/feature/compounds/domain/entities/compound_entity.dart';

part 'compounds_state.freezed.dart';

enum CompoundsStatus { initial, loading, success, failure }

@freezed
abstract class CompoundsState with _$CompoundsState {
  const CompoundsState._();

  const factory CompoundsState({
    @Default(CompoundsStatus.initial) CompoundsStatus status,
    @Default([]) List<CompoundEntity> compounds,
    String? errorMessage,
  }) = _CompoundsState;
}
