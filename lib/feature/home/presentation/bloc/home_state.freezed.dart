// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeState {

 HomeRequestStatus get nearbyStatus; HomeRequestStatus get latestStatus; HomeRequestStatus get allStatus; HomeRequestStatus get categoryStatus; HomeRequestStatus get bannerStatus; HomeRequestStatus get loadMoreStatus; List<UnitEntity> get nearbyUnits; List<UnitEntity> get latestUnits; List<UnitEntity> get allUnits; List<CategoryEntity> get categories; List<BannerEntity> get banners; HomeTab? get activeTab; int? get selectedUnitTypeId; FilterState? get filterState; String? get errorMessage; int get currentPage; int get lastPage;
/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeStateCopyWith<HomeState> get copyWith => _$HomeStateCopyWithImpl<HomeState>(this as HomeState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeState&&(identical(other.nearbyStatus, nearbyStatus) || other.nearbyStatus == nearbyStatus)&&(identical(other.latestStatus, latestStatus) || other.latestStatus == latestStatus)&&(identical(other.allStatus, allStatus) || other.allStatus == allStatus)&&(identical(other.categoryStatus, categoryStatus) || other.categoryStatus == categoryStatus)&&(identical(other.bannerStatus, bannerStatus) || other.bannerStatus == bannerStatus)&&(identical(other.loadMoreStatus, loadMoreStatus) || other.loadMoreStatus == loadMoreStatus)&&const DeepCollectionEquality().equals(other.nearbyUnits, nearbyUnits)&&const DeepCollectionEquality().equals(other.latestUnits, latestUnits)&&const DeepCollectionEquality().equals(other.allUnits, allUnits)&&const DeepCollectionEquality().equals(other.categories, categories)&&const DeepCollectionEquality().equals(other.banners, banners)&&(identical(other.activeTab, activeTab) || other.activeTab == activeTab)&&(identical(other.selectedUnitTypeId, selectedUnitTypeId) || other.selectedUnitTypeId == selectedUnitTypeId)&&(identical(other.filterState, filterState) || other.filterState == filterState)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.lastPage, lastPage) || other.lastPage == lastPage));
}


@override
int get hashCode => Object.hash(runtimeType,nearbyStatus,latestStatus,allStatus,categoryStatus,bannerStatus,loadMoreStatus,const DeepCollectionEquality().hash(nearbyUnits),const DeepCollectionEquality().hash(latestUnits),const DeepCollectionEquality().hash(allUnits),const DeepCollectionEquality().hash(categories),const DeepCollectionEquality().hash(banners),activeTab,selectedUnitTypeId,filterState,errorMessage,currentPage,lastPage);

@override
String toString() {
  return 'HomeState(nearbyStatus: $nearbyStatus, latestStatus: $latestStatus, allStatus: $allStatus, categoryStatus: $categoryStatus, bannerStatus: $bannerStatus, loadMoreStatus: $loadMoreStatus, nearbyUnits: $nearbyUnits, latestUnits: $latestUnits, allUnits: $allUnits, categories: $categories, banners: $banners, activeTab: $activeTab, selectedUnitTypeId: $selectedUnitTypeId, filterState: $filterState, errorMessage: $errorMessage, currentPage: $currentPage, lastPage: $lastPage)';
}


}

/// @nodoc
abstract mixin class $HomeStateCopyWith<$Res>  {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) _then) = _$HomeStateCopyWithImpl;
@useResult
$Res call({
 HomeRequestStatus nearbyStatus, HomeRequestStatus latestStatus, HomeRequestStatus allStatus, HomeRequestStatus categoryStatus, HomeRequestStatus bannerStatus, HomeRequestStatus loadMoreStatus, List<UnitEntity> nearbyUnits, List<UnitEntity> latestUnits, List<UnitEntity> allUnits, List<CategoryEntity> categories, List<BannerEntity> banners, HomeTab? activeTab, int? selectedUnitTypeId, FilterState? filterState, String? errorMessage, int currentPage, int lastPage
});


$FilterStateCopyWith<$Res>? get filterState;

}
/// @nodoc
class _$HomeStateCopyWithImpl<$Res>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._self, this._then);

  final HomeState _self;
  final $Res Function(HomeState) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? nearbyStatus = null,Object? latestStatus = null,Object? allStatus = null,Object? categoryStatus = null,Object? bannerStatus = null,Object? loadMoreStatus = null,Object? nearbyUnits = null,Object? latestUnits = null,Object? allUnits = null,Object? categories = null,Object? banners = null,Object? activeTab = freezed,Object? selectedUnitTypeId = freezed,Object? filterState = freezed,Object? errorMessage = freezed,Object? currentPage = null,Object? lastPage = null,}) {
  return _then(_self.copyWith(
nearbyStatus: null == nearbyStatus ? _self.nearbyStatus : nearbyStatus // ignore: cast_nullable_to_non_nullable
as HomeRequestStatus,latestStatus: null == latestStatus ? _self.latestStatus : latestStatus // ignore: cast_nullable_to_non_nullable
as HomeRequestStatus,allStatus: null == allStatus ? _self.allStatus : allStatus // ignore: cast_nullable_to_non_nullable
as HomeRequestStatus,categoryStatus: null == categoryStatus ? _self.categoryStatus : categoryStatus // ignore: cast_nullable_to_non_nullable
as HomeRequestStatus,bannerStatus: null == bannerStatus ? _self.bannerStatus : bannerStatus // ignore: cast_nullable_to_non_nullable
as HomeRequestStatus,loadMoreStatus: null == loadMoreStatus ? _self.loadMoreStatus : loadMoreStatus // ignore: cast_nullable_to_non_nullable
as HomeRequestStatus,nearbyUnits: null == nearbyUnits ? _self.nearbyUnits : nearbyUnits // ignore: cast_nullable_to_non_nullable
as List<UnitEntity>,latestUnits: null == latestUnits ? _self.latestUnits : latestUnits // ignore: cast_nullable_to_non_nullable
as List<UnitEntity>,allUnits: null == allUnits ? _self.allUnits : allUnits // ignore: cast_nullable_to_non_nullable
as List<UnitEntity>,categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<CategoryEntity>,banners: null == banners ? _self.banners : banners // ignore: cast_nullable_to_non_nullable
as List<BannerEntity>,activeTab: freezed == activeTab ? _self.activeTab : activeTab // ignore: cast_nullable_to_non_nullable
as HomeTab?,selectedUnitTypeId: freezed == selectedUnitTypeId ? _self.selectedUnitTypeId : selectedUnitTypeId // ignore: cast_nullable_to_non_nullable
as int?,filterState: freezed == filterState ? _self.filterState : filterState // ignore: cast_nullable_to_non_nullable
as FilterState?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,lastPage: null == lastPage ? _self.lastPage : lastPage // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FilterStateCopyWith<$Res>? get filterState {
    if (_self.filterState == null) {
    return null;
  }

  return $FilterStateCopyWith<$Res>(_self.filterState!, (value) {
    return _then(_self.copyWith(filterState: value));
  });
}
}


/// Adds pattern-matching-related methods to [HomeState].
extension HomeStatePatterns on HomeState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeState value)  $default,){
final _that = this;
switch (_that) {
case _HomeState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeState value)?  $default,){
final _that = this;
switch (_that) {
case _HomeState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( HomeRequestStatus nearbyStatus,  HomeRequestStatus latestStatus,  HomeRequestStatus allStatus,  HomeRequestStatus categoryStatus,  HomeRequestStatus bannerStatus,  HomeRequestStatus loadMoreStatus,  List<UnitEntity> nearbyUnits,  List<UnitEntity> latestUnits,  List<UnitEntity> allUnits,  List<CategoryEntity> categories,  List<BannerEntity> banners,  HomeTab? activeTab,  int? selectedUnitTypeId,  FilterState? filterState,  String? errorMessage,  int currentPage,  int lastPage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeState() when $default != null:
return $default(_that.nearbyStatus,_that.latestStatus,_that.allStatus,_that.categoryStatus,_that.bannerStatus,_that.loadMoreStatus,_that.nearbyUnits,_that.latestUnits,_that.allUnits,_that.categories,_that.banners,_that.activeTab,_that.selectedUnitTypeId,_that.filterState,_that.errorMessage,_that.currentPage,_that.lastPage);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( HomeRequestStatus nearbyStatus,  HomeRequestStatus latestStatus,  HomeRequestStatus allStatus,  HomeRequestStatus categoryStatus,  HomeRequestStatus bannerStatus,  HomeRequestStatus loadMoreStatus,  List<UnitEntity> nearbyUnits,  List<UnitEntity> latestUnits,  List<UnitEntity> allUnits,  List<CategoryEntity> categories,  List<BannerEntity> banners,  HomeTab? activeTab,  int? selectedUnitTypeId,  FilterState? filterState,  String? errorMessage,  int currentPage,  int lastPage)  $default,) {final _that = this;
switch (_that) {
case _HomeState():
return $default(_that.nearbyStatus,_that.latestStatus,_that.allStatus,_that.categoryStatus,_that.bannerStatus,_that.loadMoreStatus,_that.nearbyUnits,_that.latestUnits,_that.allUnits,_that.categories,_that.banners,_that.activeTab,_that.selectedUnitTypeId,_that.filterState,_that.errorMessage,_that.currentPage,_that.lastPage);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( HomeRequestStatus nearbyStatus,  HomeRequestStatus latestStatus,  HomeRequestStatus allStatus,  HomeRequestStatus categoryStatus,  HomeRequestStatus bannerStatus,  HomeRequestStatus loadMoreStatus,  List<UnitEntity> nearbyUnits,  List<UnitEntity> latestUnits,  List<UnitEntity> allUnits,  List<CategoryEntity> categories,  List<BannerEntity> banners,  HomeTab? activeTab,  int? selectedUnitTypeId,  FilterState? filterState,  String? errorMessage,  int currentPage,  int lastPage)?  $default,) {final _that = this;
switch (_that) {
case _HomeState() when $default != null:
return $default(_that.nearbyStatus,_that.latestStatus,_that.allStatus,_that.categoryStatus,_that.bannerStatus,_that.loadMoreStatus,_that.nearbyUnits,_that.latestUnits,_that.allUnits,_that.categories,_that.banners,_that.activeTab,_that.selectedUnitTypeId,_that.filterState,_that.errorMessage,_that.currentPage,_that.lastPage);case _:
  return null;

}
}

}

/// @nodoc


class _HomeState extends HomeState {
  const _HomeState({this.nearbyStatus = HomeRequestStatus.initial, this.latestStatus = HomeRequestStatus.initial, this.allStatus = HomeRequestStatus.initial, this.categoryStatus = HomeRequestStatus.initial, this.bannerStatus = HomeRequestStatus.initial, this.loadMoreStatus = HomeRequestStatus.initial, final  List<UnitEntity> nearbyUnits = const [], final  List<UnitEntity> latestUnits = const [], final  List<UnitEntity> allUnits = const [], final  List<CategoryEntity> categories = const [], final  List<BannerEntity> banners = const [], this.activeTab, this.selectedUnitTypeId, this.filterState, this.errorMessage, this.currentPage = 1, this.lastPage = 1}): _nearbyUnits = nearbyUnits,_latestUnits = latestUnits,_allUnits = allUnits,_categories = categories,_banners = banners,super._();
  

@override@JsonKey() final  HomeRequestStatus nearbyStatus;
@override@JsonKey() final  HomeRequestStatus latestStatus;
@override@JsonKey() final  HomeRequestStatus allStatus;
@override@JsonKey() final  HomeRequestStatus categoryStatus;
@override@JsonKey() final  HomeRequestStatus bannerStatus;
@override@JsonKey() final  HomeRequestStatus loadMoreStatus;
 final  List<UnitEntity> _nearbyUnits;
@override@JsonKey() List<UnitEntity> get nearbyUnits {
  if (_nearbyUnits is EqualUnmodifiableListView) return _nearbyUnits;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_nearbyUnits);
}

 final  List<UnitEntity> _latestUnits;
@override@JsonKey() List<UnitEntity> get latestUnits {
  if (_latestUnits is EqualUnmodifiableListView) return _latestUnits;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_latestUnits);
}

 final  List<UnitEntity> _allUnits;
@override@JsonKey() List<UnitEntity> get allUnits {
  if (_allUnits is EqualUnmodifiableListView) return _allUnits;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_allUnits);
}

 final  List<CategoryEntity> _categories;
@override@JsonKey() List<CategoryEntity> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

 final  List<BannerEntity> _banners;
@override@JsonKey() List<BannerEntity> get banners {
  if (_banners is EqualUnmodifiableListView) return _banners;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_banners);
}

@override final  HomeTab? activeTab;
@override final  int? selectedUnitTypeId;
@override final  FilterState? filterState;
@override final  String? errorMessage;
@override@JsonKey() final  int currentPage;
@override@JsonKey() final  int lastPage;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeStateCopyWith<_HomeState> get copyWith => __$HomeStateCopyWithImpl<_HomeState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeState&&(identical(other.nearbyStatus, nearbyStatus) || other.nearbyStatus == nearbyStatus)&&(identical(other.latestStatus, latestStatus) || other.latestStatus == latestStatus)&&(identical(other.allStatus, allStatus) || other.allStatus == allStatus)&&(identical(other.categoryStatus, categoryStatus) || other.categoryStatus == categoryStatus)&&(identical(other.bannerStatus, bannerStatus) || other.bannerStatus == bannerStatus)&&(identical(other.loadMoreStatus, loadMoreStatus) || other.loadMoreStatus == loadMoreStatus)&&const DeepCollectionEquality().equals(other._nearbyUnits, _nearbyUnits)&&const DeepCollectionEquality().equals(other._latestUnits, _latestUnits)&&const DeepCollectionEquality().equals(other._allUnits, _allUnits)&&const DeepCollectionEquality().equals(other._categories, _categories)&&const DeepCollectionEquality().equals(other._banners, _banners)&&(identical(other.activeTab, activeTab) || other.activeTab == activeTab)&&(identical(other.selectedUnitTypeId, selectedUnitTypeId) || other.selectedUnitTypeId == selectedUnitTypeId)&&(identical(other.filterState, filterState) || other.filterState == filterState)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.lastPage, lastPage) || other.lastPage == lastPage));
}


@override
int get hashCode => Object.hash(runtimeType,nearbyStatus,latestStatus,allStatus,categoryStatus,bannerStatus,loadMoreStatus,const DeepCollectionEquality().hash(_nearbyUnits),const DeepCollectionEquality().hash(_latestUnits),const DeepCollectionEquality().hash(_allUnits),const DeepCollectionEquality().hash(_categories),const DeepCollectionEquality().hash(_banners),activeTab,selectedUnitTypeId,filterState,errorMessage,currentPage,lastPage);

@override
String toString() {
  return 'HomeState(nearbyStatus: $nearbyStatus, latestStatus: $latestStatus, allStatus: $allStatus, categoryStatus: $categoryStatus, bannerStatus: $bannerStatus, loadMoreStatus: $loadMoreStatus, nearbyUnits: $nearbyUnits, latestUnits: $latestUnits, allUnits: $allUnits, categories: $categories, banners: $banners, activeTab: $activeTab, selectedUnitTypeId: $selectedUnitTypeId, filterState: $filterState, errorMessage: $errorMessage, currentPage: $currentPage, lastPage: $lastPage)';
}


}

/// @nodoc
abstract mixin class _$HomeStateCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$HomeStateCopyWith(_HomeState value, $Res Function(_HomeState) _then) = __$HomeStateCopyWithImpl;
@override @useResult
$Res call({
 HomeRequestStatus nearbyStatus, HomeRequestStatus latestStatus, HomeRequestStatus allStatus, HomeRequestStatus categoryStatus, HomeRequestStatus bannerStatus, HomeRequestStatus loadMoreStatus, List<UnitEntity> nearbyUnits, List<UnitEntity> latestUnits, List<UnitEntity> allUnits, List<CategoryEntity> categories, List<BannerEntity> banners, HomeTab? activeTab, int? selectedUnitTypeId, FilterState? filterState, String? errorMessage, int currentPage, int lastPage
});


@override $FilterStateCopyWith<$Res>? get filterState;

}
/// @nodoc
class __$HomeStateCopyWithImpl<$Res>
    implements _$HomeStateCopyWith<$Res> {
  __$HomeStateCopyWithImpl(this._self, this._then);

  final _HomeState _self;
  final $Res Function(_HomeState) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? nearbyStatus = null,Object? latestStatus = null,Object? allStatus = null,Object? categoryStatus = null,Object? bannerStatus = null,Object? loadMoreStatus = null,Object? nearbyUnits = null,Object? latestUnits = null,Object? allUnits = null,Object? categories = null,Object? banners = null,Object? activeTab = freezed,Object? selectedUnitTypeId = freezed,Object? filterState = freezed,Object? errorMessage = freezed,Object? currentPage = null,Object? lastPage = null,}) {
  return _then(_HomeState(
nearbyStatus: null == nearbyStatus ? _self.nearbyStatus : nearbyStatus // ignore: cast_nullable_to_non_nullable
as HomeRequestStatus,latestStatus: null == latestStatus ? _self.latestStatus : latestStatus // ignore: cast_nullable_to_non_nullable
as HomeRequestStatus,allStatus: null == allStatus ? _self.allStatus : allStatus // ignore: cast_nullable_to_non_nullable
as HomeRequestStatus,categoryStatus: null == categoryStatus ? _self.categoryStatus : categoryStatus // ignore: cast_nullable_to_non_nullable
as HomeRequestStatus,bannerStatus: null == bannerStatus ? _self.bannerStatus : bannerStatus // ignore: cast_nullable_to_non_nullable
as HomeRequestStatus,loadMoreStatus: null == loadMoreStatus ? _self.loadMoreStatus : loadMoreStatus // ignore: cast_nullable_to_non_nullable
as HomeRequestStatus,nearbyUnits: null == nearbyUnits ? _self._nearbyUnits : nearbyUnits // ignore: cast_nullable_to_non_nullable
as List<UnitEntity>,latestUnits: null == latestUnits ? _self._latestUnits : latestUnits // ignore: cast_nullable_to_non_nullable
as List<UnitEntity>,allUnits: null == allUnits ? _self._allUnits : allUnits // ignore: cast_nullable_to_non_nullable
as List<UnitEntity>,categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<CategoryEntity>,banners: null == banners ? _self._banners : banners // ignore: cast_nullable_to_non_nullable
as List<BannerEntity>,activeTab: freezed == activeTab ? _self.activeTab : activeTab // ignore: cast_nullable_to_non_nullable
as HomeTab?,selectedUnitTypeId: freezed == selectedUnitTypeId ? _self.selectedUnitTypeId : selectedUnitTypeId // ignore: cast_nullable_to_non_nullable
as int?,filterState: freezed == filterState ? _self.filterState : filterState // ignore: cast_nullable_to_non_nullable
as FilterState?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,lastPage: null == lastPage ? _self.lastPage : lastPage // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FilterStateCopyWith<$Res>? get filterState {
    if (_self.filterState == null) {
    return null;
  }

  return $FilterStateCopyWith<$Res>(_self.filterState!, (value) {
    return _then(_self.copyWith(filterState: value));
  });
}
}

// dart format on
