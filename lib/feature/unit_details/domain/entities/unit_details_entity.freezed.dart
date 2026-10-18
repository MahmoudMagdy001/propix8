// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'unit_details_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UnitDetailsEntity {

 int get id; String get title; String get description; String get address; double get price; double get pricePerM2; String get offerType; double get area; int get rooms; int get bathrooms; int get garages; String get buildYear; String get latitude; String get longitude; String get status; bool get isFavourite; bool get isVisible; String get developmentStatus; UnitOwnerEntity get owner; List<UnitMediaEntity> get media; UnitCityEntity get city; UnitTypeEntity get unitType; List<UnitAmenityEntity> get amenities; double get averageRating; int get reviewsCount; DateTime get createdAt; double? get landArea; double? get internalArea; CompoundEntity? get compound; DeveloperEntity? get developer;
/// Create a copy of UnitDetailsEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnitDetailsEntityCopyWith<UnitDetailsEntity> get copyWith => _$UnitDetailsEntityCopyWithImpl<UnitDetailsEntity>(this as UnitDetailsEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnitDetailsEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.address, address) || other.address == address)&&(identical(other.price, price) || other.price == price)&&(identical(other.pricePerM2, pricePerM2) || other.pricePerM2 == pricePerM2)&&(identical(other.offerType, offerType) || other.offerType == offerType)&&(identical(other.area, area) || other.area == area)&&(identical(other.rooms, rooms) || other.rooms == rooms)&&(identical(other.bathrooms, bathrooms) || other.bathrooms == bathrooms)&&(identical(other.garages, garages) || other.garages == garages)&&(identical(other.buildYear, buildYear) || other.buildYear == buildYear)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.status, status) || other.status == status)&&(identical(other.isFavourite, isFavourite) || other.isFavourite == isFavourite)&&(identical(other.isVisible, isVisible) || other.isVisible == isVisible)&&(identical(other.developmentStatus, developmentStatus) || other.developmentStatus == developmentStatus)&&(identical(other.owner, owner) || other.owner == owner)&&const DeepCollectionEquality().equals(other.media, media)&&(identical(other.city, city) || other.city == city)&&(identical(other.unitType, unitType) || other.unitType == unitType)&&const DeepCollectionEquality().equals(other.amenities, amenities)&&(identical(other.averageRating, averageRating) || other.averageRating == averageRating)&&(identical(other.reviewsCount, reviewsCount) || other.reviewsCount == reviewsCount)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.landArea, landArea) || other.landArea == landArea)&&(identical(other.internalArea, internalArea) || other.internalArea == internalArea)&&(identical(other.compound, compound) || other.compound == compound)&&(identical(other.developer, developer) || other.developer == developer));
}


@override
int get hashCode => Object.hashAll([runtimeType,id,title,description,address,price,pricePerM2,offerType,area,rooms,bathrooms,garages,buildYear,latitude,longitude,status,isFavourite,isVisible,developmentStatus,owner,const DeepCollectionEquality().hash(media),city,unitType,const DeepCollectionEquality().hash(amenities),averageRating,reviewsCount,createdAt,landArea,internalArea,compound,developer]);

@override
String toString() {
  return 'UnitDetailsEntity(id: $id, title: $title, description: $description, address: $address, price: $price, pricePerM2: $pricePerM2, offerType: $offerType, area: $area, rooms: $rooms, bathrooms: $bathrooms, garages: $garages, buildYear: $buildYear, latitude: $latitude, longitude: $longitude, status: $status, isFavourite: $isFavourite, isVisible: $isVisible, developmentStatus: $developmentStatus, owner: $owner, media: $media, city: $city, unitType: $unitType, amenities: $amenities, averageRating: $averageRating, reviewsCount: $reviewsCount, createdAt: $createdAt, landArea: $landArea, internalArea: $internalArea, compound: $compound, developer: $developer)';
}


}

/// @nodoc
abstract mixin class $UnitDetailsEntityCopyWith<$Res>  {
  factory $UnitDetailsEntityCopyWith(UnitDetailsEntity value, $Res Function(UnitDetailsEntity) _then) = _$UnitDetailsEntityCopyWithImpl;
@useResult
$Res call({
 int id, String title, String description, String address, double price, double pricePerM2, String offerType, double area, int rooms, int bathrooms, int garages, String buildYear, String latitude, String longitude, String status, bool isFavourite, bool isVisible, String developmentStatus, UnitOwnerEntity owner, List<UnitMediaEntity> media, UnitCityEntity city, UnitTypeEntity unitType, List<UnitAmenityEntity> amenities, double averageRating, int reviewsCount, DateTime createdAt, double? landArea, double? internalArea, CompoundEntity? compound, DeveloperEntity? developer
});


$UnitOwnerEntityCopyWith<$Res> get owner;$UnitCityEntityCopyWith<$Res> get city;$UnitTypeEntityCopyWith<$Res> get unitType;$CompoundEntityCopyWith<$Res>? get compound;$DeveloperEntityCopyWith<$Res>? get developer;

}
/// @nodoc
class _$UnitDetailsEntityCopyWithImpl<$Res>
    implements $UnitDetailsEntityCopyWith<$Res> {
  _$UnitDetailsEntityCopyWithImpl(this._self, this._then);

  final UnitDetailsEntity _self;
  final $Res Function(UnitDetailsEntity) _then;

/// Create a copy of UnitDetailsEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? description = null,Object? address = null,Object? price = null,Object? pricePerM2 = null,Object? offerType = null,Object? area = null,Object? rooms = null,Object? bathrooms = null,Object? garages = null,Object? buildYear = null,Object? latitude = null,Object? longitude = null,Object? status = null,Object? isFavourite = null,Object? isVisible = null,Object? developmentStatus = null,Object? owner = null,Object? media = null,Object? city = null,Object? unitType = null,Object? amenities = null,Object? averageRating = null,Object? reviewsCount = null,Object? createdAt = null,Object? landArea = freezed,Object? internalArea = freezed,Object? compound = freezed,Object? developer = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,pricePerM2: null == pricePerM2 ? _self.pricePerM2 : pricePerM2 // ignore: cast_nullable_to_non_nullable
as double,offerType: null == offerType ? _self.offerType : offerType // ignore: cast_nullable_to_non_nullable
as String,area: null == area ? _self.area : area // ignore: cast_nullable_to_non_nullable
as double,rooms: null == rooms ? _self.rooms : rooms // ignore: cast_nullable_to_non_nullable
as int,bathrooms: null == bathrooms ? _self.bathrooms : bathrooms // ignore: cast_nullable_to_non_nullable
as int,garages: null == garages ? _self.garages : garages // ignore: cast_nullable_to_non_nullable
as int,buildYear: null == buildYear ? _self.buildYear : buildYear // ignore: cast_nullable_to_non_nullable
as String,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as String,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,isFavourite: null == isFavourite ? _self.isFavourite : isFavourite // ignore: cast_nullable_to_non_nullable
as bool,isVisible: null == isVisible ? _self.isVisible : isVisible // ignore: cast_nullable_to_non_nullable
as bool,developmentStatus: null == developmentStatus ? _self.developmentStatus : developmentStatus // ignore: cast_nullable_to_non_nullable
as String,owner: null == owner ? _self.owner : owner // ignore: cast_nullable_to_non_nullable
as UnitOwnerEntity,media: null == media ? _self.media : media // ignore: cast_nullable_to_non_nullable
as List<UnitMediaEntity>,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as UnitCityEntity,unitType: null == unitType ? _self.unitType : unitType // ignore: cast_nullable_to_non_nullable
as UnitTypeEntity,amenities: null == amenities ? _self.amenities : amenities // ignore: cast_nullable_to_non_nullable
as List<UnitAmenityEntity>,averageRating: null == averageRating ? _self.averageRating : averageRating // ignore: cast_nullable_to_non_nullable
as double,reviewsCount: null == reviewsCount ? _self.reviewsCount : reviewsCount // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,landArea: freezed == landArea ? _self.landArea : landArea // ignore: cast_nullable_to_non_nullable
as double?,internalArea: freezed == internalArea ? _self.internalArea : internalArea // ignore: cast_nullable_to_non_nullable
as double?,compound: freezed == compound ? _self.compound : compound // ignore: cast_nullable_to_non_nullable
as CompoundEntity?,developer: freezed == developer ? _self.developer : developer // ignore: cast_nullable_to_non_nullable
as DeveloperEntity?,
  ));
}
/// Create a copy of UnitDetailsEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UnitOwnerEntityCopyWith<$Res> get owner {
  
  return $UnitOwnerEntityCopyWith<$Res>(_self.owner, (value) {
    return _then(_self.copyWith(owner: value));
  });
}/// Create a copy of UnitDetailsEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UnitCityEntityCopyWith<$Res> get city {
  
  return $UnitCityEntityCopyWith<$Res>(_self.city, (value) {
    return _then(_self.copyWith(city: value));
  });
}/// Create a copy of UnitDetailsEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UnitTypeEntityCopyWith<$Res> get unitType {
  
  return $UnitTypeEntityCopyWith<$Res>(_self.unitType, (value) {
    return _then(_self.copyWith(unitType: value));
  });
}/// Create a copy of UnitDetailsEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CompoundEntityCopyWith<$Res>? get compound {
    if (_self.compound == null) {
    return null;
  }

  return $CompoundEntityCopyWith<$Res>(_self.compound!, (value) {
    return _then(_self.copyWith(compound: value));
  });
}/// Create a copy of UnitDetailsEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DeveloperEntityCopyWith<$Res>? get developer {
    if (_self.developer == null) {
    return null;
  }

  return $DeveloperEntityCopyWith<$Res>(_self.developer!, (value) {
    return _then(_self.copyWith(developer: value));
  });
}
}


/// Adds pattern-matching-related methods to [UnitDetailsEntity].
extension UnitDetailsEntityPatterns on UnitDetailsEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UnitDetailsEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UnitDetailsEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UnitDetailsEntity value)  $default,){
final _that = this;
switch (_that) {
case _UnitDetailsEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UnitDetailsEntity value)?  $default,){
final _that = this;
switch (_that) {
case _UnitDetailsEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String title,  String description,  String address,  double price,  double pricePerM2,  String offerType,  double area,  int rooms,  int bathrooms,  int garages,  String buildYear,  String latitude,  String longitude,  String status,  bool isFavourite,  bool isVisible,  String developmentStatus,  UnitOwnerEntity owner,  List<UnitMediaEntity> media,  UnitCityEntity city,  UnitTypeEntity unitType,  List<UnitAmenityEntity> amenities,  double averageRating,  int reviewsCount,  DateTime createdAt,  double? landArea,  double? internalArea,  CompoundEntity? compound,  DeveloperEntity? developer)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UnitDetailsEntity() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.address,_that.price,_that.pricePerM2,_that.offerType,_that.area,_that.rooms,_that.bathrooms,_that.garages,_that.buildYear,_that.latitude,_that.longitude,_that.status,_that.isFavourite,_that.isVisible,_that.developmentStatus,_that.owner,_that.media,_that.city,_that.unitType,_that.amenities,_that.averageRating,_that.reviewsCount,_that.createdAt,_that.landArea,_that.internalArea,_that.compound,_that.developer);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String title,  String description,  String address,  double price,  double pricePerM2,  String offerType,  double area,  int rooms,  int bathrooms,  int garages,  String buildYear,  String latitude,  String longitude,  String status,  bool isFavourite,  bool isVisible,  String developmentStatus,  UnitOwnerEntity owner,  List<UnitMediaEntity> media,  UnitCityEntity city,  UnitTypeEntity unitType,  List<UnitAmenityEntity> amenities,  double averageRating,  int reviewsCount,  DateTime createdAt,  double? landArea,  double? internalArea,  CompoundEntity? compound,  DeveloperEntity? developer)  $default,) {final _that = this;
switch (_that) {
case _UnitDetailsEntity():
return $default(_that.id,_that.title,_that.description,_that.address,_that.price,_that.pricePerM2,_that.offerType,_that.area,_that.rooms,_that.bathrooms,_that.garages,_that.buildYear,_that.latitude,_that.longitude,_that.status,_that.isFavourite,_that.isVisible,_that.developmentStatus,_that.owner,_that.media,_that.city,_that.unitType,_that.amenities,_that.averageRating,_that.reviewsCount,_that.createdAt,_that.landArea,_that.internalArea,_that.compound,_that.developer);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String title,  String description,  String address,  double price,  double pricePerM2,  String offerType,  double area,  int rooms,  int bathrooms,  int garages,  String buildYear,  String latitude,  String longitude,  String status,  bool isFavourite,  bool isVisible,  String developmentStatus,  UnitOwnerEntity owner,  List<UnitMediaEntity> media,  UnitCityEntity city,  UnitTypeEntity unitType,  List<UnitAmenityEntity> amenities,  double averageRating,  int reviewsCount,  DateTime createdAt,  double? landArea,  double? internalArea,  CompoundEntity? compound,  DeveloperEntity? developer)?  $default,) {final _that = this;
switch (_that) {
case _UnitDetailsEntity() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.address,_that.price,_that.pricePerM2,_that.offerType,_that.area,_that.rooms,_that.bathrooms,_that.garages,_that.buildYear,_that.latitude,_that.longitude,_that.status,_that.isFavourite,_that.isVisible,_that.developmentStatus,_that.owner,_that.media,_that.city,_that.unitType,_that.amenities,_that.averageRating,_that.reviewsCount,_that.createdAt,_that.landArea,_that.internalArea,_that.compound,_that.developer);case _:
  return null;

}
}

}

/// @nodoc


class _UnitDetailsEntity extends UnitDetailsEntity {
  const _UnitDetailsEntity({required this.id, required this.title, required this.description, required this.address, required this.price, required this.pricePerM2, required this.offerType, required this.area, required this.rooms, required this.bathrooms, required this.garages, required this.buildYear, required this.latitude, required this.longitude, required this.status, required this.isFavourite, required this.isVisible, required this.developmentStatus, required this.owner, required final  List<UnitMediaEntity> media, required this.city, required this.unitType, required final  List<UnitAmenityEntity> amenities, required this.averageRating, required this.reviewsCount, required this.createdAt, this.landArea, this.internalArea, this.compound, this.developer}): _media = media,_amenities = amenities,super._();
  

@override final  int id;
@override final  String title;
@override final  String description;
@override final  String address;
@override final  double price;
@override final  double pricePerM2;
@override final  String offerType;
@override final  double area;
@override final  int rooms;
@override final  int bathrooms;
@override final  int garages;
@override final  String buildYear;
@override final  String latitude;
@override final  String longitude;
@override final  String status;
@override final  bool isFavourite;
@override final  bool isVisible;
@override final  String developmentStatus;
@override final  UnitOwnerEntity owner;
 final  List<UnitMediaEntity> _media;
@override List<UnitMediaEntity> get media {
  if (_media is EqualUnmodifiableListView) return _media;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_media);
}

@override final  UnitCityEntity city;
@override final  UnitTypeEntity unitType;
 final  List<UnitAmenityEntity> _amenities;
@override List<UnitAmenityEntity> get amenities {
  if (_amenities is EqualUnmodifiableListView) return _amenities;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_amenities);
}

@override final  double averageRating;
@override final  int reviewsCount;
@override final  DateTime createdAt;
@override final  double? landArea;
@override final  double? internalArea;
@override final  CompoundEntity? compound;
@override final  DeveloperEntity? developer;

/// Create a copy of UnitDetailsEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UnitDetailsEntityCopyWith<_UnitDetailsEntity> get copyWith => __$UnitDetailsEntityCopyWithImpl<_UnitDetailsEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UnitDetailsEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.address, address) || other.address == address)&&(identical(other.price, price) || other.price == price)&&(identical(other.pricePerM2, pricePerM2) || other.pricePerM2 == pricePerM2)&&(identical(other.offerType, offerType) || other.offerType == offerType)&&(identical(other.area, area) || other.area == area)&&(identical(other.rooms, rooms) || other.rooms == rooms)&&(identical(other.bathrooms, bathrooms) || other.bathrooms == bathrooms)&&(identical(other.garages, garages) || other.garages == garages)&&(identical(other.buildYear, buildYear) || other.buildYear == buildYear)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.status, status) || other.status == status)&&(identical(other.isFavourite, isFavourite) || other.isFavourite == isFavourite)&&(identical(other.isVisible, isVisible) || other.isVisible == isVisible)&&(identical(other.developmentStatus, developmentStatus) || other.developmentStatus == developmentStatus)&&(identical(other.owner, owner) || other.owner == owner)&&const DeepCollectionEquality().equals(other._media, _media)&&(identical(other.city, city) || other.city == city)&&(identical(other.unitType, unitType) || other.unitType == unitType)&&const DeepCollectionEquality().equals(other._amenities, _amenities)&&(identical(other.averageRating, averageRating) || other.averageRating == averageRating)&&(identical(other.reviewsCount, reviewsCount) || other.reviewsCount == reviewsCount)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.landArea, landArea) || other.landArea == landArea)&&(identical(other.internalArea, internalArea) || other.internalArea == internalArea)&&(identical(other.compound, compound) || other.compound == compound)&&(identical(other.developer, developer) || other.developer == developer));
}


@override
int get hashCode => Object.hashAll([runtimeType,id,title,description,address,price,pricePerM2,offerType,area,rooms,bathrooms,garages,buildYear,latitude,longitude,status,isFavourite,isVisible,developmentStatus,owner,const DeepCollectionEquality().hash(_media),city,unitType,const DeepCollectionEquality().hash(_amenities),averageRating,reviewsCount,createdAt,landArea,internalArea,compound,developer]);

@override
String toString() {
  return 'UnitDetailsEntity(id: $id, title: $title, description: $description, address: $address, price: $price, pricePerM2: $pricePerM2, offerType: $offerType, area: $area, rooms: $rooms, bathrooms: $bathrooms, garages: $garages, buildYear: $buildYear, latitude: $latitude, longitude: $longitude, status: $status, isFavourite: $isFavourite, isVisible: $isVisible, developmentStatus: $developmentStatus, owner: $owner, media: $media, city: $city, unitType: $unitType, amenities: $amenities, averageRating: $averageRating, reviewsCount: $reviewsCount, createdAt: $createdAt, landArea: $landArea, internalArea: $internalArea, compound: $compound, developer: $developer)';
}


}

/// @nodoc
abstract mixin class _$UnitDetailsEntityCopyWith<$Res> implements $UnitDetailsEntityCopyWith<$Res> {
  factory _$UnitDetailsEntityCopyWith(_UnitDetailsEntity value, $Res Function(_UnitDetailsEntity) _then) = __$UnitDetailsEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, String title, String description, String address, double price, double pricePerM2, String offerType, double area, int rooms, int bathrooms, int garages, String buildYear, String latitude, String longitude, String status, bool isFavourite, bool isVisible, String developmentStatus, UnitOwnerEntity owner, List<UnitMediaEntity> media, UnitCityEntity city, UnitTypeEntity unitType, List<UnitAmenityEntity> amenities, double averageRating, int reviewsCount, DateTime createdAt, double? landArea, double? internalArea, CompoundEntity? compound, DeveloperEntity? developer
});


@override $UnitOwnerEntityCopyWith<$Res> get owner;@override $UnitCityEntityCopyWith<$Res> get city;@override $UnitTypeEntityCopyWith<$Res> get unitType;@override $CompoundEntityCopyWith<$Res>? get compound;@override $DeveloperEntityCopyWith<$Res>? get developer;

}
/// @nodoc
class __$UnitDetailsEntityCopyWithImpl<$Res>
    implements _$UnitDetailsEntityCopyWith<$Res> {
  __$UnitDetailsEntityCopyWithImpl(this._self, this._then);

  final _UnitDetailsEntity _self;
  final $Res Function(_UnitDetailsEntity) _then;

/// Create a copy of UnitDetailsEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? description = null,Object? address = null,Object? price = null,Object? pricePerM2 = null,Object? offerType = null,Object? area = null,Object? rooms = null,Object? bathrooms = null,Object? garages = null,Object? buildYear = null,Object? latitude = null,Object? longitude = null,Object? status = null,Object? isFavourite = null,Object? isVisible = null,Object? developmentStatus = null,Object? owner = null,Object? media = null,Object? city = null,Object? unitType = null,Object? amenities = null,Object? averageRating = null,Object? reviewsCount = null,Object? createdAt = null,Object? landArea = freezed,Object? internalArea = freezed,Object? compound = freezed,Object? developer = freezed,}) {
  return _then(_UnitDetailsEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,pricePerM2: null == pricePerM2 ? _self.pricePerM2 : pricePerM2 // ignore: cast_nullable_to_non_nullable
as double,offerType: null == offerType ? _self.offerType : offerType // ignore: cast_nullable_to_non_nullable
as String,area: null == area ? _self.area : area // ignore: cast_nullable_to_non_nullable
as double,rooms: null == rooms ? _self.rooms : rooms // ignore: cast_nullable_to_non_nullable
as int,bathrooms: null == bathrooms ? _self.bathrooms : bathrooms // ignore: cast_nullable_to_non_nullable
as int,garages: null == garages ? _self.garages : garages // ignore: cast_nullable_to_non_nullable
as int,buildYear: null == buildYear ? _self.buildYear : buildYear // ignore: cast_nullable_to_non_nullable
as String,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as String,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,isFavourite: null == isFavourite ? _self.isFavourite : isFavourite // ignore: cast_nullable_to_non_nullable
as bool,isVisible: null == isVisible ? _self.isVisible : isVisible // ignore: cast_nullable_to_non_nullable
as bool,developmentStatus: null == developmentStatus ? _self.developmentStatus : developmentStatus // ignore: cast_nullable_to_non_nullable
as String,owner: null == owner ? _self.owner : owner // ignore: cast_nullable_to_non_nullable
as UnitOwnerEntity,media: null == media ? _self._media : media // ignore: cast_nullable_to_non_nullable
as List<UnitMediaEntity>,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as UnitCityEntity,unitType: null == unitType ? _self.unitType : unitType // ignore: cast_nullable_to_non_nullable
as UnitTypeEntity,amenities: null == amenities ? _self._amenities : amenities // ignore: cast_nullable_to_non_nullable
as List<UnitAmenityEntity>,averageRating: null == averageRating ? _self.averageRating : averageRating // ignore: cast_nullable_to_non_nullable
as double,reviewsCount: null == reviewsCount ? _self.reviewsCount : reviewsCount // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,landArea: freezed == landArea ? _self.landArea : landArea // ignore: cast_nullable_to_non_nullable
as double?,internalArea: freezed == internalArea ? _self.internalArea : internalArea // ignore: cast_nullable_to_non_nullable
as double?,compound: freezed == compound ? _self.compound : compound // ignore: cast_nullable_to_non_nullable
as CompoundEntity?,developer: freezed == developer ? _self.developer : developer // ignore: cast_nullable_to_non_nullable
as DeveloperEntity?,
  ));
}

/// Create a copy of UnitDetailsEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UnitOwnerEntityCopyWith<$Res> get owner {
  
  return $UnitOwnerEntityCopyWith<$Res>(_self.owner, (value) {
    return _then(_self.copyWith(owner: value));
  });
}/// Create a copy of UnitDetailsEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UnitCityEntityCopyWith<$Res> get city {
  
  return $UnitCityEntityCopyWith<$Res>(_self.city, (value) {
    return _then(_self.copyWith(city: value));
  });
}/// Create a copy of UnitDetailsEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UnitTypeEntityCopyWith<$Res> get unitType {
  
  return $UnitTypeEntityCopyWith<$Res>(_self.unitType, (value) {
    return _then(_self.copyWith(unitType: value));
  });
}/// Create a copy of UnitDetailsEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CompoundEntityCopyWith<$Res>? get compound {
    if (_self.compound == null) {
    return null;
  }

  return $CompoundEntityCopyWith<$Res>(_self.compound!, (value) {
    return _then(_self.copyWith(compound: value));
  });
}/// Create a copy of UnitDetailsEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DeveloperEntityCopyWith<$Res>? get developer {
    if (_self.developer == null) {
    return null;
  }

  return $DeveloperEntityCopyWith<$Res>(_self.developer!, (value) {
    return _then(_self.copyWith(developer: value));
  });
}
}

/// @nodoc
mixin _$UnitOwnerEntity {

 int get id; String get name; String get email; String get phone; String get address; String get avatar; String get status; String get role; UnitCityEntity? get city;
/// Create a copy of UnitOwnerEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnitOwnerEntityCopyWith<UnitOwnerEntity> get copyWith => _$UnitOwnerEntityCopyWithImpl<UnitOwnerEntity>(this as UnitOwnerEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnitOwnerEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.address, address) || other.address == address)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.status, status) || other.status == status)&&(identical(other.role, role) || other.role == role)&&(identical(other.city, city) || other.city == city));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,email,phone,address,avatar,status,role,city);

@override
String toString() {
  return 'UnitOwnerEntity(id: $id, name: $name, email: $email, phone: $phone, address: $address, avatar: $avatar, status: $status, role: $role, city: $city)';
}


}

/// @nodoc
abstract mixin class $UnitOwnerEntityCopyWith<$Res>  {
  factory $UnitOwnerEntityCopyWith(UnitOwnerEntity value, $Res Function(UnitOwnerEntity) _then) = _$UnitOwnerEntityCopyWithImpl;
@useResult
$Res call({
 int id, String name, String email, String phone, String address, String avatar, String status, String role, UnitCityEntity? city
});


$UnitCityEntityCopyWith<$Res>? get city;

}
/// @nodoc
class _$UnitOwnerEntityCopyWithImpl<$Res>
    implements $UnitOwnerEntityCopyWith<$Res> {
  _$UnitOwnerEntityCopyWithImpl(this._self, this._then);

  final UnitOwnerEntity _self;
  final $Res Function(UnitOwnerEntity) _then;

/// Create a copy of UnitOwnerEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? email = null,Object? phone = null,Object? address = null,Object? avatar = null,Object? status = null,Object? role = null,Object? city = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,avatar: null == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as UnitCityEntity?,
  ));
}
/// Create a copy of UnitOwnerEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UnitCityEntityCopyWith<$Res>? get city {
    if (_self.city == null) {
    return null;
  }

  return $UnitCityEntityCopyWith<$Res>(_self.city!, (value) {
    return _then(_self.copyWith(city: value));
  });
}
}


/// Adds pattern-matching-related methods to [UnitOwnerEntity].
extension UnitOwnerEntityPatterns on UnitOwnerEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UnitOwnerEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UnitOwnerEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UnitOwnerEntity value)  $default,){
final _that = this;
switch (_that) {
case _UnitOwnerEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UnitOwnerEntity value)?  $default,){
final _that = this;
switch (_that) {
case _UnitOwnerEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String email,  String phone,  String address,  String avatar,  String status,  String role,  UnitCityEntity? city)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UnitOwnerEntity() when $default != null:
return $default(_that.id,_that.name,_that.email,_that.phone,_that.address,_that.avatar,_that.status,_that.role,_that.city);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String email,  String phone,  String address,  String avatar,  String status,  String role,  UnitCityEntity? city)  $default,) {final _that = this;
switch (_that) {
case _UnitOwnerEntity():
return $default(_that.id,_that.name,_that.email,_that.phone,_that.address,_that.avatar,_that.status,_that.role,_that.city);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String email,  String phone,  String address,  String avatar,  String status,  String role,  UnitCityEntity? city)?  $default,) {final _that = this;
switch (_that) {
case _UnitOwnerEntity() when $default != null:
return $default(_that.id,_that.name,_that.email,_that.phone,_that.address,_that.avatar,_that.status,_that.role,_that.city);case _:
  return null;

}
}

}

/// @nodoc


class _UnitOwnerEntity implements UnitOwnerEntity {
  const _UnitOwnerEntity({required this.id, required this.name, required this.email, required this.phone, required this.address, required this.avatar, required this.status, required this.role, this.city});
  

@override final  int id;
@override final  String name;
@override final  String email;
@override final  String phone;
@override final  String address;
@override final  String avatar;
@override final  String status;
@override final  String role;
@override final  UnitCityEntity? city;

/// Create a copy of UnitOwnerEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UnitOwnerEntityCopyWith<_UnitOwnerEntity> get copyWith => __$UnitOwnerEntityCopyWithImpl<_UnitOwnerEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UnitOwnerEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.address, address) || other.address == address)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.status, status) || other.status == status)&&(identical(other.role, role) || other.role == role)&&(identical(other.city, city) || other.city == city));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,email,phone,address,avatar,status,role,city);

@override
String toString() {
  return 'UnitOwnerEntity(id: $id, name: $name, email: $email, phone: $phone, address: $address, avatar: $avatar, status: $status, role: $role, city: $city)';
}


}

/// @nodoc
abstract mixin class _$UnitOwnerEntityCopyWith<$Res> implements $UnitOwnerEntityCopyWith<$Res> {
  factory _$UnitOwnerEntityCopyWith(_UnitOwnerEntity value, $Res Function(_UnitOwnerEntity) _then) = __$UnitOwnerEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String email, String phone, String address, String avatar, String status, String role, UnitCityEntity? city
});


@override $UnitCityEntityCopyWith<$Res>? get city;

}
/// @nodoc
class __$UnitOwnerEntityCopyWithImpl<$Res>
    implements _$UnitOwnerEntityCopyWith<$Res> {
  __$UnitOwnerEntityCopyWithImpl(this._self, this._then);

  final _UnitOwnerEntity _self;
  final $Res Function(_UnitOwnerEntity) _then;

/// Create a copy of UnitOwnerEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? email = null,Object? phone = null,Object? address = null,Object? avatar = null,Object? status = null,Object? role = null,Object? city = freezed,}) {
  return _then(_UnitOwnerEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,avatar: null == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as UnitCityEntity?,
  ));
}

/// Create a copy of UnitOwnerEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UnitCityEntityCopyWith<$Res>? get city {
    if (_self.city == null) {
    return null;
  }

  return $UnitCityEntityCopyWith<$Res>(_self.city!, (value) {
    return _then(_self.copyWith(city: value));
  });
}
}

/// @nodoc
mixin _$UnitMediaEntity {

 int get id; String get filePath; String get hlsPath; String get processingStatus; String get type;
/// Create a copy of UnitMediaEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnitMediaEntityCopyWith<UnitMediaEntity> get copyWith => _$UnitMediaEntityCopyWithImpl<UnitMediaEntity>(this as UnitMediaEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnitMediaEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.filePath, filePath) || other.filePath == filePath)&&(identical(other.hlsPath, hlsPath) || other.hlsPath == hlsPath)&&(identical(other.processingStatus, processingStatus) || other.processingStatus == processingStatus)&&(identical(other.type, type) || other.type == type));
}


@override
int get hashCode => Object.hash(runtimeType,id,filePath,hlsPath,processingStatus,type);

@override
String toString() {
  return 'UnitMediaEntity(id: $id, filePath: $filePath, hlsPath: $hlsPath, processingStatus: $processingStatus, type: $type)';
}


}

/// @nodoc
abstract mixin class $UnitMediaEntityCopyWith<$Res>  {
  factory $UnitMediaEntityCopyWith(UnitMediaEntity value, $Res Function(UnitMediaEntity) _then) = _$UnitMediaEntityCopyWithImpl;
@useResult
$Res call({
 int id, String filePath, String hlsPath, String processingStatus, String type
});




}
/// @nodoc
class _$UnitMediaEntityCopyWithImpl<$Res>
    implements $UnitMediaEntityCopyWith<$Res> {
  _$UnitMediaEntityCopyWithImpl(this._self, this._then);

  final UnitMediaEntity _self;
  final $Res Function(UnitMediaEntity) _then;

/// Create a copy of UnitMediaEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? filePath = null,Object? hlsPath = null,Object? processingStatus = null,Object? type = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,filePath: null == filePath ? _self.filePath : filePath // ignore: cast_nullable_to_non_nullable
as String,hlsPath: null == hlsPath ? _self.hlsPath : hlsPath // ignore: cast_nullable_to_non_nullable
as String,processingStatus: null == processingStatus ? _self.processingStatus : processingStatus // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [UnitMediaEntity].
extension UnitMediaEntityPatterns on UnitMediaEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UnitMediaEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UnitMediaEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UnitMediaEntity value)  $default,){
final _that = this;
switch (_that) {
case _UnitMediaEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UnitMediaEntity value)?  $default,){
final _that = this;
switch (_that) {
case _UnitMediaEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String filePath,  String hlsPath,  String processingStatus,  String type)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UnitMediaEntity() when $default != null:
return $default(_that.id,_that.filePath,_that.hlsPath,_that.processingStatus,_that.type);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String filePath,  String hlsPath,  String processingStatus,  String type)  $default,) {final _that = this;
switch (_that) {
case _UnitMediaEntity():
return $default(_that.id,_that.filePath,_that.hlsPath,_that.processingStatus,_that.type);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String filePath,  String hlsPath,  String processingStatus,  String type)?  $default,) {final _that = this;
switch (_that) {
case _UnitMediaEntity() when $default != null:
return $default(_that.id,_that.filePath,_that.hlsPath,_that.processingStatus,_that.type);case _:
  return null;

}
}

}

/// @nodoc


class _UnitMediaEntity implements UnitMediaEntity {
  const _UnitMediaEntity({required this.id, required this.filePath, required this.hlsPath, required this.processingStatus, required this.type});
  

@override final  int id;
@override final  String filePath;
@override final  String hlsPath;
@override final  String processingStatus;
@override final  String type;

/// Create a copy of UnitMediaEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UnitMediaEntityCopyWith<_UnitMediaEntity> get copyWith => __$UnitMediaEntityCopyWithImpl<_UnitMediaEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UnitMediaEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.filePath, filePath) || other.filePath == filePath)&&(identical(other.hlsPath, hlsPath) || other.hlsPath == hlsPath)&&(identical(other.processingStatus, processingStatus) || other.processingStatus == processingStatus)&&(identical(other.type, type) || other.type == type));
}


@override
int get hashCode => Object.hash(runtimeType,id,filePath,hlsPath,processingStatus,type);

@override
String toString() {
  return 'UnitMediaEntity(id: $id, filePath: $filePath, hlsPath: $hlsPath, processingStatus: $processingStatus, type: $type)';
}


}

/// @nodoc
abstract mixin class _$UnitMediaEntityCopyWith<$Res> implements $UnitMediaEntityCopyWith<$Res> {
  factory _$UnitMediaEntityCopyWith(_UnitMediaEntity value, $Res Function(_UnitMediaEntity) _then) = __$UnitMediaEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, String filePath, String hlsPath, String processingStatus, String type
});




}
/// @nodoc
class __$UnitMediaEntityCopyWithImpl<$Res>
    implements _$UnitMediaEntityCopyWith<$Res> {
  __$UnitMediaEntityCopyWithImpl(this._self, this._then);

  final _UnitMediaEntity _self;
  final $Res Function(_UnitMediaEntity) _then;

/// Create a copy of UnitMediaEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? filePath = null,Object? hlsPath = null,Object? processingStatus = null,Object? type = null,}) {
  return _then(_UnitMediaEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,filePath: null == filePath ? _self.filePath : filePath // ignore: cast_nullable_to_non_nullable
as String,hlsPath: null == hlsPath ? _self.hlsPath : hlsPath // ignore: cast_nullable_to_non_nullable
as String,processingStatus: null == processingStatus ? _self.processingStatus : processingStatus // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$UnitCityEntity {

 int get id; String get name;
/// Create a copy of UnitCityEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnitCityEntityCopyWith<UnitCityEntity> get copyWith => _$UnitCityEntityCopyWithImpl<UnitCityEntity>(this as UnitCityEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnitCityEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}


@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'UnitCityEntity(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class $UnitCityEntityCopyWith<$Res>  {
  factory $UnitCityEntityCopyWith(UnitCityEntity value, $Res Function(UnitCityEntity) _then) = _$UnitCityEntityCopyWithImpl;
@useResult
$Res call({
 int id, String name
});




}
/// @nodoc
class _$UnitCityEntityCopyWithImpl<$Res>
    implements $UnitCityEntityCopyWith<$Res> {
  _$UnitCityEntityCopyWithImpl(this._self, this._then);

  final UnitCityEntity _self;
  final $Res Function(UnitCityEntity) _then;

/// Create a copy of UnitCityEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [UnitCityEntity].
extension UnitCityEntityPatterns on UnitCityEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UnitCityEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UnitCityEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UnitCityEntity value)  $default,){
final _that = this;
switch (_that) {
case _UnitCityEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UnitCityEntity value)?  $default,){
final _that = this;
switch (_that) {
case _UnitCityEntity() when $default != null:
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
case _UnitCityEntity() when $default != null:
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
case _UnitCityEntity():
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
case _UnitCityEntity() when $default != null:
return $default(_that.id,_that.name);case _:
  return null;

}
}

}

/// @nodoc


class _UnitCityEntity implements UnitCityEntity {
  const _UnitCityEntity({required this.id, required this.name});
  

@override final  int id;
@override final  String name;

/// Create a copy of UnitCityEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UnitCityEntityCopyWith<_UnitCityEntity> get copyWith => __$UnitCityEntityCopyWithImpl<_UnitCityEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UnitCityEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}


@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'UnitCityEntity(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class _$UnitCityEntityCopyWith<$Res> implements $UnitCityEntityCopyWith<$Res> {
  factory _$UnitCityEntityCopyWith(_UnitCityEntity value, $Res Function(_UnitCityEntity) _then) = __$UnitCityEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, String name
});




}
/// @nodoc
class __$UnitCityEntityCopyWithImpl<$Res>
    implements _$UnitCityEntityCopyWith<$Res> {
  __$UnitCityEntityCopyWithImpl(this._self, this._then);

  final _UnitCityEntity _self;
  final $Res Function(_UnitCityEntity) _then;

/// Create a copy of UnitCityEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,}) {
  return _then(_UnitCityEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$UnitTypeEntity {

 int get id; String get name; String get icon;
/// Create a copy of UnitTypeEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnitTypeEntityCopyWith<UnitTypeEntity> get copyWith => _$UnitTypeEntityCopyWithImpl<UnitTypeEntity>(this as UnitTypeEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnitTypeEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.icon, icon) || other.icon == icon));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,icon);

@override
String toString() {
  return 'UnitTypeEntity(id: $id, name: $name, icon: $icon)';
}


}

/// @nodoc
abstract mixin class $UnitTypeEntityCopyWith<$Res>  {
  factory $UnitTypeEntityCopyWith(UnitTypeEntity value, $Res Function(UnitTypeEntity) _then) = _$UnitTypeEntityCopyWithImpl;
@useResult
$Res call({
 int id, String name, String icon
});




}
/// @nodoc
class _$UnitTypeEntityCopyWithImpl<$Res>
    implements $UnitTypeEntityCopyWith<$Res> {
  _$UnitTypeEntityCopyWithImpl(this._self, this._then);

  final UnitTypeEntity _self;
  final $Res Function(UnitTypeEntity) _then;

/// Create a copy of UnitTypeEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? icon = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [UnitTypeEntity].
extension UnitTypeEntityPatterns on UnitTypeEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UnitTypeEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UnitTypeEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UnitTypeEntity value)  $default,){
final _that = this;
switch (_that) {
case _UnitTypeEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UnitTypeEntity value)?  $default,){
final _that = this;
switch (_that) {
case _UnitTypeEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String icon)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UnitTypeEntity() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String icon)  $default,) {final _that = this;
switch (_that) {
case _UnitTypeEntity():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String icon)?  $default,) {final _that = this;
switch (_that) {
case _UnitTypeEntity() when $default != null:
return $default(_that.id,_that.name,_that.icon);case _:
  return null;

}
}

}

/// @nodoc


class _UnitTypeEntity implements UnitTypeEntity {
  const _UnitTypeEntity({required this.id, required this.name, required this.icon});
  

@override final  int id;
@override final  String name;
@override final  String icon;

/// Create a copy of UnitTypeEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UnitTypeEntityCopyWith<_UnitTypeEntity> get copyWith => __$UnitTypeEntityCopyWithImpl<_UnitTypeEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UnitTypeEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.icon, icon) || other.icon == icon));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,icon);

@override
String toString() {
  return 'UnitTypeEntity(id: $id, name: $name, icon: $icon)';
}


}

/// @nodoc
abstract mixin class _$UnitTypeEntityCopyWith<$Res> implements $UnitTypeEntityCopyWith<$Res> {
  factory _$UnitTypeEntityCopyWith(_UnitTypeEntity value, $Res Function(_UnitTypeEntity) _then) = __$UnitTypeEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String icon
});




}
/// @nodoc
class __$UnitTypeEntityCopyWithImpl<$Res>
    implements _$UnitTypeEntityCopyWith<$Res> {
  __$UnitTypeEntityCopyWithImpl(this._self, this._then);

  final _UnitTypeEntity _self;
  final $Res Function(_UnitTypeEntity) _then;

/// Create a copy of UnitTypeEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? icon = null,}) {
  return _then(_UnitTypeEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$UnitAmenityEntity {

 int get id; String get name; String get icon;
/// Create a copy of UnitAmenityEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnitAmenityEntityCopyWith<UnitAmenityEntity> get copyWith => _$UnitAmenityEntityCopyWithImpl<UnitAmenityEntity>(this as UnitAmenityEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnitAmenityEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.icon, icon) || other.icon == icon));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,icon);

@override
String toString() {
  return 'UnitAmenityEntity(id: $id, name: $name, icon: $icon)';
}


}

/// @nodoc
abstract mixin class $UnitAmenityEntityCopyWith<$Res>  {
  factory $UnitAmenityEntityCopyWith(UnitAmenityEntity value, $Res Function(UnitAmenityEntity) _then) = _$UnitAmenityEntityCopyWithImpl;
@useResult
$Res call({
 int id, String name, String icon
});




}
/// @nodoc
class _$UnitAmenityEntityCopyWithImpl<$Res>
    implements $UnitAmenityEntityCopyWith<$Res> {
  _$UnitAmenityEntityCopyWithImpl(this._self, this._then);

  final UnitAmenityEntity _self;
  final $Res Function(UnitAmenityEntity) _then;

/// Create a copy of UnitAmenityEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? icon = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [UnitAmenityEntity].
extension UnitAmenityEntityPatterns on UnitAmenityEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UnitAmenityEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UnitAmenityEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UnitAmenityEntity value)  $default,){
final _that = this;
switch (_that) {
case _UnitAmenityEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UnitAmenityEntity value)?  $default,){
final _that = this;
switch (_that) {
case _UnitAmenityEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String icon)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UnitAmenityEntity() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String icon)  $default,) {final _that = this;
switch (_that) {
case _UnitAmenityEntity():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String icon)?  $default,) {final _that = this;
switch (_that) {
case _UnitAmenityEntity() when $default != null:
return $default(_that.id,_that.name,_that.icon);case _:
  return null;

}
}

}

/// @nodoc


class _UnitAmenityEntity implements UnitAmenityEntity {
  const _UnitAmenityEntity({required this.id, required this.name, required this.icon});
  

@override final  int id;
@override final  String name;
@override final  String icon;

/// Create a copy of UnitAmenityEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UnitAmenityEntityCopyWith<_UnitAmenityEntity> get copyWith => __$UnitAmenityEntityCopyWithImpl<_UnitAmenityEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UnitAmenityEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.icon, icon) || other.icon == icon));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,icon);

@override
String toString() {
  return 'UnitAmenityEntity(id: $id, name: $name, icon: $icon)';
}


}

/// @nodoc
abstract mixin class _$UnitAmenityEntityCopyWith<$Res> implements $UnitAmenityEntityCopyWith<$Res> {
  factory _$UnitAmenityEntityCopyWith(_UnitAmenityEntity value, $Res Function(_UnitAmenityEntity) _then) = __$UnitAmenityEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String icon
});




}
/// @nodoc
class __$UnitAmenityEntityCopyWithImpl<$Res>
    implements _$UnitAmenityEntityCopyWith<$Res> {
  __$UnitAmenityEntityCopyWithImpl(this._self, this._then);

  final _UnitAmenityEntity _self;
  final $Res Function(_UnitAmenityEntity) _then;

/// Create a copy of UnitAmenityEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? icon = null,}) {
  return _then(_UnitAmenityEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
