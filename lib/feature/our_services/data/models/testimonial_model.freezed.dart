// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'testimonial_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TestimonialModel {

@JsonKey(name: 'created_at') DateTime get createdAt;@JsonKey(name: 'updated_at') DateTime get updatedAt; int get id;@JsonKey(name: 'user_id') int? get userId; String get name; String get position; String get content; String get image; bool get status;
/// Create a copy of TestimonialModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TestimonialModelCopyWith<TestimonialModel> get copyWith => _$TestimonialModelCopyWithImpl<TestimonialModel>(this as TestimonialModel, _$identity);

  /// Serializes this TestimonialModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as TestimonialModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TestimonialModel&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt)&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.userId, _this.userId) || other.userId == _this.userId)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.position, _this.position) || other.position == _this.position)&&(identical(other.content, _this.content) || other.content == _this.content)&&(identical(other.image, _this.image) || other.image == _this.image)&&(identical(other.status, _this.status) || other.status == _this.status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as TestimonialModel;
  return Object.hash(runtimeType,_this.createdAt,_this.updatedAt,_this.id,_this.userId,_this.name,_this.position,_this.content,_this.image,_this.status);
}

@override
String toString() {
  final _this = this as TestimonialModel;
  return 'TestimonialModel(createdAt: ${_this.createdAt}, updatedAt: ${_this.updatedAt}, id: ${_this.id}, userId: ${_this.userId}, name: ${_this.name}, position: ${_this.position}, content: ${_this.content}, image: ${_this.image}, status: ${_this.status})';
}


}

/// @nodoc
abstract mixin class $TestimonialModelCopyWith<$Res>  {
  factory $TestimonialModelCopyWith(TestimonialModel value, $Res Function(TestimonialModel) _then) = _$TestimonialModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt, int id,@JsonKey(name: 'user_id') int? userId, String name, String position, String content, String image, bool status
});




}
/// @nodoc
class _$TestimonialModelCopyWithImpl<$Res>
    implements $TestimonialModelCopyWith<$Res> {
  _$TestimonialModelCopyWithImpl(this._self, this._then);

  final TestimonialModel _self;
  final $Res Function(TestimonialModel) _then;

/// Create a copy of TestimonialModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? createdAt = null,Object? updatedAt = null,Object? id = null,Object? userId = freezed,Object? name = null,Object? position = null,Object? content = null,Object? image = null,Object? status = null,}) {
  return _then(TestimonialModel(
createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [TestimonialModel].
extension TestimonialModelPatterns on TestimonialModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TestimonialModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TestimonialModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TestimonialModel value)  $default,){
final _that = this;
switch (_that) {
case _TestimonialModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TestimonialModel value)?  $default,){
final _that = this;
switch (_that) {
case _TestimonialModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt,  int id, @JsonKey(name: 'user_id')  int? userId,  String name,  String position,  String content,  String image,  bool status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TestimonialModel() when $default != null:
return $default(_that.createdAt,_that.updatedAt,_that.id,_that.userId,_that.name,_that.position,_that.content,_that.image,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt,  int id, @JsonKey(name: 'user_id')  int? userId,  String name,  String position,  String content,  String image,  bool status)  $default,) {final _that = this;
switch (_that) {
case _TestimonialModel():
return $default(_that.createdAt,_that.updatedAt,_that.id,_that.userId,_that.name,_that.position,_that.content,_that.image,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt,  int id, @JsonKey(name: 'user_id')  int? userId,  String name,  String position,  String content,  String image,  bool status)?  $default,) {final _that = this;
switch (_that) {
case _TestimonialModel() when $default != null:
return $default(_that.createdAt,_that.updatedAt,_that.id,_that.userId,_that.name,_that.position,_that.content,_that.image,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TestimonialModel extends TestimonialModel {
  const _TestimonialModel({@JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt, this.id = 0, @JsonKey(name: 'user_id') this.userId, this.name = '', this.position = '', this.content = '', this.image = '', this.status = false}): super._();
  factory _TestimonialModel.fromJson(Map<String, dynamic> json) => _$TestimonialModelFromJson(json);

@override@JsonKey(name: 'created_at') final  DateTime createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime updatedAt;
@override@JsonKey() final  int id;
@override@JsonKey(name: 'user_id') final  int? userId;
@override@JsonKey() final  String name;
@override@JsonKey() final  String position;
@override@JsonKey() final  String content;
@override@JsonKey() final  String image;
@override@JsonKey() final  bool status;

/// Create a copy of TestimonialModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TestimonialModelCopyWith<_TestimonialModel> get copyWith => __$TestimonialModelCopyWithImpl<_TestimonialModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TestimonialModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TestimonialModel&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.name, name) || other.name == name)&&(identical(other.position, position) || other.position == position)&&(identical(other.content, content) || other.content == content)&&(identical(other.image, image) || other.image == image)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,createdAt,updatedAt,id,userId,name,position,content,image,status);
}

@override
String toString() {
    return 'TestimonialModel(createdAt: $createdAt, updatedAt: $updatedAt, id: $id, userId: $userId, name: $name, position: $position, content: $content, image: $image, status: $status)';
}


}

/// @nodoc
abstract mixin class _$TestimonialModelCopyWith<$Res> implements $TestimonialModelCopyWith<$Res> {
  factory _$TestimonialModelCopyWith(_TestimonialModel value, $Res Function(_TestimonialModel) _then) = __$TestimonialModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt, int id,@JsonKey(name: 'user_id') int? userId, String name, String position, String content, String image, bool status
});




}
/// @nodoc
class __$TestimonialModelCopyWithImpl<$Res>
    implements _$TestimonialModelCopyWith<$Res> {
  __$TestimonialModelCopyWithImpl(this._self, this._then);

  final _TestimonialModel _self;
  final $Res Function(_TestimonialModel) _then;

/// Create a copy of TestimonialModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? createdAt = null,Object? updatedAt = null,Object? id = null,Object? userId = freezed,Object? name = null,Object? position = null,Object? content = null,Object? image = null,Object? status = null,}) {
  return _then(_TestimonialModel(
createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
