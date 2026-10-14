import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:propix8/feature/static_pages/domain/entities/page_entity.dart';
import 'package:propix8/feature/static_pages/domain/entities/stat_entity.dart';

part 'pages_state.freezed.dart';

enum PagesStatus { initial, loading, success, failure }

@freezed
abstract class PagesState with _$PagesState {
  const PagesState._();

  const factory PagesState({
    @Default(PagesStatus.initial) PagesStatus status,
    @Default([]) List<PageEntity> pages,
    @Default([]) List<StatEntity> stats,
    String? errorMessage,
  }) = _PagesState;

  PageEntity? getPageBySlug(String slug) {
    try {
      return pages.firstWhere((page) => page.slug == slug);
    } on Object catch (_) {
      return null;
    }
  }
}
