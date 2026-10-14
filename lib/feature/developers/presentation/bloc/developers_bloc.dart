import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:propix8/core/shared/bloc/safe_bloc.dart';
import 'package:propix8/feature/developers/domain/usecases/get_developers_usecase.dart';
import 'package:propix8/feature/developers/presentation/bloc/developers_event.dart';
import 'package:propix8/feature/developers/presentation/bloc/developers_state.dart';

class DevelopersBloc extends SafeBloc<DevelopersEvent, DevelopersState> {
  DevelopersBloc({required GetDevelopersUseCase getDevelopersUseCase})
    : _getDevelopersUseCase = getDevelopersUseCase,
      super(const DevelopersState()) {
    on<DevelopersRequested>(_onDevelopersRequested);
    on<DevelopersRefreshed>(_onDevelopersRefreshed);
  }

  final GetDevelopersUseCase _getDevelopersUseCase;

  Future<void> _onDevelopersRequested(
    DevelopersRequested event,
    Emitter<DevelopersState> emit,
  ) async {
    emit(state.copyWith(status: DevelopersStatus.loading));
    final result = await _getDevelopersUseCase();
    result.fold(
      (failure) => emit(
        state.copyWith(
          status: DevelopersStatus.failure,
          errorMessage: failure.message,
        ),
      ),
      (developers) => emit(
        state.copyWith(
          status: DevelopersStatus.success,
          developers: developers,
        ),
      ),
    );
  }

  Future<void> _onDevelopersRefreshed(
    DevelopersRefreshed event,
    Emitter<DevelopersState> emit,
  ) async {
    final result = await _getDevelopersUseCase();
    result.fold(
      (failure) => emit(
        state.copyWith(
          status: DevelopersStatus.failure,
          errorMessage: failure.message,
        ),
      ),
      (developers) => emit(
        state.copyWith(
          status: DevelopersStatus.success,
          developers: developers,
        ),
      ),
    );
  }
}
