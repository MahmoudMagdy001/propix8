import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:propix8/feature/auth/repositories/address_setup_repository.dart';
import 'package:propix8/feature/auth/repositories/auth_repository.dart';
import 'package:propix8/feature/auth/viewmodels/auth_cubit.dart';
import 'package:propix8/feature/auth/viewmodels/auth_state.dart';

class MockAuthRepository extends Mock implements AuthRepository {}
class MockAddressSetupRepository extends Mock implements AddressSetupRepository {}

void main() {
  late MockAuthRepository mockAuthRepository;
  late MockAddressSetupRepository mockAddressSetupRepository;
  late AuthCubit authCubit;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    mockAddressSetupRepository = MockAddressSetupRepository();
    authCubit = AuthCubit(mockAuthRepository, mockAddressSetupRepository);
  });

  tearDown(() async {
    await authCubit.close();
  });

  test('initial state should be AuthState with initial status', () {
    expect(authCubit.state.authenticationStatus, equals(AuthenticationStatus.unknown));
  });

  group('checkAuthStatus', () {
    blocTest<AuthCubit, AuthState>(
      'emits unauthenticated when user is not logged in',
      build: () {
        when(() => mockAuthRepository.isLoggedIn()).thenReturn(false);
        return authCubit;
      },
      act: (cubit) => cubit.checkAuthStatus(),
      expect: () => [
        const AuthState(authenticationStatus: AuthenticationStatus.unauthenticated),
      ],
      verify: (_) {
        verify(() => mockAuthRepository.isLoggedIn()).called(1);
      },
    );
  });
}
