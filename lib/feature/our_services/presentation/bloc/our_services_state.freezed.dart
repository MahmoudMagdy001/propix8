// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'our_services_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OurServicesState {

 OurServicesStatus get status; List<ServiceEntity> get services; List<FaqEntity> get faqs; PaginatedResponse<TestimonialEntity>? get testimonials; String? get errorMessage; bool get isMoreLoading; bool get isRefreshing; OurServicesStatus get addTestimonialStatus; String? get addTestimonialError; OurServicesStatus get updateTestimonialStatus; OurServicesStatus get deleteTestimonialStatus;
/// Create a copy of OurServicesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OurServicesStateCopyWith<OurServicesState> get copyWith => _$OurServicesStateCopyWithImpl<OurServicesState>(this as OurServicesState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as OurServicesState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OurServicesState&&(identical(other.status, _this.status) || other.status == _this.status)&&const DeepCollectionEquality().equals(other.services, _this.services)&&const DeepCollectionEquality().equals(other.faqs, _this.faqs)&&(identical(other.testimonials, _this.testimonials) || other.testimonials == _this.testimonials)&&(identical(other.errorMessage, _this.errorMessage) || other.errorMessage == _this.errorMessage)&&(identical(other.isMoreLoading, _this.isMoreLoading) || other.isMoreLoading == _this.isMoreLoading)&&(identical(other.isRefreshing, _this.isRefreshing) || other.isRefreshing == _this.isRefreshing)&&(identical(other.addTestimonialStatus, _this.addTestimonialStatus) || other.addTestimonialStatus == _this.addTestimonialStatus)&&(identical(other.addTestimonialError, _this.addTestimonialError) || other.addTestimonialError == _this.addTestimonialError)&&(identical(other.updateTestimonialStatus, _this.updateTestimonialStatus) || other.updateTestimonialStatus == _this.updateTestimonialStatus)&&(identical(other.deleteTestimonialStatus, _this.deleteTestimonialStatus) || other.deleteTestimonialStatus == _this.deleteTestimonialStatus));
}


@override
int get hashCode {
  final _this = this as OurServicesState;
  return Object.hash(runtimeType,_this.status,const DeepCollectionEquality().hash(_this.services),const DeepCollectionEquality().hash(_this.faqs),_this.testimonials,_this.errorMessage,_this.isMoreLoading,_this.isRefreshing,_this.addTestimonialStatus,_this.addTestimonialError,_this.updateTestimonialStatus,_this.deleteTestimonialStatus);
}

@override
String toString() {
  final _this = this as OurServicesState;
  return 'OurServicesState(status: ${_this.status}, services: ${_this.services}, faqs: ${_this.faqs}, testimonials: ${_this.testimonials}, errorMessage: ${_this.errorMessage}, isMoreLoading: ${_this.isMoreLoading}, isRefreshing: ${_this.isRefreshing}, addTestimonialStatus: ${_this.addTestimonialStatus}, addTestimonialError: ${_this.addTestimonialError}, updateTestimonialStatus: ${_this.updateTestimonialStatus}, deleteTestimonialStatus: ${_this.deleteTestimonialStatus})';
}


}

/// @nodoc
abstract mixin class $OurServicesStateCopyWith<$Res>  {
  factory $OurServicesStateCopyWith(OurServicesState value, $Res Function(OurServicesState) _then) = _$OurServicesStateCopyWithImpl;
@useResult
$Res call({
 OurServicesStatus status, List<ServiceEntity> services, List<FaqEntity> faqs, PaginatedResponse<TestimonialEntity>? testimonials, String? errorMessage, bool isMoreLoading, bool isRefreshing, OurServicesStatus addTestimonialStatus, String? addTestimonialError, OurServicesStatus updateTestimonialStatus, OurServicesStatus deleteTestimonialStatus
});


$PaginatedResponseCopyWith<TestimonialEntity, $Res>? get testimonials;

}
/// @nodoc
class _$OurServicesStateCopyWithImpl<$Res>
    implements $OurServicesStateCopyWith<$Res> {
  _$OurServicesStateCopyWithImpl(this._self, this._then);

  final OurServicesState _self;
  final $Res Function(OurServicesState) _then;

/// Create a copy of OurServicesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? services = null,Object? faqs = null,Object? testimonials = freezed,Object? errorMessage = freezed,Object? isMoreLoading = null,Object? isRefreshing = null,Object? addTestimonialStatus = null,Object? addTestimonialError = freezed,Object? updateTestimonialStatus = null,Object? deleteTestimonialStatus = null,}) {
  return _then(OurServicesState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OurServicesStatus,services: null == services ? _self.services : services // ignore: cast_nullable_to_non_nullable
as List<ServiceEntity>,faqs: null == faqs ? _self.faqs : faqs // ignore: cast_nullable_to_non_nullable
as List<FaqEntity>,testimonials: freezed == testimonials ? _self.testimonials : testimonials // ignore: cast_nullable_to_non_nullable
as PaginatedResponse<TestimonialEntity>?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,isMoreLoading: null == isMoreLoading ? _self.isMoreLoading : isMoreLoading // ignore: cast_nullable_to_non_nullable
as bool,isRefreshing: null == isRefreshing ? _self.isRefreshing : isRefreshing // ignore: cast_nullable_to_non_nullable
as bool,addTestimonialStatus: null == addTestimonialStatus ? _self.addTestimonialStatus : addTestimonialStatus // ignore: cast_nullable_to_non_nullable
as OurServicesStatus,addTestimonialError: freezed == addTestimonialError ? _self.addTestimonialError : addTestimonialError // ignore: cast_nullable_to_non_nullable
as String?,updateTestimonialStatus: null == updateTestimonialStatus ? _self.updateTestimonialStatus : updateTestimonialStatus // ignore: cast_nullable_to_non_nullable
as OurServicesStatus,deleteTestimonialStatus: null == deleteTestimonialStatus ? _self.deleteTestimonialStatus : deleteTestimonialStatus // ignore: cast_nullable_to_non_nullable
as OurServicesStatus,
  ));
}
/// Create a copy of OurServicesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginatedResponseCopyWith<TestimonialEntity, $Res>? get testimonials {
    if (_self.testimonials == null) {
    return null;
  }

  return $PaginatedResponseCopyWith<TestimonialEntity, $Res>(_self.testimonials!, (value) {
    return _then(_self.copyWith(testimonials: value));
  });
}
}


/// Adds pattern-matching-related methods to [OurServicesState].
extension OurServicesStatePatterns on OurServicesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OurServicesState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OurServicesState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OurServicesState value)  $default,){
final _that = this;
switch (_that) {
case _OurServicesState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OurServicesState value)?  $default,){
final _that = this;
switch (_that) {
case _OurServicesState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( OurServicesStatus status,  List<ServiceEntity> services,  List<FaqEntity> faqs,  PaginatedResponse<TestimonialEntity>? testimonials,  String? errorMessage,  bool isMoreLoading,  bool isRefreshing,  OurServicesStatus addTestimonialStatus,  String? addTestimonialError,  OurServicesStatus updateTestimonialStatus,  OurServicesStatus deleteTestimonialStatus)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OurServicesState() when $default != null:
return $default(_that.status,_that.services,_that.faqs,_that.testimonials,_that.errorMessage,_that.isMoreLoading,_that.isRefreshing,_that.addTestimonialStatus,_that.addTestimonialError,_that.updateTestimonialStatus,_that.deleteTestimonialStatus);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( OurServicesStatus status,  List<ServiceEntity> services,  List<FaqEntity> faqs,  PaginatedResponse<TestimonialEntity>? testimonials,  String? errorMessage,  bool isMoreLoading,  bool isRefreshing,  OurServicesStatus addTestimonialStatus,  String? addTestimonialError,  OurServicesStatus updateTestimonialStatus,  OurServicesStatus deleteTestimonialStatus)  $default,) {final _that = this;
switch (_that) {
case _OurServicesState():
return $default(_that.status,_that.services,_that.faqs,_that.testimonials,_that.errorMessage,_that.isMoreLoading,_that.isRefreshing,_that.addTestimonialStatus,_that.addTestimonialError,_that.updateTestimonialStatus,_that.deleteTestimonialStatus);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( OurServicesStatus status,  List<ServiceEntity> services,  List<FaqEntity> faqs,  PaginatedResponse<TestimonialEntity>? testimonials,  String? errorMessage,  bool isMoreLoading,  bool isRefreshing,  OurServicesStatus addTestimonialStatus,  String? addTestimonialError,  OurServicesStatus updateTestimonialStatus,  OurServicesStatus deleteTestimonialStatus)?  $default,) {final _that = this;
switch (_that) {
case _OurServicesState() when $default != null:
return $default(_that.status,_that.services,_that.faqs,_that.testimonials,_that.errorMessage,_that.isMoreLoading,_that.isRefreshing,_that.addTestimonialStatus,_that.addTestimonialError,_that.updateTestimonialStatus,_that.deleteTestimonialStatus);case _:
  return null;

}
}

}

/// @nodoc


class _OurServicesState extends OurServicesState {
  const _OurServicesState({this.status = OurServicesStatus.initial,  List<ServiceEntity> services = const [],  List<FaqEntity> faqs = const [], this.testimonials, this.errorMessage, this.isMoreLoading = false, this.isRefreshing = false, this.addTestimonialStatus = OurServicesStatus.initial, this.addTestimonialError, this.updateTestimonialStatus = OurServicesStatus.initial, this.deleteTestimonialStatus = OurServicesStatus.initial}): _services = services,_faqs = faqs,super._();
  

@override@JsonKey() final  OurServicesStatus status;
 final  List<ServiceEntity> _services;
@override@JsonKey() List<ServiceEntity> get services {
  if (_services is EqualUnmodifiableListView) return _services;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_services);
}

 final  List<FaqEntity> _faqs;
@override@JsonKey() List<FaqEntity> get faqs {
  if (_faqs is EqualUnmodifiableListView) return _faqs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_faqs);
}

@override final  PaginatedResponse<TestimonialEntity>? testimonials;
@override final  String? errorMessage;
@override@JsonKey() final  bool isMoreLoading;
@override@JsonKey() final  bool isRefreshing;
@override@JsonKey() final  OurServicesStatus addTestimonialStatus;
@override final  String? addTestimonialError;
@override@JsonKey() final  OurServicesStatus updateTestimonialStatus;
@override@JsonKey() final  OurServicesStatus deleteTestimonialStatus;

/// Create a copy of OurServicesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OurServicesStateCopyWith<_OurServicesState> get copyWith => __$OurServicesStateCopyWithImpl<_OurServicesState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OurServicesState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.services, _services)&&const DeepCollectionEquality().equals(other.faqs, _faqs)&&(identical(other.testimonials, testimonials) || other.testimonials == testimonials)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.isMoreLoading, isMoreLoading) || other.isMoreLoading == isMoreLoading)&&(identical(other.isRefreshing, isRefreshing) || other.isRefreshing == isRefreshing)&&(identical(other.addTestimonialStatus, addTestimonialStatus) || other.addTestimonialStatus == addTestimonialStatus)&&(identical(other.addTestimonialError, addTestimonialError) || other.addTestimonialError == addTestimonialError)&&(identical(other.updateTestimonialStatus, updateTestimonialStatus) || other.updateTestimonialStatus == updateTestimonialStatus)&&(identical(other.deleteTestimonialStatus, deleteTestimonialStatus) || other.deleteTestimonialStatus == deleteTestimonialStatus));
}


@override
int get hashCode {
    return Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_services),const DeepCollectionEquality().hash(_faqs),testimonials,errorMessage,isMoreLoading,isRefreshing,addTestimonialStatus,addTestimonialError,updateTestimonialStatus,deleteTestimonialStatus);
}

@override
String toString() {
    return 'OurServicesState(status: $status, services: $services, faqs: $faqs, testimonials: $testimonials, errorMessage: $errorMessage, isMoreLoading: $isMoreLoading, isRefreshing: $isRefreshing, addTestimonialStatus: $addTestimonialStatus, addTestimonialError: $addTestimonialError, updateTestimonialStatus: $updateTestimonialStatus, deleteTestimonialStatus: $deleteTestimonialStatus)';
}


}

/// @nodoc
abstract mixin class _$OurServicesStateCopyWith<$Res> implements $OurServicesStateCopyWith<$Res> {
  factory _$OurServicesStateCopyWith(_OurServicesState value, $Res Function(_OurServicesState) _then) = __$OurServicesStateCopyWithImpl;
@override @useResult
$Res call({
 OurServicesStatus status, List<ServiceEntity> services, List<FaqEntity> faqs, PaginatedResponse<TestimonialEntity>? testimonials, String? errorMessage, bool isMoreLoading, bool isRefreshing, OurServicesStatus addTestimonialStatus, String? addTestimonialError, OurServicesStatus updateTestimonialStatus, OurServicesStatus deleteTestimonialStatus
});


@override $PaginatedResponseCopyWith<TestimonialEntity, $Res>? get testimonials;

}
/// @nodoc
class __$OurServicesStateCopyWithImpl<$Res>
    implements _$OurServicesStateCopyWith<$Res> {
  __$OurServicesStateCopyWithImpl(this._self, this._then);

  final _OurServicesState _self;
  final $Res Function(_OurServicesState) _then;

/// Create a copy of OurServicesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? services = null,Object? faqs = null,Object? testimonials = freezed,Object? errorMessage = freezed,Object? isMoreLoading = null,Object? isRefreshing = null,Object? addTestimonialStatus = null,Object? addTestimonialError = freezed,Object? updateTestimonialStatus = null,Object? deleteTestimonialStatus = null,}) {
  return _then(_OurServicesState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OurServicesStatus,services: null == services ? _self._services : services // ignore: cast_nullable_to_non_nullable
as List<ServiceEntity>,faqs: null == faqs ? _self._faqs : faqs // ignore: cast_nullable_to_non_nullable
as List<FaqEntity>,testimonials: freezed == testimonials ? _self.testimonials : testimonials // ignore: cast_nullable_to_non_nullable
as PaginatedResponse<TestimonialEntity>?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,isMoreLoading: null == isMoreLoading ? _self.isMoreLoading : isMoreLoading // ignore: cast_nullable_to_non_nullable
as bool,isRefreshing: null == isRefreshing ? _self.isRefreshing : isRefreshing // ignore: cast_nullable_to_non_nullable
as bool,addTestimonialStatus: null == addTestimonialStatus ? _self.addTestimonialStatus : addTestimonialStatus // ignore: cast_nullable_to_non_nullable
as OurServicesStatus,addTestimonialError: freezed == addTestimonialError ? _self.addTestimonialError : addTestimonialError // ignore: cast_nullable_to_non_nullable
as String?,updateTestimonialStatus: null == updateTestimonialStatus ? _self.updateTestimonialStatus : updateTestimonialStatus // ignore: cast_nullable_to_non_nullable
as OurServicesStatus,deleteTestimonialStatus: null == deleteTestimonialStatus ? _self.deleteTestimonialStatus : deleteTestimonialStatus // ignore: cast_nullable_to_non_nullable
as OurServicesStatus,
  ));
}

/// Create a copy of OurServicesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginatedResponseCopyWith<TestimonialEntity, $Res>? get testimonials {
    if (_self.testimonials == null) {
    return null;
  }

  return $PaginatedResponseCopyWith<TestimonialEntity, $Res>(_self.testimonials!, (value) {
    return _then(_self.copyWith(testimonials: value));
  });
}
}

// dart format on
