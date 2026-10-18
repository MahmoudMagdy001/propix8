import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:propix8/core/error/failures.dart';
import 'package:propix8/feature/auth/data/models/auth_model.dart';
import 'package:propix8/feature/auth/domain/repositories/address_setup_repository.dart';
import 'package:propix8/feature/auth/domain/repositories/auth_repository.dart';
import 'package:propix8/feature/auth/domain/usecases/get_auth_profile_usecase.dart';
import 'package:propix8/feature/auth/domain/usecases/login_usecase.dart';
import 'package:propix8/feature/auth/domain/usecases/logout_usecase.dart';
import 'package:propix8/feature/auth/domain/usecases/register_usecase.dart';
import 'package:propix8/feature/auth/domain/usecases/resend_verification_email_usecase.dart';
import 'package:propix8/feature/auth/domain/usecases/verify_email_usecase.dart';
import 'package:propix8/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:propix8/feature/auth/presentation/bloc/auth_event.dart';
import 'package:propix8/feature/auth/presentation/bloc/auth_state.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

class MockAddressSetupRepository extends Mock
    implements AddressSetupRepository {}

class MockLoginUseCase extends Mock implements LoginUseCase {}

class MockRegisterUseCase extends Mock implements RegisterUseCase {}

class MockLogoutUseCase extends Mock implements LogoutUseCase {}

class MockResendVerificationEmailUseCase extends Mock
    implements ResendVerificationEmailUseCase {}

class MockVerifyEmailUseCase extends Mock implements VerifyEmailUseCase {}

class MockGetAuthProfileUseCase extends Mock implements GetAuthProfileUseCase {}

void main() {
  late MockAuthRepository mockAuthRepository;
  late MockAddressSetupRepository mockAddressSetupRepository;
  late MockLoginUseCase mockLoginUseCase;
  late MockLogoutUseCase mockLogoutUseCase;
  late MockGetAuthProfileUseCase mockGetAuthProfileUseCase;
  late AuthBloc authBloc;

  setUpAll(() {
    registerFallbackValue(const LoginRequest(email: '', password: ''));
  });

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    mockAddressSetupRepository = MockAddressSetupRepository();
    mockLoginUseCase = MockLoginUseCase();
    mockLogoutUseCase = MockLogoutUseCase();
    mockGetAuthProfileUseCase = MockGetAuthProfileUseCase();

    when(() => mockAuthRepository.isTokenExpired()).thenReturn(false);

    authBloc = AuthBloc(
      authRepository: mockAuthRepository,
      addressSetupRepository: mockAddressSetupRepository,
      loginUseCase: mockLoginUseCase,
      logoutUseCase: mockLogoutUseCase,
      getAuthProfileUseCase: mockGetAuthProfileUseCase,
    );
  });

  tearDown(() async {
    await authBloc.close();
  });

  test('initial state should be AuthState with unknown authenticationStatus', () {
    expect(
      authBloc.state.authenticationStatus,
      equals(AuthenticationStatus.unknown),
    );
  });

  group('CheckAuthStatusRequested', () {
    blocTest<AuthBloc, AuthState>(
      'emits unauthenticated when user is not logged in',
      build: () {
        when(() => mockAuthRepository.isLoggedIn()).thenReturn(false);
        return authBloc;
      },
      act: (bloc) => bloc.add(const AuthEvent.checkAuthStatusRequested()),
      expect: () => [
        const AuthState(
          authenticationStatus: AuthenticationStatus.unauthenticated,
        ),
      ],
      verify: (_) {
        verify(() => mockAuthRepository.isLoggedIn()).called(1);
      },
    );

    blocTest<AuthBloc, AuthState>(
      'emits authenticated when user is logged in with user and completed address',
      build: () {
        const user = User(
          id: 1,
          name: 'Test',
          email: 'test@example.com',
          cityId: 10,
          address: '123 Main St',
        );
        when(() => mockAuthRepository.isLoggedIn()).thenReturn(true);
        when(() => mockAuthRepository.getCachedUser()).thenReturn(user);
        when(() => mockGetAuthProfileUseCase()).thenAnswer((_) async => const Right(user));
        return authBloc;
      },
      act: (bloc) => bloc.add(const AuthEvent.checkAuthStatusRequested()),
      expect: () => [
        const AuthState(
          status: AuthRequestStatus.success,
          authenticationStatus: AuthenticationStatus.authenticated,
          user: User(
            id: 1,
            name: 'Test',
            email: 'test@example.com',
            cityId: 10,
            address: '123 Main St',
          ),
        ),
      ],
      verify: (_) {
        verify(() => mockAuthRepository.isLoggedIn()).called(1);
      },
    );
  });

  group('LoginRequested', () {
    blocTest<AuthBloc, AuthState>(
      'emits loading and authenticated on successful login',
      build: () {
        const user = User(id: 1, name: 'User', email: 'user@example.com', address: 'City Road');
        const response = AuthResponse(token: 'token123', user: user);
        when(() => mockLoginUseCase(any())).thenAnswer((_) async => const Right(response));
        when(() => mockGetAuthProfileUseCase()).thenAnswer((_) async => const Right(user));
        return authBloc;
      },
      act: (bloc) => bloc.add(
        const AuthEvent.loginRequested(
          email: 'user@example.com',
          password: 'password',
        ),
      ),
      expect: () => [
        const AuthState(status: AuthRequestStatus.loading),
        const AuthState(
          status: AuthRequestStatus.success,
          authenticationStatus: AuthenticationStatus.authenticated,
          user: User(id: 1, name: 'User', email: 'user@example.com', address: 'City Road'),
        ),
      ],
    );

    blocTest<AuthBloc, AuthState>(
      'emits loading and failure on login failure',
      build: () {
        when(() => mockLoginUseCase(any())).thenAnswer(
          (_) async => const Left(ServerFailure('Invalid credentials')),
        );
        return authBloc;
      },
      act: (bloc) => bloc.add(
        const AuthEvent.loginRequested(
          email: 'user@example.com',
          password: 'wrong',
        ),
      ),
      expect: () => [
        const AuthState(status: AuthRequestStatus.loading),
        const AuthState(
          status: AuthRequestStatus.failure,
          errorMessage: 'Invalid credentials',
        ),
      ],
    );
  });

  group('LogoutRequested', () {
    blocTest<AuthBloc, AuthState>(
      'emits unauthenticated on logout',
      build: () {
        when(() => mockLogoutUseCase()).thenAnswer((_) async => const Right<Failure, Unit>(unit));
        return authBloc;
      },
      act: (bloc) => bloc.add(const AuthEvent.logoutRequested()),
      expect: () => [
        const AuthState(
          authenticationStatus: AuthenticationStatus.unauthenticated,
        ),
      ],
    );
  });
}
