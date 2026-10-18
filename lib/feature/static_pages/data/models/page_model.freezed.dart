// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'page_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TeamMemberModel {

 String get name; String get position; String get photo;
/// Create a copy of TeamMemberModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TeamMemberModelCopyWith<TeamMemberModel> get copyWith => _$TeamMemberModelCopyWithImpl<TeamMemberModel>(this as TeamMemberModel, _$identity);

  /// Serializes this TeamMemberModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as TeamMemberModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TeamMemberModel&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.position, _this.position) || other.position == _this.position)&&(identical(other.photo, _this.photo) || other.photo == _this.photo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as TeamMemberModel;
  return Object.hash(runtimeType,_this.name,_this.position,_this.photo);
}

@override
String toString() {
  final _this = this as TeamMemberModel;
  return 'TeamMemberModel(name: ${_this.name}, position: ${_this.position}, photo: ${_this.photo})';
}


}

/// @nodoc
abstract mixin class $TeamMemberModelCopyWith<$Res>  {
  factory $TeamMemberModelCopyWith(TeamMemberModel value, $Res Function(TeamMemberModel) _then) = _$TeamMemberModelCopyWithImpl;
@useResult
$Res call({
 String name, String position, String photo
});




}
/// @nodoc
class _$TeamMemberModelCopyWithImpl<$Res>
    implements $TeamMemberModelCopyWith<$Res> {
  _$TeamMemberModelCopyWithImpl(this._self, this._then);

  final TeamMemberModel _self;
  final $Res Function(TeamMemberModel) _then;

/// Create a copy of TeamMemberModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? position = null,Object? photo = null,}) {
  return _then(TeamMemberModel(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as String,photo: null == photo ? _self.photo : photo // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TeamMemberModel].
extension TeamMemberModelPatterns on TeamMemberModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TeamMemberModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TeamMemberModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TeamMemberModel value)  $default,){
final _that = this;
switch (_that) {
case _TeamMemberModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TeamMemberModel value)?  $default,){
final _that = this;
switch (_that) {
case _TeamMemberModel() when $default != null:
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
case _TeamMemberModel() when $default != null:
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
case _TeamMemberModel():
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
case _TeamMemberModel() when $default != null:
return $default(_that.name,_that.position,_that.photo);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TeamMemberModel extends TeamMemberModel {
  const _TeamMemberModel({this.name = '', this.position = '', this.photo = ''}): super._();
  factory _TeamMemberModel.fromJson(Map<String, dynamic> json) => _$TeamMemberModelFromJson(json);

@override@JsonKey() final  String name;
@override@JsonKey() final  String position;
@override@JsonKey() final  String photo;

/// Create a copy of TeamMemberModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TeamMemberModelCopyWith<_TeamMemberModel> get copyWith => __$TeamMemberModelCopyWithImpl<_TeamMemberModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TeamMemberModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TeamMemberModel&&(identical(other.name, name) || other.name == name)&&(identical(other.position, position) || other.position == position)&&(identical(other.photo, photo) || other.photo == photo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,name,position,photo);
}

@override
String toString() {
    return 'TeamMemberModel(name: $name, position: $position, photo: $photo)';
}


}

/// @nodoc
abstract mixin class _$TeamMemberModelCopyWith<$Res> implements $TeamMemberModelCopyWith<$Res> {
  factory _$TeamMemberModelCopyWith(_TeamMemberModel value, $Res Function(_TeamMemberModel) _then) = __$TeamMemberModelCopyWithImpl;
@override @useResult
$Res call({
 String name, String position, String photo
});




}
/// @nodoc
class __$TeamMemberModelCopyWithImpl<$Res>
    implements _$TeamMemberModelCopyWith<$Res> {
  __$TeamMemberModelCopyWithImpl(this._self, this._then);

  final _TeamMemberModel _self;
  final $Res Function(_TeamMemberModel) _then;

/// Create a copy of TeamMemberModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? position = null,Object? photo = null,}) {
  return _then(_TeamMemberModel(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as String,photo: null == photo ? _self.photo : photo // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$SectionModel {

 String get title; List<String> get content;
/// Create a copy of SectionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SectionModelCopyWith<SectionModel> get copyWith => _$SectionModelCopyWithImpl<SectionModel>(this as SectionModel, _$identity);

  /// Serializes this SectionModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as SectionModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SectionModel&&(identical(other.title, _this.title) || other.title == _this.title)&&const DeepCollectionEquality().equals(other.content, _this.content));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as SectionModel;
  return Object.hash(runtimeType,_this.title,const DeepCollectionEquality().hash(_this.content));
}

@override
String toString() {
  final _this = this as SectionModel;
  return 'SectionModel(title: ${_this.title}, content: ${_this.content})';
}


}

/// @nodoc
abstract mixin class $SectionModelCopyWith<$Res>  {
  factory $SectionModelCopyWith(SectionModel value, $Res Function(SectionModel) _then) = _$SectionModelCopyWithImpl;
@useResult
$Res call({
 String title, List<String> content
});




}
/// @nodoc
class _$SectionModelCopyWithImpl<$Res>
    implements $SectionModelCopyWith<$Res> {
  _$SectionModelCopyWithImpl(this._self, this._then);

  final SectionModel _self;
  final $Res Function(SectionModel) _then;

/// Create a copy of SectionModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? content = null,}) {
  return _then(SectionModel(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [SectionModel].
extension SectionModelPatterns on SectionModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SectionModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SectionModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SectionModel value)  $default,){
final _that = this;
switch (_that) {
case _SectionModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SectionModel value)?  $default,){
final _that = this;
switch (_that) {
case _SectionModel() when $default != null:
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
case _SectionModel() when $default != null:
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
case _SectionModel():
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
case _SectionModel() when $default != null:
return $default(_that.title,_that.content);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SectionModel extends SectionModel {
  const _SectionModel({this.title = '',  List<String> content = const []}): _content = content,super._();
  factory _SectionModel.fromJson(Map<String, dynamic> json) => _$SectionModelFromJson(json);

@override@JsonKey() final  String title;
 final  List<String> _content;
@override@JsonKey() List<String> get content {
  if (_content is EqualUnmodifiableListView) return _content;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_content);
}


/// Create a copy of SectionModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SectionModelCopyWith<_SectionModel> get copyWith => __$SectionModelCopyWithImpl<_SectionModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SectionModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SectionModel&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other.content, _content));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,title,const DeepCollectionEquality().hash(_content));
}

@override
String toString() {
    return 'SectionModel(title: $title, content: $content)';
}


}

/// @nodoc
abstract mixin class _$SectionModelCopyWith<$Res> implements $SectionModelCopyWith<$Res> {
  factory _$SectionModelCopyWith(_SectionModel value, $Res Function(_SectionModel) _then) = __$SectionModelCopyWithImpl;
@override @useResult
$Res call({
 String title, List<String> content
});




}
/// @nodoc
class __$SectionModelCopyWithImpl<$Res>
    implements _$SectionModelCopyWith<$Res> {
  __$SectionModelCopyWithImpl(this._self, this._then);

  final _SectionModel _self;
  final $Res Function(_SectionModel) _then;

/// Create a copy of SectionModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? content = null,}) {
  return _then(_SectionModel(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self._content : content // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}


/// @nodoc
mixin _$PageModel {

 int get id; String get slug; String get image; String get title; String get content;@JsonKey(name: 'team_members') List<TeamMemberModel> get teamMembers; List<SectionModel> get sections;
/// Create a copy of PageModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PageModelCopyWith<PageModel> get copyWith => _$PageModelCopyWithImpl<PageModel>(this as PageModel, _$identity);

  /// Serializes this PageModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PageModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PageModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.slug, _this.slug) || other.slug == _this.slug)&&(identical(other.image, _this.image) || other.image == _this.image)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.content, _this.content) || other.content == _this.content)&&const DeepCollectionEquality().equals(other.teamMembers, _this.teamMembers)&&const DeepCollectionEquality().equals(other.sections, _this.sections));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PageModel;
  return Object.hash(runtimeType,_this.id,_this.slug,_this.image,_this.title,_this.content,const DeepCollectionEquality().hash(_this.teamMembers),const DeepCollectionEquality().hash(_this.sections));
}

@override
String toString() {
  final _this = this as PageModel;
  return 'PageModel(id: ${_this.id}, slug: ${_this.slug}, image: ${_this.image}, title: ${_this.title}, content: ${_this.content}, teamMembers: ${_this.teamMembers}, sections: ${_this.sections})';
}


}

/// @nodoc
abstract mixin class $PageModelCopyWith<$Res>  {
  factory $PageModelCopyWith(PageModel value, $Res Function(PageModel) _then) = _$PageModelCopyWithImpl;
@useResult
$Res call({
 int id, String slug, String image, String title, String content,@JsonKey(name: 'team_members') List<TeamMemberModel> teamMembers, List<SectionModel> sections
});




}
/// @nodoc
class _$PageModelCopyWithImpl<$Res>
    implements $PageModelCopyWith<$Res> {
  _$PageModelCopyWithImpl(this._self, this._then);

  final PageModel _self;
  final $Res Function(PageModel) _then;

/// Create a copy of PageModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? slug = null,Object? image = null,Object? title = null,Object? content = null,Object? teamMembers = null,Object? sections = null,}) {
  return _then(PageModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,teamMembers: null == teamMembers ? _self.teamMembers : teamMembers // ignore: cast_nullable_to_non_nullable
as List<TeamMemberModel>,sections: null == sections ? _self.sections : sections // ignore: cast_nullable_to_non_nullable
as List<SectionModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [PageModel].
extension PageModelPatterns on PageModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PageModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PageModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PageModel value)  $default,){
final _that = this;
switch (_that) {
case _PageModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PageModel value)?  $default,){
final _that = this;
switch (_that) {
case _PageModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String slug,  String image,  String title,  String content, @JsonKey(name: 'team_members')  List<TeamMemberModel> teamMembers,  List<SectionModel> sections)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PageModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String slug,  String image,  String title,  String content, @JsonKey(name: 'team_members')  List<TeamMemberModel> teamMembers,  List<SectionModel> sections)  $default,) {final _that = this;
switch (_that) {
case _PageModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String slug,  String image,  String title,  String content, @JsonKey(name: 'team_members')  List<TeamMemberModel> teamMembers,  List<SectionModel> sections)?  $default,) {final _that = this;
switch (_that) {
case _PageModel() when $default != null:
return $default(_that.id,_that.slug,_that.image,_that.title,_that.content,_that.teamMembers,_that.sections);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PageModel extends PageModel {
  const _PageModel({this.id = 0, this.slug = '', this.image = '', this.title = '', this.content = '', @JsonKey(name: 'team_members')  List<TeamMemberModel> teamMembers = const [],  List<SectionModel> sections = const []}): _teamMembers = teamMembers,_sections = sections,super._();
  factory _PageModel.fromJson(Map<String, dynamic> json) => _$PageModelFromJson(json);

@override@JsonKey() final  int id;
@override@JsonKey() final  String slug;
@override@JsonKey() final  String image;
@override@JsonKey() final  String title;
@override@JsonKey() final  String content;
 final  List<TeamMemberModel> _teamMembers;
@override@JsonKey(name: 'team_members') List<TeamMemberModel> get teamMembers {
  if (_teamMembers is EqualUnmodifiableListView) return _teamMembers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_teamMembers);
}

 final  List<SectionModel> _sections;
@override@JsonKey() List<SectionModel> get sections {
  if (_sections is EqualUnmodifiableListView) return _sections;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sections);
}


/// Create a copy of PageModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PageModelCopyWith<_PageModel> get copyWith => __$PageModelCopyWithImpl<_PageModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PageModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PageModel&&(identical(other.id, id) || other.id == id)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.image, image) || other.image == image)&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content)&&const DeepCollectionEquality().equals(other.teamMembers, _teamMembers)&&const DeepCollectionEquality().equals(other.sections, _sections));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,slug,image,title,content,const DeepCollectionEquality().hash(_teamMembers),const DeepCollectionEquality().hash(_sections));
}

@override
String toString() {
    return 'PageModel(id: $id, slug: $slug, image: $image, title: $title, content: $content, teamMembers: $teamMembers, sections: $sections)';
}


}

/// @nodoc
abstract mixin class _$PageModelCopyWith<$Res> implements $PageModelCopyWith<$Res> {
  factory _$PageModelCopyWith(_PageModel value, $Res Function(_PageModel) _then) = __$PageModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String slug, String image, String title, String content,@JsonKey(name: 'team_members') List<TeamMemberModel> teamMembers, List<SectionModel> sections
});




}
/// @nodoc
class __$PageModelCopyWithImpl<$Res>
    implements _$PageModelCopyWith<$Res> {
  __$PageModelCopyWithImpl(this._self, this._then);

  final _PageModel _self;
  final $Res Function(_PageModel) _then;

/// Create a copy of PageModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? slug = null,Object? image = null,Object? title = null,Object? content = null,Object? teamMembers = null,Object? sections = null,}) {
  return _then(_PageModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,teamMembers: null == teamMembers ? _self._teamMembers : teamMembers // ignore: cast_nullable_to_non_nullable
as List<TeamMemberModel>,sections: null == sections ? _self._sections : sections // ignore: cast_nullable_to_non_nullable
as List<SectionModel>,
  ));
}


}

// dart format on
