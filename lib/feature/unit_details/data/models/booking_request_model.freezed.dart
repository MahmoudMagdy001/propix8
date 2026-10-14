// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BookingRequestModel {

@JsonKey(name: 'unit_id') int get unitId; String get name; String get email; String get phone; String get date; String get time; String get notes;
/// Create a copy of BookingRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookingRequestModelCopyWith<BookingRequestModel> get copyWith => _$BookingRequestModelCopyWithImpl<BookingRequestModel>(this as BookingRequestModel, _$identity);

  /// Serializes this BookingRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingRequestModel&&(identical(other.unitId, unitId) || other.unitId == unitId)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.date, date) || other.date == date)&&(identical(other.time, time) || other.time == time)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,unitId,name,email,phone,date,time,notes);

@override
String toString() {
  return 'BookingRequestModel(unitId: $unitId, name: $name, email: $email, phone: $phone, date: $date, time: $time, notes: $notes)';
}


}

/// @nodoc
abstract mixin class $BookingRequestModelCopyWith<$Res>  {
  factory $BookingRequestModelCopyWith(BookingRequestModel value, $Res Function(BookingRequestModel) _then) = _$BookingRequestModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'unit_id') int unitId, String name, String email, String phone, String date, String time, String notes
});




}
/// @nodoc
class _$BookingRequestModelCopyWithImpl<$Res>
    implements $BookingRequestModelCopyWith<$Res> {
  _$BookingRequestModelCopyWithImpl(this._self, this._then);

  final BookingRequestModel _self;
  final $Res Function(BookingRequestModel) _then;

/// Create a copy of BookingRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? unitId = null,Object? name = null,Object? email = null,Object? phone = null,Object? date = null,Object? time = null,Object? notes = null,}) {
  return _then(_self.copyWith(
unitId: null == unitId ? _self.unitId : unitId // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [BookingRequestModel].
extension BookingRequestModelPatterns on BookingRequestModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookingRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookingRequestModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookingRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _BookingRequestModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookingRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _BookingRequestModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'unit_id')  int unitId,  String name,  String email,  String phone,  String date,  String time,  String notes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BookingRequestModel() when $default != null:
return $default(_that.unitId,_that.name,_that.email,_that.phone,_that.date,_that.time,_that.notes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'unit_id')  int unitId,  String name,  String email,  String phone,  String date,  String time,  String notes)  $default,) {final _that = this;
switch (_that) {
case _BookingRequestModel():
return $default(_that.unitId,_that.name,_that.email,_that.phone,_that.date,_that.time,_that.notes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'unit_id')  int unitId,  String name,  String email,  String phone,  String date,  String time,  String notes)?  $default,) {final _that = this;
switch (_that) {
case _BookingRequestModel() when $default != null:
return $default(_that.unitId,_that.name,_that.email,_that.phone,_that.date,_that.time,_that.notes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BookingRequestModel implements BookingRequestModel {
  const _BookingRequestModel({@JsonKey(name: 'unit_id') required this.unitId, required this.name, required this.email, required this.phone, required this.date, required this.time, this.notes = ''});
  factory _BookingRequestModel.fromJson(Map<String, dynamic> json) => _$BookingRequestModelFromJson(json);

@override@JsonKey(name: 'unit_id') final  int unitId;
@override final  String name;
@override final  String email;
@override final  String phone;
@override final  String date;
@override final  String time;
@override@JsonKey() final  String notes;

/// Create a copy of BookingRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookingRequestModelCopyWith<_BookingRequestModel> get copyWith => __$BookingRequestModelCopyWithImpl<_BookingRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BookingRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookingRequestModel&&(identical(other.unitId, unitId) || other.unitId == unitId)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.date, date) || other.date == date)&&(identical(other.time, time) || other.time == time)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,unitId,name,email,phone,date,time,notes);

@override
String toString() {
  return 'BookingRequestModel(unitId: $unitId, name: $name, email: $email, phone: $phone, date: $date, time: $time, notes: $notes)';
}


}

/// @nodoc
abstract mixin class _$BookingRequestModelCopyWith<$Res> implements $BookingRequestModelCopyWith<$Res> {
  factory _$BookingRequestModelCopyWith(_BookingRequestModel value, $Res Function(_BookingRequestModel) _then) = __$BookingRequestModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'unit_id') int unitId, String name, String email, String phone, String date, String time, String notes
});




}
/// @nodoc
class __$BookingRequestModelCopyWithImpl<$Res>
    implements _$BookingRequestModelCopyWith<$Res> {
  __$BookingRequestModelCopyWithImpl(this._self, this._then);

  final _BookingRequestModel _self;
  final $Res Function(_BookingRequestModel) _then;

/// Create a copy of BookingRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? unitId = null,Object? name = null,Object? email = null,Object? phone = null,Object? date = null,Object? time = null,Object? notes = null,}) {
  return _then(_BookingRequestModel(
unitId: null == unitId ? _self.unitId : unitId // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
