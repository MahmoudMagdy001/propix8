// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'filter_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FilterState {

 FilterStatus get status; PropertyTab? get activeTab; DevelopmentStatus? get developmentStatus; String? get location; int? get selectedCityId; double get minPrice; double get maxPrice; int get bedrooms; int get bathrooms; int get rooms; double get minArea; double get maxArea; List<City> get cities; String? get errorMessage;
/// Create a copy of FilterState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FilterStateCopyWith<FilterState> get copyWith => _$FilterStateCopyWithImpl<FilterState>(this as FilterState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as FilterState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FilterState&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.activeTab, _this.activeTab) || other.activeTab == _this.activeTab)&&(identical(other.developmentStatus, _this.developmentStatus) || other.developmentStatus == _this.developmentStatus)&&(identical(other.location, _this.location) || other.location == _this.location)&&(identical(other.selectedCityId, _this.selectedCityId) || other.selectedCityId == _this.selectedCityId)&&(identical(other.minPrice, _this.minPrice) || other.minPrice == _this.minPrice)&&(identical(other.maxPrice, _this.maxPrice) || other.maxPrice == _this.maxPrice)&&(identical(other.bedrooms, _this.bedrooms) || other.bedrooms == _this.bedrooms)&&(identical(other.bathrooms, _this.bathrooms) || other.bathrooms == _this.bathrooms)&&(identical(other.rooms, _this.rooms) || other.rooms == _this.rooms)&&(identical(other.minArea, _this.minArea) || other.minArea == _this.minArea)&&(identical(other.maxArea, _this.maxArea) || other.maxArea == _this.maxArea)&&const DeepCollectionEquality().equals(other.cities, _this.cities)&&(identical(other.errorMessage, _this.errorMessage) || other.errorMessage == _this.errorMessage));
}


@override
int get hashCode {
  final _this = this as FilterState;
  return Object.hash(runtimeType,_this.status,_this.activeTab,_this.developmentStatus,_this.location,_this.selectedCityId,_this.minPrice,_this.maxPrice,_this.bedrooms,_this.bathrooms,_this.rooms,_this.minArea,_this.maxArea,const DeepCollectionEquality().hash(_this.cities),_this.errorMessage);
}

@override
String toString() {
  final _this = this as FilterState;
  return 'FilterState(status: ${_this.status}, activeTab: ${_this.activeTab}, developmentStatus: ${_this.developmentStatus}, location: ${_this.location}, selectedCityId: ${_this.selectedCityId}, minPrice: ${_this.minPrice}, maxPrice: ${_this.maxPrice}, bedrooms: ${_this.bedrooms}, bathrooms: ${_this.bathrooms}, rooms: ${_this.rooms}, minArea: ${_this.minArea}, maxArea: ${_this.maxArea}, cities: ${_this.cities}, errorMessage: ${_this.errorMessage})';
}


}

/// @nodoc
abstract mixin class $FilterStateCopyWith<$Res>  {
  factory $FilterStateCopyWith(FilterState value, $Res Function(FilterState) _then) = _$FilterStateCopyWithImpl;
@useResult
$Res call({
 FilterStatus status, PropertyTab? activeTab, DevelopmentStatus? developmentStatus, String? location, int? selectedCityId, double minPrice, double maxPrice, int bedrooms, int bathrooms, int rooms, double minArea, double maxArea, List<City> cities, String? errorMessage
});




}
/// @nodoc
class _$FilterStateCopyWithImpl<$Res>
    implements $FilterStateCopyWith<$Res> {
  _$FilterStateCopyWithImpl(this._self, this._then);

  final FilterState _self;
  final $Res Function(FilterState) _then;

/// Create a copy of FilterState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? activeTab = freezed,Object? developmentStatus = freezed,Object? location = freezed,Object? selectedCityId = freezed,Object? minPrice = null,Object? maxPrice = null,Object? bedrooms = null,Object? bathrooms = null,Object? rooms = null,Object? minArea = null,Object? maxArea = null,Object? cities = null,Object? errorMessage = freezed,}) {
  return _then(FilterState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as FilterStatus,activeTab: freezed == activeTab ? _self.activeTab : activeTab // ignore: cast_nullable_to_non_nullable
as PropertyTab?,developmentStatus: freezed == developmentStatus ? _self.developmentStatus : developmentStatus // ignore: cast_nullable_to_non_nullable
as DevelopmentStatus?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,selectedCityId: freezed == selectedCityId ? _self.selectedCityId : selectedCityId // ignore: cast_nullable_to_non_nullable
as int?,minPrice: null == minPrice ? _self.minPrice : minPrice // ignore: cast_nullable_to_non_nullable
as double,maxPrice: null == maxPrice ? _self.maxPrice : maxPrice // ignore: cast_nullable_to_non_nullable
as double,bedrooms: null == bedrooms ? _self.bedrooms : bedrooms // ignore: cast_nullable_to_non_nullable
as int,bathrooms: null == bathrooms ? _self.bathrooms : bathrooms // ignore: cast_nullable_to_non_nullable
as int,rooms: null == rooms ? _self.rooms : rooms // ignore: cast_nullable_to_non_nullable
as int,minArea: null == minArea ? _self.minArea : minArea // ignore: cast_nullable_to_non_nullable
as double,maxArea: null == maxArea ? _self.maxArea : maxArea // ignore: cast_nullable_to_non_nullable
as double,cities: null == cities ? _self.cities : cities // ignore: cast_nullable_to_non_nullable
as List<City>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [FilterState].
extension FilterStatePatterns on FilterState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FilterState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FilterState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FilterState value)  $default,){
final _that = this;
switch (_that) {
case _FilterState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FilterState value)?  $default,){
final _that = this;
switch (_that) {
case _FilterState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( FilterStatus status,  PropertyTab? activeTab,  DevelopmentStatus? developmentStatus,  String? location,  int? selectedCityId,  double minPrice,  double maxPrice,  int bedrooms,  int bathrooms,  int rooms,  double minArea,  double maxArea,  List<City> cities,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FilterState() when $default != null:
return $default(_that.status,_that.activeTab,_that.developmentStatus,_that.location,_that.selectedCityId,_that.minPrice,_that.maxPrice,_that.bedrooms,_that.bathrooms,_that.rooms,_that.minArea,_that.maxArea,_that.cities,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( FilterStatus status,  PropertyTab? activeTab,  DevelopmentStatus? developmentStatus,  String? location,  int? selectedCityId,  double minPrice,  double maxPrice,  int bedrooms,  int bathrooms,  int rooms,  double minArea,  double maxArea,  List<City> cities,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _FilterState():
return $default(_that.status,_that.activeTab,_that.developmentStatus,_that.location,_that.selectedCityId,_that.minPrice,_that.maxPrice,_that.bedrooms,_that.bathrooms,_that.rooms,_that.minArea,_that.maxArea,_that.cities,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( FilterStatus status,  PropertyTab? activeTab,  DevelopmentStatus? developmentStatus,  String? location,  int? selectedCityId,  double minPrice,  double maxPrice,  int bedrooms,  int bathrooms,  int rooms,  double minArea,  double maxArea,  List<City> cities,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _FilterState() when $default != null:
return $default(_that.status,_that.activeTab,_that.developmentStatus,_that.location,_that.selectedCityId,_that.minPrice,_that.maxPrice,_that.bedrooms,_that.bathrooms,_that.rooms,_that.minArea,_that.maxArea,_that.cities,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _FilterState extends FilterState {
  const _FilterState({this.status = FilterStatus.initial, this.activeTab, this.developmentStatus, this.location, this.selectedCityId, this.minPrice = 0.0, this.maxPrice = 1000000.0, this.bedrooms = 0, this.bathrooms = 0, this.rooms = 0, this.minArea = 0.0, this.maxArea = 1000.0,  List<City> cities = const [], this.errorMessage}): _cities = cities,super._();
  

@override@JsonKey() final  FilterStatus status;
@override final  PropertyTab? activeTab;
@override final  DevelopmentStatus? developmentStatus;
@override final  String? location;
@override final  int? selectedCityId;
@override@JsonKey() final  double minPrice;
@override@JsonKey() final  double maxPrice;
@override@JsonKey() final  int bedrooms;
@override@JsonKey() final  int bathrooms;
@override@JsonKey() final  int rooms;
@override@JsonKey() final  double minArea;
@override@JsonKey() final  double maxArea;
 final  List<City> _cities;
@override@JsonKey() List<City> get cities {
  if (_cities is EqualUnmodifiableListView) return _cities;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_cities);
}

@override final  String? errorMessage;

/// Create a copy of FilterState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FilterStateCopyWith<_FilterState> get copyWith => __$FilterStateCopyWithImpl<_FilterState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _FilterState&&(identical(other.status, status) || other.status == status)&&(identical(other.activeTab, activeTab) || other.activeTab == activeTab)&&(identical(other.developmentStatus, developmentStatus) || other.developmentStatus == developmentStatus)&&(identical(other.location, location) || other.location == location)&&(identical(other.selectedCityId, selectedCityId) || other.selectedCityId == selectedCityId)&&(identical(other.minPrice, minPrice) || other.minPrice == minPrice)&&(identical(other.maxPrice, maxPrice) || other.maxPrice == maxPrice)&&(identical(other.bedrooms, bedrooms) || other.bedrooms == bedrooms)&&(identical(other.bathrooms, bathrooms) || other.bathrooms == bathrooms)&&(identical(other.rooms, rooms) || other.rooms == rooms)&&(identical(other.minArea, minArea) || other.minArea == minArea)&&(identical(other.maxArea, maxArea) || other.maxArea == maxArea)&&const DeepCollectionEquality().equals(other.cities, _cities)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode {
    return Object.hash(runtimeType,status,activeTab,developmentStatus,location,selectedCityId,minPrice,maxPrice,bedrooms,bathrooms,rooms,minArea,maxArea,const DeepCollectionEquality().hash(_cities),errorMessage);
}

@override
String toString() {
    return 'FilterState(status: $status, activeTab: $activeTab, developmentStatus: $developmentStatus, location: $location, selectedCityId: $selectedCityId, minPrice: $minPrice, maxPrice: $maxPrice, bedrooms: $bedrooms, bathrooms: $bathrooms, rooms: $rooms, minArea: $minArea, maxArea: $maxArea, cities: $cities, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$FilterStateCopyWith<$Res> implements $FilterStateCopyWith<$Res> {
  factory _$FilterStateCopyWith(_FilterState value, $Res Function(_FilterState) _then) = __$FilterStateCopyWithImpl;
@override @useResult
$Res call({
 FilterStatus status, PropertyTab? activeTab, DevelopmentStatus? developmentStatus, String? location, int? selectedCityId, double minPrice, double maxPrice, int bedrooms, int bathrooms, int rooms, double minArea, double maxArea, List<City> cities, String? errorMessage
});




}
/// @nodoc
class __$FilterStateCopyWithImpl<$Res>
    implements _$FilterStateCopyWith<$Res> {
  __$FilterStateCopyWithImpl(this._self, this._then);

  final _FilterState _self;
  final $Res Function(_FilterState) _then;

/// Create a copy of FilterState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? activeTab = freezed,Object? developmentStatus = freezed,Object? location = freezed,Object? selectedCityId = freezed,Object? minPrice = null,Object? maxPrice = null,Object? bedrooms = null,Object? bathrooms = null,Object? rooms = null,Object? minArea = null,Object? maxArea = null,Object? cities = null,Object? errorMessage = freezed,}) {
  return _then(_FilterState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as FilterStatus,activeTab: freezed == activeTab ? _self.activeTab : activeTab // ignore: cast_nullable_to_non_nullable
as PropertyTab?,developmentStatus: freezed == developmentStatus ? _self.developmentStatus : developmentStatus // ignore: cast_nullable_to_non_nullable
as DevelopmentStatus?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,selectedCityId: freezed == selectedCityId ? _self.selectedCityId : selectedCityId // ignore: cast_nullable_to_non_nullable
as int?,minPrice: null == minPrice ? _self.minPrice : minPrice // ignore: cast_nullable_to_non_nullable
as double,maxPrice: null == maxPrice ? _self.maxPrice : maxPrice // ignore: cast_nullable_to_non_nullable
as double,bedrooms: null == bedrooms ? _self.bedrooms : bedrooms // ignore: cast_nullable_to_non_nullable
as int,bathrooms: null == bathrooms ? _self.bathrooms : bathrooms // ignore: cast_nullable_to_non_nullable
as int,rooms: null == rooms ? _self.rooms : rooms // ignore: cast_nullable_to_non_nullable
as int,minArea: null == minArea ? _self.minArea : minArea // ignore: cast_nullable_to_non_nullable
as double,maxArea: null == maxArea ? _self.maxArea : maxArea // ignore: cast_nullable_to_non_nullable
as double,cities: null == cities ? _self._cities : cities // ignore: cast_nullable_to_non_nullable
as List<City>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
