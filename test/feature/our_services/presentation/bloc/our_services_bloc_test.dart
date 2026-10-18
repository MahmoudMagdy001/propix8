import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:propix8/core/error/failures.dart';
import 'package:propix8/core/models/pagination_model.dart';
import 'package:propix8/feature/our_services/domain/entities/faq_entity.dart';
import 'package:propix8/feature/our_services/domain/entities/service_entity.dart';
import 'package:propix8/feature/our_services/domain/entities/testimonial_entity.dart';
import 'package:propix8/feature/our_services/domain/usecases/add_testimonial_usecase.dart';
import 'package:propix8/feature/our_services/domain/usecases/delete_testimonial_usecase.dart';
import 'package:propix8/feature/our_services/domain/usecases/get_faqs_usecase.dart';
import 'package:propix8/feature/our_services/domain/usecases/get_services_usecase.dart';
import 'package:propix8/feature/our_services/domain/usecases/get_testimonials_usecase.dart';
import 'package:propix8/feature/our_services/domain/usecases/update_testimonial_usecase.dart';
import 'package:propix8/feature/our_services/presentation/bloc/our_services_bloc.dart';
import 'package:propix8/feature/our_services/presentation/bloc/our_services_event.dart';
import 'package:propix8/feature/our_services/presentation/bloc/our_services_state.dart';

class MockGetServicesUseCase extends Mock implements GetServicesUseCase {}

class MockGetFaqsUseCase extends Mock implements GetFaqsUseCase {}

class MockGetTestimonialsUseCase extends Mock
    implements GetTestimonialsUseCase {}

class MockAddTestimonialUseCase extends Mock implements AddTestimonialUseCase {}

class MockUpdateTestimonialUseCase extends Mock
    implements UpdateTestimonialUseCase {}

class MockDeleteTestimonialUseCase extends Mock
    implements DeleteTestimonialUseCase {}

void main() {
  late MockGetServicesUseCase mockGetServicesUseCase;
  late MockGetFaqsUseCase mockGetFaqsUseCase;
  late MockGetTestimonialsUseCase mockGetTestimonialsUseCase;
  late MockAddTestimonialUseCase mockAddTestimonialUseCase;
  late MockUpdateTestimonialUseCase mockUpdateTestimonialUseCase;
  late MockDeleteTestimonialUseCase mockDeleteTestimonialUseCase;
  late OurServicesBloc bloc;

  setUp(() {
    mockGetServicesUseCase = MockGetServicesUseCase();
    mockGetFaqsUseCase = MockGetFaqsUseCase();
    mockGetTestimonialsUseCase = MockGetTestimonialsUseCase();
    mockAddTestimonialUseCase = MockAddTestimonialUseCase();
    mockUpdateTestimonialUseCase = MockUpdateTestimonialUseCase();
    mockDeleteTestimonialUseCase = MockDeleteTestimonialUseCase();

    bloc = OurServicesBloc(
      getServicesUseCase: mockGetServicesUseCase,
      getFaqsUseCase: mockGetFaqsUseCase,
      getTestimonialsUseCase: mockGetTestimonialsUseCase,
      addTestimonialUseCase: mockAddTestimonialUseCase,
      updateTestimonialUseCase: mockUpdateTestimonialUseCase,
      deleteTestimonialUseCase: mockDeleteTestimonialUseCase,
    );
  });

  tearDown(() async {
    await bloc.close();
  });

  final tServices = [
    const ServiceEntity(
      id: 1,
      name: 'Evaluation',
      description: 'Property evaluation service',
      icon: 'icon1',
    ),
  ];

  final tFaqs = [
    const FaqEntity(
      id: 1,
      question: 'How to buy?',
      answer: 'Contact our sales team.',
    ),
  ];

  final tTestimonials = PaginatedResponse<TestimonialEntity>(
    data: [
      TestimonialEntity(
        id: 1,
        name: 'John Doe',
        position: 'Investor',
        content: 'Great experience!',
        image: 'https://example.com/avatar.png',
        status: true,
        createdAt: DateTime(2025),
        updatedAt: DateTime(2025),
      ),
    ],
    pagination: const PaginationModel(
      perPage: 1,
      total: 2,
      lastPage: 2,
    ),
  );

  test('initial state should be OurServicesState with initial status', () {
    expect(bloc.state.status, equals(OurServicesStatus.initial));
    expect(bloc.state.services, isEmpty);
    expect(bloc.state.faqs, isEmpty);
    expect(bloc.state.testimonials, isNull);
    expect(bloc.state.errorMessage, isNull);
  });

  group('OurServicesDataRequested event', () {
    blocTest<OurServicesBloc, OurServicesState>(
      'emits [loading, success] when all calls succeed',
      build: () {
        when(
          () => mockGetServicesUseCase(),
        ).thenAnswer((_) async => Right(tServices));
        when(() => mockGetFaqsUseCase()).thenAnswer((_) async => Right(tFaqs));
        when(
          () => mockGetTestimonialsUseCase(),
        ).thenAnswer((_) async => Right(tTestimonials));
        return bloc;
      },
      act: (bloc) => bloc.add(const OurServicesEvent.dataRequested()),
      expect: () => [
        const OurServicesState(status: OurServicesStatus.loading),
        OurServicesState(
          status: OurServicesStatus.success,
          services: tServices,
          faqs: tFaqs,
          testimonials: tTestimonials,
        ),
      ],
      verify: (_) {
        verify(() => mockGetServicesUseCase()).called(1);
        verify(() => mockGetFaqsUseCase()).called(1);
        verify(() => mockGetTestimonialsUseCase()).called(1);
      },
    );

    blocTest<OurServicesBloc, OurServicesState>(
      'emits [loading, failure] when getServices fails',
      build: () {
        when(() => mockGetServicesUseCase()).thenAnswer(
          (_) async => const Left(ServerFailure('Failed to load services')),
        );
        when(() => mockGetFaqsUseCase()).thenAnswer((_) async => Right(tFaqs));
        when(
          () => mockGetTestimonialsUseCase(),
        ).thenAnswer((_) async => Right(tTestimonials));
        return bloc;
      },
      act: (bloc) => bloc.add(const OurServicesEvent.dataRequested()),
      expect: () => [
        const OurServicesState(status: OurServicesStatus.loading),
        const OurServicesState(
          status: OurServicesStatus.failure,
          errorMessage: 'Failed to load services',
        ),
      ],
    );

    blocTest<OurServicesBloc, OurServicesState>(
      'only loads testimonials when loadServices and loadFaqs are false',
      build: () {
        when(
          () => mockGetTestimonialsUseCase(),
        ).thenAnswer((_) async => Right(tTestimonials));
        return bloc;
      },
      act: (bloc) => bloc.add(
        const OurServicesEvent.dataRequested(
          loadServices: false,
          loadFaqs: false,
        ),
      ),
      expect: () => [
        const OurServicesState(status: OurServicesStatus.loading),
        OurServicesState(
          status: OurServicesStatus.success,
          testimonials: tTestimonials,
        ),
      ],
      verify: (_) {
        verifyNever(() => mockGetServicesUseCase());
        verifyNever(() => mockGetFaqsUseCase());
        verify(() => mockGetTestimonialsUseCase()).called(1);
      },
    );
  });

  group('OurServicesMoreTestimonialsRequested event', () {
    final tPage2Testimonials = PaginatedResponse<TestimonialEntity>(
      data: [
        TestimonialEntity(
          id: 2,
          name: 'Jane Doe',
          position: 'Architect',
          content: 'Excellent service!',
          image: 'https://example.com/avatar2.png',
          status: true,
          createdAt: DateTime(2025, 1, 2),
          updatedAt: DateTime(2025, 1, 2),
        ),
      ],
      pagination: const PaginationModel(
        currentPage: 2,
        perPage: 1,
        total: 2,
        lastPage: 2,
      ),
    );

    blocTest<OurServicesBloc, OurServicesState>(
      'appends testimonials on page 2',
      seed: () => OurServicesState(
        status: OurServicesStatus.success,
        testimonials: tTestimonials,
      ),
      build: () {
        when(
          () => mockGetTestimonialsUseCase(page: 2),
        ).thenAnswer((_) async => Right(tPage2Testimonials));
        return bloc;
      },
      act: (bloc) =>
          bloc.add(const OurServicesEvent.moreTestimonialsRequested()),
      expect: () => [
        OurServicesState(
          status: OurServicesStatus.success,
          testimonials: tTestimonials,
          isMoreLoading: true,
        ),
        OurServicesState(
          status: OurServicesStatus.success,
          testimonials: PaginatedResponse<TestimonialEntity>(
            data: [...tTestimonials.data, ...tPage2Testimonials.data],
            pagination: tPage2Testimonials.pagination,
          ),
        ),
      ],
      verify: (_) {
        verify(() => mockGetTestimonialsUseCase(page: 2)).called(1);
      },
    );
  });

  group('Testimonial mutations', () {
    blocTest<OurServicesBloc, OurServicesState>(
      'adds testimonial successfully and reloads data',
      build: () {
        when(
          () => mockAddTestimonialUseCase('Great app!'),
        ).thenAnswer((_) async => const Right(unit));
        when(
          () => mockGetTestimonialsUseCase(),
        ).thenAnswer((_) async => Right(tTestimonials));
        return bloc;
      },
      act: (bloc) =>
          bloc.add(const OurServicesEvent.testimonialAdded('Great app!')),
      expect: () => [
        const OurServicesState(addTestimonialStatus: OurServicesStatus.loading),
        const OurServicesState(addTestimonialStatus: OurServicesStatus.success),
        const OurServicesState(
          addTestimonialStatus: OurServicesStatus.success,
          isRefreshing: true,
        ),
        OurServicesState(
          status: OurServicesStatus.success,
          testimonials: tTestimonials,
          addTestimonialStatus: OurServicesStatus.success,
        ),
      ],
      verify: (_) {
        verify(() => mockAddTestimonialUseCase('Great app!')).called(1);
      },
    );

    blocTest<OurServicesBloc, OurServicesState>(
      'emits failure when adding testimonial fails',
      build: () {
        when(() => mockAddTestimonialUseCase('Failed review')).thenAnswer(
          (_) async => const Left(ServerFailure('Error adding review')),
        );
        return bloc;
      },
      act: (bloc) =>
          bloc.add(const OurServicesEvent.testimonialAdded('Failed review')),
      expect: () => [
        const OurServicesState(addTestimonialStatus: OurServicesStatus.loading),
        const OurServicesState(
          addTestimonialStatus: OurServicesStatus.failure,
          addTestimonialError: 'Error adding review',
        ),
      ],
      verify: (_) {
        verify(() => mockAddTestimonialUseCase('Failed review')).called(1);
      },
    );
  });
}
