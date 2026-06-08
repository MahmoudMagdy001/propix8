import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:propix8/feature/compounds/models/compound_model.dart';
import 'package:propix8/feature/compounds/repositories/compound_repository.dart';

enum CompoundsStatus { initial, loading, success, failure }

class CompoundsState extends Equatable {
  const CompoundsState({
    this.status = CompoundsStatus.initial,
    this.compounds = const [],
    this.errorMessage,
  });
  final CompoundsStatus status;
  final List<CompoundModel> compounds;
  final String? errorMessage;

  CompoundsState copyWith({
    CompoundsStatus? status,
    List<CompoundModel>? compounds,
    String? errorMessage,
  }) => CompoundsState(
    status: status ?? this.status,
    compounds: compounds ?? this.compounds,
    errorMessage: errorMessage ?? this.errorMessage,
  );

  @override
  List<Object?> get props => [status, compounds, errorMessage];
}

class CompoundsCubit extends Cubit<CompoundsState> {
  CompoundsCubit(this._repository) : super(const CompoundsState());
  final CompoundsRepository _repository;

  Future<void> fetchCompounds() async {
    emit(state.copyWith(status: CompoundsStatus.loading));
    try {
      final compounds = await _repository.getCompounds();
      if (isClosed) return;
      emit(
        state.copyWith(status: CompoundsStatus.success, compounds: compounds),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: CompoundsStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
