import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/developer_model.dart';
import '../repositories/developer_repository.dart';

enum DevelopersStatus { initial, loading, success, failure }

class DevelopersState extends Equatable {
  const DevelopersState({
    this.status = DevelopersStatus.initial,
    this.developers = const [],
    this.errorMessage,
  });
  final DevelopersStatus status;
  final List<DeveloperModel> developers;
  final String? errorMessage;

  DevelopersState copyWith({
    DevelopersStatus? status,
    List<DeveloperModel>? developers,
    String? errorMessage,
  }) => DevelopersState(
    status: status ?? this.status,
    developers: developers ?? this.developers,
    errorMessage: errorMessage ?? this.errorMessage,
  );

  @override
  List<Object?> get props => [status, developers, errorMessage];
}

class DevelopersCubit extends Cubit<DevelopersState> {
  DevelopersCubit(this._repository) : super(const DevelopersState());
  final DevelopersRepository _repository;

  Future<void> fetchDevelopers() async {
    emit(state.copyWith(status: DevelopersStatus.loading));
    try {
      final developers = await _repository.getDevelopers();
      if (isClosed) return;
      emit(
        state.copyWith(
          status: DevelopersStatus.success,
          developers: developers,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: DevelopersStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
