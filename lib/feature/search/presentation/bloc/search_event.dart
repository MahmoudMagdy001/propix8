import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_event.freezed.dart';

@freezed
class SearchEvent with _$SearchEvent {
  const factory SearchEvent.queryChanged(String query) = SearchQueryChanged;
  const factory SearchEvent.loadMoreRequested() = SearchLoadMoreRequested;
  const factory SearchEvent.viewTypeToggled() = SearchViewTypeToggled;
  const factory SearchEvent.searchCleared() = SearchCleared;
}
