import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:propix8/core/models/pagination_model.dart';
import 'package:propix8/core/shared/bloc/safe_bloc.dart';
import 'package:propix8/feature/our_services/models/faq_model.dart';
import 'package:propix8/feature/our_services/models/service_model.dart';
import 'package:propix8/feature/our_services/models/testimonial_model.dart';
import 'package:propix8/feature/our_services/repositories/our_services_repository.dart';
import 'package:propix8/feature/our_services/viewmodels/our_services_state.dart';

class OurServicesCubit extends SafeCubit<OurServicesState> {
  OurServicesCubit(this._repository) : super(const OurServicesState());
  final OurServicesRepository _repository;

  Future<void> loadData({
    bool isRefreshing = false,
    bool loadServices = true,
    bool loadFaqs = true,
    bool loadTestimonials = true,
  }) async {
    if (isRefreshing) {
      emit(state.copyWith(isRefreshing: true));
    } else {
      emit(state.copyWith(status: OurServicesStatus.loading));
    }

    final futures = <Future<dynamic>>[];
    if (loadServices) futures.add(_repository.getOurServices());
    if (loadFaqs) futures.add(_repository.getFaqs());
    if (loadTestimonials) futures.add(_repository.getTestimonials());

    if (futures.isEmpty) {
      emit(
        state.copyWith(status: OurServicesStatus.success, isRefreshing: false),
      );
      return;
    }

    final results = await Future.wait(futures);

    if (isClosed) return;

    String? error;
    var services = <ServiceModel>[];
    var faqs = <FaqModel>[];
    PaginatedResponse<TestimonialModel>? testimonials;

    var resultsIndex = 0;

    if (loadServices) {
      final _ = results[resultsIndex++] as Either<String, List<ServiceModel>>
        ..fold((l) => error = l, (r) => services = r);
    }

    if (loadFaqs && error == null) {
      final _ = results[resultsIndex++] as Either<String, List<FaqModel>>
        ..fold((l) => error = l, (r) => faqs = r);
    }

    if (loadTestimonials && error == null) {
      final _ =
          results[resultsIndex++]
                as Either<String, PaginatedResponse<TestimonialModel>>
            ..fold((l) => error = l, (r) => testimonials = r);
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
          services: loadServices ? services : state.services,
          faqs: loadFaqs ? faqs : state.faqs,
          testimonials: loadTestimonials ? testimonials : state.testimonials,
          isRefreshing: false,
        ),
      );
    }
  }

  Future<void> loadMore() async {
    if (state.isMoreLoading ||
        state.testimonials == null ||
        !state.testimonials!.pagination.hasMorePages) {
      return;
    }

    emit(state.copyWith(isMoreLoading: true));

    final nextPage = state.testimonials!.pagination.currentPage + 1;
    final result = await _repository.getTestimonials(page: nextPage);

    if (isClosed) return;

    result.fold((l) => emit(state.copyWith(isMoreLoading: false)), (r) {
      final updatedData = List<TestimonialModel>.from(state.testimonials!.data)
        ..addAll(r.data);

      emit(
        state.copyWith(
          isMoreLoading: false,
          testimonials: PaginatedResponse(
            data: updatedData,
            pagination: r.pagination,
          ),
        ),
      );
    });
  }

  Future<void> addTestimonial(String content) async {
    emit(state.copyWith(addTestimonialStatus: OurServicesStatus.loading));

    final result = await _repository.addTestimonial(content);
    if (isClosed) return;

    result.fold(
      (l) => emit(
        state.copyWith(
          addTestimonialStatus: OurServicesStatus.failure,
          addTestimonialError: l,
        ),
      ),
      (r) {
        emit(state.copyWith(addTestimonialStatus: OurServicesStatus.success));
        unawaited(refresh());
      },
    );
  }

  Future<void> updateTestimonial(int id, String content) async {
    emit(state.copyWith(updateTestimonialStatus: OurServicesStatus.loading));

    final result = await _repository.updateTestimonial(id, content);
    if (isClosed) return;

    result.fold(
      (l) => emit(
        state.copyWith(updateTestimonialStatus: OurServicesStatus.failure),
      ),
      (r) {
        emit(
          state.copyWith(updateTestimonialStatus: OurServicesStatus.success),
        );
        unawaited(refresh());
      },
    );
  }

  Future<void> deleteTestimonial(int id) async {
    // Optimistic UI update could be done here, but let's stick to simple refresh for now
    emit(state.copyWith(deleteTestimonialStatus: OurServicesStatus.loading));

    final result = await _repository.deleteTestimonial(id);
    if (isClosed) return;

    result.fold(
      (l) => emit(
        state.copyWith(deleteTestimonialStatus: OurServicesStatus.failure),
      ),
      (r) {
        emit(
          state.copyWith(deleteTestimonialStatus: OurServicesStatus.success),
        );
        unawaited(refresh());
      },
    );
  }

  Future<void> refresh() => loadData(isRefreshing: true);
}
