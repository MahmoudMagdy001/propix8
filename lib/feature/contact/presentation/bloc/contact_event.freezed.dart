// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contact_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ContactEvent {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ContactEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'ContactEvent()';
}


}

/// @nodoc
class $ContactEventCopyWith<$Res>  {
$ContactEventCopyWith(ContactEvent _, $Res Function(ContactEvent) __);
}


/// Adds pattern-matching-related methods to [ContactEvent].
extension ContactEventPatterns on ContactEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ContactRequestSubmitted value)?  contactRequestSubmitted,TResult Function( ContactReset value)?  reset,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ContactRequestSubmitted() when contactRequestSubmitted != null:
return contactRequestSubmitted(_that);case ContactReset() when reset != null:
return reset(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ContactRequestSubmitted value)  contactRequestSubmitted,required TResult Function( ContactReset value)  reset,}){
final _that = this;
switch (_that) {
case ContactRequestSubmitted():
return contactRequestSubmitted(_that);case ContactReset():
return reset(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ContactRequestSubmitted value)?  contactRequestSubmitted,TResult? Function( ContactReset value)?  reset,}){
final _that = this;
switch (_that) {
case ContactRequestSubmitted() when contactRequestSubmitted != null:
return contactRequestSubmitted(_that);case ContactReset() when reset != null:
return reset(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( ContactRequestEntity request)?  contactRequestSubmitted,TResult Function()?  reset,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ContactRequestSubmitted() when contactRequestSubmitted != null:
return contactRequestSubmitted(_that.request);case ContactReset() when reset != null:
return reset();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( ContactRequestEntity request)  contactRequestSubmitted,required TResult Function()  reset,}) {final _that = this;
switch (_that) {
case ContactRequestSubmitted():
return contactRequestSubmitted(_that.request);case ContactReset():
return reset();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( ContactRequestEntity request)?  contactRequestSubmitted,TResult? Function()?  reset,}) {final _that = this;
switch (_that) {
case ContactRequestSubmitted() when contactRequestSubmitted != null:
return contactRequestSubmitted(_that.request);case ContactReset() when reset != null:
return reset();case _:
  return null;

}
}

}

/// @nodoc


class ContactRequestSubmitted implements ContactEvent {
  const ContactRequestSubmitted(this.request);
  

 final  ContactRequestEntity request;

/// Create a copy of ContactEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContactRequestSubmittedCopyWith<ContactRequestSubmitted> get copyWith => _$ContactRequestSubmittedCopyWithImpl<ContactRequestSubmitted>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ContactRequestSubmitted&&(identical(other.request, request) || other.request == request));
}


@override
int get hashCode {
    return Object.hash(runtimeType,request);
}

@override
String toString() {
    return 'ContactEvent.contactRequestSubmitted(request: $request)';
}


}

/// @nodoc
abstract mixin class $ContactRequestSubmittedCopyWith<$Res> implements $ContactEventCopyWith<$Res> {
  factory $ContactRequestSubmittedCopyWith(ContactRequestSubmitted value, $Res Function(ContactRequestSubmitted) _then) = _$ContactRequestSubmittedCopyWithImpl;
@useResult
$Res call({
 ContactRequestEntity request
});


$ContactRequestEntityCopyWith<$Res> get request;

}
/// @nodoc
class _$ContactRequestSubmittedCopyWithImpl<$Res>
    implements $ContactRequestSubmittedCopyWith<$Res> {
  _$ContactRequestSubmittedCopyWithImpl(this._self, this._then);

  final ContactRequestSubmitted _self;
  final $Res Function(ContactRequestSubmitted) _then;

/// Create a copy of ContactEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? request = null,}) {
  return _then(ContactRequestSubmitted(
null == request ? _self.request : request // ignore: cast_nullable_to_non_nullable
as ContactRequestEntity,
  ));
}

/// Create a copy of ContactEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ContactRequestEntityCopyWith<$Res> get request {
  
  return $ContactRequestEntityCopyWith<$Res>(_self.request, (value) {
    return _then(_self.copyWith(request: value));
  });
}
}

/// @nodoc


class ContactReset implements ContactEvent {
  const ContactReset();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ContactReset);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'ContactEvent.reset()';
}


}




// dart format on
