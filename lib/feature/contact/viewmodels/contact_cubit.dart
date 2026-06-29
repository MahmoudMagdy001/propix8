import 'package:propix8/core/shared/bloc/safe_bloc.dart';

import 'package:propix8/feature/contact/models/contact_request_model.dart';
import 'package:propix8/feature/contact/repositories/contact_repository.dart';
import 'package:propix8/feature/contact/viewmodels/contact_state.dart';

class ContactCubit extends SafeCubit<ContactState> {
  ContactCubit(this._contactRepository) : super(const ContactState());

  final ContactRepository _contactRepository;

  Future<void> sendContactRequest(ContactRequestModel request) async {
    emit(state.copyWith(status: ContactStatus.loading));

    final result = await _contactRepository.sendContactRequest(request);
    if (isClosed) return;

    result.fold(
      (error) => emit(
        state.copyWith(status: ContactStatus.failure, errorMessage: error),
      ),
      (_) => emit(
        state.copyWith(
          status: ContactStatus.success,
          successMessage: 'تم إرسال طلبك بنجاح', // Default Arabic message
        ),
      ),
    );
  }

  void reset() {
    emit(const ContactState());
  }
}
