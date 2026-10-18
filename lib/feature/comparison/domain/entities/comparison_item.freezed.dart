// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comparison_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ComparisonItem {

 String get label; String get value1; String get value2; bool get isDifferent; ComparisonAdvantage get advantage; String? get icon;
/// Create a copy of ComparisonItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ComparisonItemCopyWith<ComparisonItem> get copyWith => _$ComparisonItemCopyWithImpl<ComparisonItem>(this as ComparisonItem, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ComparisonItem;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ComparisonItem&&(identical(other.label, _this.label) || other.label == _this.label)&&(identical(other.value1, _this.value1) || other.value1 == _this.value1)&&(identical(other.value2, _this.value2) || other.value2 == _this.value2)&&(identical(other.isDifferent, _this.isDifferent) || other.isDifferent == _this.isDifferent)&&(identical(other.advantage, _this.advantage) || other.advantage == _this.advantage)&&(identical(other.icon, _this.icon) || other.icon == _this.icon));
}


@override
int get hashCode {
  final _this = this as ComparisonItem;
  return Object.hash(runtimeType,_this.label,_this.value1,_this.value2,_this.isDifferent,_this.advantage,_this.icon);
}

@override
String toString() {
  final _this = this as ComparisonItem;
  return 'ComparisonItem(label: ${_this.label}, value1: ${_this.value1}, value2: ${_this.value2}, isDifferent: ${_this.isDifferent}, advantage: ${_this.advantage}, icon: ${_this.icon})';
}


}

/// @nodoc
abstract mixin class $ComparisonItemCopyWith<$Res>  {
  factory $ComparisonItemCopyWith(ComparisonItem value, $Res Function(ComparisonItem) _then) = _$ComparisonItemCopyWithImpl;
@useResult
$Res call({
 String label, String value1, String value2, bool isDifferent, ComparisonAdvantage advantage, String? icon
});




}
/// @nodoc
class _$ComparisonItemCopyWithImpl<$Res>
    implements $ComparisonItemCopyWith<$Res> {
  _$ComparisonItemCopyWithImpl(this._self, this._then);

  final ComparisonItem _self;
  final $Res Function(ComparisonItem) _then;

/// Create a copy of ComparisonItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? label = null,Object? value1 = null,Object? value2 = null,Object? isDifferent = null,Object? advantage = null,Object? icon = freezed,}) {
  return _then(ComparisonItem(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,value1: null == value1 ? _self.value1 : value1 // ignore: cast_nullable_to_non_nullable
as String,value2: null == value2 ? _self.value2 : value2 // ignore: cast_nullable_to_non_nullable
as String,isDifferent: null == isDifferent ? _self.isDifferent : isDifferent // ignore: cast_nullable_to_non_nullable
as bool,advantage: null == advantage ? _self.advantage : advantage // ignore: cast_nullable_to_non_nullable
as ComparisonAdvantage,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ComparisonItem].
extension ComparisonItemPatterns on ComparisonItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ComparisonItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ComparisonItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ComparisonItem value)  $default,){
final _that = this;
switch (_that) {
case _ComparisonItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ComparisonItem value)?  $default,){
final _that = this;
switch (_that) {
case _ComparisonItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String label,  String value1,  String value2,  bool isDifferent,  ComparisonAdvantage advantage,  String? icon)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ComparisonItem() when $default != null:
return $default(_that.label,_that.value1,_that.value2,_that.isDifferent,_that.advantage,_that.icon);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String label,  String value1,  String value2,  bool isDifferent,  ComparisonAdvantage advantage,  String? icon)  $default,) {final _that = this;
switch (_that) {
case _ComparisonItem():
return $default(_that.label,_that.value1,_that.value2,_that.isDifferent,_that.advantage,_that.icon);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String label,  String value1,  String value2,  bool isDifferent,  ComparisonAdvantage advantage,  String? icon)?  $default,) {final _that = this;
switch (_that) {
case _ComparisonItem() when $default != null:
return $default(_that.label,_that.value1,_that.value2,_that.isDifferent,_that.advantage,_that.icon);case _:
  return null;

}
}

}

/// @nodoc


class _ComparisonItem implements ComparisonItem {
  const _ComparisonItem({required this.label, required this.value1, required this.value2, required this.isDifferent, this.advantage = ComparisonAdvantage.none, this.icon});
  

@override final  String label;
@override final  String value1;
@override final  String value2;
@override final  bool isDifferent;
@override@JsonKey() final  ComparisonAdvantage advantage;
@override final  String? icon;

/// Create a copy of ComparisonItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ComparisonItemCopyWith<_ComparisonItem> get copyWith => __$ComparisonItemCopyWithImpl<_ComparisonItem>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ComparisonItem&&(identical(other.label, label) || other.label == label)&&(identical(other.value1, value1) || other.value1 == value1)&&(identical(other.value2, value2) || other.value2 == value2)&&(identical(other.isDifferent, isDifferent) || other.isDifferent == isDifferent)&&(identical(other.advantage, advantage) || other.advantage == advantage)&&(identical(other.icon, icon) || other.icon == icon));
}


@override
int get hashCode {
    return Object.hash(runtimeType,label,value1,value2,isDifferent,advantage,icon);
}

@override
String toString() {
    return 'ComparisonItem(label: $label, value1: $value1, value2: $value2, isDifferent: $isDifferent, advantage: $advantage, icon: $icon)';
}


}

/// @nodoc
abstract mixin class _$ComparisonItemCopyWith<$Res> implements $ComparisonItemCopyWith<$Res> {
  factory _$ComparisonItemCopyWith(_ComparisonItem value, $Res Function(_ComparisonItem) _then) = __$ComparisonItemCopyWithImpl;
@override @useResult
$Res call({
 String label, String value1, String value2, bool isDifferent, ComparisonAdvantage advantage, String? icon
});




}
/// @nodoc
class __$ComparisonItemCopyWithImpl<$Res>
    implements _$ComparisonItemCopyWith<$Res> {
  __$ComparisonItemCopyWithImpl(this._self, this._then);

  final _ComparisonItem _self;
  final $Res Function(_ComparisonItem) _then;

/// Create a copy of ComparisonItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? label = null,Object? value1 = null,Object? value2 = null,Object? isDifferent = null,Object? advantage = null,Object? icon = freezed,}) {
  return _then(_ComparisonItem(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,value1: null == value1 ? _self.value1 : value1 // ignore: cast_nullable_to_non_nullable
as String,value2: null == value2 ? _self.value2 : value2 // ignore: cast_nullable_to_non_nullable
as String,isDifferent: null == isDifferent ? _self.isDifferent : isDifferent // ignore: cast_nullable_to_non_nullable
as bool,advantage: null == advantage ? _self.advantage : advantage // ignore: cast_nullable_to_non_nullable
as ComparisonAdvantage,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
