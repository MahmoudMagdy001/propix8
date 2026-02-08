import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/contact_request_model.dart';
import '../repositories/contact_repository.dart';
import 'contact_state.dart';

class ContactCubit extends Cubit<ContactState> {
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
