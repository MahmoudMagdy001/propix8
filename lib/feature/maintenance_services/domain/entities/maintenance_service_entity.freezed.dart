// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'maintenance_service_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MaintenanceServiceEntity {

 int get id; String get title; String get category; String get image; String get createdAt;
/// Create a copy of MaintenanceServiceEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MaintenanceServiceEntityCopyWith<MaintenanceServiceEntity> get copyWith => _$MaintenanceServiceEntityCopyWithImpl<MaintenanceServiceEntity>(this as MaintenanceServiceEntity, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as MaintenanceServiceEntity;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MaintenanceServiceEntity&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.category, _this.category) || other.category == _this.category)&&(identical(other.image, _this.image) || other.image == _this.image)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt));
}


@override
int get hashCode {
  final _this = this as MaintenanceServiceEntity;
  return Object.hash(runtimeType,_this.id,_this.title,_this.category,_this.image,_this.createdAt);
}

@override
String toString() {
  final _this = this as MaintenanceServiceEntity;
  return 'MaintenanceServiceEntity(id: ${_this.id}, title: ${_this.title}, category: ${_this.category}, image: ${_this.image}, createdAt: ${_this.createdAt})';
}


}

/// @nodoc
abstract mixin class $MaintenanceServiceEntityCopyWith<$Res>  {
  factory $MaintenanceServiceEntityCopyWith(MaintenanceServiceEntity value, $Res Function(MaintenanceServiceEntity) _then) = _$MaintenanceServiceEntityCopyWithImpl;
@useResult
$Res call({
 int id, String title, String category, String image, String createdAt
});




}
/// @nodoc
class _$MaintenanceServiceEntityCopyWithImpl<$Res>
    implements $MaintenanceServiceEntityCopyWith<$Res> {
  _$MaintenanceServiceEntityCopyWithImpl(this._self, this._then);

  final MaintenanceServiceEntity _self;
  final $Res Function(MaintenanceServiceEntity) _then;

/// Create a copy of MaintenanceServiceEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? category = null,Object? image = null,Object? createdAt = null,}) {
  return _then(MaintenanceServiceEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [MaintenanceServiceEntity].
extension MaintenanceServiceEntityPatterns on MaintenanceServiceEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MaintenanceServiceEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MaintenanceServiceEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MaintenanceServiceEntity value)  $default,){
final _that = this;
switch (_that) {
case _MaintenanceServiceEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MaintenanceServiceEntity value)?  $default,){
final _that = this;
switch (_that) {
case _MaintenanceServiceEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String title,  String category,  String image,  String createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MaintenanceServiceEntity() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String title,  String category,  String image,  String createdAt)  $default,) {final _that = this;
switch (_that) {
case _MaintenanceServiceEntity():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String title,  String category,  String image,  String createdAt)?  $default,) {final _that = this;
switch (_that) {
case _MaintenanceServiceEntity() when $default != null:
return $default(_that.id,_that.title,_that.category,_that.image,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc


class _MaintenanceServiceEntity implements MaintenanceServiceEntity {
  const _MaintenanceServiceEntity({required this.id, required this.title, required this.category, required this.image, required this.createdAt});
  

@override final  int id;
@override final  String title;
@override final  String category;
@override final  String image;
@override final  String createdAt;

/// Create a copy of MaintenanceServiceEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MaintenanceServiceEntityCopyWith<_MaintenanceServiceEntity> get copyWith => __$MaintenanceServiceEntityCopyWithImpl<_MaintenanceServiceEntity>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _MaintenanceServiceEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.category, category) || other.category == category)&&(identical(other.image, image) || other.image == image)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,title,category,image,createdAt);
}

@override
String toString() {
    return 'MaintenanceServiceEntity(id: $id, title: $title, category: $category, image: $image, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$MaintenanceServiceEntityCopyWith<$Res> implements $MaintenanceServiceEntityCopyWith<$Res> {
  factory _$MaintenanceServiceEntityCopyWith(_MaintenanceServiceEntity value, $Res Function(_MaintenanceServiceEntity) _then) = __$MaintenanceServiceEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, String title, String category, String image, String createdAt
});




}
/// @nodoc
class __$MaintenanceServiceEntityCopyWithImpl<$Res>
    implements _$MaintenanceServiceEntityCopyWith<$Res> {
  __$MaintenanceServiceEntityCopyWithImpl(this._self, this._then);

  final _MaintenanceServiceEntity _self;
  final $Res Function(_MaintenanceServiceEntity) _then;

/// Create a copy of MaintenanceServiceEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? category = null,Object? image = null,Object? createdAt = null,}) {
  return _then(_MaintenanceServiceEntity(
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
mixin _$MaintenanceServicesDataEntity {

 List<MaintenanceServiceEntity> get home; List<MaintenanceServiceEntity> get technical;
/// Create a copy of MaintenanceServicesDataEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MaintenanceServicesDataEntityCopyWith<MaintenanceServicesDataEntity> get copyWith => _$MaintenanceServicesDataEntityCopyWithImpl<MaintenanceServicesDataEntity>(this as MaintenanceServicesDataEntity, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as MaintenanceServicesDataEntity;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MaintenanceServicesDataEntity&&const DeepCollectionEquality().equals(other.home, _this.home)&&const DeepCollectionEquality().equals(other.technical, _this.technical));
}


@override
int get hashCode {
  final _this = this as MaintenanceServicesDataEntity;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.home),const DeepCollectionEquality().hash(_this.technical));
}

@override
String toString() {
  final _this = this as MaintenanceServicesDataEntity;
  return 'MaintenanceServicesDataEntity(home: ${_this.home}, technical: ${_this.technical})';
}


}

/// @nodoc
abstract mixin class $MaintenanceServicesDataEntityCopyWith<$Res>  {
  factory $MaintenanceServicesDataEntityCopyWith(MaintenanceServicesDataEntity value, $Res Function(MaintenanceServicesDataEntity) _then) = _$MaintenanceServicesDataEntityCopyWithImpl;
@useResult
$Res call({
 List<MaintenanceServiceEntity> home, List<MaintenanceServiceEntity> technical
});




}
/// @nodoc
class _$MaintenanceServicesDataEntityCopyWithImpl<$Res>
    implements $MaintenanceServicesDataEntityCopyWith<$Res> {
  _$MaintenanceServicesDataEntityCopyWithImpl(this._self, this._then);

  final MaintenanceServicesDataEntity _self;
  final $Res Function(MaintenanceServicesDataEntity) _then;

/// Create a copy of MaintenanceServicesDataEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? home = null,Object? technical = null,}) {
  return _then(MaintenanceServicesDataEntity(
home: null == home ? _self.home : home // ignore: cast_nullable_to_non_nullable
as List<MaintenanceServiceEntity>,technical: null == technical ? _self.technical : technical // ignore: cast_nullable_to_non_nullable
as List<MaintenanceServiceEntity>,
  ));
}

}


/// Adds pattern-matching-related methods to [MaintenanceServicesDataEntity].
extension MaintenanceServicesDataEntityPatterns on MaintenanceServicesDataEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MaintenanceServicesDataEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MaintenanceServicesDataEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MaintenanceServicesDataEntity value)  $default,){
final _that = this;
switch (_that) {
case _MaintenanceServicesDataEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MaintenanceServicesDataEntity value)?  $default,){
final _that = this;
switch (_that) {
case _MaintenanceServicesDataEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<MaintenanceServiceEntity> home,  List<MaintenanceServiceEntity> technical)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MaintenanceServicesDataEntity() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<MaintenanceServiceEntity> home,  List<MaintenanceServiceEntity> technical)  $default,) {final _that = this;
switch (_that) {
case _MaintenanceServicesDataEntity():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<MaintenanceServiceEntity> home,  List<MaintenanceServiceEntity> technical)?  $default,) {final _that = this;
switch (_that) {
case _MaintenanceServicesDataEntity() when $default != null:
return $default(_that.home,_that.technical);case _:
  return null;

}
}

}

/// @nodoc


class _MaintenanceServicesDataEntity implements MaintenanceServicesDataEntity {
  const _MaintenanceServicesDataEntity({required  List<MaintenanceServiceEntity> home, required  List<MaintenanceServiceEntity> technical}): _home = home,_technical = technical;
  

 final  List<MaintenanceServiceEntity> _home;
@override List<MaintenanceServiceEntity> get home {
  if (_home is EqualUnmodifiableListView) return _home;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_home);
}

 final  List<MaintenanceServiceEntity> _technical;
@override List<MaintenanceServiceEntity> get technical {
  if (_technical is EqualUnmodifiableListView) return _technical;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_technical);
}


/// Create a copy of MaintenanceServicesDataEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MaintenanceServicesDataEntityCopyWith<_MaintenanceServicesDataEntity> get copyWith => __$MaintenanceServicesDataEntityCopyWithImpl<_MaintenanceServicesDataEntity>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _MaintenanceServicesDataEntity&&const DeepCollectionEquality().equals(other.home, _home)&&const DeepCollectionEquality().equals(other.technical, _technical));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_home),const DeepCollectionEquality().hash(_technical));
}

@override
String toString() {
    return 'MaintenanceServicesDataEntity(home: $home, technical: $technical)';
}


}

/// @nodoc
abstract mixin class _$MaintenanceServicesDataEntityCopyWith<$Res> implements $MaintenanceServicesDataEntityCopyWith<$Res> {
  factory _$MaintenanceServicesDataEntityCopyWith(_MaintenanceServicesDataEntity value, $Res Function(_MaintenanceServicesDataEntity) _then) = __$MaintenanceServicesDataEntityCopyWithImpl;
@override @useResult
$Res call({
 List<MaintenanceServiceEntity> home, List<MaintenanceServiceEntity> technical
});




}
/// @nodoc
class __$MaintenanceServicesDataEntityCopyWithImpl<$Res>
    implements _$MaintenanceServicesDataEntityCopyWith<$Res> {
  __$MaintenanceServicesDataEntityCopyWithImpl(this._self, this._then);

  final _MaintenanceServicesDataEntity _self;
  final $Res Function(_MaintenanceServicesDataEntity) _then;

/// Create a copy of MaintenanceServicesDataEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? home = null,Object? technical = null,}) {
  return _then(_MaintenanceServicesDataEntity(
home: null == home ? _self._home : home // ignore: cast_nullable_to_non_nullable
as List<MaintenanceServiceEntity>,technical: null == technical ? _self._technical : technical // ignore: cast_nullable_to_non_nullable
as List<MaintenanceServiceEntity>,
  ));
}


}

// dart format on
