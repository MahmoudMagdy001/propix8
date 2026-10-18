// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'page_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TeamMemberEntity {

 String get name; String get position; String get photo;
/// Create a copy of TeamMemberEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TeamMemberEntityCopyWith<TeamMemberEntity> get copyWith => _$TeamMemberEntityCopyWithImpl<TeamMemberEntity>(this as TeamMemberEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TeamMemberEntity&&(identical(other.name, name) || other.name == name)&&(identical(other.position, position) || other.position == position)&&(identical(other.photo, photo) || other.photo == photo));
}


@override
int get hashCode => Object.hash(runtimeType,name,position,photo);

@override
String toString() {
  return 'TeamMemberEntity(name: $name, position: $position, photo: $photo)';
}


}

/// @nodoc
abstract mixin class $TeamMemberEntityCopyWith<$Res>  {
  factory $TeamMemberEntityCopyWith(TeamMemberEntity value, $Res Function(TeamMemberEntity) _then) = _$TeamMemberEntityCopyWithImpl;
@useResult
$Res call({
 String name, String position, String photo
});




}
/// @nodoc
class _$TeamMemberEntityCopyWithImpl<$Res>
    implements $TeamMemberEntityCopyWith<$Res> {
  _$TeamMemberEntityCopyWithImpl(this._self, this._then);

  final TeamMemberEntity _self;
  final $Res Function(TeamMemberEntity) _then;

/// Create a copy of TeamMemberEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? position = null,Object? photo = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as String,photo: null == photo ? _self.photo : photo // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TeamMemberEntity].
extension TeamMemberEntityPatterns on TeamMemberEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TeamMemberEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TeamMemberEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TeamMemberEntity value)  $default,){
final _that = this;
switch (_that) {
case _TeamMemberEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TeamMemberEntity value)?  $default,){
final _that = this;
switch (_that) {
case _TeamMemberEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String position,  String photo)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TeamMemberEntity() when $default != null:
return $default(_that.name,_that.position,_that.photo);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String position,  String photo)  $default,) {final _that = this;
switch (_that) {
case _TeamMemberEntity():
return $default(_that.name,_that.position,_that.photo);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String position,  String photo)?  $default,) {final _that = this;
switch (_that) {
case _TeamMemberEntity() when $default != null:
return $default(_that.name,_that.position,_that.photo);case _:
  return null;

}
}

}

/// @nodoc


class _TeamMemberEntity implements TeamMemberEntity {
  const _TeamMemberEntity({required this.name, required this.position, required this.photo});
  

@override final  String name;
@override final  String position;
@override final  String photo;

/// Create a copy of TeamMemberEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TeamMemberEntityCopyWith<_TeamMemberEntity> get copyWith => __$TeamMemberEntityCopyWithImpl<_TeamMemberEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TeamMemberEntity&&(identical(other.name, name) || other.name == name)&&(identical(other.position, position) || other.position == position)&&(identical(other.photo, photo) || other.photo == photo));
}


@override
int get hashCode => Object.hash(runtimeType,name,position,photo);

@override
String toString() {
  return 'TeamMemberEntity(name: $name, position: $position, photo: $photo)';
}


}

/// @nodoc
abstract mixin class _$TeamMemberEntityCopyWith<$Res> implements $TeamMemberEntityCopyWith<$Res> {
  factory _$TeamMemberEntityCopyWith(_TeamMemberEntity value, $Res Function(_TeamMemberEntity) _then) = __$TeamMemberEntityCopyWithImpl;
@override @useResult
$Res call({
 String name, String position, String photo
});




}
/// @nodoc
class __$TeamMemberEntityCopyWithImpl<$Res>
    implements _$TeamMemberEntityCopyWith<$Res> {
  __$TeamMemberEntityCopyWithImpl(this._self, this._then);

  final _TeamMemberEntity _self;
  final $Res Function(_TeamMemberEntity) _then;

/// Create a copy of TeamMemberEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? position = null,Object? photo = null,}) {
  return _then(_TeamMemberEntity(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as String,photo: null == photo ? _self.photo : photo // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$SectionEntity {

 String get title; List<String> get content;
/// Create a copy of SectionEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SectionEntityCopyWith<SectionEntity> get copyWith => _$SectionEntityCopyWithImpl<SectionEntity>(this as SectionEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SectionEntity&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other.content, content));
}


@override
int get hashCode => Object.hash(runtimeType,title,const DeepCollectionEquality().hash(content));

@override
String toString() {
  return 'SectionEntity(title: $title, content: $content)';
}


}

/// @nodoc
abstract mixin class $SectionEntityCopyWith<$Res>  {
  factory $SectionEntityCopyWith(SectionEntity value, $Res Function(SectionEntity) _then) = _$SectionEntityCopyWithImpl;
@useResult
$Res call({
 String title, List<String> content
});




}
/// @nodoc
class _$SectionEntityCopyWithImpl<$Res>
    implements $SectionEntityCopyWith<$Res> {
  _$SectionEntityCopyWithImpl(this._self, this._then);

  final SectionEntity _self;
  final $Res Function(SectionEntity) _then;

/// Create a copy of SectionEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? content = null,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [SectionEntity].
extension SectionEntityPatterns on SectionEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SectionEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SectionEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SectionEntity value)  $default,){
final _that = this;
switch (_that) {
case _SectionEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SectionEntity value)?  $default,){
final _that = this;
switch (_that) {
case _SectionEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  List<String> content)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SectionEntity() when $default != null:
return $default(_that.title,_that.content);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  List<String> content)  $default,) {final _that = this;
switch (_that) {
case _SectionEntity():
return $default(_that.title,_that.content);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  List<String> content)?  $default,) {final _that = this;
switch (_that) {
case _SectionEntity() when $default != null:
return $default(_that.title,_that.content);case _:
  return null;

}
}

}

/// @nodoc


class _SectionEntity implements SectionEntity {
  const _SectionEntity({required this.title, required final  List<String> content}): _content = content;
  

@override final  String title;
 final  List<String> _content;
@override List<String> get content {
  if (_content is EqualUnmodifiableListView) return _content;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_content);
}


/// Create a copy of SectionEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SectionEntityCopyWith<_SectionEntity> get copyWith => __$SectionEntityCopyWithImpl<_SectionEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SectionEntity&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other._content, _content));
}


@override
int get hashCode => Object.hash(runtimeType,title,const DeepCollectionEquality().hash(_content));

@override
String toString() {
  return 'SectionEntity(title: $title, content: $content)';
}


}

/// @nodoc
abstract mixin class _$SectionEntityCopyWith<$Res> implements $SectionEntityCopyWith<$Res> {
  factory _$SectionEntityCopyWith(_SectionEntity value, $Res Function(_SectionEntity) _then) = __$SectionEntityCopyWithImpl;
@override @useResult
$Res call({
 String title, List<String> content
});




}
/// @nodoc
class __$SectionEntityCopyWithImpl<$Res>
    implements _$SectionEntityCopyWith<$Res> {
  __$SectionEntityCopyWithImpl(this._self, this._then);

  final _SectionEntity _self;
  final $Res Function(_SectionEntity) _then;

/// Create a copy of SectionEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? content = null,}) {
  return _then(_SectionEntity(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self._content : content // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

/// @nodoc
mixin _$PageEntity {

 int get id; String get slug; String get image; String get title; String get content; List<TeamMemberEntity> get teamMembers; List<SectionEntity> get sections;
/// Create a copy of PageEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PageEntityCopyWith<PageEntity> get copyWith => _$PageEntityCopyWithImpl<PageEntity>(this as PageEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PageEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.image, image) || other.image == image)&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content)&&const DeepCollectionEquality().equals(other.teamMembers, teamMembers)&&const DeepCollectionEquality().equals(other.sections, sections));
}


@override
int get hashCode => Object.hash(runtimeType,id,slug,image,title,content,const DeepCollectionEquality().hash(teamMembers),const DeepCollectionEquality().hash(sections));

@override
String toString() {
  return 'PageEntity(id: $id, slug: $slug, image: $image, title: $title, content: $content, teamMembers: $teamMembers, sections: $sections)';
}


}

/// @nodoc
abstract mixin class $PageEntityCopyWith<$Res>  {
  factory $PageEntityCopyWith(PageEntity value, $Res Function(PageEntity) _then) = _$PageEntityCopyWithImpl;
@useResult
$Res call({
 int id, String slug, String image, String title, String content, List<TeamMemberEntity> teamMembers, List<SectionEntity> sections
});




}
/// @nodoc
class _$PageEntityCopyWithImpl<$Res>
    implements $PageEntityCopyWith<$Res> {
  _$PageEntityCopyWithImpl(this._self, this._then);

  final PageEntity _self;
  final $Res Function(PageEntity) _then;

/// Create a copy of PageEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? slug = null,Object? image = null,Object? title = null,Object? content = null,Object? teamMembers = null,Object? sections = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,teamMembers: null == teamMembers ? _self.teamMembers : teamMembers // ignore: cast_nullable_to_non_nullable
as List<TeamMemberEntity>,sections: null == sections ? _self.sections : sections // ignore: cast_nullable_to_non_nullable
as List<SectionEntity>,
  ));
}

}


/// Adds pattern-matching-related methods to [PageEntity].
extension PageEntityPatterns on PageEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PageEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PageEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PageEntity value)  $default,){
final _that = this;
switch (_that) {
case _PageEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PageEntity value)?  $default,){
final _that = this;
switch (_that) {
case _PageEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String slug,  String image,  String title,  String content,  List<TeamMemberEntity> teamMembers,  List<SectionEntity> sections)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PageEntity() when $default != null:
return $default(_that.id,_that.slug,_that.image,_that.title,_that.content,_that.teamMembers,_that.sections);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String slug,  String image,  String title,  String content,  List<TeamMemberEntity> teamMembers,  List<SectionEntity> sections)  $default,) {final _that = this;
switch (_that) {
case _PageEntity():
return $default(_that.id,_that.slug,_that.image,_that.title,_that.content,_that.teamMembers,_that.sections);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String slug,  String image,  String title,  String content,  List<TeamMemberEntity> teamMembers,  List<SectionEntity> sections)?  $default,) {final _that = this;
switch (_that) {
case _PageEntity() when $default != null:
return $default(_that.id,_that.slug,_that.image,_that.title,_that.content,_that.teamMembers,_that.sections);case _:
  return null;

}
}

}

/// @nodoc


class _PageEntity implements PageEntity {
  const _PageEntity({required this.id, required this.slug, required this.image, required this.title, required this.content, required final  List<TeamMemberEntity> teamMembers, required final  List<SectionEntity> sections}): _teamMembers = teamMembers,_sections = sections;
  

@override final  int id;
@override final  String slug;
@override final  String image;
@override final  String title;
@override final  String content;
 final  List<TeamMemberEntity> _teamMembers;
@override List<TeamMemberEntity> get teamMembers {
  if (_teamMembers is EqualUnmodifiableListView) return _teamMembers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_teamMembers);
}

 final  List<SectionEntity> _sections;
@override List<SectionEntity> get sections {
  if (_sections is EqualUnmodifiableListView) return _sections;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sections);
}


/// Create a copy of PageEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PageEntityCopyWith<_PageEntity> get copyWith => __$PageEntityCopyWithImpl<_PageEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PageEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.image, image) || other.image == image)&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content)&&const DeepCollectionEquality().equals(other._teamMembers, _teamMembers)&&const DeepCollectionEquality().equals(other._sections, _sections));
}


@override
int get hashCode => Object.hash(runtimeType,id,slug,image,title,content,const DeepCollectionEquality().hash(_teamMembers),const DeepCollectionEquality().hash(_sections));

@override
String toString() {
  return 'PageEntity(id: $id, slug: $slug, image: $image, title: $title, content: $content, teamMembers: $teamMembers, sections: $sections)';
}


}

/// @nodoc
abstract mixin class _$PageEntityCopyWith<$Res> implements $PageEntityCopyWith<$Res> {
  factory _$PageEntityCopyWith(_PageEntity value, $Res Function(_PageEntity) _then) = __$PageEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, String slug, String image, String title, String content, List<TeamMemberEntity> teamMembers, List<SectionEntity> sections
});




}
/// @nodoc
class __$PageEntityCopyWithImpl<$Res>
    implements _$PageEntityCopyWith<$Res> {
  __$PageEntityCopyWithImpl(this._self, this._then);

  final _PageEntity _self;
  final $Res Function(_PageEntity) _then;

/// Create a copy of PageEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? slug = null,Object? image = null,Object? title = null,Object? content = null,Object? teamMembers = null,Object? sections = null,}) {
  return _then(_PageEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,teamMembers: null == teamMembers ? _self._teamMembers : teamMembers // ignore: cast_nullable_to_non_nullable
as List<TeamMemberEntity>,sections: null == sections ? _self._sections : sections // ignore: cast_nullable_to_non_nullable
as List<SectionEntity>,
  ));
}


}

// dart format on
