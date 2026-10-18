import 'package:propix8/core/shared/bloc/safe_bloc.dart';
import 'package:propix8/feature/contact/domain/usecases/send_contact_request_usecase.dart';
import 'package:propix8/feature/contact/presentation/bloc/contact_event.dart';
import 'package:propix8/feature/contact/presentation/bloc/contact_state.dart';

class ContactBloc extends SafeBloc<ContactEvent, ContactState> {
  ContactBloc({required SendContactRequestUseCase sendContactRequestUseCase})
    : _sendContactRequestUseCase = sendContactRequestUseCase,
      super(const ContactState()) {
    on<ContactRequestSubmitted>(_onContactRequestSubmitted);
    on<ContactReset>(_onContactReset);
  }

  final SendContactRequestUseCase _sendContactRequestUseCase;

  Future<void> _onContactRequestSubmitted(
    ContactRequestSubmitted event,
    Emitter<ContactState> emit,
  ) async {
    emit(state.copyWith(status: ContactStatus.loading));

    final result = await _sendContactRequestUseCase(event.request);

    result.fold(
      (failure) => emit(
        state.copyWith(
          status: ContactStatus.failure,
          errorMessage: failure.message,
        ),
      ),
      (_) => emit(
        state.copyWith(
          status: ContactStatus.success,
          successMessage: 'تم إرسال طلبك بنجاح',
        ),
      ),
    );
  }

  void _onContactReset(ContactReset event, Emitter<ContactState> emit) {
    emit(const ContactState());
  }
}
