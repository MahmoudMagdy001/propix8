// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BookingUserDto {

 int get id; String get name; String get email;
/// Create a copy of BookingUserDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookingUserDtoCopyWith<BookingUserDto> get copyWith => _$BookingUserDtoCopyWithImpl<BookingUserDto>(this as BookingUserDto, _$identity);

  /// Serializes this BookingUserDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingUserDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,email);

@override
String toString() {
  return 'BookingUserDto(id: $id, name: $name, email: $email)';
}


}

/// @nodoc
abstract mixin class $BookingUserDtoCopyWith<$Res>  {
  factory $BookingUserDtoCopyWith(BookingUserDto value, $Res Function(BookingUserDto) _then) = _$BookingUserDtoCopyWithImpl;
@useResult
$Res call({
 int id, String name, String email
});




}
/// @nodoc
class _$BookingUserDtoCopyWithImpl<$Res>
    implements $BookingUserDtoCopyWith<$Res> {
  _$BookingUserDtoCopyWithImpl(this._self, this._then);

  final BookingUserDto _self;
  final $Res Function(BookingUserDto) _then;

/// Create a copy of BookingUserDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? email = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [BookingUserDto].
extension BookingUserDtoPatterns on BookingUserDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookingUserDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookingUserDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookingUserDto value)  $default,){
final _that = this;
switch (_that) {
case _BookingUserDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookingUserDto value)?  $default,){
final _that = this;
switch (_that) {
case _BookingUserDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String email)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BookingUserDto() when $default != null:
return $default(_that.id,_that.name,_that.email);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String email)  $default,) {final _that = this;
switch (_that) {
case _BookingUserDto():
return $default(_that.id,_that.name,_that.email);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String email)?  $default,) {final _that = this;
switch (_that) {
case _BookingUserDto() when $default != null:
return $default(_that.id,_that.name,_that.email);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BookingUserDto implements BookingUserDto {
  const _BookingUserDto({this.id = 0, this.name = '', this.email = ''});
  factory _BookingUserDto.fromJson(Map<String, dynamic> json) => _$BookingUserDtoFromJson(json);

@override@JsonKey() final  int id;
@override@JsonKey() final  String name;
@override@JsonKey() final  String email;

/// Create a copy of BookingUserDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookingUserDtoCopyWith<_BookingUserDto> get copyWith => __$BookingUserDtoCopyWithImpl<_BookingUserDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BookingUserDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookingUserDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,email);

@override
String toString() {
  return 'BookingUserDto(id: $id, name: $name, email: $email)';
}


}

/// @nodoc
abstract mixin class _$BookingUserDtoCopyWith<$Res> implements $BookingUserDtoCopyWith<$Res> {
  factory _$BookingUserDtoCopyWith(_BookingUserDto value, $Res Function(_BookingUserDto) _then) = __$BookingUserDtoCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String email
});




}
/// @nodoc
class __$BookingUserDtoCopyWithImpl<$Res>
    implements _$BookingUserDtoCopyWith<$Res> {
  __$BookingUserDtoCopyWithImpl(this._self, this._then);

  final _BookingUserDto _self;
  final $Res Function(_BookingUserDto) _then;

/// Create a copy of BookingUserDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? email = null,}) {
  return _then(_BookingUserDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$BookingCityDto {

 int get id; String get name;
/// Create a copy of BookingCityDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookingCityDtoCopyWith<BookingCityDto> get copyWith => _$BookingCityDtoCopyWithImpl<BookingCityDto>(this as BookingCityDto, _$identity);

  /// Serializes this BookingCityDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingCityDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'BookingCityDto(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class $BookingCityDtoCopyWith<$Res>  {
  factory $BookingCityDtoCopyWith(BookingCityDto value, $Res Function(BookingCityDto) _then) = _$BookingCityDtoCopyWithImpl;
@useResult
$Res call({
 int id, String name
});




}
/// @nodoc
class _$BookingCityDtoCopyWithImpl<$Res>
    implements $BookingCityDtoCopyWith<$Res> {
  _$BookingCityDtoCopyWithImpl(this._self, this._then);

  final BookingCityDto _self;
  final $Res Function(BookingCityDto) _then;

/// Create a copy of BookingCityDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [BookingCityDto].
extension BookingCityDtoPatterns on BookingCityDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookingCityDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookingCityDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookingCityDto value)  $default,){
final _that = this;
switch (_that) {
case _BookingCityDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookingCityDto value)?  $default,){
final _that = this;
switch (_that) {
case _BookingCityDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BookingCityDto() when $default != null:
return $default(_that.id,_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name)  $default,) {final _that = this;
switch (_that) {
case _BookingCityDto():
return $default(_that.id,_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name)?  $default,) {final _that = this;
switch (_that) {
case _BookingCityDto() when $default != null:
return $default(_that.id,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BookingCityDto implements BookingCityDto {
  const _BookingCityDto({this.id = 0, this.name = ''});
  factory _BookingCityDto.fromJson(Map<String, dynamic> json) => _$BookingCityDtoFromJson(json);

@override@JsonKey() final  int id;
@override@JsonKey() final  String name;

/// Create a copy of BookingCityDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookingCityDtoCopyWith<_BookingCityDto> get copyWith => __$BookingCityDtoCopyWithImpl<_BookingCityDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BookingCityDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookingCityDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'BookingCityDto(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class _$BookingCityDtoCopyWith<$Res> implements $BookingCityDtoCopyWith<$Res> {
  factory _$BookingCityDtoCopyWith(_BookingCityDto value, $Res Function(_BookingCityDto) _then) = __$BookingCityDtoCopyWithImpl;
@override @useResult
$Res call({
 int id, String name
});




}
/// @nodoc
class __$BookingCityDtoCopyWithImpl<$Res>
    implements _$BookingCityDtoCopyWith<$Res> {
  __$BookingCityDtoCopyWithImpl(this._self, this._then);

  final _BookingCityDto _self;
  final $Res Function(_BookingCityDto) _then;

/// Create a copy of BookingCityDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,}) {
  return _then(_BookingCityDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$BookingCompoundDto {

 int get id; String get name;
/// Create a copy of BookingCompoundDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookingCompoundDtoCopyWith<BookingCompoundDto> get copyWith => _$BookingCompoundDtoCopyWithImpl<BookingCompoundDto>(this as BookingCompoundDto, _$identity);

  /// Serializes this BookingCompoundDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingCompoundDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'BookingCompoundDto(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class $BookingCompoundDtoCopyWith<$Res>  {
  factory $BookingCompoundDtoCopyWith(BookingCompoundDto value, $Res Function(BookingCompoundDto) _then) = _$BookingCompoundDtoCopyWithImpl;
@useResult
$Res call({
 int id, String name
});




}
/// @nodoc
class _$BookingCompoundDtoCopyWithImpl<$Res>
    implements $BookingCompoundDtoCopyWith<$Res> {
  _$BookingCompoundDtoCopyWithImpl(this._self, this._then);

  final BookingCompoundDto _self;
  final $Res Function(BookingCompoundDto) _then;

/// Create a copy of BookingCompoundDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [BookingCompoundDto].
extension BookingCompoundDtoPatterns on BookingCompoundDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookingCompoundDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookingCompoundDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookingCompoundDto value)  $default,){
final _that = this;
switch (_that) {
case _BookingCompoundDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookingCompoundDto value)?  $default,){
final _that = this;
switch (_that) {
case _BookingCompoundDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BookingCompoundDto() when $default != null:
return $default(_that.id,_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name)  $default,) {final _that = this;
switch (_that) {
case _BookingCompoundDto():
return $default(_that.id,_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name)?  $default,) {final _that = this;
switch (_that) {
case _BookingCompoundDto() when $default != null:
return $default(_that.id,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BookingCompoundDto implements BookingCompoundDto {
  const _BookingCompoundDto({this.id = 0, this.name = ''});
  factory _BookingCompoundDto.fromJson(Map<String, dynamic> json) => _$BookingCompoundDtoFromJson(json);

@override@JsonKey() final  int id;
@override@JsonKey() final  String name;

/// Create a copy of BookingCompoundDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookingCompoundDtoCopyWith<_BookingCompoundDto> get copyWith => __$BookingCompoundDtoCopyWithImpl<_BookingCompoundDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BookingCompoundDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookingCompoundDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'BookingCompoundDto(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class _$BookingCompoundDtoCopyWith<$Res> implements $BookingCompoundDtoCopyWith<$Res> {
  factory _$BookingCompoundDtoCopyWith(_BookingCompoundDto value, $Res Function(_BookingCompoundDto) _then) = __$BookingCompoundDtoCopyWithImpl;
@override @useResult
$Res call({
 int id, String name
});




}
/// @nodoc
class __$BookingCompoundDtoCopyWithImpl<$Res>
    implements _$BookingCompoundDtoCopyWith<$Res> {
  __$BookingCompoundDtoCopyWithImpl(this._self, this._then);

  final _BookingCompoundDto _self;
  final $Res Function(_BookingCompoundDto) _then;

/// Create a copy of BookingCompoundDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,}) {
  return _then(_BookingCompoundDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$BookingDeveloperDto {

 int get id; String get name;
/// Create a copy of BookingDeveloperDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookingDeveloperDtoCopyWith<BookingDeveloperDto> get copyWith => _$BookingDeveloperDtoCopyWithImpl<BookingDeveloperDto>(this as BookingDeveloperDto, _$identity);

  /// Serializes this BookingDeveloperDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingDeveloperDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'BookingDeveloperDto(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class $BookingDeveloperDtoCopyWith<$Res>  {
  factory $BookingDeveloperDtoCopyWith(BookingDeveloperDto value, $Res Function(BookingDeveloperDto) _then) = _$BookingDeveloperDtoCopyWithImpl;
@useResult
$Res call({
 int id, String name
});




}
/// @nodoc
class _$BookingDeveloperDtoCopyWithImpl<$Res>
    implements $BookingDeveloperDtoCopyWith<$Res> {
  _$BookingDeveloperDtoCopyWithImpl(this._self, this._then);

  final BookingDeveloperDto _self;
  final $Res Function(BookingDeveloperDto) _then;

/// Create a copy of BookingDeveloperDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [BookingDeveloperDto].
extension BookingDeveloperDtoPatterns on BookingDeveloperDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookingDeveloperDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookingDeveloperDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookingDeveloperDto value)  $default,){
final _that = this;
switch (_that) {
case _BookingDeveloperDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookingDeveloperDto value)?  $default,){
final _that = this;
switch (_that) {
case _BookingDeveloperDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BookingDeveloperDto() when $default != null:
return $default(_that.id,_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name)  $default,) {final _that = this;
switch (_that) {
case _BookingDeveloperDto():
return $default(_that.id,_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name)?  $default,) {final _that = this;
switch (_that) {
case _BookingDeveloperDto() when $default != null:
return $default(_that.id,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BookingDeveloperDto implements BookingDeveloperDto {
  const _BookingDeveloperDto({this.id = 0, this.name = ''});
  factory _BookingDeveloperDto.fromJson(Map<String, dynamic> json) => _$BookingDeveloperDtoFromJson(json);

@override@JsonKey() final  int id;
@override@JsonKey() final  String name;

/// Create a copy of BookingDeveloperDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookingDeveloperDtoCopyWith<_BookingDeveloperDto> get copyWith => __$BookingDeveloperDtoCopyWithImpl<_BookingDeveloperDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BookingDeveloperDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookingDeveloperDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'BookingDeveloperDto(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class _$BookingDeveloperDtoCopyWith<$Res> implements $BookingDeveloperDtoCopyWith<$Res> {
  factory _$BookingDeveloperDtoCopyWith(_BookingDeveloperDto value, $Res Function(_BookingDeveloperDto) _then) = __$BookingDeveloperDtoCopyWithImpl;
@override @useResult
$Res call({
 int id, String name
});




}
/// @nodoc
class __$BookingDeveloperDtoCopyWithImpl<$Res>
    implements _$BookingDeveloperDtoCopyWith<$Res> {
  __$BookingDeveloperDtoCopyWithImpl(this._self, this._then);

  final _BookingDeveloperDto _self;
  final $Res Function(_BookingDeveloperDto) _then;

/// Create a copy of BookingDeveloperDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,}) {
  return _then(_BookingDeveloperDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$BookingUnitTypeDto {

 int get id; String get name; String? get icon;
/// Create a copy of BookingUnitTypeDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookingUnitTypeDtoCopyWith<BookingUnitTypeDto> get copyWith => _$BookingUnitTypeDtoCopyWithImpl<BookingUnitTypeDto>(this as BookingUnitTypeDto, _$identity);

  /// Serializes this BookingUnitTypeDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingUnitTypeDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.icon, icon) || other.icon == icon));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,icon);

@override
String toString() {
  return 'BookingUnitTypeDto(id: $id, name: $name, icon: $icon)';
}


}

/// @nodoc
abstract mixin class $BookingUnitTypeDtoCopyWith<$Res>  {
  factory $BookingUnitTypeDtoCopyWith(BookingUnitTypeDto value, $Res Function(BookingUnitTypeDto) _then) = _$BookingUnitTypeDtoCopyWithImpl;
@useResult
$Res call({
 int id, String name, String? icon
});




}
/// @nodoc
class _$BookingUnitTypeDtoCopyWithImpl<$Res>
    implements $BookingUnitTypeDtoCopyWith<$Res> {
  _$BookingUnitTypeDtoCopyWithImpl(this._self, this._then);

  final BookingUnitTypeDto _self;
  final $Res Function(BookingUnitTypeDto) _then;

/// Create a copy of BookingUnitTypeDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? icon = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [BookingUnitTypeDto].
extension BookingUnitTypeDtoPatterns on BookingUnitTypeDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookingUnitTypeDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookingUnitTypeDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookingUnitTypeDto value)  $default,){
final _that = this;
switch (_that) {
case _BookingUnitTypeDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookingUnitTypeDto value)?  $default,){
final _that = this;
switch (_that) {
case _BookingUnitTypeDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String? icon)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BookingUnitTypeDto() when $default != null:
return $default(_that.id,_that.name,_that.icon);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String? icon)  $default,) {final _that = this;
switch (_that) {
case _BookingUnitTypeDto():
return $default(_that.id,_that.name,_that.icon);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String? icon)?  $default,) {final _that = this;
switch (_that) {
case _BookingUnitTypeDto() when $default != null:
return $default(_that.id,_that.name,_that.icon);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BookingUnitTypeDto implements BookingUnitTypeDto {
  const _BookingUnitTypeDto({this.id = 0, this.name = '', this.icon});
  factory _BookingUnitTypeDto.fromJson(Map<String, dynamic> json) => _$BookingUnitTypeDtoFromJson(json);

@override@JsonKey() final  int id;
@override@JsonKey() final  String name;
@override final  String? icon;

/// Create a copy of BookingUnitTypeDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookingUnitTypeDtoCopyWith<_BookingUnitTypeDto> get copyWith => __$BookingUnitTypeDtoCopyWithImpl<_BookingUnitTypeDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BookingUnitTypeDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookingUnitTypeDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.icon, icon) || other.icon == icon));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,icon);

@override
String toString() {
  return 'BookingUnitTypeDto(id: $id, name: $name, icon: $icon)';
}


}

/// @nodoc
abstract mixin class _$BookingUnitTypeDtoCopyWith<$Res> implements $BookingUnitTypeDtoCopyWith<$Res> {
  factory _$BookingUnitTypeDtoCopyWith(_BookingUnitTypeDto value, $Res Function(_BookingUnitTypeDto) _then) = __$BookingUnitTypeDtoCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String? icon
});




}
/// @nodoc
class __$BookingUnitTypeDtoCopyWithImpl<$Res>
    implements _$BookingUnitTypeDtoCopyWith<$Res> {
  __$BookingUnitTypeDtoCopyWithImpl(this._self, this._then);

  final _BookingUnitTypeDto _self;
  final $Res Function(_BookingUnitTypeDto) _then;

/// Create a copy of BookingUnitTypeDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? icon = freezed,}) {
  return _then(_BookingUnitTypeDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$BookingUnitDto {

 BookingCityDto get city;@JsonKey(name: 'unit_type') BookingUnitTypeDto get unitType;@JsonKey(name: 'created_at', fromJson: _parseDateTime) DateTime get createdAt; int get id; String get title;@JsonKey(name: 'is_visible') bool get isVisible;@JsonKey(name: 'is_favourite') bool get isFavourite; String get address;@JsonKey(fromJson: _parseDouble) double get price;@JsonKey(name: 'offer_type') String get offerType;@JsonKey(fromJson: _parseDouble) double get area; int get rooms; int get bathrooms;@JsonKey(name: 'main_image') String get mainImage;@JsonKey(name: 'average_rating') int get averageRating;@JsonKey(name: 'reviews_count') int get reviewsCount; BookingCompoundDto? get compound; BookingDeveloperDto? get developer;
/// Create a copy of BookingUnitDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookingUnitDtoCopyWith<BookingUnitDto> get copyWith => _$BookingUnitDtoCopyWithImpl<BookingUnitDto>(this as BookingUnitDto, _$identity);

  /// Serializes this BookingUnitDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingUnitDto&&(identical(other.city, city) || other.city == city)&&(identical(other.unitType, unitType) || other.unitType == unitType)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.isVisible, isVisible) || other.isVisible == isVisible)&&(identical(other.isFavourite, isFavourite) || other.isFavourite == isFavourite)&&(identical(other.address, address) || other.address == address)&&(identical(other.price, price) || other.price == price)&&(identical(other.offerType, offerType) || other.offerType == offerType)&&(identical(other.area, area) || other.area == area)&&(identical(other.rooms, rooms) || other.rooms == rooms)&&(identical(other.bathrooms, bathrooms) || other.bathrooms == bathrooms)&&(identical(other.mainImage, mainImage) || other.mainImage == mainImage)&&(identical(other.averageRating, averageRating) || other.averageRating == averageRating)&&(identical(other.reviewsCount, reviewsCount) || other.reviewsCount == reviewsCount)&&(identical(other.compound, compound) || other.compound == compound)&&(identical(other.developer, developer) || other.developer == developer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,city,unitType,createdAt,id,title,isVisible,isFavourite,address,price,offerType,area,rooms,bathrooms,mainImage,averageRating,reviewsCount,compound,developer);

@override
String toString() {
  return 'BookingUnitDto(city: $city, unitType: $unitType, createdAt: $createdAt, id: $id, title: $title, isVisible: $isVisible, isFavourite: $isFavourite, address: $address, price: $price, offerType: $offerType, area: $area, rooms: $rooms, bathrooms: $bathrooms, mainImage: $mainImage, averageRating: $averageRating, reviewsCount: $reviewsCount, compound: $compound, developer: $developer)';
}


}

/// @nodoc
abstract mixin class $BookingUnitDtoCopyWith<$Res>  {
  factory $BookingUnitDtoCopyWith(BookingUnitDto value, $Res Function(BookingUnitDto) _then) = _$BookingUnitDtoCopyWithImpl;
@useResult
$Res call({
 BookingCityDto city,@JsonKey(name: 'unit_type') BookingUnitTypeDto unitType,@JsonKey(name: 'created_at', fromJson: _parseDateTime) DateTime createdAt, int id, String title,@JsonKey(name: 'is_visible') bool isVisible,@JsonKey(name: 'is_favourite') bool isFavourite, String address,@JsonKey(fromJson: _parseDouble) double price,@JsonKey(name: 'offer_type') String offerType,@JsonKey(fromJson: _parseDouble) double area, int rooms, int bathrooms,@JsonKey(name: 'main_image') String mainImage,@JsonKey(name: 'average_rating') int averageRating,@JsonKey(name: 'reviews_count') int reviewsCount, BookingCompoundDto? compound, BookingDeveloperDto? developer
});


$BookingCityDtoCopyWith<$Res> get city;$BookingUnitTypeDtoCopyWith<$Res> get unitType;$BookingCompoundDtoCopyWith<$Res>? get compound;$BookingDeveloperDtoCopyWith<$Res>? get developer;

}
/// @nodoc
class _$BookingUnitDtoCopyWithImpl<$Res>
    implements $BookingUnitDtoCopyWith<$Res> {
  _$BookingUnitDtoCopyWithImpl(this._self, this._then);

  final BookingUnitDto _self;
  final $Res Function(BookingUnitDto) _then;

/// Create a copy of BookingUnitDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? city = null,Object? unitType = null,Object? createdAt = null,Object? id = null,Object? title = null,Object? isVisible = null,Object? isFavourite = null,Object? address = null,Object? price = null,Object? offerType = null,Object? area = null,Object? rooms = null,Object? bathrooms = null,Object? mainImage = null,Object? averageRating = null,Object? reviewsCount = null,Object? compound = freezed,Object? developer = freezed,}) {
  return _then(_self.copyWith(
city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as BookingCityDto,unitType: null == unitType ? _self.unitType : unitType // ignore: cast_nullable_to_non_nullable
as BookingUnitTypeDto,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,isVisible: null == isVisible ? _self.isVisible : isVisible // ignore: cast_nullable_to_non_nullable
as bool,isFavourite: null == isFavourite ? _self.isFavourite : isFavourite // ignore: cast_nullable_to_non_nullable
as bool,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,offerType: null == offerType ? _self.offerType : offerType // ignore: cast_nullable_to_non_nullable
as String,area: null == area ? _self.area : area // ignore: cast_nullable_to_non_nullable
as double,rooms: null == rooms ? _self.rooms : rooms // ignore: cast_nullable_to_non_nullable
as int,bathrooms: null == bathrooms ? _self.bathrooms : bathrooms // ignore: cast_nullable_to_non_nullable
as int,mainImage: null == mainImage ? _self.mainImage : mainImage // ignore: cast_nullable_to_non_nullable
as String,averageRating: null == averageRating ? _self.averageRating : averageRating // ignore: cast_nullable_to_non_nullable
as int,reviewsCount: null == reviewsCount ? _self.reviewsCount : reviewsCount // ignore: cast_nullable_to_non_nullable
as int,compound: freezed == compound ? _self.compound : compound // ignore: cast_nullable_to_non_nullable
as BookingCompoundDto?,developer: freezed == developer ? _self.developer : developer // ignore: cast_nullable_to_non_nullable
as BookingDeveloperDto?,
  ));
}
/// Create a copy of BookingUnitDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookingCityDtoCopyWith<$Res> get city {
  
  return $BookingCityDtoCopyWith<$Res>(_self.city, (value) {
    return _then(_self.copyWith(city: value));
  });
}/// Create a copy of BookingUnitDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookingUnitTypeDtoCopyWith<$Res> get unitType {
  
  return $BookingUnitTypeDtoCopyWith<$Res>(_self.unitType, (value) {
    return _then(_self.copyWith(unitType: value));
  });
}/// Create a copy of BookingUnitDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookingCompoundDtoCopyWith<$Res>? get compound {
    if (_self.compound == null) {
    return null;
  }

  return $BookingCompoundDtoCopyWith<$Res>(_self.compound!, (value) {
    return _then(_self.copyWith(compound: value));
  });
}/// Create a copy of BookingUnitDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookingDeveloperDtoCopyWith<$Res>? get developer {
    if (_self.developer == null) {
    return null;
  }

  return $BookingDeveloperDtoCopyWith<$Res>(_self.developer!, (value) {
    return _then(_self.copyWith(developer: value));
  });
}
}


/// Adds pattern-matching-related methods to [BookingUnitDto].
extension BookingUnitDtoPatterns on BookingUnitDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookingUnitDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookingUnitDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookingUnitDto value)  $default,){
final _that = this;
switch (_that) {
case _BookingUnitDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookingUnitDto value)?  $default,){
final _that = this;
switch (_that) {
case _BookingUnitDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( BookingCityDto city, @JsonKey(name: 'unit_type')  BookingUnitTypeDto unitType, @JsonKey(name: 'created_at', fromJson: _parseDateTime)  DateTime createdAt,  int id,  String title, @JsonKey(name: 'is_visible')  bool isVisible, @JsonKey(name: 'is_favourite')  bool isFavourite,  String address, @JsonKey(fromJson: _parseDouble)  double price, @JsonKey(name: 'offer_type')  String offerType, @JsonKey(fromJson: _parseDouble)  double area,  int rooms,  int bathrooms, @JsonKey(name: 'main_image')  String mainImage, @JsonKey(name: 'average_rating')  int averageRating, @JsonKey(name: 'reviews_count')  int reviewsCount,  BookingCompoundDto? compound,  BookingDeveloperDto? developer)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BookingUnitDto() when $default != null:
return $default(_that.city,_that.unitType,_that.createdAt,_that.id,_that.title,_that.isVisible,_that.isFavourite,_that.address,_that.price,_that.offerType,_that.area,_that.rooms,_that.bathrooms,_that.mainImage,_that.averageRating,_that.reviewsCount,_that.compound,_that.developer);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( BookingCityDto city, @JsonKey(name: 'unit_type')  BookingUnitTypeDto unitType, @JsonKey(name: 'created_at', fromJson: _parseDateTime)  DateTime createdAt,  int id,  String title, @JsonKey(name: 'is_visible')  bool isVisible, @JsonKey(name: 'is_favourite')  bool isFavourite,  String address, @JsonKey(fromJson: _parseDouble)  double price, @JsonKey(name: 'offer_type')  String offerType, @JsonKey(fromJson: _parseDouble)  double area,  int rooms,  int bathrooms, @JsonKey(name: 'main_image')  String mainImage, @JsonKey(name: 'average_rating')  int averageRating, @JsonKey(name: 'reviews_count')  int reviewsCount,  BookingCompoundDto? compound,  BookingDeveloperDto? developer)  $default,) {final _that = this;
switch (_that) {
case _BookingUnitDto():
return $default(_that.city,_that.unitType,_that.createdAt,_that.id,_that.title,_that.isVisible,_that.isFavourite,_that.address,_that.price,_that.offerType,_that.area,_that.rooms,_that.bathrooms,_that.mainImage,_that.averageRating,_that.reviewsCount,_that.compound,_that.developer);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( BookingCityDto city, @JsonKey(name: 'unit_type')  BookingUnitTypeDto unitType, @JsonKey(name: 'created_at', fromJson: _parseDateTime)  DateTime createdAt,  int id,  String title, @JsonKey(name: 'is_visible')  bool isVisible, @JsonKey(name: 'is_favourite')  bool isFavourite,  String address, @JsonKey(fromJson: _parseDouble)  double price, @JsonKey(name: 'offer_type')  String offerType, @JsonKey(fromJson: _parseDouble)  double area,  int rooms,  int bathrooms, @JsonKey(name: 'main_image')  String mainImage, @JsonKey(name: 'average_rating')  int averageRating, @JsonKey(name: 'reviews_count')  int reviewsCount,  BookingCompoundDto? compound,  BookingDeveloperDto? developer)?  $default,) {final _that = this;
switch (_that) {
case _BookingUnitDto() when $default != null:
return $default(_that.city,_that.unitType,_that.createdAt,_that.id,_that.title,_that.isVisible,_that.isFavourite,_that.address,_that.price,_that.offerType,_that.area,_that.rooms,_that.bathrooms,_that.mainImage,_that.averageRating,_that.reviewsCount,_that.compound,_that.developer);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BookingUnitDto implements BookingUnitDto {
  const _BookingUnitDto({required this.city, @JsonKey(name: 'unit_type') required this.unitType, @JsonKey(name: 'created_at', fromJson: _parseDateTime) required this.createdAt, this.id = 0, this.title = '', @JsonKey(name: 'is_visible') this.isVisible = false, @JsonKey(name: 'is_favourite') this.isFavourite = false, this.address = '', @JsonKey(fromJson: _parseDouble) this.price = 0.0, @JsonKey(name: 'offer_type') this.offerType = '', @JsonKey(fromJson: _parseDouble) this.area = 0.0, this.rooms = 0, this.bathrooms = 0, @JsonKey(name: 'main_image') this.mainImage = '', @JsonKey(name: 'average_rating') this.averageRating = 0, @JsonKey(name: 'reviews_count') this.reviewsCount = 0, this.compound, this.developer});
  factory _BookingUnitDto.fromJson(Map<String, dynamic> json) => _$BookingUnitDtoFromJson(json);

@override final  BookingCityDto city;
@override@JsonKey(name: 'unit_type') final  BookingUnitTypeDto unitType;
@override@JsonKey(name: 'created_at', fromJson: _parseDateTime) final  DateTime createdAt;
@override@JsonKey() final  int id;
@override@JsonKey() final  String title;
@override@JsonKey(name: 'is_visible') final  bool isVisible;
@override@JsonKey(name: 'is_favourite') final  bool isFavourite;
@override@JsonKey() final  String address;
@override@JsonKey(fromJson: _parseDouble) final  double price;
@override@JsonKey(name: 'offer_type') final  String offerType;
@override@JsonKey(fromJson: _parseDouble) final  double area;
@override@JsonKey() final  int rooms;
@override@JsonKey() final  int bathrooms;
@override@JsonKey(name: 'main_image') final  String mainImage;
@override@JsonKey(name: 'average_rating') final  int averageRating;
@override@JsonKey(name: 'reviews_count') final  int reviewsCount;
@override final  BookingCompoundDto? compound;
@override final  BookingDeveloperDto? developer;

/// Create a copy of BookingUnitDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookingUnitDtoCopyWith<_BookingUnitDto> get copyWith => __$BookingUnitDtoCopyWithImpl<_BookingUnitDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BookingUnitDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookingUnitDto&&(identical(other.city, city) || other.city == city)&&(identical(other.unitType, unitType) || other.unitType == unitType)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.isVisible, isVisible) || other.isVisible == isVisible)&&(identical(other.isFavourite, isFavourite) || other.isFavourite == isFavourite)&&(identical(other.address, address) || other.address == address)&&(identical(other.price, price) || other.price == price)&&(identical(other.offerType, offerType) || other.offerType == offerType)&&(identical(other.area, area) || other.area == area)&&(identical(other.rooms, rooms) || other.rooms == rooms)&&(identical(other.bathrooms, bathrooms) || other.bathrooms == bathrooms)&&(identical(other.mainImage, mainImage) || other.mainImage == mainImage)&&(identical(other.averageRating, averageRating) || other.averageRating == averageRating)&&(identical(other.reviewsCount, reviewsCount) || other.reviewsCount == reviewsCount)&&(identical(other.compound, compound) || other.compound == compound)&&(identical(other.developer, developer) || other.developer == developer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,city,unitType,createdAt,id,title,isVisible,isFavourite,address,price,offerType,area,rooms,bathrooms,mainImage,averageRating,reviewsCount,compound,developer);

@override
String toString() {
  return 'BookingUnitDto(city: $city, unitType: $unitType, createdAt: $createdAt, id: $id, title: $title, isVisible: $isVisible, isFavourite: $isFavourite, address: $address, price: $price, offerType: $offerType, area: $area, rooms: $rooms, bathrooms: $bathrooms, mainImage: $mainImage, averageRating: $averageRating, reviewsCount: $reviewsCount, compound: $compound, developer: $developer)';
}


}

/// @nodoc
abstract mixin class _$BookingUnitDtoCopyWith<$Res> implements $BookingUnitDtoCopyWith<$Res> {
  factory _$BookingUnitDtoCopyWith(_BookingUnitDto value, $Res Function(_BookingUnitDto) _then) = __$BookingUnitDtoCopyWithImpl;
@override @useResult
$Res call({
 BookingCityDto city,@JsonKey(name: 'unit_type') BookingUnitTypeDto unitType,@JsonKey(name: 'created_at', fromJson: _parseDateTime) DateTime createdAt, int id, String title,@JsonKey(name: 'is_visible') bool isVisible,@JsonKey(name: 'is_favourite') bool isFavourite, String address,@JsonKey(fromJson: _parseDouble) double price,@JsonKey(name: 'offer_type') String offerType,@JsonKey(fromJson: _parseDouble) double area, int rooms, int bathrooms,@JsonKey(name: 'main_image') String mainImage,@JsonKey(name: 'average_rating') int averageRating,@JsonKey(name: 'reviews_count') int reviewsCount, BookingCompoundDto? compound, BookingDeveloperDto? developer
});


@override $BookingCityDtoCopyWith<$Res> get city;@override $BookingUnitTypeDtoCopyWith<$Res> get unitType;@override $BookingCompoundDtoCopyWith<$Res>? get compound;@override $BookingDeveloperDtoCopyWith<$Res>? get developer;

}
/// @nodoc
class __$BookingUnitDtoCopyWithImpl<$Res>
    implements _$BookingUnitDtoCopyWith<$Res> {
  __$BookingUnitDtoCopyWithImpl(this._self, this._then);

  final _BookingUnitDto _self;
  final $Res Function(_BookingUnitDto) _then;

/// Create a copy of BookingUnitDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? city = null,Object? unitType = null,Object? createdAt = null,Object? id = null,Object? title = null,Object? isVisible = null,Object? isFavourite = null,Object? address = null,Object? price = null,Object? offerType = null,Object? area = null,Object? rooms = null,Object? bathrooms = null,Object? mainImage = null,Object? averageRating = null,Object? reviewsCount = null,Object? compound = freezed,Object? developer = freezed,}) {
  return _then(_BookingUnitDto(
city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as BookingCityDto,unitType: null == unitType ? _self.unitType : unitType // ignore: cast_nullable_to_non_nullable
as BookingUnitTypeDto,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,isVisible: null == isVisible ? _self.isVisible : isVisible // ignore: cast_nullable_to_non_nullable
as bool,isFavourite: null == isFavourite ? _self.isFavourite : isFavourite // ignore: cast_nullable_to_non_nullable
as bool,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,offerType: null == offerType ? _self.offerType : offerType // ignore: cast_nullable_to_non_nullable
as String,area: null == area ? _self.area : area // ignore: cast_nullable_to_non_nullable
as double,rooms: null == rooms ? _self.rooms : rooms // ignore: cast_nullable_to_non_nullable
as int,bathrooms: null == bathrooms ? _self.bathrooms : bathrooms // ignore: cast_nullable_to_non_nullable
as int,mainImage: null == mainImage ? _self.mainImage : mainImage // ignore: cast_nullable_to_non_nullable
as String,averageRating: null == averageRating ? _self.averageRating : averageRating // ignore: cast_nullable_to_non_nullable
as int,reviewsCount: null == reviewsCount ? _self.reviewsCount : reviewsCount // ignore: cast_nullable_to_non_nullable
as int,compound: freezed == compound ? _self.compound : compound // ignore: cast_nullable_to_non_nullable
as BookingCompoundDto?,developer: freezed == developer ? _self.developer : developer // ignore: cast_nullable_to_non_nullable
as BookingDeveloperDto?,
  ));
}

/// Create a copy of BookingUnitDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookingCityDtoCopyWith<$Res> get city {
  
  return $BookingCityDtoCopyWith<$Res>(_self.city, (value) {
    return _then(_self.copyWith(city: value));
  });
}/// Create a copy of BookingUnitDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookingUnitTypeDtoCopyWith<$Res> get unitType {
  
  return $BookingUnitTypeDtoCopyWith<$Res>(_self.unitType, (value) {
    return _then(_self.copyWith(unitType: value));
  });
}/// Create a copy of BookingUnitDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookingCompoundDtoCopyWith<$Res>? get compound {
    if (_self.compound == null) {
    return null;
  }

  return $BookingCompoundDtoCopyWith<$Res>(_self.compound!, (value) {
    return _then(_self.copyWith(compound: value));
  });
}/// Create a copy of BookingUnitDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookingDeveloperDtoCopyWith<$Res>? get developer {
    if (_self.developer == null) {
    return null;
  }

  return $BookingDeveloperDtoCopyWith<$Res>(_self.developer!, (value) {
    return _then(_self.copyWith(developer: value));
  });
}
}


/// @nodoc
mixin _$BookingDto {

 BookingUserDto get user; BookingUnitDto get unit; int get id;@JsonKey(name: 'user_id') int get userId; String get name; String get email; String get phone; String get date; String get time; String get status;@JsonKey(name: 'created_at') String get createdAt;@JsonKey(name: 'updated_at') String get updatedAt; String? get notes;@JsonKey(name: 'user_message') String? get userMessage;
/// Create a copy of BookingDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookingDtoCopyWith<BookingDto> get copyWith => _$BookingDtoCopyWithImpl<BookingDto>(this as BookingDto, _$identity);

  /// Serializes this BookingDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingDto&&(identical(other.user, user) || other.user == user)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.date, date) || other.date == date)&&(identical(other.time, time) || other.time == time)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.userMessage, userMessage) || other.userMessage == userMessage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,user,unit,id,userId,name,email,phone,date,time,status,createdAt,updatedAt,notes,userMessage);

@override
String toString() {
  return 'BookingDto(user: $user, unit: $unit, id: $id, userId: $userId, name: $name, email: $email, phone: $phone, date: $date, time: $time, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, notes: $notes, userMessage: $userMessage)';
}


}

/// @nodoc
abstract mixin class $BookingDtoCopyWith<$Res>  {
  factory $BookingDtoCopyWith(BookingDto value, $Res Function(BookingDto) _then) = _$BookingDtoCopyWithImpl;
@useResult
$Res call({
 BookingUserDto user, BookingUnitDto unit, int id,@JsonKey(name: 'user_id') int userId, String name, String email, String phone, String date, String time, String status,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'updated_at') String updatedAt, String? notes,@JsonKey(name: 'user_message') String? userMessage
});


$BookingUserDtoCopyWith<$Res> get user;$BookingUnitDtoCopyWith<$Res> get unit;

}
/// @nodoc
class _$BookingDtoCopyWithImpl<$Res>
    implements $BookingDtoCopyWith<$Res> {
  _$BookingDtoCopyWithImpl(this._self, this._then);

  final BookingDto _self;
  final $Res Function(BookingDto) _then;

/// Create a copy of BookingDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? user = null,Object? unit = null,Object? id = null,Object? userId = null,Object? name = null,Object? email = null,Object? phone = null,Object? date = null,Object? time = null,Object? status = null,Object? createdAt = null,Object? updatedAt = null,Object? notes = freezed,Object? userMessage = freezed,}) {
  return _then(_self.copyWith(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as BookingUserDto,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as BookingUnitDto,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,userMessage: freezed == userMessage ? _self.userMessage : userMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of BookingDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookingUserDtoCopyWith<$Res> get user {
  
  return $BookingUserDtoCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}/// Create a copy of BookingDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookingUnitDtoCopyWith<$Res> get unit {
  
  return $BookingUnitDtoCopyWith<$Res>(_self.unit, (value) {
    return _then(_self.copyWith(unit: value));
  });
}
}


/// Adds pattern-matching-related methods to [BookingDto].
extension BookingDtoPatterns on BookingDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookingDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookingDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookingDto value)  $default,){
final _that = this;
switch (_that) {
case _BookingDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookingDto value)?  $default,){
final _that = this;
switch (_that) {
case _BookingDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( BookingUserDto user,  BookingUnitDto unit,  int id, @JsonKey(name: 'user_id')  int userId,  String name,  String email,  String phone,  String date,  String time,  String status, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'updated_at')  String updatedAt,  String? notes, @JsonKey(name: 'user_message')  String? userMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BookingDto() when $default != null:
return $default(_that.user,_that.unit,_that.id,_that.userId,_that.name,_that.email,_that.phone,_that.date,_that.time,_that.status,_that.createdAt,_that.updatedAt,_that.notes,_that.userMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( BookingUserDto user,  BookingUnitDto unit,  int id, @JsonKey(name: 'user_id')  int userId,  String name,  String email,  String phone,  String date,  String time,  String status, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'updated_at')  String updatedAt,  String? notes, @JsonKey(name: 'user_message')  String? userMessage)  $default,) {final _that = this;
switch (_that) {
case _BookingDto():
return $default(_that.user,_that.unit,_that.id,_that.userId,_that.name,_that.email,_that.phone,_that.date,_that.time,_that.status,_that.createdAt,_that.updatedAt,_that.notes,_that.userMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( BookingUserDto user,  BookingUnitDto unit,  int id, @JsonKey(name: 'user_id')  int userId,  String name,  String email,  String phone,  String date,  String time,  String status, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'updated_at')  String updatedAt,  String? notes, @JsonKey(name: 'user_message')  String? userMessage)?  $default,) {final _that = this;
switch (_that) {
case _BookingDto() when $default != null:
return $default(_that.user,_that.unit,_that.id,_that.userId,_that.name,_that.email,_that.phone,_that.date,_that.time,_that.status,_that.createdAt,_that.updatedAt,_that.notes,_that.userMessage);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BookingDto implements BookingDto {
  const _BookingDto({required this.user, required this.unit, this.id = 0, @JsonKey(name: 'user_id') this.userId = 0, this.name = '', this.email = '', this.phone = '', this.date = '', this.time = '', this.status = '', @JsonKey(name: 'created_at') this.createdAt = '', @JsonKey(name: 'updated_at') this.updatedAt = '', this.notes, @JsonKey(name: 'user_message') this.userMessage});
  factory _BookingDto.fromJson(Map<String, dynamic> json) => _$BookingDtoFromJson(json);

@override final  BookingUserDto user;
@override final  BookingUnitDto unit;
@override@JsonKey() final  int id;
@override@JsonKey(name: 'user_id') final  int userId;
@override@JsonKey() final  String name;
@override@JsonKey() final  String email;
@override@JsonKey() final  String phone;
@override@JsonKey() final  String date;
@override@JsonKey() final  String time;
@override@JsonKey() final  String status;
@override@JsonKey(name: 'created_at') final  String createdAt;
@override@JsonKey(name: 'updated_at') final  String updatedAt;
@override final  String? notes;
@override@JsonKey(name: 'user_message') final  String? userMessage;

/// Create a copy of BookingDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookingDtoCopyWith<_BookingDto> get copyWith => __$BookingDtoCopyWithImpl<_BookingDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BookingDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookingDto&&(identical(other.user, user) || other.user == user)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.date, date) || other.date == date)&&(identical(other.time, time) || other.time == time)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.userMessage, userMessage) || other.userMessage == userMessage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,user,unit,id,userId,name,email,phone,date,time,status,createdAt,updatedAt,notes,userMessage);

@override
String toString() {
  return 'BookingDto(user: $user, unit: $unit, id: $id, userId: $userId, name: $name, email: $email, phone: $phone, date: $date, time: $time, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, notes: $notes, userMessage: $userMessage)';
}


}

/// @nodoc
abstract mixin class _$BookingDtoCopyWith<$Res> implements $BookingDtoCopyWith<$Res> {
  factory _$BookingDtoCopyWith(_BookingDto value, $Res Function(_BookingDto) _then) = __$BookingDtoCopyWithImpl;
@override @useResult
$Res call({
 BookingUserDto user, BookingUnitDto unit, int id,@JsonKey(name: 'user_id') int userId, String name, String email, String phone, String date, String time, String status,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'updated_at') String updatedAt, String? notes,@JsonKey(name: 'user_message') String? userMessage
});


@override $BookingUserDtoCopyWith<$Res> get user;@override $BookingUnitDtoCopyWith<$Res> get unit;

}
/// @nodoc
class __$BookingDtoCopyWithImpl<$Res>
    implements _$BookingDtoCopyWith<$Res> {
  __$BookingDtoCopyWithImpl(this._self, this._then);

  final _BookingDto _self;
  final $Res Function(_BookingDto) _then;

/// Create a copy of BookingDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? user = null,Object? unit = null,Object? id = null,Object? userId = null,Object? name = null,Object? email = null,Object? phone = null,Object? date = null,Object? time = null,Object? status = null,Object? createdAt = null,Object? updatedAt = null,Object? notes = freezed,Object? userMessage = freezed,}) {
  return _then(_BookingDto(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as BookingUserDto,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as BookingUnitDto,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,userMessage: freezed == userMessage ? _self.userMessage : userMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of BookingDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookingUserDtoCopyWith<$Res> get user {
  
  return $BookingUserDtoCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}/// Create a copy of BookingDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookingUnitDtoCopyWith<$Res> get unit {
  
  return $BookingUnitDtoCopyWith<$Res>(_self.unit, (value) {
    return _then(_self.copyWith(unit: value));
  });
}
}


/// @nodoc
mixin _$BookingResponseDto {

 bool get status; String get message; List<BookingDto> get data; PaginationModel? get pagination;
/// Create a copy of BookingResponseDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookingResponseDtoCopyWith<BookingResponseDto> get copyWith => _$BookingResponseDtoCopyWithImpl<BookingResponseDto>(this as BookingResponseDto, _$identity);

  /// Serializes this BookingResponseDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingResponseDto&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.pagination, pagination) || other.pagination == pagination));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,message,const DeepCollectionEquality().hash(data),pagination);

@override
String toString() {
  return 'BookingResponseDto(status: $status, message: $message, data: $data, pagination: $pagination)';
}


}

/// @nodoc
abstract mixin class $BookingResponseDtoCopyWith<$Res>  {
  factory $BookingResponseDtoCopyWith(BookingResponseDto value, $Res Function(BookingResponseDto) _then) = _$BookingResponseDtoCopyWithImpl;
@useResult
$Res call({
 bool status, String message, List<BookingDto> data, PaginationModel? pagination
});


$PaginationModelCopyWith<$Res>? get pagination;

}
/// @nodoc
class _$BookingResponseDtoCopyWithImpl<$Res>
    implements $BookingResponseDtoCopyWith<$Res> {
  _$BookingResponseDtoCopyWithImpl(this._self, this._then);

  final BookingResponseDto _self;
  final $Res Function(BookingResponseDto) _then;

/// Create a copy of BookingResponseDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? message = null,Object? data = null,Object? pagination = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<BookingDto>,pagination: freezed == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as PaginationModel?,
  ));
}
/// Create a copy of BookingResponseDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationModelCopyWith<$Res>? get pagination {
    if (_self.pagination == null) {
    return null;
  }

  return $PaginationModelCopyWith<$Res>(_self.pagination!, (value) {
    return _then(_self.copyWith(pagination: value));
  });
}
}


/// Adds pattern-matching-related methods to [BookingResponseDto].
extension BookingResponseDtoPatterns on BookingResponseDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookingResponseDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookingResponseDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookingResponseDto value)  $default,){
final _that = this;
switch (_that) {
case _BookingResponseDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookingResponseDto value)?  $default,){
final _that = this;
switch (_that) {
case _BookingResponseDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool status,  String message,  List<BookingDto> data,  PaginationModel? pagination)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BookingResponseDto() when $default != null:
return $default(_that.status,_that.message,_that.data,_that.pagination);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool status,  String message,  List<BookingDto> data,  PaginationModel? pagination)  $default,) {final _that = this;
switch (_that) {
case _BookingResponseDto():
return $default(_that.status,_that.message,_that.data,_that.pagination);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool status,  String message,  List<BookingDto> data,  PaginationModel? pagination)?  $default,) {final _that = this;
switch (_that) {
case _BookingResponseDto() when $default != null:
return $default(_that.status,_that.message,_that.data,_that.pagination);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BookingResponseDto implements BookingResponseDto {
  const _BookingResponseDto({this.status = false, this.message = '', final  List<BookingDto> data = const <BookingDto>[], this.pagination}): _data = data;
  factory _BookingResponseDto.fromJson(Map<String, dynamic> json) => _$BookingResponseDtoFromJson(json);

@override@JsonKey() final  bool status;
@override@JsonKey() final  String message;
 final  List<BookingDto> _data;
@override@JsonKey() List<BookingDto> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}

@override final  PaginationModel? pagination;

/// Create a copy of BookingResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookingResponseDtoCopyWith<_BookingResponseDto> get copyWith => __$BookingResponseDtoCopyWithImpl<_BookingResponseDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BookingResponseDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookingResponseDto&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other._data, _data)&&(identical(other.pagination, pagination) || other.pagination == pagination));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,message,const DeepCollectionEquality().hash(_data),pagination);

@override
String toString() {
  return 'BookingResponseDto(status: $status, message: $message, data: $data, pagination: $pagination)';
}


}

/// @nodoc
abstract mixin class _$BookingResponseDtoCopyWith<$Res> implements $BookingResponseDtoCopyWith<$Res> {
  factory _$BookingResponseDtoCopyWith(_BookingResponseDto value, $Res Function(_BookingResponseDto) _then) = __$BookingResponseDtoCopyWithImpl;
@override @useResult
$Res call({
 bool status, String message, List<BookingDto> data, PaginationModel? pagination
});


@override $PaginationModelCopyWith<$Res>? get pagination;

}
/// @nodoc
class __$BookingResponseDtoCopyWithImpl<$Res>
    implements _$BookingResponseDtoCopyWith<$Res> {
  __$BookingResponseDtoCopyWithImpl(this._self, this._then);

  final _BookingResponseDto _self;
  final $Res Function(_BookingResponseDto) _then;

/// Create a copy of BookingResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? message = null,Object? data = null,Object? pagination = freezed,}) {
  return _then(_BookingResponseDto(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<BookingDto>,pagination: freezed == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as PaginationModel?,
  ));
}

/// Create a copy of BookingResponseDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationModelCopyWith<$Res>? get pagination {
    if (_self.pagination == null) {
    return null;
  }

  return $PaginationModelCopyWith<$Res>(_self.pagination!, (value) {
    return _then(_self.copyWith(pagination: value));
  });
}
}

// dart format on
