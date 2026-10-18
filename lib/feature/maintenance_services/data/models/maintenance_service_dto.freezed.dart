// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'maintenance_service_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MaintenanceServiceDto {

 int get id; String get title; String get category; String get image;@JsonKey(name: 'created_at') String get createdAt;
/// Create a copy of MaintenanceServiceDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MaintenanceServiceDtoCopyWith<MaintenanceServiceDto> get copyWith => _$MaintenanceServiceDtoCopyWithImpl<MaintenanceServiceDto>(this as MaintenanceServiceDto, _$identity);

  /// Serializes this MaintenanceServiceDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as MaintenanceServiceDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MaintenanceServiceDto&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.category, _this.category) || other.category == _this.category)&&(identical(other.image, _this.image) || other.image == _this.image)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as MaintenanceServiceDto;
  return Object.hash(runtimeType,_this.id,_this.title,_this.category,_this.image,_this.createdAt);
}

@override
String toString() {
  final _this = this as MaintenanceServiceDto;
  return 'MaintenanceServiceDto(id: ${_this.id}, title: ${_this.title}, category: ${_this.category}, image: ${_this.image}, createdAt: ${_this.createdAt})';
}


}

/// @nodoc
abstract mixin class $MaintenanceServiceDtoCopyWith<$Res>  {
  factory $MaintenanceServiceDtoCopyWith(MaintenanceServiceDto value, $Res Function(MaintenanceServiceDto) _then) = _$MaintenanceServiceDtoCopyWithImpl;
@useResult
$Res call({
 int id, String title, String category, String image,@JsonKey(name: 'created_at') String createdAt
});




}
/// @nodoc
class _$MaintenanceServiceDtoCopyWithImpl<$Res>
    implements $MaintenanceServiceDtoCopyWith<$Res> {
  _$MaintenanceServiceDtoCopyWithImpl(this._self, this._then);

  final MaintenanceServiceDto _self;
  final $Res Function(MaintenanceServiceDto) _then;

/// Create a copy of MaintenanceServiceDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? category = null,Object? image = null,Object? createdAt = null,}) {
  return _then(MaintenanceServiceDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [MaintenanceServiceDto].
extension MaintenanceServiceDtoPatterns on MaintenanceServiceDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MaintenanceServiceDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MaintenanceServiceDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MaintenanceServiceDto value)  $default,){
final _that = this;
switch (_that) {
case _MaintenanceServiceDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MaintenanceServiceDto value)?  $default,){
final _that = this;
switch (_that) {
case _MaintenanceServiceDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String title,  String category,  String image, @JsonKey(name: 'created_at')  String createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MaintenanceServiceDto() when $default != null:
return $default(_that.id,_that.title,_that.category,_that.image,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String title,  String category,  String image, @JsonKey(name: 'created_at')  String createdAt)  $default,) {final _that = this;
switch (_that) {
case _MaintenanceServiceDto():
return $default(_that.id,_that.title,_that.category,_that.image,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String title,  String category,  String image, @JsonKey(name: 'created_at')  String createdAt)?  $default,) {final _that = this;
switch (_that) {
case _MaintenanceServiceDto() when $default != null:
return $default(_that.id,_that.title,_that.category,_that.image,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MaintenanceServiceDto implements MaintenanceServiceDto {
  const _MaintenanceServiceDto({this.id = 0, this.title = '', this.category = '', this.image = '', @JsonKey(name: 'created_at') this.createdAt = ''});
  factory _MaintenanceServiceDto.fromJson(Map<String, dynamic> json) => _$MaintenanceServiceDtoFromJson(json);

@override@JsonKey() final  int id;
@override@JsonKey() final  String title;
@override@JsonKey() final  String category;
@override@JsonKey() final  String image;
@override@JsonKey(name: 'created_at') final  String createdAt;

/// Create a copy of MaintenanceServiceDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MaintenanceServiceDtoCopyWith<_MaintenanceServiceDto> get copyWith => __$MaintenanceServiceDtoCopyWithImpl<_MaintenanceServiceDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MaintenanceServiceDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _MaintenanceServiceDto&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.category, category) || other.category == category)&&(identical(other.image, image) || other.image == image)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,title,category,image,createdAt);
}

@override
String toString() {
    return 'MaintenanceServiceDto(id: $id, title: $title, category: $category, image: $image, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$MaintenanceServiceDtoCopyWith<$Res> implements $MaintenanceServiceDtoCopyWith<$Res> {
  factory _$MaintenanceServiceDtoCopyWith(_MaintenanceServiceDto value, $Res Function(_MaintenanceServiceDto) _then) = __$MaintenanceServiceDtoCopyWithImpl;
@override @useResult
$Res call({
 int id, String title, String category, String image,@JsonKey(name: 'created_at') String createdAt
});




}
/// @nodoc
class __$MaintenanceServiceDtoCopyWithImpl<$Res>
    implements _$MaintenanceServiceDtoCopyWith<$Res> {
  __$MaintenanceServiceDtoCopyWithImpl(this._self, this._then);

  final _MaintenanceServiceDto _self;
  final $Res Function(_MaintenanceServiceDto) _then;

/// Create a copy of MaintenanceServiceDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? category = null,Object? image = null,Object? createdAt = null,}) {
  return _then(_MaintenanceServiceDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$MaintenanceDataDto {

 List<MaintenanceServiceDto> get home; List<MaintenanceServiceDto> get technical;
/// Create a copy of MaintenanceDataDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MaintenanceDataDtoCopyWith<MaintenanceDataDto> get copyWith => _$MaintenanceDataDtoCopyWithImpl<MaintenanceDataDto>(this as MaintenanceDataDto, _$identity);

  /// Serializes this MaintenanceDataDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as MaintenanceDataDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MaintenanceDataDto&&const DeepCollectionEquality().equals(other.home, _this.home)&&const DeepCollectionEquality().equals(other.technical, _this.technical));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as MaintenanceDataDto;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.home),const DeepCollectionEquality().hash(_this.technical));
}

@override
String toString() {
  final _this = this as MaintenanceDataDto;
  return 'MaintenanceDataDto(home: ${_this.home}, technical: ${_this.technical})';
}


}

/// @nodoc
abstract mixin class $MaintenanceDataDtoCopyWith<$Res>  {
  factory $MaintenanceDataDtoCopyWith(MaintenanceDataDto value, $Res Function(MaintenanceDataDto) _then) = _$MaintenanceDataDtoCopyWithImpl;
@useResult
$Res call({
 List<MaintenanceServiceDto> home, List<MaintenanceServiceDto> technical
});




}
/// @nodoc
class _$MaintenanceDataDtoCopyWithImpl<$Res>
    implements $MaintenanceDataDtoCopyWith<$Res> {
  _$MaintenanceDataDtoCopyWithImpl(this._self, this._then);

  final MaintenanceDataDto _self;
  final $Res Function(MaintenanceDataDto) _then;

/// Create a copy of MaintenanceDataDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? home = null,Object? technical = null,}) {
  return _then(MaintenanceDataDto(
home: null == home ? _self.home : home // ignore: cast_nullable_to_non_nullable
as List<MaintenanceServiceDto>,technical: null == technical ? _self.technical : technical // ignore: cast_nullable_to_non_nullable
as List<MaintenanceServiceDto>,
  ));
}

}


/// Adds pattern-matching-related methods to [MaintenanceDataDto].
extension MaintenanceDataDtoPatterns on MaintenanceDataDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MaintenanceDataDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MaintenanceDataDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MaintenanceDataDto value)  $default,){
final _that = this;
switch (_that) {
case _MaintenanceDataDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MaintenanceDataDto value)?  $default,){
final _that = this;
switch (_that) {
case _MaintenanceDataDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<MaintenanceServiceDto> home,  List<MaintenanceServiceDto> technical)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MaintenanceDataDto() when $default != null:
return $default(_that.home,_that.technical);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<MaintenanceServiceDto> home,  List<MaintenanceServiceDto> technical)  $default,) {final _that = this;
switch (_that) {
case _MaintenanceDataDto():
return $default(_that.home,_that.technical);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<MaintenanceServiceDto> home,  List<MaintenanceServiceDto> technical)?  $default,) {final _that = this;
switch (_that) {
case _MaintenanceDataDto() when $default != null:
return $default(_that.home,_that.technical);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MaintenanceDataDto implements MaintenanceDataDto {
  const _MaintenanceDataDto({ List<MaintenanceServiceDto> home = const <MaintenanceServiceDto>[],  List<MaintenanceServiceDto> technical = const <MaintenanceServiceDto>[]}): _home = home,_technical = technical;
  factory _MaintenanceDataDto.fromJson(Map<String, dynamic> json) => _$MaintenanceDataDtoFromJson(json);

 final  List<MaintenanceServiceDto> _home;
@override@JsonKey() List<MaintenanceServiceDto> get home {
  if (_home is EqualUnmodifiableListView) return _home;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_home);
}

 final  List<MaintenanceServiceDto> _technical;
@override@JsonKey() List<MaintenanceServiceDto> get technical {
  if (_technical is EqualUnmodifiableListView) return _technical;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_technical);
}


/// Create a copy of MaintenanceDataDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MaintenanceDataDtoCopyWith<_MaintenanceDataDto> get copyWith => __$MaintenanceDataDtoCopyWithImpl<_MaintenanceDataDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MaintenanceDataDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _MaintenanceDataDto&&const DeepCollectionEquality().equals(other.home, _home)&&const DeepCollectionEquality().equals(other.technical, _technical));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_home),const DeepCollectionEquality().hash(_technical));
}

@override
String toString() {
    return 'MaintenanceDataDto(home: $home, technical: $technical)';
}


}

/// @nodoc
abstract mixin class _$MaintenanceDataDtoCopyWith<$Res> implements $MaintenanceDataDtoCopyWith<$Res> {
  factory _$MaintenanceDataDtoCopyWith(_MaintenanceDataDto value, $Res Function(_MaintenanceDataDto) _then) = __$MaintenanceDataDtoCopyWithImpl;
@override @useResult
$Res call({
 List<MaintenanceServiceDto> home, List<MaintenanceServiceDto> technical
});




}
/// @nodoc
class __$MaintenanceDataDtoCopyWithImpl<$Res>
    implements _$MaintenanceDataDtoCopyWith<$Res> {
  __$MaintenanceDataDtoCopyWithImpl(this._self, this._then);

  final _MaintenanceDataDto _self;
  final $Res Function(_MaintenanceDataDto) _then;

/// Create a copy of MaintenanceDataDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? home = null,Object? technical = null,}) {
  return _then(_MaintenanceDataDto(
home: null == home ? _self._home : home // ignore: cast_nullable_to_non_nullable
as List<MaintenanceServiceDto>,technical: null == technical ? _self._technical : technical // ignore: cast_nullable_to_non_nullable
as List<MaintenanceServiceDto>,
  ));
}


}


/// @nodoc
mixin _$MaintenanceServicesResponseDto {

 bool get status; String get message; MaintenanceDataDto get data;
/// Create a copy of MaintenanceServicesResponseDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MaintenanceServicesResponseDtoCopyWith<MaintenanceServicesResponseDto> get copyWith => _$MaintenanceServicesResponseDtoCopyWithImpl<MaintenanceServicesResponseDto>(this as MaintenanceServicesResponseDto, _$identity);

  /// Serializes this MaintenanceServicesResponseDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as MaintenanceServicesResponseDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MaintenanceServicesResponseDto&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.message, _this.message) || other.message == _this.message)&&(identical(other.data, _this.data) || other.data == _this.data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as MaintenanceServicesResponseDto;
  return Object.hash(runtimeType,_this.status,_this.message,_this.data);
}

@override
String toString() {
  final _this = this as MaintenanceServicesResponseDto;
  return 'MaintenanceServicesResponseDto(status: ${_this.status}, message: ${_this.message}, data: ${_this.data})';
}


}

/// @nodoc
abstract mixin class $MaintenanceServicesResponseDtoCopyWith<$Res>  {
  factory $MaintenanceServicesResponseDtoCopyWith(MaintenanceServicesResponseDto value, $Res Function(MaintenanceServicesResponseDto) _then) = _$MaintenanceServicesResponseDtoCopyWithImpl;
@useResult
$Res call({
 bool status, String message, MaintenanceDataDto data
});


$MaintenanceDataDtoCopyWith<$Res> get data;

}
/// @nodoc
class _$MaintenanceServicesResponseDtoCopyWithImpl<$Res>
    implements $MaintenanceServicesResponseDtoCopyWith<$Res> {
  _$MaintenanceServicesResponseDtoCopyWithImpl(this._self, this._then);

  final MaintenanceServicesResponseDto _self;
  final $Res Function(MaintenanceServicesResponseDto) _then;

/// Create a copy of MaintenanceServicesResponseDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? message = null,Object? data = null,}) {
  return _then(MaintenanceServicesResponseDto(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as MaintenanceDataDto,
  ));
}
/// Create a copy of MaintenanceServicesResponseDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MaintenanceDataDtoCopyWith<$Res> get data {
  
  return $MaintenanceDataDtoCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [MaintenanceServicesResponseDto].
extension MaintenanceServicesResponseDtoPatterns on MaintenanceServicesResponseDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MaintenanceServicesResponseDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MaintenanceServicesResponseDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MaintenanceServicesResponseDto value)  $default,){
final _that = this;
switch (_that) {
case _MaintenanceServicesResponseDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MaintenanceServicesResponseDto value)?  $default,){
final _that = this;
switch (_that) {
case _MaintenanceServicesResponseDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool status,  String message,  MaintenanceDataDto data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MaintenanceServicesResponseDto() when $default != null:
return $default(_that.status,_that.message,_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool status,  String message,  MaintenanceDataDto data)  $default,) {final _that = this;
switch (_that) {
case _MaintenanceServicesResponseDto():
return $default(_that.status,_that.message,_that.data);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool status,  String message,  MaintenanceDataDto data)?  $default,) {final _that = this;
switch (_that) {
case _MaintenanceServicesResponseDto() when $default != null:
return $default(_that.status,_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MaintenanceServicesResponseDto implements MaintenanceServicesResponseDto {
  const _MaintenanceServicesResponseDto({this.status = false, this.message = '', this.data = const MaintenanceDataDto()});
  factory _MaintenanceServicesResponseDto.fromJson(Map<String, dynamic> json) => _$MaintenanceServicesResponseDtoFromJson(json);

@override@JsonKey() final  bool status;
@override@JsonKey() final  String message;
@override@JsonKey() final  MaintenanceDataDto data;

/// Create a copy of MaintenanceServicesResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MaintenanceServicesResponseDtoCopyWith<_MaintenanceServicesResponseDto> get copyWith => __$MaintenanceServicesResponseDtoCopyWithImpl<_MaintenanceServicesResponseDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MaintenanceServicesResponseDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _MaintenanceServicesResponseDto&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,status,message,data);
}

@override
String toString() {
    return 'MaintenanceServicesResponseDto(status: $status, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$MaintenanceServicesResponseDtoCopyWith<$Res> implements $MaintenanceServicesResponseDtoCopyWith<$Res> {
  factory _$MaintenanceServicesResponseDtoCopyWith(_MaintenanceServicesResponseDto value, $Res Function(_MaintenanceServicesResponseDto) _then) = __$MaintenanceServicesResponseDtoCopyWithImpl;
@override @useResult
$Res call({
 bool status, String message, MaintenanceDataDto data
});


@override $MaintenanceDataDtoCopyWith<$Res> get data;

}
/// @nodoc
class __$MaintenanceServicesResponseDtoCopyWithImpl<$Res>
    implements _$MaintenanceServicesResponseDtoCopyWith<$Res> {
  __$MaintenanceServicesResponseDtoCopyWithImpl(this._self, this._then);

  final _MaintenanceServicesResponseDto _self;
  final $Res Function(_MaintenanceServicesResponseDto) _then;

/// Create a copy of MaintenanceServicesResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? message = null,Object? data = null,}) {
  return _then(_MaintenanceServicesResponseDto(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as MaintenanceDataDto,
  ));
}

/// Create a copy of MaintenanceServicesResponseDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MaintenanceDataDtoCopyWith<$Res> get data {
  
  return $MaintenanceDataDtoCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$MaintenanceBookingResponseDto {

 bool get status; String get message; Map<String, dynamic>? get data;
/// Create a copy of MaintenanceBookingResponseDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MaintenanceBookingResponseDtoCopyWith<MaintenanceBookingResponseDto> get copyWith => _$MaintenanceBookingResponseDtoCopyWithImpl<MaintenanceBookingResponseDto>(this as MaintenanceBookingResponseDto, _$identity);

  /// Serializes this MaintenanceBookingResponseDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as MaintenanceBookingResponseDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MaintenanceBookingResponseDto&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.message, _this.message) || other.message == _this.message)&&const DeepCollectionEquality().equals(other.data, _this.data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as MaintenanceBookingResponseDto;
  return Object.hash(runtimeType,_this.status,_this.message,const DeepCollectionEquality().hash(_this.data));
}

@override
String toString() {
  final _this = this as MaintenanceBookingResponseDto;
  return 'MaintenanceBookingResponseDto(status: ${_this.status}, message: ${_this.message}, data: ${_this.data})';
}


}

/// @nodoc
abstract mixin class $MaintenanceBookingResponseDtoCopyWith<$Res>  {
  factory $MaintenanceBookingResponseDtoCopyWith(MaintenanceBookingResponseDto value, $Res Function(MaintenanceBookingResponseDto) _then) = _$MaintenanceBookingResponseDtoCopyWithImpl;
@useResult
$Res call({
 bool status, String message, Map<String, dynamic>? data
});




}
/// @nodoc
class _$MaintenanceBookingResponseDtoCopyWithImpl<$Res>
    implements $MaintenanceBookingResponseDtoCopyWith<$Res> {
  _$MaintenanceBookingResponseDtoCopyWithImpl(this._self, this._then);

  final MaintenanceBookingResponseDto _self;
  final $Res Function(MaintenanceBookingResponseDto) _then;

/// Create a copy of MaintenanceBookingResponseDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? message = null,Object? data = freezed,}) {
  return _then(MaintenanceBookingResponseDto(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [MaintenanceBookingResponseDto].
extension MaintenanceBookingResponseDtoPatterns on MaintenanceBookingResponseDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MaintenanceBookingResponseDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MaintenanceBookingResponseDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MaintenanceBookingResponseDto value)  $default,){
final _that = this;
switch (_that) {
case _MaintenanceBookingResponseDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MaintenanceBookingResponseDto value)?  $default,){
final _that = this;
switch (_that) {
case _MaintenanceBookingResponseDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool status,  String message,  Map<String, dynamic>? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MaintenanceBookingResponseDto() when $default != null:
return $default(_that.status,_that.message,_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool status,  String message,  Map<String, dynamic>? data)  $default,) {final _that = this;
switch (_that) {
case _MaintenanceBookingResponseDto():
return $default(_that.status,_that.message,_that.data);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool status,  String message,  Map<String, dynamic>? data)?  $default,) {final _that = this;
switch (_that) {
case _MaintenanceBookingResponseDto() when $default != null:
return $default(_that.status,_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MaintenanceBookingResponseDto implements MaintenanceBookingResponseDto {
  const _MaintenanceBookingResponseDto({this.status = false, this.message = '',  Map<String, dynamic>? data}): _data = data;
  factory _MaintenanceBookingResponseDto.fromJson(Map<String, dynamic> json) => _$MaintenanceBookingResponseDtoFromJson(json);

@override@JsonKey() final  bool status;
@override@JsonKey() final  String message;
 final  Map<String, dynamic>? _data;
@override Map<String, dynamic>? get data {
  final value = _data;
  if (value == null) return null;
  if (_data is EqualUnmodifiableMapView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of MaintenanceBookingResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MaintenanceBookingResponseDtoCopyWith<_MaintenanceBookingResponseDto> get copyWith => __$MaintenanceBookingResponseDtoCopyWithImpl<_MaintenanceBookingResponseDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MaintenanceBookingResponseDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _MaintenanceBookingResponseDto&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,status,message,const DeepCollectionEquality().hash(_data));
}

@override
String toString() {
    return 'MaintenanceBookingResponseDto(status: $status, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$MaintenanceBookingResponseDtoCopyWith<$Res> implements $MaintenanceBookingResponseDtoCopyWith<$Res> {
  factory _$MaintenanceBookingResponseDtoCopyWith(_MaintenanceBookingResponseDto value, $Res Function(_MaintenanceBookingResponseDto) _then) = __$MaintenanceBookingResponseDtoCopyWithImpl;
@override @useResult
$Res call({
 bool status, String message, Map<String, dynamic>? data
});




}
/// @nodoc
class __$MaintenanceBookingResponseDtoCopyWithImpl<$Res>
    implements _$MaintenanceBookingResponseDtoCopyWith<$Res> {
  __$MaintenanceBookingResponseDtoCopyWithImpl(this._self, this._then);

  final _MaintenanceBookingResponseDto _self;
  final $Res Function(_MaintenanceBookingResponseDto) _then;

/// Create a copy of MaintenanceBookingResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? message = null,Object? data = freezed,}) {
  return _then(_MaintenanceBookingResponseDto(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: freezed == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}

// dart format on
