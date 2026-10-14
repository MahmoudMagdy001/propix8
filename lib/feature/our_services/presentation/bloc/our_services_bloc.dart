import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:propix8/core/error/failures.dart';
import 'package:propix8/core/models/pagination_model.dart';
import 'package:propix8/core/shared/bloc/safe_bloc.dart';
import 'package:propix8/feature/our_services/domain/entities/faq_entity.dart';
import 'package:propix8/feature/our_services/domain/entities/service_entity.dart';
import 'package:propix8/feature/our_services/domain/entities/testimonial_entity.dart';
import 'package:propix8/feature/our_services/domain/usecases/add_testimonial_usecase.dart';
import 'package:propix8/feature/our_services/domain/usecases/delete_testimonial_usecase.dart';
import 'package:propix8/feature/our_services/domain/usecases/get_faqs_usecase.dart';
import 'package:propix8/feature/our_services/domain/usecases/get_services_usecase.dart';
import 'package:propix8/feature/our_services/domain/usecases/get_testimonials_usecase.dart';
import 'package:propix8/feature/our_services/domain/usecases/update_testimonial_usecase.dart';
import 'package:propix8/feature/our_services/presentation/bloc/our_services_event.dart';
import 'package:propix8/feature/our_services/presentation/bloc/our_services_state.dart';

class OurServicesBloc extends SafeBloc<OurServicesEvent, OurServicesState> {
  OurServicesBloc({
    required GetServicesUseCase getServicesUseCase,
    required GetFaqsUseCase getFaqsUseCase,
    required GetTestimonialsUseCase getTestimonialsUseCase,
    required AddTestimonialUseCase addTestimonialUseCase,
    required UpdateTestimonialUseCase updateTestimonialUseCase,
    required DeleteTestimonialUseCase deleteTestimonialUseCase,
  }) : _getServicesUseCase = getServicesUseCase,
       _getFaqsUseCase = getFaqsUseCase,
       _getTestimonialsUseCase = getTestimonialsUseCase,
       _addTestimonialUseCase = addTestimonialUseCase,
       _updateTestimonialUseCase = updateTestimonialUseCase,
       _deleteTestimonialUseCase = deleteTestimonialUseCase,
       super(const OurServicesState()) {
    on<OurServicesDataRequested>(_onDataRequested);
    on<OurServicesMoreTestimonialsRequested>(_onMoreTestimonialsRequested);
    on<OurServicesTestimonialAdded>(_onTestimonialAdded);
    on<OurServicesTestimonialUpdated>(_onTestimonialUpdated);
    on<OurServicesTestimonialDeleted>(_onTestimonialDeleted);
    on<OurServicesRefreshed>(_onRefreshed);
  }

  final GetServicesUseCase _getServicesUseCase;
  final GetFaqsUseCase _getFaqsUseCase;
  final GetTestimonialsUseCase _getTestimonialsUseCase;
  final AddTestimonialUseCase _addTestimonialUseCase;
  final UpdateTestimonialUseCase _updateTestimonialUseCase;
  final DeleteTestimonialUseCase _deleteTestimonialUseCase;

  Future<void> _onDataRequested(
    OurServicesDataRequested event,
    Emitter<OurServicesState> emit,
  ) async {
    if (event.isRefreshing) {
      emit(state.copyWith(isRefreshing: true));
    } else {
      emit(state.copyWith(status: OurServicesStatus.loading));
    }

    final futures = <Future<dynamic>>[];
    if (event.loadServices) futures.add(_getServicesUseCase());
    if (event.loadFaqs) futures.add(_getFaqsUseCase());
    if (event.loadTestimonials) futures.add(_getTestimonialsUseCase());

    if (futures.isEmpty) {
      emit(
        state.copyWith(status: OurServicesStatus.success, isRefreshing: false),
      );
      return;
    }

    final results = await Future.wait(futures);

    String? error;
    var services = <ServiceEntity>[];
    var faqs = <FaqEntity>[];
    PaginatedResponse<TestimonialEntity>? testimonials;

    var resultsIndex = 0;

    if (event.loadServices) {
      (results[resultsIndex++] as Either<Failure, List<ServiceEntity>>).fold(
        (failure) => error = failure.message,
        (data) => services = data,
      );
    }

    if (event.loadFaqs && error == null) {
      (results[resultsIndex++] as Either<Failure, List<FaqEntity>>).fold(
        (failure) => error = failure.message,
        (data) => faqs = data,
      );
    }

    if (event.loadTestimonials && error == null) {
      (results[resultsIndex++]
              as Either<Failure, PaginatedResponse<TestimonialEntity>>)
          .fold(
        (failure) => error = failure.message,
        (data) => testimonials = data,
      );
    }

    if (error != null) {
      emit(
        state.copyWith(
          status: OurServicesStatus.failure,
          errorMessage: error,
          isRefreshing: false,
        ),
      );
    } else {
      emit(
        state.copyWith(
          status: OurServicesStatus.success,
          services: event.loadServices ? services : state.services,
          faqs: event.loadFaqs ? faqs : state.faqs,
          testimonials: event.loadTestimonials
              ? testimonials
              : state.testimonials,
          isRefreshing: false,
        ),
      );
    }
  }

  Future<void> _onMoreTestimonialsRequested(
    OurServicesMoreTestimonialsRequested event,
    Emitter<OurServicesState> emit,
  ) async {
    if (state.isMoreLoading ||
        state.testimonials == null ||
        !state.testimonials!.pagination.hasMorePages) {
      return;
    }

    emit(state.copyWith(isMoreLoading: true));

    final nextPage = state.testimonials!.pagination.currentPage + 1;
    final result = await _getTestimonialsUseCase(page: nextPage);

    result.fold((failure) => emit(state.copyWith(isMoreLoading: false)), (
      newResponse,
    ) {
      final currentTestimonials = state.testimonials;
      final updatedData = [
        if (currentTestimonials != null) ...currentTestimonials.data,
        ...newResponse.data,
      ];

      emit(
        state.copyWith(
          isMoreLoading: false,
          testimonials: PaginatedResponse(
            data: updatedData,
            pagination: newResponse.pagination,
          ),
        ),
      );
    });
  }

  Future<void> _onTestimonialAdded(
    OurServicesTestimonialAdded event,
    Emitter<OurServicesState> emit,
  ) async {
    emit(state.copyWith(addTestimonialStatus: OurServicesStatus.loading));

    final result = await _addTestimonialUseCase(event.content);

    result.fold(
      (failure) => emit(
        state.copyWith(
          addTestimonialStatus: OurServicesStatus.failure,
          addTestimonialError: failure.message,
        ),
      ),
      (_) {
        emit(state.copyWith(addTestimonialStatus: OurServicesStatus.success));
        add(
          OurServicesEvent.dataRequested(
            isRefreshing: true,
            loadServices: state.services.isNotEmpty,
            loadFaqs: state.faqs.isNotEmpty,
          ),
        );
      },
    );
  }

  Future<void> _onTestimonialUpdated(
    OurServicesTestimonialUpdated event,
    Emitter<OurServicesState> emit,
  ) async {
    emit(state.copyWith(updateTestimonialStatus: OurServicesStatus.loading));

    final result = await _updateTestimonialUseCase(event.id, event.content);

    result.fold(
      (failure) => emit(
        state.copyWith(updateTestimonialStatus: OurServicesStatus.failure),
      ),
      (_) {
        emit(
          state.copyWith(updateTestimonialStatus: OurServicesStatus.success),
        );
        add(
          OurServicesEvent.dataRequested(
            isRefreshing: true,
            loadServices: state.services.isNotEmpty,
            loadFaqs: state.faqs.isNotEmpty,
          ),
        );
      },
    );
  }

  Future<void> _onTestimonialDeleted(
    OurServicesTestimonialDeleted event,
    Emitter<OurServicesState> emit,
  ) async {
    emit(state.copyWith(deleteTestimonialStatus: OurServicesStatus.loading));

    final result = await _deleteTestimonialUseCase(event.id);

    result.fold(
      (failure) => emit(
        state.copyWith(deleteTestimonialStatus: OurServicesStatus.failure),
      ),
      (_) {
        emit(
          state.copyWith(deleteTestimonialStatus: OurServicesStatus.success),
        );
        add(
          OurServicesEvent.dataRequested(
            isRefreshing: true,
            loadServices: state.services.isNotEmpty,
            loadFaqs: state.faqs.isNotEmpty,
          ),
        );
      },
    );
  }

  void _onRefreshed(
    OurServicesRefreshed event,
    Emitter<OurServicesState> emit,
  ) {
    add(
      OurServicesEvent.dataRequested(
        isRefreshing: true,
        loadServices: state.services.isNotEmpty,
        loadFaqs: state.faqs.isNotEmpty,
        loadTestimonials: state.testimonials != null,
      ),
    );
  }
}
