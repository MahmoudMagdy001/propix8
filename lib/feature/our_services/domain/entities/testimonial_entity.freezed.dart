// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'testimonial_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TestimonialEntity {

 int get id; String get name; String get position; String get content; String get image; bool get status; DateTime get createdAt; DateTime get updatedAt; int? get userId;
/// Create a copy of TestimonialEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TestimonialEntityCopyWith<TestimonialEntity> get copyWith => _$TestimonialEntityCopyWithImpl<TestimonialEntity>(this as TestimonialEntity, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as TestimonialEntity;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TestimonialEntity&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.position, _this.position) || other.position == _this.position)&&(identical(other.content, _this.content) || other.content == _this.content)&&(identical(other.image, _this.image) || other.image == _this.image)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt)&&(identical(other.userId, _this.userId) || other.userId == _this.userId));
}


@override
int get hashCode {
  final _this = this as TestimonialEntity;
  return Object.hash(runtimeType,_this.id,_this.name,_this.position,_this.content,_this.image,_this.status,_this.createdAt,_this.updatedAt,_this.userId);
}

@override
String toString() {
  final _this = this as TestimonialEntity;
  return 'TestimonialEntity(id: ${_this.id}, name: ${_this.name}, position: ${_this.position}, content: ${_this.content}, image: ${_this.image}, status: ${_this.status}, createdAt: ${_this.createdAt}, updatedAt: ${_this.updatedAt}, userId: ${_this.userId})';
}


}

/// @nodoc
abstract mixin class $TestimonialEntityCopyWith<$Res>  {
  factory $TestimonialEntityCopyWith(TestimonialEntity value, $Res Function(TestimonialEntity) _then) = _$TestimonialEntityCopyWithImpl;
@useResult
$Res call({
 int id, String name, String position, String content, String image, bool status, DateTime createdAt, DateTime updatedAt, int? userId
});




}
/// @nodoc
class _$TestimonialEntityCopyWithImpl<$Res>
    implements $TestimonialEntityCopyWith<$Res> {
  _$TestimonialEntityCopyWithImpl(this._self, this._then);

  final TestimonialEntity _self;
  final $Res Function(TestimonialEntity) _then;

/// Create a copy of TestimonialEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? position = null,Object? content = null,Object? image = null,Object? status = null,Object? createdAt = null,Object? updatedAt = null,Object? userId = freezed,}) {
  return _then(TestimonialEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [TestimonialEntity].
extension TestimonialEntityPatterns on TestimonialEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TestimonialEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TestimonialEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TestimonialEntity value)  $default,){
final _that = this;
switch (_that) {
case _TestimonialEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TestimonialEntity value)?  $default,){
final _that = this;
switch (_that) {
case _TestimonialEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String position,  String content,  String image,  bool status,  DateTime createdAt,  DateTime updatedAt,  int? userId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TestimonialEntity() when $default != null:
return $default(_that.id,_that.name,_that.position,_that.content,_that.image,_that.status,_that.createdAt,_that.updatedAt,_that.userId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String position,  String content,  String image,  bool status,  DateTime createdAt,  DateTime updatedAt,  int? userId)  $default,) {final _that = this;
switch (_that) {
case _TestimonialEntity():
return $default(_that.id,_that.name,_that.position,_that.content,_that.image,_that.status,_that.createdAt,_that.updatedAt,_that.userId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String position,  String content,  String image,  bool status,  DateTime createdAt,  DateTime updatedAt,  int? userId)?  $default,) {final _that = this;
switch (_that) {
case _TestimonialEntity() when $default != null:
return $default(_that.id,_that.name,_that.position,_that.content,_that.image,_that.status,_that.createdAt,_that.updatedAt,_that.userId);case _:
  return null;

}
}

}

/// @nodoc


class _TestimonialEntity implements TestimonialEntity {
  const _TestimonialEntity({required this.id, required this.name, required this.position, required this.content, required this.image, required this.status, required this.createdAt, required this.updatedAt, this.userId});
  

@override final  int id;
@override final  String name;
@override final  String position;
@override final  String content;
@override final  String image;
@override final  bool status;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;
@override final  int? userId;

/// Create a copy of TestimonialEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TestimonialEntityCopyWith<_TestimonialEntity> get copyWith => __$TestimonialEntityCopyWithImpl<_TestimonialEntity>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TestimonialEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.position, position) || other.position == position)&&(identical(other.content, content) || other.content == content)&&(identical(other.image, image) || other.image == image)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.userId, userId) || other.userId == userId));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,name,position,content,image,status,createdAt,updatedAt,userId);
}

@override
String toString() {
    return 'TestimonialEntity(id: $id, name: $name, position: $position, content: $content, image: $image, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, userId: $userId)';
}


}

/// @nodoc
abstract mixin class _$TestimonialEntityCopyWith<$Res> implements $TestimonialEntityCopyWith<$Res> {
  factory _$TestimonialEntityCopyWith(_TestimonialEntity value, $Res Function(_TestimonialEntity) _then) = __$TestimonialEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String position, String content, String image, bool status, DateTime createdAt, DateTime updatedAt, int? userId
});




}
/// @nodoc
class __$TestimonialEntityCopyWithImpl<$Res>
    implements _$TestimonialEntityCopyWith<$Res> {
  __$TestimonialEntityCopyWithImpl(this._self, this._then);

  final _TestimonialEntity _self;
  final $Res Function(_TestimonialEntity) _then;

/// Create a copy of TestimonialEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? position = null,Object? content = null,Object? image = null,Object? status = null,Object? createdAt = null,Object? updatedAt = null,Object? userId = freezed,}) {
  return _then(_TestimonialEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
