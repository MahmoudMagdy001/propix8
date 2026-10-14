import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:propix8/core/shared/bloc/safe_bloc.dart';
import 'package:propix8/feature/compounds/domain/usecases/get_compounds_usecase.dart';
import 'package:propix8/feature/compounds/presentation/bloc/compounds_event.dart';
import 'package:propix8/feature/compounds/presentation/bloc/compounds_state.dart';

class CompoundsBloc extends SafeBloc<CompoundsEvent, CompoundsState> {
  CompoundsBloc({required GetCompoundsUseCase getCompoundsUseCase})
    : _getCompoundsUseCase = getCompoundsUseCase,
      super(const CompoundsState()) {
    on<CompoundsRequested>(_onCompoundsRequested);
    on<CompoundsRefreshed>(_onCompoundsRefreshed);
  }

  final GetCompoundsUseCase _getCompoundsUseCase;

  Future<void> _onCompoundsRequested(
    CompoundsRequested event,
    Emitter<CompoundsState> emit,
  ) async {
    emit(state.copyWith(status: CompoundsStatus.loading));
    final result = await _getCompoundsUseCase();
    result.fold(
      (failure) => emit(
        state.copyWith(
          status: CompoundsStatus.failure,
          errorMessage: failure.message,
        ),
      ),
      (compounds) => emit(
        state.copyWith(status: CompoundsStatus.success, compounds: compounds),
      ),
    );
  }

  Future<void> _onCompoundsRefreshed(
    CompoundsRefreshed event,
    Emitter<CompoundsState> emit,
  ) async {
    final result = await _getCompoundsUseCase();
    result.fold(
      (failure) => emit(
        state.copyWith(
          status: CompoundsStatus.failure,
          errorMessage: failure.message,
        ),
      ),
      (compounds) => emit(
        state.copyWith(status: CompoundsStatus.success, compounds: compounds),
      ),
    );
  }
}
