// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BookingUserEntity {

 int get id; String get name; String get email;
/// Create a copy of BookingUserEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookingUserEntityCopyWith<BookingUserEntity> get copyWith => _$BookingUserEntityCopyWithImpl<BookingUserEntity>(this as BookingUserEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingUserEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,email);

@override
String toString() {
  return 'BookingUserEntity(id: $id, name: $name, email: $email)';
}


}

/// @nodoc
abstract mixin class $BookingUserEntityCopyWith<$Res>  {
  factory $BookingUserEntityCopyWith(BookingUserEntity value, $Res Function(BookingUserEntity) _then) = _$BookingUserEntityCopyWithImpl;
@useResult
$Res call({
 int id, String name, String email
});




}
/// @nodoc
class _$BookingUserEntityCopyWithImpl<$Res>
    implements $BookingUserEntityCopyWith<$Res> {
  _$BookingUserEntityCopyWithImpl(this._self, this._then);

  final BookingUserEntity _self;
  final $Res Function(BookingUserEntity) _then;

/// Create a copy of BookingUserEntity
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


/// Adds pattern-matching-related methods to [BookingUserEntity].
extension BookingUserEntityPatterns on BookingUserEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookingUserEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookingUserEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookingUserEntity value)  $default,){
final _that = this;
switch (_that) {
case _BookingUserEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookingUserEntity value)?  $default,){
final _that = this;
switch (_that) {
case _BookingUserEntity() when $default != null:
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
case _BookingUserEntity() when $default != null:
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
case _BookingUserEntity():
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
case _BookingUserEntity() when $default != null:
return $default(_that.id,_that.name,_that.email);case _:
  return null;

}
}

}

/// @nodoc


class _BookingUserEntity implements BookingUserEntity {
  const _BookingUserEntity({required this.id, required this.name, required this.email});
  

@override final  int id;
@override final  String name;
@override final  String email;

/// Create a copy of BookingUserEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookingUserEntityCopyWith<_BookingUserEntity> get copyWith => __$BookingUserEntityCopyWithImpl<_BookingUserEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookingUserEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,email);

@override
String toString() {
  return 'BookingUserEntity(id: $id, name: $name, email: $email)';
}


}

/// @nodoc
abstract mixin class _$BookingUserEntityCopyWith<$Res> implements $BookingUserEntityCopyWith<$Res> {
  factory _$BookingUserEntityCopyWith(_BookingUserEntity value, $Res Function(_BookingUserEntity) _then) = __$BookingUserEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String email
});




}
/// @nodoc
class __$BookingUserEntityCopyWithImpl<$Res>
    implements _$BookingUserEntityCopyWith<$Res> {
  __$BookingUserEntityCopyWithImpl(this._self, this._then);

  final _BookingUserEntity _self;
  final $Res Function(_BookingUserEntity) _then;

/// Create a copy of BookingUserEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? email = null,}) {
  return _then(_BookingUserEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$BookingCityEntity {

 int get id; String get name;
/// Create a copy of BookingCityEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookingCityEntityCopyWith<BookingCityEntity> get copyWith => _$BookingCityEntityCopyWithImpl<BookingCityEntity>(this as BookingCityEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingCityEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}


@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'BookingCityEntity(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class $BookingCityEntityCopyWith<$Res>  {
  factory $BookingCityEntityCopyWith(BookingCityEntity value, $Res Function(BookingCityEntity) _then) = _$BookingCityEntityCopyWithImpl;
@useResult
$Res call({
 int id, String name
});




}
/// @nodoc
class _$BookingCityEntityCopyWithImpl<$Res>
    implements $BookingCityEntityCopyWith<$Res> {
  _$BookingCityEntityCopyWithImpl(this._self, this._then);

  final BookingCityEntity _self;
  final $Res Function(BookingCityEntity) _then;

/// Create a copy of BookingCityEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [BookingCityEntity].
extension BookingCityEntityPatterns on BookingCityEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookingCityEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookingCityEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookingCityEntity value)  $default,){
final _that = this;
switch (_that) {
case _BookingCityEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookingCityEntity value)?  $default,){
final _that = this;
switch (_that) {
case _BookingCityEntity() when $default != null:
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
case _BookingCityEntity() when $default != null:
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
case _BookingCityEntity():
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
case _BookingCityEntity() when $default != null:
return $default(_that.id,_that.name);case _:
  return null;

}
}

}

/// @nodoc


class _BookingCityEntity implements BookingCityEntity {
  const _BookingCityEntity({required this.id, required this.name});
  

@override final  int id;
@override final  String name;

/// Create a copy of BookingCityEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookingCityEntityCopyWith<_BookingCityEntity> get copyWith => __$BookingCityEntityCopyWithImpl<_BookingCityEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookingCityEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}


@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'BookingCityEntity(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class _$BookingCityEntityCopyWith<$Res> implements $BookingCityEntityCopyWith<$Res> {
  factory _$BookingCityEntityCopyWith(_BookingCityEntity value, $Res Function(_BookingCityEntity) _then) = __$BookingCityEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, String name
});




}
/// @nodoc
class __$BookingCityEntityCopyWithImpl<$Res>
    implements _$BookingCityEntityCopyWith<$Res> {
  __$BookingCityEntityCopyWithImpl(this._self, this._then);

  final _BookingCityEntity _self;
  final $Res Function(_BookingCityEntity) _then;

/// Create a copy of BookingCityEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,}) {
  return _then(_BookingCityEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$BookingCompoundEntity {

 int get id; String get name;
/// Create a copy of BookingCompoundEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookingCompoundEntityCopyWith<BookingCompoundEntity> get copyWith => _$BookingCompoundEntityCopyWithImpl<BookingCompoundEntity>(this as BookingCompoundEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingCompoundEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}


@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'BookingCompoundEntity(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class $BookingCompoundEntityCopyWith<$Res>  {
  factory $BookingCompoundEntityCopyWith(BookingCompoundEntity value, $Res Function(BookingCompoundEntity) _then) = _$BookingCompoundEntityCopyWithImpl;
@useResult
$Res call({
 int id, String name
});




}
/// @nodoc
class _$BookingCompoundEntityCopyWithImpl<$Res>
    implements $BookingCompoundEntityCopyWith<$Res> {
  _$BookingCompoundEntityCopyWithImpl(this._self, this._then);

  final BookingCompoundEntity _self;
  final $Res Function(BookingCompoundEntity) _then;

/// Create a copy of BookingCompoundEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [BookingCompoundEntity].
extension BookingCompoundEntityPatterns on BookingCompoundEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookingCompoundEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookingCompoundEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookingCompoundEntity value)  $default,){
final _that = this;
switch (_that) {
case _BookingCompoundEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookingCompoundEntity value)?  $default,){
final _that = this;
switch (_that) {
case _BookingCompoundEntity() when $default != null:
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
case _BookingCompoundEntity() when $default != null:
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
case _BookingCompoundEntity():
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
case _BookingCompoundEntity() when $default != null:
return $default(_that.id,_that.name);case _:
  return null;

}
}

}

/// @nodoc


class _BookingCompoundEntity implements BookingCompoundEntity {
  const _BookingCompoundEntity({required this.id, required this.name});
  

@override final  int id;
@override final  String name;

/// Create a copy of BookingCompoundEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookingCompoundEntityCopyWith<_BookingCompoundEntity> get copyWith => __$BookingCompoundEntityCopyWithImpl<_BookingCompoundEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookingCompoundEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}


@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'BookingCompoundEntity(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class _$BookingCompoundEntityCopyWith<$Res> implements $BookingCompoundEntityCopyWith<$Res> {
  factory _$BookingCompoundEntityCopyWith(_BookingCompoundEntity value, $Res Function(_BookingCompoundEntity) _then) = __$BookingCompoundEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, String name
});




}
/// @nodoc
class __$BookingCompoundEntityCopyWithImpl<$Res>
    implements _$BookingCompoundEntityCopyWith<$Res> {
  __$BookingCompoundEntityCopyWithImpl(this._self, this._then);

  final _BookingCompoundEntity _self;
  final $Res Function(_BookingCompoundEntity) _then;

/// Create a copy of BookingCompoundEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,}) {
  return _then(_BookingCompoundEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$BookingDeveloperEntity {

 int get id; String get name;
/// Create a copy of BookingDeveloperEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookingDeveloperEntityCopyWith<BookingDeveloperEntity> get copyWith => _$BookingDeveloperEntityCopyWithImpl<BookingDeveloperEntity>(this as BookingDeveloperEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingDeveloperEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}


@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'BookingDeveloperEntity(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class $BookingDeveloperEntityCopyWith<$Res>  {
  factory $BookingDeveloperEntityCopyWith(BookingDeveloperEntity value, $Res Function(BookingDeveloperEntity) _then) = _$BookingDeveloperEntityCopyWithImpl;
@useResult
$Res call({
 int id, String name
});




}
/// @nodoc
class _$BookingDeveloperEntityCopyWithImpl<$Res>
    implements $BookingDeveloperEntityCopyWith<$Res> {
  _$BookingDeveloperEntityCopyWithImpl(this._self, this._then);

  final BookingDeveloperEntity _self;
  final $Res Function(BookingDeveloperEntity) _then;

/// Create a copy of BookingDeveloperEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [BookingDeveloperEntity].
extension BookingDeveloperEntityPatterns on BookingDeveloperEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookingDeveloperEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookingDeveloperEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookingDeveloperEntity value)  $default,){
final _that = this;
switch (_that) {
case _BookingDeveloperEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookingDeveloperEntity value)?  $default,){
final _that = this;
switch (_that) {
case _BookingDeveloperEntity() when $default != null:
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
case _BookingDeveloperEntity() when $default != null:
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
case _BookingDeveloperEntity():
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
case _BookingDeveloperEntity() when $default != null:
return $default(_that.id,_that.name);case _:
  return null;

}
}

}

/// @nodoc


class _BookingDeveloperEntity implements BookingDeveloperEntity {
  const _BookingDeveloperEntity({required this.id, required this.name});
  

@override final  int id;
@override final  String name;

/// Create a copy of BookingDeveloperEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookingDeveloperEntityCopyWith<_BookingDeveloperEntity> get copyWith => __$BookingDeveloperEntityCopyWithImpl<_BookingDeveloperEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookingDeveloperEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}


@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'BookingDeveloperEntity(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class _$BookingDeveloperEntityCopyWith<$Res> implements $BookingDeveloperEntityCopyWith<$Res> {
  factory _$BookingDeveloperEntityCopyWith(_BookingDeveloperEntity value, $Res Function(_BookingDeveloperEntity) _then) = __$BookingDeveloperEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, String name
});




}
/// @nodoc
class __$BookingDeveloperEntityCopyWithImpl<$Res>
    implements _$BookingDeveloperEntityCopyWith<$Res> {
  __$BookingDeveloperEntityCopyWithImpl(this._self, this._then);

  final _BookingDeveloperEntity _self;
  final $Res Function(_BookingDeveloperEntity) _then;

/// Create a copy of BookingDeveloperEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,}) {
  return _then(_BookingDeveloperEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$BookingUnitTypeEntity {

 int get id; String get name; String? get icon;
/// Create a copy of BookingUnitTypeEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookingUnitTypeEntityCopyWith<BookingUnitTypeEntity> get copyWith => _$BookingUnitTypeEntityCopyWithImpl<BookingUnitTypeEntity>(this as BookingUnitTypeEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingUnitTypeEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.icon, icon) || other.icon == icon));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,icon);

@override
String toString() {
  return 'BookingUnitTypeEntity(id: $id, name: $name, icon: $icon)';
}


}

/// @nodoc
abstract mixin class $BookingUnitTypeEntityCopyWith<$Res>  {
  factory $BookingUnitTypeEntityCopyWith(BookingUnitTypeEntity value, $Res Function(BookingUnitTypeEntity) _then) = _$BookingUnitTypeEntityCopyWithImpl;
@useResult
$Res call({
 int id, String name, String? icon
});




}
/// @nodoc
class _$BookingUnitTypeEntityCopyWithImpl<$Res>
    implements $BookingUnitTypeEntityCopyWith<$Res> {
  _$BookingUnitTypeEntityCopyWithImpl(this._self, this._then);

  final BookingUnitTypeEntity _self;
  final $Res Function(BookingUnitTypeEntity) _then;

/// Create a copy of BookingUnitTypeEntity
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


/// Adds pattern-matching-related methods to [BookingUnitTypeEntity].
extension BookingUnitTypeEntityPatterns on BookingUnitTypeEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookingUnitTypeEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookingUnitTypeEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookingUnitTypeEntity value)  $default,){
final _that = this;
switch (_that) {
case _BookingUnitTypeEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookingUnitTypeEntity value)?  $default,){
final _that = this;
switch (_that) {
case _BookingUnitTypeEntity() when $default != null:
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
case _BookingUnitTypeEntity() when $default != null:
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
case _BookingUnitTypeEntity():
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
case _BookingUnitTypeEntity() when $default != null:
return $default(_that.id,_that.name,_that.icon);case _:
  return null;

}
}

}

/// @nodoc


class _BookingUnitTypeEntity implements BookingUnitTypeEntity {
  const _BookingUnitTypeEntity({required this.id, required this.name, this.icon});
  

@override final  int id;
@override final  String name;
@override final  String? icon;

/// Create a copy of BookingUnitTypeEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookingUnitTypeEntityCopyWith<_BookingUnitTypeEntity> get copyWith => __$BookingUnitTypeEntityCopyWithImpl<_BookingUnitTypeEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookingUnitTypeEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.icon, icon) || other.icon == icon));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,icon);

@override
String toString() {
  return 'BookingUnitTypeEntity(id: $id, name: $name, icon: $icon)';
}


}

/// @nodoc
abstract mixin class _$BookingUnitTypeEntityCopyWith<$Res> implements $BookingUnitTypeEntityCopyWith<$Res> {
  factory _$BookingUnitTypeEntityCopyWith(_BookingUnitTypeEntity value, $Res Function(_BookingUnitTypeEntity) _then) = __$BookingUnitTypeEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String? icon
});




}
/// @nodoc
class __$BookingUnitTypeEntityCopyWithImpl<$Res>
    implements _$BookingUnitTypeEntityCopyWith<$Res> {
  __$BookingUnitTypeEntityCopyWithImpl(this._self, this._then);

  final _BookingUnitTypeEntity _self;
  final $Res Function(_BookingUnitTypeEntity) _then;

/// Create a copy of BookingUnitTypeEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? icon = freezed,}) {
  return _then(_BookingUnitTypeEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$BookingUnitEntity {

 int get id; String get title; bool get isVisible; bool get isFavourite; String get address; double get price; String get offerType; double get area; int get rooms; int get bathrooms; BookingCityEntity get city; BookingUnitTypeEntity get unitType; String get mainImage; int get averageRating; int get reviewsCount; DateTime get createdAt; BookingCompoundEntity? get compound; BookingDeveloperEntity? get developer;
/// Create a copy of BookingUnitEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookingUnitEntityCopyWith<BookingUnitEntity> get copyWith => _$BookingUnitEntityCopyWithImpl<BookingUnitEntity>(this as BookingUnitEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingUnitEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.isVisible, isVisible) || other.isVisible == isVisible)&&(identical(other.isFavourite, isFavourite) || other.isFavourite == isFavourite)&&(identical(other.address, address) || other.address == address)&&(identical(other.price, price) || other.price == price)&&(identical(other.offerType, offerType) || other.offerType == offerType)&&(identical(other.area, area) || other.area == area)&&(identical(other.rooms, rooms) || other.rooms == rooms)&&(identical(other.bathrooms, bathrooms) || other.bathrooms == bathrooms)&&(identical(other.city, city) || other.city == city)&&(identical(other.unitType, unitType) || other.unitType == unitType)&&(identical(other.mainImage, mainImage) || other.mainImage == mainImage)&&(identical(other.averageRating, averageRating) || other.averageRating == averageRating)&&(identical(other.reviewsCount, reviewsCount) || other.reviewsCount == reviewsCount)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.compound, compound) || other.compound == compound)&&(identical(other.developer, developer) || other.developer == developer));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,isVisible,isFavourite,address,price,offerType,area,rooms,bathrooms,city,unitType,mainImage,averageRating,reviewsCount,createdAt,compound,developer);

@override
String toString() {
  return 'BookingUnitEntity(id: $id, title: $title, isVisible: $isVisible, isFavourite: $isFavourite, address: $address, price: $price, offerType: $offerType, area: $area, rooms: $rooms, bathrooms: $bathrooms, city: $city, unitType: $unitType, mainImage: $mainImage, averageRating: $averageRating, reviewsCount: $reviewsCount, createdAt: $createdAt, compound: $compound, developer: $developer)';
}


}

/// @nodoc
abstract mixin class $BookingUnitEntityCopyWith<$Res>  {
  factory $BookingUnitEntityCopyWith(BookingUnitEntity value, $Res Function(BookingUnitEntity) _then) = _$BookingUnitEntityCopyWithImpl;
@useResult
$Res call({
 int id, String title, bool isVisible, bool isFavourite, String address, double price, String offerType, double area, int rooms, int bathrooms, BookingCityEntity city, BookingUnitTypeEntity unitType, String mainImage, int averageRating, int reviewsCount, DateTime createdAt, BookingCompoundEntity? compound, BookingDeveloperEntity? developer
});


$BookingCityEntityCopyWith<$Res> get city;$BookingUnitTypeEntityCopyWith<$Res> get unitType;$BookingCompoundEntityCopyWith<$Res>? get compound;$BookingDeveloperEntityCopyWith<$Res>? get developer;

}
/// @nodoc
class _$BookingUnitEntityCopyWithImpl<$Res>
    implements $BookingUnitEntityCopyWith<$Res> {
  _$BookingUnitEntityCopyWithImpl(this._self, this._then);

  final BookingUnitEntity _self;
  final $Res Function(BookingUnitEntity) _then;

/// Create a copy of BookingUnitEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? isVisible = null,Object? isFavourite = null,Object? address = null,Object? price = null,Object? offerType = null,Object? area = null,Object? rooms = null,Object? bathrooms = null,Object? city = null,Object? unitType = null,Object? mainImage = null,Object? averageRating = null,Object? reviewsCount = null,Object? createdAt = null,Object? compound = freezed,Object? developer = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,isVisible: null == isVisible ? _self.isVisible : isVisible // ignore: cast_nullable_to_non_nullable
as bool,isFavourite: null == isFavourite ? _self.isFavourite : isFavourite // ignore: cast_nullable_to_non_nullable
as bool,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,offerType: null == offerType ? _self.offerType : offerType // ignore: cast_nullable_to_non_nullable
as String,area: null == area ? _self.area : area // ignore: cast_nullable_to_non_nullable
as double,rooms: null == rooms ? _self.rooms : rooms // ignore: cast_nullable_to_non_nullable
as int,bathrooms: null == bathrooms ? _self.bathrooms : bathrooms // ignore: cast_nullable_to_non_nullable
as int,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as BookingCityEntity,unitType: null == unitType ? _self.unitType : unitType // ignore: cast_nullable_to_non_nullable
as BookingUnitTypeEntity,mainImage: null == mainImage ? _self.mainImage : mainImage // ignore: cast_nullable_to_non_nullable
as String,averageRating: null == averageRating ? _self.averageRating : averageRating // ignore: cast_nullable_to_non_nullable
as int,reviewsCount: null == reviewsCount ? _self.reviewsCount : reviewsCount // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,compound: freezed == compound ? _self.compound : compound // ignore: cast_nullable_to_non_nullable
as BookingCompoundEntity?,developer: freezed == developer ? _self.developer : developer // ignore: cast_nullable_to_non_nullable
as BookingDeveloperEntity?,
  ));
}
/// Create a copy of BookingUnitEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookingCityEntityCopyWith<$Res> get city {
  
  return $BookingCityEntityCopyWith<$Res>(_self.city, (value) {
    return _then(_self.copyWith(city: value));
  });
}/// Create a copy of BookingUnitEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookingUnitTypeEntityCopyWith<$Res> get unitType {
  
  return $BookingUnitTypeEntityCopyWith<$Res>(_self.unitType, (value) {
    return _then(_self.copyWith(unitType: value));
  });
}/// Create a copy of BookingUnitEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookingCompoundEntityCopyWith<$Res>? get compound {
    if (_self.compound == null) {
    return null;
  }

  return $BookingCompoundEntityCopyWith<$Res>(_self.compound!, (value) {
    return _then(_self.copyWith(compound: value));
  });
}/// Create a copy of BookingUnitEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookingDeveloperEntityCopyWith<$Res>? get developer {
    if (_self.developer == null) {
    return null;
  }

  return $BookingDeveloperEntityCopyWith<$Res>(_self.developer!, (value) {
    return _then(_self.copyWith(developer: value));
  });
}
}


/// Adds pattern-matching-related methods to [BookingUnitEntity].
extension BookingUnitEntityPatterns on BookingUnitEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookingUnitEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookingUnitEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookingUnitEntity value)  $default,){
final _that = this;
switch (_that) {
case _BookingUnitEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookingUnitEntity value)?  $default,){
final _that = this;
switch (_that) {
case _BookingUnitEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String title,  bool isVisible,  bool isFavourite,  String address,  double price,  String offerType,  double area,  int rooms,  int bathrooms,  BookingCityEntity city,  BookingUnitTypeEntity unitType,  String mainImage,  int averageRating,  int reviewsCount,  DateTime createdAt,  BookingCompoundEntity? compound,  BookingDeveloperEntity? developer)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BookingUnitEntity() when $default != null:
return $default(_that.id,_that.title,_that.isVisible,_that.isFavourite,_that.address,_that.price,_that.offerType,_that.area,_that.rooms,_that.bathrooms,_that.city,_that.unitType,_that.mainImage,_that.averageRating,_that.reviewsCount,_that.createdAt,_that.compound,_that.developer);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String title,  bool isVisible,  bool isFavourite,  String address,  double price,  String offerType,  double area,  int rooms,  int bathrooms,  BookingCityEntity city,  BookingUnitTypeEntity unitType,  String mainImage,  int averageRating,  int reviewsCount,  DateTime createdAt,  BookingCompoundEntity? compound,  BookingDeveloperEntity? developer)  $default,) {final _that = this;
switch (_that) {
case _BookingUnitEntity():
return $default(_that.id,_that.title,_that.isVisible,_that.isFavourite,_that.address,_that.price,_that.offerType,_that.area,_that.rooms,_that.bathrooms,_that.city,_that.unitType,_that.mainImage,_that.averageRating,_that.reviewsCount,_that.createdAt,_that.compound,_that.developer);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String title,  bool isVisible,  bool isFavourite,  String address,  double price,  String offerType,  double area,  int rooms,  int bathrooms,  BookingCityEntity city,  BookingUnitTypeEntity unitType,  String mainImage,  int averageRating,  int reviewsCount,  DateTime createdAt,  BookingCompoundEntity? compound,  BookingDeveloperEntity? developer)?  $default,) {final _that = this;
switch (_that) {
case _BookingUnitEntity() when $default != null:
return $default(_that.id,_that.title,_that.isVisible,_that.isFavourite,_that.address,_that.price,_that.offerType,_that.area,_that.rooms,_that.bathrooms,_that.city,_that.unitType,_that.mainImage,_that.averageRating,_that.reviewsCount,_that.createdAt,_that.compound,_that.developer);case _:
  return null;

}
}

}

/// @nodoc


class _BookingUnitEntity implements BookingUnitEntity {
  const _BookingUnitEntity({required this.id, required this.title, required this.isVisible, required this.isFavourite, required this.address, required this.price, required this.offerType, required this.area, required this.rooms, required this.bathrooms, required this.city, required this.unitType, required this.mainImage, required this.averageRating, required this.reviewsCount, required this.createdAt, this.compound, this.developer});
  

@override final  int id;
@override final  String title;
@override final  bool isVisible;
@override final  bool isFavourite;
@override final  String address;
@override final  double price;
@override final  String offerType;
@override final  double area;
@override final  int rooms;
@override final  int bathrooms;
@override final  BookingCityEntity city;
@override final  BookingUnitTypeEntity unitType;
@override final  String mainImage;
@override final  int averageRating;
@override final  int reviewsCount;
@override final  DateTime createdAt;
@override final  BookingCompoundEntity? compound;
@override final  BookingDeveloperEntity? developer;

/// Create a copy of BookingUnitEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookingUnitEntityCopyWith<_BookingUnitEntity> get copyWith => __$BookingUnitEntityCopyWithImpl<_BookingUnitEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookingUnitEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.isVisible, isVisible) || other.isVisible == isVisible)&&(identical(other.isFavourite, isFavourite) || other.isFavourite == isFavourite)&&(identical(other.address, address) || other.address == address)&&(identical(other.price, price) || other.price == price)&&(identical(other.offerType, offerType) || other.offerType == offerType)&&(identical(other.area, area) || other.area == area)&&(identical(other.rooms, rooms) || other.rooms == rooms)&&(identical(other.bathrooms, bathrooms) || other.bathrooms == bathrooms)&&(identical(other.city, city) || other.city == city)&&(identical(other.unitType, unitType) || other.unitType == unitType)&&(identical(other.mainImage, mainImage) || other.mainImage == mainImage)&&(identical(other.averageRating, averageRating) || other.averageRating == averageRating)&&(identical(other.reviewsCount, reviewsCount) || other.reviewsCount == reviewsCount)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.compound, compound) || other.compound == compound)&&(identical(other.developer, developer) || other.developer == developer));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,isVisible,isFavourite,address,price,offerType,area,rooms,bathrooms,city,unitType,mainImage,averageRating,reviewsCount,createdAt,compound,developer);

@override
String toString() {
  return 'BookingUnitEntity(id: $id, title: $title, isVisible: $isVisible, isFavourite: $isFavourite, address: $address, price: $price, offerType: $offerType, area: $area, rooms: $rooms, bathrooms: $bathrooms, city: $city, unitType: $unitType, mainImage: $mainImage, averageRating: $averageRating, reviewsCount: $reviewsCount, createdAt: $createdAt, compound: $compound, developer: $developer)';
}


}

/// @nodoc
abstract mixin class _$BookingUnitEntityCopyWith<$Res> implements $BookingUnitEntityCopyWith<$Res> {
  factory _$BookingUnitEntityCopyWith(_BookingUnitEntity value, $Res Function(_BookingUnitEntity) _then) = __$BookingUnitEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, String title, bool isVisible, bool isFavourite, String address, double price, String offerType, double area, int rooms, int bathrooms, BookingCityEntity city, BookingUnitTypeEntity unitType, String mainImage, int averageRating, int reviewsCount, DateTime createdAt, BookingCompoundEntity? compound, BookingDeveloperEntity? developer
});


@override $BookingCityEntityCopyWith<$Res> get city;@override $BookingUnitTypeEntityCopyWith<$Res> get unitType;@override $BookingCompoundEntityCopyWith<$Res>? get compound;@override $BookingDeveloperEntityCopyWith<$Res>? get developer;

}
/// @nodoc
class __$BookingUnitEntityCopyWithImpl<$Res>
    implements _$BookingUnitEntityCopyWith<$Res> {
  __$BookingUnitEntityCopyWithImpl(this._self, this._then);

  final _BookingUnitEntity _self;
  final $Res Function(_BookingUnitEntity) _then;

/// Create a copy of BookingUnitEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? isVisible = null,Object? isFavourite = null,Object? address = null,Object? price = null,Object? offerType = null,Object? area = null,Object? rooms = null,Object? bathrooms = null,Object? city = null,Object? unitType = null,Object? mainImage = null,Object? averageRating = null,Object? reviewsCount = null,Object? createdAt = null,Object? compound = freezed,Object? developer = freezed,}) {
  return _then(_BookingUnitEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,isVisible: null == isVisible ? _self.isVisible : isVisible // ignore: cast_nullable_to_non_nullable
as bool,isFavourite: null == isFavourite ? _self.isFavourite : isFavourite // ignore: cast_nullable_to_non_nullable
as bool,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,offerType: null == offerType ? _self.offerType : offerType // ignore: cast_nullable_to_non_nullable
as String,area: null == area ? _self.area : area // ignore: cast_nullable_to_non_nullable
as double,rooms: null == rooms ? _self.rooms : rooms // ignore: cast_nullable_to_non_nullable
as int,bathrooms: null == bathrooms ? _self.bathrooms : bathrooms // ignore: cast_nullable_to_non_nullable
as int,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as BookingCityEntity,unitType: null == unitType ? _self.unitType : unitType // ignore: cast_nullable_to_non_nullable
as BookingUnitTypeEntity,mainImage: null == mainImage ? _self.mainImage : mainImage // ignore: cast_nullable_to_non_nullable
as String,averageRating: null == averageRating ? _self.averageRating : averageRating // ignore: cast_nullable_to_non_nullable
as int,reviewsCount: null == reviewsCount ? _self.reviewsCount : reviewsCount // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,compound: freezed == compound ? _self.compound : compound // ignore: cast_nullable_to_non_nullable
as BookingCompoundEntity?,developer: freezed == developer ? _self.developer : developer // ignore: cast_nullable_to_non_nullable
as BookingDeveloperEntity?,
  ));
}

/// Create a copy of BookingUnitEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookingCityEntityCopyWith<$Res> get city {
  
  return $BookingCityEntityCopyWith<$Res>(_self.city, (value) {
    return _then(_self.copyWith(city: value));
  });
}/// Create a copy of BookingUnitEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookingUnitTypeEntityCopyWith<$Res> get unitType {
  
  return $BookingUnitTypeEntityCopyWith<$Res>(_self.unitType, (value) {
    return _then(_self.copyWith(unitType: value));
  });
}/// Create a copy of BookingUnitEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookingCompoundEntityCopyWith<$Res>? get compound {
    if (_self.compound == null) {
    return null;
  }

  return $BookingCompoundEntityCopyWith<$Res>(_self.compound!, (value) {
    return _then(_self.copyWith(compound: value));
  });
}/// Create a copy of BookingUnitEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookingDeveloperEntityCopyWith<$Res>? get developer {
    if (_self.developer == null) {
    return null;
  }

  return $BookingDeveloperEntityCopyWith<$Res>(_self.developer!, (value) {
    return _then(_self.copyWith(developer: value));
  });
}
}

/// @nodoc
mixin _$BookingEntity {

 int get id; int get userId; BookingUserEntity get user; BookingUnitEntity get unit; String get name; String get email; String get phone; String get date; String get time; String get status; String get createdAt; String get updatedAt; String? get notes; String? get userMessage;
/// Create a copy of BookingEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookingEntityCopyWith<BookingEntity> get copyWith => _$BookingEntityCopyWithImpl<BookingEntity>(this as BookingEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.user, user) || other.user == user)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.date, date) || other.date == date)&&(identical(other.time, time) || other.time == time)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.userMessage, userMessage) || other.userMessage == userMessage));
}


@override
int get hashCode => Object.hash(runtimeType,id,userId,user,unit,name,email,phone,date,time,status,createdAt,updatedAt,notes,userMessage);

@override
String toString() {
  return 'BookingEntity(id: $id, userId: $userId, user: $user, unit: $unit, name: $name, email: $email, phone: $phone, date: $date, time: $time, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, notes: $notes, userMessage: $userMessage)';
}


}

/// @nodoc
abstract mixin class $BookingEntityCopyWith<$Res>  {
  factory $BookingEntityCopyWith(BookingEntity value, $Res Function(BookingEntity) _then) = _$BookingEntityCopyWithImpl;
@useResult
$Res call({
 int id, int userId, BookingUserEntity user, BookingUnitEntity unit, String name, String email, String phone, String date, String time, String status, String createdAt, String updatedAt, String? notes, String? userMessage
});


$BookingUserEntityCopyWith<$Res> get user;$BookingUnitEntityCopyWith<$Res> get unit;

}
/// @nodoc
class _$BookingEntityCopyWithImpl<$Res>
    implements $BookingEntityCopyWith<$Res> {
  _$BookingEntityCopyWithImpl(this._self, this._then);

  final BookingEntity _self;
  final $Res Function(BookingEntity) _then;

/// Create a copy of BookingEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? user = null,Object? unit = null,Object? name = null,Object? email = null,Object? phone = null,Object? date = null,Object? time = null,Object? status = null,Object? createdAt = null,Object? updatedAt = null,Object? notes = freezed,Object? userMessage = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as BookingUserEntity,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as BookingUnitEntity,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
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
/// Create a copy of BookingEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookingUserEntityCopyWith<$Res> get user {
  
  return $BookingUserEntityCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}/// Create a copy of BookingEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookingUnitEntityCopyWith<$Res> get unit {
  
  return $BookingUnitEntityCopyWith<$Res>(_self.unit, (value) {
    return _then(_self.copyWith(unit: value));
  });
}
}


/// Adds pattern-matching-related methods to [BookingEntity].
extension BookingEntityPatterns on BookingEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookingEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookingEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookingEntity value)  $default,){
final _that = this;
switch (_that) {
case _BookingEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookingEntity value)?  $default,){
final _that = this;
switch (_that) {
case _BookingEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int userId,  BookingUserEntity user,  BookingUnitEntity unit,  String name,  String email,  String phone,  String date,  String time,  String status,  String createdAt,  String updatedAt,  String? notes,  String? userMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BookingEntity() when $default != null:
return $default(_that.id,_that.userId,_that.user,_that.unit,_that.name,_that.email,_that.phone,_that.date,_that.time,_that.status,_that.createdAt,_that.updatedAt,_that.notes,_that.userMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int userId,  BookingUserEntity user,  BookingUnitEntity unit,  String name,  String email,  String phone,  String date,  String time,  String status,  String createdAt,  String updatedAt,  String? notes,  String? userMessage)  $default,) {final _that = this;
switch (_that) {
case _BookingEntity():
return $default(_that.id,_that.userId,_that.user,_that.unit,_that.name,_that.email,_that.phone,_that.date,_that.time,_that.status,_that.createdAt,_that.updatedAt,_that.notes,_that.userMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int userId,  BookingUserEntity user,  BookingUnitEntity unit,  String name,  String email,  String phone,  String date,  String time,  String status,  String createdAt,  String updatedAt,  String? notes,  String? userMessage)?  $default,) {final _that = this;
switch (_that) {
case _BookingEntity() when $default != null:
return $default(_that.id,_that.userId,_that.user,_that.unit,_that.name,_that.email,_that.phone,_that.date,_that.time,_that.status,_that.createdAt,_that.updatedAt,_that.notes,_that.userMessage);case _:
  return null;

}
}

}

/// @nodoc


class _BookingEntity implements BookingEntity {
  const _BookingEntity({required this.id, required this.userId, required this.user, required this.unit, required this.name, required this.email, required this.phone, required this.date, required this.time, required this.status, required this.createdAt, required this.updatedAt, this.notes, this.userMessage});
  

@override final  int id;
@override final  int userId;
@override final  BookingUserEntity user;
@override final  BookingUnitEntity unit;
@override final  String name;
@override final  String email;
@override final  String phone;
@override final  String date;
@override final  String time;
@override final  String status;
@override final  String createdAt;
@override final  String updatedAt;
@override final  String? notes;
@override final  String? userMessage;

/// Create a copy of BookingEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookingEntityCopyWith<_BookingEntity> get copyWith => __$BookingEntityCopyWithImpl<_BookingEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookingEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.user, user) || other.user == user)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.date, date) || other.date == date)&&(identical(other.time, time) || other.time == time)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.userMessage, userMessage) || other.userMessage == userMessage));
}


@override
int get hashCode => Object.hash(runtimeType,id,userId,user,unit,name,email,phone,date,time,status,createdAt,updatedAt,notes,userMessage);

@override
String toString() {
  return 'BookingEntity(id: $id, userId: $userId, user: $user, unit: $unit, name: $name, email: $email, phone: $phone, date: $date, time: $time, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, notes: $notes, userMessage: $userMessage)';
}


}

/// @nodoc
abstract mixin class _$BookingEntityCopyWith<$Res> implements $BookingEntityCopyWith<$Res> {
  factory _$BookingEntityCopyWith(_BookingEntity value, $Res Function(_BookingEntity) _then) = __$BookingEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, int userId, BookingUserEntity user, BookingUnitEntity unit, String name, String email, String phone, String date, String time, String status, String createdAt, String updatedAt, String? notes, String? userMessage
});


@override $BookingUserEntityCopyWith<$Res> get user;@override $BookingUnitEntityCopyWith<$Res> get unit;

}
/// @nodoc
class __$BookingEntityCopyWithImpl<$Res>
    implements _$BookingEntityCopyWith<$Res> {
  __$BookingEntityCopyWithImpl(this._self, this._then);

  final _BookingEntity _self;
  final $Res Function(_BookingEntity) _then;

/// Create a copy of BookingEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? user = null,Object? unit = null,Object? name = null,Object? email = null,Object? phone = null,Object? date = null,Object? time = null,Object? status = null,Object? createdAt = null,Object? updatedAt = null,Object? notes = freezed,Object? userMessage = freezed,}) {
  return _then(_BookingEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as BookingUserEntity,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as BookingUnitEntity,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
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

/// Create a copy of BookingEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookingUserEntityCopyWith<$Res> get user {
  
  return $BookingUserEntityCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}/// Create a copy of BookingEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookingUnitEntityCopyWith<$Res> get unit {
  
  return $BookingUnitEntityCopyWith<$Res>(_self.unit, (value) {
    return _then(_self.copyWith(unit: value));
  });
}
}

/// @nodoc
mixin _$BookingResponse {

 bool get status; String get message; List<BookingEntity> get data; PaginationModel? get pagination;
/// Create a copy of BookingResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookingResponseCopyWith<BookingResponse> get copyWith => _$BookingResponseCopyWithImpl<BookingResponse>(this as BookingResponse, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingResponse&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.pagination, pagination) || other.pagination == pagination));
}


@override
int get hashCode => Object.hash(runtimeType,status,message,const DeepCollectionEquality().hash(data),pagination);

@override
String toString() {
  return 'BookingResponse(status: $status, message: $message, data: $data, pagination: $pagination)';
}


}

/// @nodoc
abstract mixin class $BookingResponseCopyWith<$Res>  {
  factory $BookingResponseCopyWith(BookingResponse value, $Res Function(BookingResponse) _then) = _$BookingResponseCopyWithImpl;
@useResult
$Res call({
 bool status, String message, List<BookingEntity> data, PaginationModel? pagination
});


$PaginationModelCopyWith<$Res>? get pagination;

}
/// @nodoc
class _$BookingResponseCopyWithImpl<$Res>
    implements $BookingResponseCopyWith<$Res> {
  _$BookingResponseCopyWithImpl(this._self, this._then);

  final BookingResponse _self;
  final $Res Function(BookingResponse) _then;

/// Create a copy of BookingResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? message = null,Object? data = null,Object? pagination = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<BookingEntity>,pagination: freezed == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as PaginationModel?,
  ));
}
/// Create a copy of BookingResponse
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


/// Adds pattern-matching-related methods to [BookingResponse].
extension BookingResponsePatterns on BookingResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookingResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookingResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookingResponse value)  $default,){
final _that = this;
switch (_that) {
case _BookingResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookingResponse value)?  $default,){
final _that = this;
switch (_that) {
case _BookingResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool status,  String message,  List<BookingEntity> data,  PaginationModel? pagination)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BookingResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool status,  String message,  List<BookingEntity> data,  PaginationModel? pagination)  $default,) {final _that = this;
switch (_that) {
case _BookingResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool status,  String message,  List<BookingEntity> data,  PaginationModel? pagination)?  $default,) {final _that = this;
switch (_that) {
case _BookingResponse() when $default != null:
return $default(_that.status,_that.message,_that.data,_that.pagination);case _:
  return null;

}
}

}

/// @nodoc


class _BookingResponse implements BookingResponse {
  const _BookingResponse({required this.status, required this.message, required final  List<BookingEntity> data, this.pagination}): _data = data;
  

@override final  bool status;
@override final  String message;
 final  List<BookingEntity> _data;
@override List<BookingEntity> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}

@override final  PaginationModel? pagination;

/// Create a copy of BookingResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookingResponseCopyWith<_BookingResponse> get copyWith => __$BookingResponseCopyWithImpl<_BookingResponse>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookingResponse&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other._data, _data)&&(identical(other.pagination, pagination) || other.pagination == pagination));
}


@override
int get hashCode => Object.hash(runtimeType,status,message,const DeepCollectionEquality().hash(_data),pagination);

@override
String toString() {
  return 'BookingResponse(status: $status, message: $message, data: $data, pagination: $pagination)';
}


}

/// @nodoc
abstract mixin class _$BookingResponseCopyWith<$Res> implements $BookingResponseCopyWith<$Res> {
  factory _$BookingResponseCopyWith(_BookingResponse value, $Res Function(_BookingResponse) _then) = __$BookingResponseCopyWithImpl;
@override @useResult
$Res call({
 bool status, String message, List<BookingEntity> data, PaginationModel? pagination
});


@override $PaginationModelCopyWith<$Res>? get pagination;

}
/// @nodoc
class __$BookingResponseCopyWithImpl<$Res>
    implements _$BookingResponseCopyWith<$Res> {
  __$BookingResponseCopyWithImpl(this._self, this._then);

  final _BookingResponse _self;
  final $Res Function(_BookingResponse) _then;

/// Create a copy of BookingResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? message = null,Object? data = null,Object? pagination = freezed,}) {
  return _then(_BookingResponse(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<BookingEntity>,pagination: freezed == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as PaginationModel?,
  ));
}

/// Create a copy of BookingResponse
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
