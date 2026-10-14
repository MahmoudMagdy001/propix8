import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:propix8/core/error/failures.dart';
import 'package:propix8/feature/contact/domain/entities/contact_request_entity.dart';
import 'package:propix8/feature/contact/domain/usecases/send_contact_request_usecase.dart';
import 'package:propix8/feature/contact/presentation/bloc/contact_bloc.dart';
import 'package:propix8/feature/contact/presentation/bloc/contact_event.dart';
import 'package:propix8/feature/contact/presentation/bloc/contact_state.dart';

class MockSendContactRequestUseCase extends Mock
    implements SendContactRequestUseCase {}

void main() {
  late MockSendContactRequestUseCase mockSendContactRequestUseCase;
  late ContactBloc bloc;

  setUpAll(() {
    registerFallbackValue(
      const ContactRequestEntity(
        name: '',
        email: '',
        phone: '',
        address: '',
        message: '',
      ),
    );
  });

  setUp(() {
    mockSendContactRequestUseCase = MockSendContactRequestUseCase();
    bloc = ContactBloc(
      sendContactRequestUseCase: mockSendContactRequestUseCase,
    );
  });

  tearDown(() async {
    await bloc.close();
  });

  const tRequest = ContactRequestEntity(
    name: 'Ahmed',
    email: 'ahmed@example.com',
    phone: '0123456789',
    address: 'Cairo, Egypt',
    message: 'Hello, inquiring about property.',
  );

  test('initial state should be ContactState with initial status', () {
    expect(bloc.state.status, equals(ContactStatus.initial));
    expect(bloc.state.errorMessage, isNull);
    expect(bloc.state.successMessage, isNull);
  });

  group('ContactRequestSubmitted event', () {
    blocTest<ContactBloc, ContactState>(
      'emits [loading, success] when sendContactRequestUseCase succeeds',
      build: () {
        when(
          () => mockSendContactRequestUseCase(any()),
        ).thenAnswer((_) async => const Right(null));
        return bloc;
      },
      act: (bloc) =>
          bloc.add(const ContactEvent.contactRequestSubmitted(tRequest)),
      expect: () => [
        const ContactState(status: ContactStatus.loading),
        const ContactState(
          status: ContactStatus.success,
          successMessage: 'تم إرسال طلبك بنجاح',
        ),
      ],
      verify: (_) {
        verify(() => mockSendContactRequestUseCase(tRequest)).called(1);
      },
    );

    blocTest<ContactBloc, ContactState>(
      'emits [loading, failure] when sendContactRequestUseCase fails',
      build: () {
        when(() => mockSendContactRequestUseCase(any())).thenAnswer(
          (_) async => const Left(ServerFailure('Invalid phone number')),
        );
        return bloc;
      },
      act: (bloc) =>
          bloc.add(const ContactEvent.contactRequestSubmitted(tRequest)),
      expect: () => [
        const ContactState(status: ContactStatus.loading),
        const ContactState(
          status: ContactStatus.failure,
          errorMessage: 'Invalid phone number',
        ),
      ],
      verify: (_) {
        verify(() => mockSendContactRequestUseCase(tRequest)).called(1);
      },
    );
  });

  group('ContactReset event', () {
    blocTest<ContactBloc, ContactState>(
      'resets state to initial ContactState',
      build: () => bloc,
      seed: () => const ContactState(
        status: ContactStatus.success,
        successMessage: 'Success',
      ),
      act: (bloc) => bloc.add(const ContactEvent.reset()),
      expect: () => [const ContactState()],
    );
  });
}
