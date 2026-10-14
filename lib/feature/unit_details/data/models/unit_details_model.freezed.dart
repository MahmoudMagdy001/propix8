// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'unit_details_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UnitDetailsModel {

@JsonKey(name: 'created_at', fromJson: _parseDateTime) DateTime get createdAt; int get id; String get title; String get description; String get address;@JsonKey(fromJson: _parseDouble) double get price;@JsonKey(name: 'price_per_m2', fromJson: _parseDouble) double get pricePerM2;@JsonKey(name: 'offer_type') String get offerType;@JsonKey(fromJson: _parseDouble) double get area;@JsonKey(name: 'land_area', fromJson: _parseDouble) double? get landArea;@JsonKey(name: 'internal_area', fromJson: _parseDouble) double? get internalArea; int get rooms; int get bathrooms; int get garages;@JsonKey(name: 'build_year') String get buildYear; String get latitude; String get longitude; String get status;@JsonKey(name: 'is_favourite') bool get isFavourite;@JsonKey(name: 'is_visible') bool get isVisible;@JsonKey(name: 'development_status') String get developmentStatus; OwnerModel get owner; List<MediaModel> get media; CityModel get city;@JsonKey(name: 'unit_type') UnitTypeModel get unitType; CompoundModel? get compound; DeveloperModel? get developer; List<AmenityModel> get amenities;@JsonKey(name: 'average_rating', fromJson: _parseDouble) double get averageRating;@JsonKey(name: 'reviews_count') int get reviewsCount;
/// Create a copy of UnitDetailsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnitDetailsModelCopyWith<UnitDetailsModel> get copyWith => _$UnitDetailsModelCopyWithImpl<UnitDetailsModel>(this as UnitDetailsModel, _$identity);

  /// Serializes this UnitDetailsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnitDetailsModel&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.address, address) || other.address == address)&&(identical(other.price, price) || other.price == price)&&(identical(other.pricePerM2, pricePerM2) || other.pricePerM2 == pricePerM2)&&(identical(other.offerType, offerType) || other.offerType == offerType)&&(identical(other.area, area) || other.area == area)&&(identical(other.landArea, landArea) || other.landArea == landArea)&&(identical(other.internalArea, internalArea) || other.internalArea == internalArea)&&(identical(other.rooms, rooms) || other.rooms == rooms)&&(identical(other.bathrooms, bathrooms) || other.bathrooms == bathrooms)&&(identical(other.garages, garages) || other.garages == garages)&&(identical(other.buildYear, buildYear) || other.buildYear == buildYear)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.status, status) || other.status == status)&&(identical(other.isFavourite, isFavourite) || other.isFavourite == isFavourite)&&(identical(other.isVisible, isVisible) || other.isVisible == isVisible)&&(identical(other.developmentStatus, developmentStatus) || other.developmentStatus == developmentStatus)&&(identical(other.owner, owner) || other.owner == owner)&&const DeepCollectionEquality().equals(other.media, media)&&(identical(other.city, city) || other.city == city)&&(identical(other.unitType, unitType) || other.unitType == unitType)&&(identical(other.compound, compound) || other.compound == compound)&&(identical(other.developer, developer) || other.developer == developer)&&const DeepCollectionEquality().equals(other.amenities, amenities)&&(identical(other.averageRating, averageRating) || other.averageRating == averageRating)&&(identical(other.reviewsCount, reviewsCount) || other.reviewsCount == reviewsCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,createdAt,id,title,description,address,price,pricePerM2,offerType,area,landArea,internalArea,rooms,bathrooms,garages,buildYear,latitude,longitude,status,isFavourite,isVisible,developmentStatus,owner,const DeepCollectionEquality().hash(media),city,unitType,compound,developer,const DeepCollectionEquality().hash(amenities),averageRating,reviewsCount]);

@override
String toString() {
  return 'UnitDetailsModel(createdAt: $createdAt, id: $id, title: $title, description: $description, address: $address, price: $price, pricePerM2: $pricePerM2, offerType: $offerType, area: $area, landArea: $landArea, internalArea: $internalArea, rooms: $rooms, bathrooms: $bathrooms, garages: $garages, buildYear: $buildYear, latitude: $latitude, longitude: $longitude, status: $status, isFavourite: $isFavourite, isVisible: $isVisible, developmentStatus: $developmentStatus, owner: $owner, media: $media, city: $city, unitType: $unitType, compound: $compound, developer: $developer, amenities: $amenities, averageRating: $averageRating, reviewsCount: $reviewsCount)';
}


}

/// @nodoc
abstract mixin class $UnitDetailsModelCopyWith<$Res>  {
  factory $UnitDetailsModelCopyWith(UnitDetailsModel value, $Res Function(UnitDetailsModel) _then) = _$UnitDetailsModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'created_at', fromJson: _parseDateTime) DateTime createdAt, int id, String title, String description, String address,@JsonKey(fromJson: _parseDouble) double price,@JsonKey(name: 'price_per_m2', fromJson: _parseDouble) double pricePerM2,@JsonKey(name: 'offer_type') String offerType,@JsonKey(fromJson: _parseDouble) double area,@JsonKey(name: 'land_area', fromJson: _parseDouble) double? landArea,@JsonKey(name: 'internal_area', fromJson: _parseDouble) double? internalArea, int rooms, int bathrooms, int garages,@JsonKey(name: 'build_year') String buildYear, String latitude, String longitude, String status,@JsonKey(name: 'is_favourite') bool isFavourite,@JsonKey(name: 'is_visible') bool isVisible,@JsonKey(name: 'development_status') String developmentStatus, OwnerModel owner, List<MediaModel> media, CityModel city,@JsonKey(name: 'unit_type') UnitTypeModel unitType, CompoundModel? compound, DeveloperModel? developer, List<AmenityModel> amenities,@JsonKey(name: 'average_rating', fromJson: _parseDouble) double averageRating,@JsonKey(name: 'reviews_count') int reviewsCount
});


$OwnerModelCopyWith<$Res> get owner;$CityModelCopyWith<$Res> get city;$UnitTypeModelCopyWith<$Res> get unitType;$CompoundModelCopyWith<$Res>? get compound;$DeveloperModelCopyWith<$Res>? get developer;

}
/// @nodoc
class _$UnitDetailsModelCopyWithImpl<$Res>
    implements $UnitDetailsModelCopyWith<$Res> {
  _$UnitDetailsModelCopyWithImpl(this._self, this._then);

  final UnitDetailsModel _self;
  final $Res Function(UnitDetailsModel) _then;

/// Create a copy of UnitDetailsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? createdAt = null,Object? id = null,Object? title = null,Object? description = null,Object? address = null,Object? price = null,Object? pricePerM2 = null,Object? offerType = null,Object? area = null,Object? landArea = freezed,Object? internalArea = freezed,Object? rooms = null,Object? bathrooms = null,Object? garages = null,Object? buildYear = null,Object? latitude = null,Object? longitude = null,Object? status = null,Object? isFavourite = null,Object? isVisible = null,Object? developmentStatus = null,Object? owner = null,Object? media = null,Object? city = null,Object? unitType = null,Object? compound = freezed,Object? developer = freezed,Object? amenities = null,Object? averageRating = null,Object? reviewsCount = null,}) {
  return _then(_self.copyWith(
createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,pricePerM2: null == pricePerM2 ? _self.pricePerM2 : pricePerM2 // ignore: cast_nullable_to_non_nullable
as double,offerType: null == offerType ? _self.offerType : offerType // ignore: cast_nullable_to_non_nullable
as String,area: null == area ? _self.area : area // ignore: cast_nullable_to_non_nullable
as double,landArea: freezed == landArea ? _self.landArea : landArea // ignore: cast_nullable_to_non_nullable
as double?,internalArea: freezed == internalArea ? _self.internalArea : internalArea // ignore: cast_nullable_to_non_nullable
as double?,rooms: null == rooms ? _self.rooms : rooms // ignore: cast_nullable_to_non_nullable
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
as OwnerModel,media: null == media ? _self.media : media // ignore: cast_nullable_to_non_nullable
as List<MediaModel>,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as CityModel,unitType: null == unitType ? _self.unitType : unitType // ignore: cast_nullable_to_non_nullable
as UnitTypeModel,compound: freezed == compound ? _self.compound : compound // ignore: cast_nullable_to_non_nullable
as CompoundModel?,developer: freezed == developer ? _self.developer : developer // ignore: cast_nullable_to_non_nullable
as DeveloperModel?,amenities: null == amenities ? _self.amenities : amenities // ignore: cast_nullable_to_non_nullable
as List<AmenityModel>,averageRating: null == averageRating ? _self.averageRating : averageRating // ignore: cast_nullable_to_non_nullable
as double,reviewsCount: null == reviewsCount ? _self.reviewsCount : reviewsCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of UnitDetailsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OwnerModelCopyWith<$Res> get owner {
  
  return $OwnerModelCopyWith<$Res>(_self.owner, (value) {
    return _then(_self.copyWith(owner: value));
  });
}/// Create a copy of UnitDetailsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CityModelCopyWith<$Res> get city {
  
  return $CityModelCopyWith<$Res>(_self.city, (value) {
    return _then(_self.copyWith(city: value));
  });
}/// Create a copy of UnitDetailsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UnitTypeModelCopyWith<$Res> get unitType {
  
  return $UnitTypeModelCopyWith<$Res>(_self.unitType, (value) {
    return _then(_self.copyWith(unitType: value));
  });
}/// Create a copy of UnitDetailsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CompoundModelCopyWith<$Res>? get compound {
    if (_self.compound == null) {
    return null;
  }

  return $CompoundModelCopyWith<$Res>(_self.compound!, (value) {
    return _then(_self.copyWith(compound: value));
  });
}/// Create a copy of UnitDetailsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DeveloperModelCopyWith<$Res>? get developer {
    if (_self.developer == null) {
    return null;
  }

  return $DeveloperModelCopyWith<$Res>(_self.developer!, (value) {
    return _then(_self.copyWith(developer: value));
  });
}
}


/// Adds pattern-matching-related methods to [UnitDetailsModel].
extension UnitDetailsModelPatterns on UnitDetailsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UnitDetailsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UnitDetailsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UnitDetailsModel value)  $default,){
final _that = this;
switch (_that) {
case _UnitDetailsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UnitDetailsModel value)?  $default,){
final _that = this;
switch (_that) {
case _UnitDetailsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'created_at', fromJson: _parseDateTime)  DateTime createdAt,  int id,  String title,  String description,  String address, @JsonKey(fromJson: _parseDouble)  double price, @JsonKey(name: 'price_per_m2', fromJson: _parseDouble)  double pricePerM2, @JsonKey(name: 'offer_type')  String offerType, @JsonKey(fromJson: _parseDouble)  double area, @JsonKey(name: 'land_area', fromJson: _parseDouble)  double? landArea, @JsonKey(name: 'internal_area', fromJson: _parseDouble)  double? internalArea,  int rooms,  int bathrooms,  int garages, @JsonKey(name: 'build_year')  String buildYear,  String latitude,  String longitude,  String status, @JsonKey(name: 'is_favourite')  bool isFavourite, @JsonKey(name: 'is_visible')  bool isVisible, @JsonKey(name: 'development_status')  String developmentStatus,  OwnerModel owner,  List<MediaModel> media,  CityModel city, @JsonKey(name: 'unit_type')  UnitTypeModel unitType,  CompoundModel? compound,  DeveloperModel? developer,  List<AmenityModel> amenities, @JsonKey(name: 'average_rating', fromJson: _parseDouble)  double averageRating, @JsonKey(name: 'reviews_count')  int reviewsCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UnitDetailsModel() when $default != null:
return $default(_that.createdAt,_that.id,_that.title,_that.description,_that.address,_that.price,_that.pricePerM2,_that.offerType,_that.area,_that.landArea,_that.internalArea,_that.rooms,_that.bathrooms,_that.garages,_that.buildYear,_that.latitude,_that.longitude,_that.status,_that.isFavourite,_that.isVisible,_that.developmentStatus,_that.owner,_that.media,_that.city,_that.unitType,_that.compound,_that.developer,_that.amenities,_that.averageRating,_that.reviewsCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'created_at', fromJson: _parseDateTime)  DateTime createdAt,  int id,  String title,  String description,  String address, @JsonKey(fromJson: _parseDouble)  double price, @JsonKey(name: 'price_per_m2', fromJson: _parseDouble)  double pricePerM2, @JsonKey(name: 'offer_type')  String offerType, @JsonKey(fromJson: _parseDouble)  double area, @JsonKey(name: 'land_area', fromJson: _parseDouble)  double? landArea, @JsonKey(name: 'internal_area', fromJson: _parseDouble)  double? internalArea,  int rooms,  int bathrooms,  int garages, @JsonKey(name: 'build_year')  String buildYear,  String latitude,  String longitude,  String status, @JsonKey(name: 'is_favourite')  bool isFavourite, @JsonKey(name: 'is_visible')  bool isVisible, @JsonKey(name: 'development_status')  String developmentStatus,  OwnerModel owner,  List<MediaModel> media,  CityModel city, @JsonKey(name: 'unit_type')  UnitTypeModel unitType,  CompoundModel? compound,  DeveloperModel? developer,  List<AmenityModel> amenities, @JsonKey(name: 'average_rating', fromJson: _parseDouble)  double averageRating, @JsonKey(name: 'reviews_count')  int reviewsCount)  $default,) {final _that = this;
switch (_that) {
case _UnitDetailsModel():
return $default(_that.createdAt,_that.id,_that.title,_that.description,_that.address,_that.price,_that.pricePerM2,_that.offerType,_that.area,_that.landArea,_that.internalArea,_that.rooms,_that.bathrooms,_that.garages,_that.buildYear,_that.latitude,_that.longitude,_that.status,_that.isFavourite,_that.isVisible,_that.developmentStatus,_that.owner,_that.media,_that.city,_that.unitType,_that.compound,_that.developer,_that.amenities,_that.averageRating,_that.reviewsCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'created_at', fromJson: _parseDateTime)  DateTime createdAt,  int id,  String title,  String description,  String address, @JsonKey(fromJson: _parseDouble)  double price, @JsonKey(name: 'price_per_m2', fromJson: _parseDouble)  double pricePerM2, @JsonKey(name: 'offer_type')  String offerType, @JsonKey(fromJson: _parseDouble)  double area, @JsonKey(name: 'land_area', fromJson: _parseDouble)  double? landArea, @JsonKey(name: 'internal_area', fromJson: _parseDouble)  double? internalArea,  int rooms,  int bathrooms,  int garages, @JsonKey(name: 'build_year')  String buildYear,  String latitude,  String longitude,  String status, @JsonKey(name: 'is_favourite')  bool isFavourite, @JsonKey(name: 'is_visible')  bool isVisible, @JsonKey(name: 'development_status')  String developmentStatus,  OwnerModel owner,  List<MediaModel> media,  CityModel city, @JsonKey(name: 'unit_type')  UnitTypeModel unitType,  CompoundModel? compound,  DeveloperModel? developer,  List<AmenityModel> amenities, @JsonKey(name: 'average_rating', fromJson: _parseDouble)  double averageRating, @JsonKey(name: 'reviews_count')  int reviewsCount)?  $default,) {final _that = this;
switch (_that) {
case _UnitDetailsModel() when $default != null:
return $default(_that.createdAt,_that.id,_that.title,_that.description,_that.address,_that.price,_that.pricePerM2,_that.offerType,_that.area,_that.landArea,_that.internalArea,_that.rooms,_that.bathrooms,_that.garages,_that.buildYear,_that.latitude,_that.longitude,_that.status,_that.isFavourite,_that.isVisible,_that.developmentStatus,_that.owner,_that.media,_that.city,_that.unitType,_that.compound,_that.developer,_that.amenities,_that.averageRating,_that.reviewsCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UnitDetailsModel extends UnitDetailsModel {
  const _UnitDetailsModel({@JsonKey(name: 'created_at', fromJson: _parseDateTime) required this.createdAt, this.id = 0, this.title = '', this.description = '', this.address = '', @JsonKey(fromJson: _parseDouble) this.price = 0.0, @JsonKey(name: 'price_per_m2', fromJson: _parseDouble) this.pricePerM2 = 0.0, @JsonKey(name: 'offer_type') this.offerType = '', @JsonKey(fromJson: _parseDouble) this.area = 0.0, @JsonKey(name: 'land_area', fromJson: _parseDouble) this.landArea, @JsonKey(name: 'internal_area', fromJson: _parseDouble) this.internalArea, this.rooms = 0, this.bathrooms = 0, this.garages = 0, @JsonKey(name: 'build_year') this.buildYear = '', this.latitude = '', this.longitude = '', this.status = '', @JsonKey(name: 'is_favourite') this.isFavourite = false, @JsonKey(name: 'is_visible') this.isVisible = true, @JsonKey(name: 'development_status') this.developmentStatus = '', this.owner = const OwnerModel(), final  List<MediaModel> media = const <MediaModel>[], this.city = const CityModel(), @JsonKey(name: 'unit_type') this.unitType = const UnitTypeModel(), this.compound, this.developer, final  List<AmenityModel> amenities = const <AmenityModel>[], @JsonKey(name: 'average_rating', fromJson: _parseDouble) this.averageRating = 0.0, @JsonKey(name: 'reviews_count') this.reviewsCount = 0}): _media = media,_amenities = amenities,super._();
  factory _UnitDetailsModel.fromJson(Map<String, dynamic> json) => _$UnitDetailsModelFromJson(json);

@override@JsonKey(name: 'created_at', fromJson: _parseDateTime) final  DateTime createdAt;
@override@JsonKey() final  int id;
@override@JsonKey() final  String title;
@override@JsonKey() final  String description;
@override@JsonKey() final  String address;
@override@JsonKey(fromJson: _parseDouble) final  double price;
@override@JsonKey(name: 'price_per_m2', fromJson: _parseDouble) final  double pricePerM2;
@override@JsonKey(name: 'offer_type') final  String offerType;
@override@JsonKey(fromJson: _parseDouble) final  double area;
@override@JsonKey(name: 'land_area', fromJson: _parseDouble) final  double? landArea;
@override@JsonKey(name: 'internal_area', fromJson: _parseDouble) final  double? internalArea;
@override@JsonKey() final  int rooms;
@override@JsonKey() final  int bathrooms;
@override@JsonKey() final  int garages;
@override@JsonKey(name: 'build_year') final  String buildYear;
@override@JsonKey() final  String latitude;
@override@JsonKey() final  String longitude;
@override@JsonKey() final  String status;
@override@JsonKey(name: 'is_favourite') final  bool isFavourite;
@override@JsonKey(name: 'is_visible') final  bool isVisible;
@override@JsonKey(name: 'development_status') final  String developmentStatus;
@override@JsonKey() final  OwnerModel owner;
 final  List<MediaModel> _media;
@override@JsonKey() List<MediaModel> get media {
  if (_media is EqualUnmodifiableListView) return _media;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_media);
}

@override@JsonKey() final  CityModel city;
@override@JsonKey(name: 'unit_type') final  UnitTypeModel unitType;
@override final  CompoundModel? compound;
@override final  DeveloperModel? developer;
 final  List<AmenityModel> _amenities;
@override@JsonKey() List<AmenityModel> get amenities {
  if (_amenities is EqualUnmodifiableListView) return _amenities;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_amenities);
}

@override@JsonKey(name: 'average_rating', fromJson: _parseDouble) final  double averageRating;
@override@JsonKey(name: 'reviews_count') final  int reviewsCount;

/// Create a copy of UnitDetailsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UnitDetailsModelCopyWith<_UnitDetailsModel> get copyWith => __$UnitDetailsModelCopyWithImpl<_UnitDetailsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UnitDetailsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UnitDetailsModel&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.address, address) || other.address == address)&&(identical(other.price, price) || other.price == price)&&(identical(other.pricePerM2, pricePerM2) || other.pricePerM2 == pricePerM2)&&(identical(other.offerType, offerType) || other.offerType == offerType)&&(identical(other.area, area) || other.area == area)&&(identical(other.landArea, landArea) || other.landArea == landArea)&&(identical(other.internalArea, internalArea) || other.internalArea == internalArea)&&(identical(other.rooms, rooms) || other.rooms == rooms)&&(identical(other.bathrooms, bathrooms) || other.bathrooms == bathrooms)&&(identical(other.garages, garages) || other.garages == garages)&&(identical(other.buildYear, buildYear) || other.buildYear == buildYear)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.status, status) || other.status == status)&&(identical(other.isFavourite, isFavourite) || other.isFavourite == isFavourite)&&(identical(other.isVisible, isVisible) || other.isVisible == isVisible)&&(identical(other.developmentStatus, developmentStatus) || other.developmentStatus == developmentStatus)&&(identical(other.owner, owner) || other.owner == owner)&&const DeepCollectionEquality().equals(other._media, _media)&&(identical(other.city, city) || other.city == city)&&(identical(other.unitType, unitType) || other.unitType == unitType)&&(identical(other.compound, compound) || other.compound == compound)&&(identical(other.developer, developer) || other.developer == developer)&&const DeepCollectionEquality().equals(other._amenities, _amenities)&&(identical(other.averageRating, averageRating) || other.averageRating == averageRating)&&(identical(other.reviewsCount, reviewsCount) || other.reviewsCount == reviewsCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,createdAt,id,title,description,address,price,pricePerM2,offerType,area,landArea,internalArea,rooms,bathrooms,garages,buildYear,latitude,longitude,status,isFavourite,isVisible,developmentStatus,owner,const DeepCollectionEquality().hash(_media),city,unitType,compound,developer,const DeepCollectionEquality().hash(_amenities),averageRating,reviewsCount]);

@override
String toString() {
  return 'UnitDetailsModel(createdAt: $createdAt, id: $id, title: $title, description: $description, address: $address, price: $price, pricePerM2: $pricePerM2, offerType: $offerType, area: $area, landArea: $landArea, internalArea: $internalArea, rooms: $rooms, bathrooms: $bathrooms, garages: $garages, buildYear: $buildYear, latitude: $latitude, longitude: $longitude, status: $status, isFavourite: $isFavourite, isVisible: $isVisible, developmentStatus: $developmentStatus, owner: $owner, media: $media, city: $city, unitType: $unitType, compound: $compound, developer: $developer, amenities: $amenities, averageRating: $averageRating, reviewsCount: $reviewsCount)';
}


}

/// @nodoc
abstract mixin class _$UnitDetailsModelCopyWith<$Res> implements $UnitDetailsModelCopyWith<$Res> {
  factory _$UnitDetailsModelCopyWith(_UnitDetailsModel value, $Res Function(_UnitDetailsModel) _then) = __$UnitDetailsModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'created_at', fromJson: _parseDateTime) DateTime createdAt, int id, String title, String description, String address,@JsonKey(fromJson: _parseDouble) double price,@JsonKey(name: 'price_per_m2', fromJson: _parseDouble) double pricePerM2,@JsonKey(name: 'offer_type') String offerType,@JsonKey(fromJson: _parseDouble) double area,@JsonKey(name: 'land_area', fromJson: _parseDouble) double? landArea,@JsonKey(name: 'internal_area', fromJson: _parseDouble) double? internalArea, int rooms, int bathrooms, int garages,@JsonKey(name: 'build_year') String buildYear, String latitude, String longitude, String status,@JsonKey(name: 'is_favourite') bool isFavourite,@JsonKey(name: 'is_visible') bool isVisible,@JsonKey(name: 'development_status') String developmentStatus, OwnerModel owner, List<MediaModel> media, CityModel city,@JsonKey(name: 'unit_type') UnitTypeModel unitType, CompoundModel? compound, DeveloperModel? developer, List<AmenityModel> amenities,@JsonKey(name: 'average_rating', fromJson: _parseDouble) double averageRating,@JsonKey(name: 'reviews_count') int reviewsCount
});


@override $OwnerModelCopyWith<$Res> get owner;@override $CityModelCopyWith<$Res> get city;@override $UnitTypeModelCopyWith<$Res> get unitType;@override $CompoundModelCopyWith<$Res>? get compound;@override $DeveloperModelCopyWith<$Res>? get developer;

}
/// @nodoc
class __$UnitDetailsModelCopyWithImpl<$Res>
    implements _$UnitDetailsModelCopyWith<$Res> {
  __$UnitDetailsModelCopyWithImpl(this._self, this._then);

  final _UnitDetailsModel _self;
  final $Res Function(_UnitDetailsModel) _then;

/// Create a copy of UnitDetailsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? createdAt = null,Object? id = null,Object? title = null,Object? description = null,Object? address = null,Object? price = null,Object? pricePerM2 = null,Object? offerType = null,Object? area = null,Object? landArea = freezed,Object? internalArea = freezed,Object? rooms = null,Object? bathrooms = null,Object? garages = null,Object? buildYear = null,Object? latitude = null,Object? longitude = null,Object? status = null,Object? isFavourite = null,Object? isVisible = null,Object? developmentStatus = null,Object? owner = null,Object? media = null,Object? city = null,Object? unitType = null,Object? compound = freezed,Object? developer = freezed,Object? amenities = null,Object? averageRating = null,Object? reviewsCount = null,}) {
  return _then(_UnitDetailsModel(
createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,pricePerM2: null == pricePerM2 ? _self.pricePerM2 : pricePerM2 // ignore: cast_nullable_to_non_nullable
as double,offerType: null == offerType ? _self.offerType : offerType // ignore: cast_nullable_to_non_nullable
as String,area: null == area ? _self.area : area // ignore: cast_nullable_to_non_nullable
as double,landArea: freezed == landArea ? _self.landArea : landArea // ignore: cast_nullable_to_non_nullable
as double?,internalArea: freezed == internalArea ? _self.internalArea : internalArea // ignore: cast_nullable_to_non_nullable
as double?,rooms: null == rooms ? _self.rooms : rooms // ignore: cast_nullable_to_non_nullable
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
as OwnerModel,media: null == media ? _self._media : media // ignore: cast_nullable_to_non_nullable
as List<MediaModel>,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as CityModel,unitType: null == unitType ? _self.unitType : unitType // ignore: cast_nullable_to_non_nullable
as UnitTypeModel,compound: freezed == compound ? _self.compound : compound // ignore: cast_nullable_to_non_nullable
as CompoundModel?,developer: freezed == developer ? _self.developer : developer // ignore: cast_nullable_to_non_nullable
as DeveloperModel?,amenities: null == amenities ? _self._amenities : amenities // ignore: cast_nullable_to_non_nullable
as List<AmenityModel>,averageRating: null == averageRating ? _self.averageRating : averageRating // ignore: cast_nullable_to_non_nullable
as double,reviewsCount: null == reviewsCount ? _self.reviewsCount : reviewsCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of UnitDetailsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OwnerModelCopyWith<$Res> get owner {
  
  return $OwnerModelCopyWith<$Res>(_self.owner, (value) {
    return _then(_self.copyWith(owner: value));
  });
}/// Create a copy of UnitDetailsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CityModelCopyWith<$Res> get city {
  
  return $CityModelCopyWith<$Res>(_self.city, (value) {
    return _then(_self.copyWith(city: value));
  });
}/// Create a copy of UnitDetailsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UnitTypeModelCopyWith<$Res> get unitType {
  
  return $UnitTypeModelCopyWith<$Res>(_self.unitType, (value) {
    return _then(_self.copyWith(unitType: value));
  });
}/// Create a copy of UnitDetailsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CompoundModelCopyWith<$Res>? get compound {
    if (_self.compound == null) {
    return null;
  }

  return $CompoundModelCopyWith<$Res>(_self.compound!, (value) {
    return _then(_self.copyWith(compound: value));
  });
}/// Create a copy of UnitDetailsModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DeveloperModelCopyWith<$Res>? get developer {
    if (_self.developer == null) {
    return null;
  }

  return $DeveloperModelCopyWith<$Res>(_self.developer!, (value) {
    return _then(_self.copyWith(developer: value));
  });
}
}


/// @nodoc
mixin _$OwnerModel {

 int get id; String get name; String get email; String get phone; String get address; String get avatar; String get status; String get role; CityModel? get city;
/// Create a copy of OwnerModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OwnerModelCopyWith<OwnerModel> get copyWith => _$OwnerModelCopyWithImpl<OwnerModel>(this as OwnerModel, _$identity);

  /// Serializes this OwnerModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OwnerModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.address, address) || other.address == address)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.status, status) || other.status == status)&&(identical(other.role, role) || other.role == role)&&(identical(other.city, city) || other.city == city));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,email,phone,address,avatar,status,role,city);

@override
String toString() {
  return 'OwnerModel(id: $id, name: $name, email: $email, phone: $phone, address: $address, avatar: $avatar, status: $status, role: $role, city: $city)';
}


}

/// @nodoc
abstract mixin class $OwnerModelCopyWith<$Res>  {
  factory $OwnerModelCopyWith(OwnerModel value, $Res Function(OwnerModel) _then) = _$OwnerModelCopyWithImpl;
@useResult
$Res call({
 int id, String name, String email, String phone, String address, String avatar, String status, String role, CityModel? city
});


$CityModelCopyWith<$Res>? get city;

}
/// @nodoc
class _$OwnerModelCopyWithImpl<$Res>
    implements $OwnerModelCopyWith<$Res> {
  _$OwnerModelCopyWithImpl(this._self, this._then);

  final OwnerModel _self;
  final $Res Function(OwnerModel) _then;

/// Create a copy of OwnerModel
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
as CityModel?,
  ));
}
/// Create a copy of OwnerModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CityModelCopyWith<$Res>? get city {
    if (_self.city == null) {
    return null;
  }

  return $CityModelCopyWith<$Res>(_self.city!, (value) {
    return _then(_self.copyWith(city: value));
  });
}
}


/// Adds pattern-matching-related methods to [OwnerModel].
extension OwnerModelPatterns on OwnerModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OwnerModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OwnerModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OwnerModel value)  $default,){
final _that = this;
switch (_that) {
case _OwnerModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OwnerModel value)?  $default,){
final _that = this;
switch (_that) {
case _OwnerModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String email,  String phone,  String address,  String avatar,  String status,  String role,  CityModel? city)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OwnerModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String email,  String phone,  String address,  String avatar,  String status,  String role,  CityModel? city)  $default,) {final _that = this;
switch (_that) {
case _OwnerModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String email,  String phone,  String address,  String avatar,  String status,  String role,  CityModel? city)?  $default,) {final _that = this;
switch (_that) {
case _OwnerModel() when $default != null:
return $default(_that.id,_that.name,_that.email,_that.phone,_that.address,_that.avatar,_that.status,_that.role,_that.city);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OwnerModel extends OwnerModel {
  const _OwnerModel({this.id = 0, this.name = '', this.email = '', this.phone = '', this.address = '', this.avatar = '', this.status = '', this.role = '', this.city}): super._();
  factory _OwnerModel.fromJson(Map<String, dynamic> json) => _$OwnerModelFromJson(json);

@override@JsonKey() final  int id;
@override@JsonKey() final  String name;
@override@JsonKey() final  String email;
@override@JsonKey() final  String phone;
@override@JsonKey() final  String address;
@override@JsonKey() final  String avatar;
@override@JsonKey() final  String status;
@override@JsonKey() final  String role;
@override final  CityModel? city;

/// Create a copy of OwnerModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OwnerModelCopyWith<_OwnerModel> get copyWith => __$OwnerModelCopyWithImpl<_OwnerModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OwnerModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OwnerModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.address, address) || other.address == address)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.status, status) || other.status == status)&&(identical(other.role, role) || other.role == role)&&(identical(other.city, city) || other.city == city));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,email,phone,address,avatar,status,role,city);

@override
String toString() {
  return 'OwnerModel(id: $id, name: $name, email: $email, phone: $phone, address: $address, avatar: $avatar, status: $status, role: $role, city: $city)';
}


}

/// @nodoc
abstract mixin class _$OwnerModelCopyWith<$Res> implements $OwnerModelCopyWith<$Res> {
  factory _$OwnerModelCopyWith(_OwnerModel value, $Res Function(_OwnerModel) _then) = __$OwnerModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String email, String phone, String address, String avatar, String status, String role, CityModel? city
});


@override $CityModelCopyWith<$Res>? get city;

}
/// @nodoc
class __$OwnerModelCopyWithImpl<$Res>
    implements _$OwnerModelCopyWith<$Res> {
  __$OwnerModelCopyWithImpl(this._self, this._then);

  final _OwnerModel _self;
  final $Res Function(_OwnerModel) _then;

/// Create a copy of OwnerModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? email = null,Object? phone = null,Object? address = null,Object? avatar = null,Object? status = null,Object? role = null,Object? city = freezed,}) {
  return _then(_OwnerModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,avatar: null == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as CityModel?,
  ));
}

/// Create a copy of OwnerModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CityModelCopyWith<$Res>? get city {
    if (_self.city == null) {
    return null;
  }

  return $CityModelCopyWith<$Res>(_self.city!, (value) {
    return _then(_self.copyWith(city: value));
  });
}
}


/// @nodoc
mixin _$MediaModel {

 int get id;@JsonKey(name: 'file_path') String get filePath;@JsonKey(name: 'hls_path') String get hlsPath;@JsonKey(name: 'processing_status') String get processingStatus; String get type;
/// Create a copy of MediaModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MediaModelCopyWith<MediaModel> get copyWith => _$MediaModelCopyWithImpl<MediaModel>(this as MediaModel, _$identity);

  /// Serializes this MediaModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MediaModel&&(identical(other.id, id) || other.id == id)&&(identical(other.filePath, filePath) || other.filePath == filePath)&&(identical(other.hlsPath, hlsPath) || other.hlsPath == hlsPath)&&(identical(other.processingStatus, processingStatus) || other.processingStatus == processingStatus)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,filePath,hlsPath,processingStatus,type);

@override
String toString() {
  return 'MediaModel(id: $id, filePath: $filePath, hlsPath: $hlsPath, processingStatus: $processingStatus, type: $type)';
}


}

/// @nodoc
abstract mixin class $MediaModelCopyWith<$Res>  {
  factory $MediaModelCopyWith(MediaModel value, $Res Function(MediaModel) _then) = _$MediaModelCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'file_path') String filePath,@JsonKey(name: 'hls_path') String hlsPath,@JsonKey(name: 'processing_status') String processingStatus, String type
});




}
/// @nodoc
class _$MediaModelCopyWithImpl<$Res>
    implements $MediaModelCopyWith<$Res> {
  _$MediaModelCopyWithImpl(this._self, this._then);

  final MediaModel _self;
  final $Res Function(MediaModel) _then;

/// Create a copy of MediaModel
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


/// Adds pattern-matching-related methods to [MediaModel].
extension MediaModelPatterns on MediaModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MediaModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MediaModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MediaModel value)  $default,){
final _that = this;
switch (_that) {
case _MediaModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MediaModel value)?  $default,){
final _that = this;
switch (_that) {
case _MediaModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'file_path')  String filePath, @JsonKey(name: 'hls_path')  String hlsPath, @JsonKey(name: 'processing_status')  String processingStatus,  String type)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MediaModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'file_path')  String filePath, @JsonKey(name: 'hls_path')  String hlsPath, @JsonKey(name: 'processing_status')  String processingStatus,  String type)  $default,) {final _that = this;
switch (_that) {
case _MediaModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'file_path')  String filePath, @JsonKey(name: 'hls_path')  String hlsPath, @JsonKey(name: 'processing_status')  String processingStatus,  String type)?  $default,) {final _that = this;
switch (_that) {
case _MediaModel() when $default != null:
return $default(_that.id,_that.filePath,_that.hlsPath,_that.processingStatus,_that.type);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MediaModel extends MediaModel {
  const _MediaModel({this.id = 0, @JsonKey(name: 'file_path') this.filePath = '', @JsonKey(name: 'hls_path') this.hlsPath = '', @JsonKey(name: 'processing_status') this.processingStatus = '', this.type = ''}): super._();
  factory _MediaModel.fromJson(Map<String, dynamic> json) => _$MediaModelFromJson(json);

@override@JsonKey() final  int id;
@override@JsonKey(name: 'file_path') final  String filePath;
@override@JsonKey(name: 'hls_path') final  String hlsPath;
@override@JsonKey(name: 'processing_status') final  String processingStatus;
@override@JsonKey() final  String type;

/// Create a copy of MediaModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MediaModelCopyWith<_MediaModel> get copyWith => __$MediaModelCopyWithImpl<_MediaModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MediaModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MediaModel&&(identical(other.id, id) || other.id == id)&&(identical(other.filePath, filePath) || other.filePath == filePath)&&(identical(other.hlsPath, hlsPath) || other.hlsPath == hlsPath)&&(identical(other.processingStatus, processingStatus) || other.processingStatus == processingStatus)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,filePath,hlsPath,processingStatus,type);

@override
String toString() {
  return 'MediaModel(id: $id, filePath: $filePath, hlsPath: $hlsPath, processingStatus: $processingStatus, type: $type)';
}


}

/// @nodoc
abstract mixin class _$MediaModelCopyWith<$Res> implements $MediaModelCopyWith<$Res> {
  factory _$MediaModelCopyWith(_MediaModel value, $Res Function(_MediaModel) _then) = __$MediaModelCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'file_path') String filePath,@JsonKey(name: 'hls_path') String hlsPath,@JsonKey(name: 'processing_status') String processingStatus, String type
});




}
/// @nodoc
class __$MediaModelCopyWithImpl<$Res>
    implements _$MediaModelCopyWith<$Res> {
  __$MediaModelCopyWithImpl(this._self, this._then);

  final _MediaModel _self;
  final $Res Function(_MediaModel) _then;

/// Create a copy of MediaModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? filePath = null,Object? hlsPath = null,Object? processingStatus = null,Object? type = null,}) {
  return _then(_MediaModel(
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
mixin _$CityModel {

 int get id; String get name;
/// Create a copy of CityModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CityModelCopyWith<CityModel> get copyWith => _$CityModelCopyWithImpl<CityModel>(this as CityModel, _$identity);

  /// Serializes this CityModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CityModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'CityModel(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class $CityModelCopyWith<$Res>  {
  factory $CityModelCopyWith(CityModel value, $Res Function(CityModel) _then) = _$CityModelCopyWithImpl;
@useResult
$Res call({
 int id, String name
});




}
/// @nodoc
class _$CityModelCopyWithImpl<$Res>
    implements $CityModelCopyWith<$Res> {
  _$CityModelCopyWithImpl(this._self, this._then);

  final CityModel _self;
  final $Res Function(CityModel) _then;

/// Create a copy of CityModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CityModel].
extension CityModelPatterns on CityModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CityModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CityModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CityModel value)  $default,){
final _that = this;
switch (_that) {
case _CityModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CityModel value)?  $default,){
final _that = this;
switch (_that) {
case _CityModel() when $default != null:
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
case _CityModel() when $default != null:
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
case _CityModel():
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
case _CityModel() when $default != null:
return $default(_that.id,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CityModel extends CityModel {
  const _CityModel({this.id = 0, this.name = ''}): super._();
  factory _CityModel.fromJson(Map<String, dynamic> json) => _$CityModelFromJson(json);

@override@JsonKey() final  int id;
@override@JsonKey() final  String name;

/// Create a copy of CityModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CityModelCopyWith<_CityModel> get copyWith => __$CityModelCopyWithImpl<_CityModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CityModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CityModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'CityModel(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class _$CityModelCopyWith<$Res> implements $CityModelCopyWith<$Res> {
  factory _$CityModelCopyWith(_CityModel value, $Res Function(_CityModel) _then) = __$CityModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String name
});




}
/// @nodoc
class __$CityModelCopyWithImpl<$Res>
    implements _$CityModelCopyWith<$Res> {
  __$CityModelCopyWithImpl(this._self, this._then);

  final _CityModel _self;
  final $Res Function(_CityModel) _then;

/// Create a copy of CityModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,}) {
  return _then(_CityModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$UnitTypeModel {

 int get id; String get name; String get icon;
/// Create a copy of UnitTypeModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnitTypeModelCopyWith<UnitTypeModel> get copyWith => _$UnitTypeModelCopyWithImpl<UnitTypeModel>(this as UnitTypeModel, _$identity);

  /// Serializes this UnitTypeModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnitTypeModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.icon, icon) || other.icon == icon));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,icon);

@override
String toString() {
  return 'UnitTypeModel(id: $id, name: $name, icon: $icon)';
}


}

/// @nodoc
abstract mixin class $UnitTypeModelCopyWith<$Res>  {
  factory $UnitTypeModelCopyWith(UnitTypeModel value, $Res Function(UnitTypeModel) _then) = _$UnitTypeModelCopyWithImpl;
@useResult
$Res call({
 int id, String name, String icon
});




}
/// @nodoc
class _$UnitTypeModelCopyWithImpl<$Res>
    implements $UnitTypeModelCopyWith<$Res> {
  _$UnitTypeModelCopyWithImpl(this._self, this._then);

  final UnitTypeModel _self;
  final $Res Function(UnitTypeModel) _then;

/// Create a copy of UnitTypeModel
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


/// Adds pattern-matching-related methods to [UnitTypeModel].
extension UnitTypeModelPatterns on UnitTypeModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UnitTypeModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UnitTypeModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UnitTypeModel value)  $default,){
final _that = this;
switch (_that) {
case _UnitTypeModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UnitTypeModel value)?  $default,){
final _that = this;
switch (_that) {
case _UnitTypeModel() when $default != null:
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
case _UnitTypeModel() when $default != null:
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
case _UnitTypeModel():
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
case _UnitTypeModel() when $default != null:
return $default(_that.id,_that.name,_that.icon);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UnitTypeModel extends UnitTypeModel {
  const _UnitTypeModel({this.id = 0, this.name = '', this.icon = ''}): super._();
  factory _UnitTypeModel.fromJson(Map<String, dynamic> json) => _$UnitTypeModelFromJson(json);

@override@JsonKey() final  int id;
@override@JsonKey() final  String name;
@override@JsonKey() final  String icon;

/// Create a copy of UnitTypeModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UnitTypeModelCopyWith<_UnitTypeModel> get copyWith => __$UnitTypeModelCopyWithImpl<_UnitTypeModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UnitTypeModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UnitTypeModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.icon, icon) || other.icon == icon));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,icon);

@override
String toString() {
  return 'UnitTypeModel(id: $id, name: $name, icon: $icon)';
}


}

/// @nodoc
abstract mixin class _$UnitTypeModelCopyWith<$Res> implements $UnitTypeModelCopyWith<$Res> {
  factory _$UnitTypeModelCopyWith(_UnitTypeModel value, $Res Function(_UnitTypeModel) _then) = __$UnitTypeModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String icon
});




}
/// @nodoc
class __$UnitTypeModelCopyWithImpl<$Res>
    implements _$UnitTypeModelCopyWith<$Res> {
  __$UnitTypeModelCopyWithImpl(this._self, this._then);

  final _UnitTypeModel _self;
  final $Res Function(_UnitTypeModel) _then;

/// Create a copy of UnitTypeModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? icon = null,}) {
  return _then(_UnitTypeModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$AmenityModel {

 int get id; String get name; String get icon;
/// Create a copy of AmenityModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AmenityModelCopyWith<AmenityModel> get copyWith => _$AmenityModelCopyWithImpl<AmenityModel>(this as AmenityModel, _$identity);

  /// Serializes this AmenityModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AmenityModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.icon, icon) || other.icon == icon));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,icon);

@override
String toString() {
  return 'AmenityModel(id: $id, name: $name, icon: $icon)';
}


}

/// @nodoc
abstract mixin class $AmenityModelCopyWith<$Res>  {
  factory $AmenityModelCopyWith(AmenityModel value, $Res Function(AmenityModel) _then) = _$AmenityModelCopyWithImpl;
@useResult
$Res call({
 int id, String name, String icon
});




}
/// @nodoc
class _$AmenityModelCopyWithImpl<$Res>
    implements $AmenityModelCopyWith<$Res> {
  _$AmenityModelCopyWithImpl(this._self, this._then);

  final AmenityModel _self;
  final $Res Function(AmenityModel) _then;

/// Create a copy of AmenityModel
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


/// Adds pattern-matching-related methods to [AmenityModel].
extension AmenityModelPatterns on AmenityModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AmenityModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AmenityModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AmenityModel value)  $default,){
final _that = this;
switch (_that) {
case _AmenityModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AmenityModel value)?  $default,){
final _that = this;
switch (_that) {
case _AmenityModel() when $default != null:
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
case _AmenityModel() when $default != null:
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
case _AmenityModel():
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
case _AmenityModel() when $default != null:
return $default(_that.id,_that.name,_that.icon);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AmenityModel extends AmenityModel {
  const _AmenityModel({this.id = 0, this.name = '', this.icon = ''}): super._();
  factory _AmenityModel.fromJson(Map<String, dynamic> json) => _$AmenityModelFromJson(json);

@override@JsonKey() final  int id;
@override@JsonKey() final  String name;
@override@JsonKey() final  String icon;

/// Create a copy of AmenityModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AmenityModelCopyWith<_AmenityModel> get copyWith => __$AmenityModelCopyWithImpl<_AmenityModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AmenityModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AmenityModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.icon, icon) || other.icon == icon));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,icon);

@override
String toString() {
  return 'AmenityModel(id: $id, name: $name, icon: $icon)';
}


}

/// @nodoc
abstract mixin class _$AmenityModelCopyWith<$Res> implements $AmenityModelCopyWith<$Res> {
  factory _$AmenityModelCopyWith(_AmenityModel value, $Res Function(_AmenityModel) _then) = __$AmenityModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String icon
});




}
/// @nodoc
class __$AmenityModelCopyWithImpl<$Res>
    implements _$AmenityModelCopyWith<$Res> {
  __$AmenityModelCopyWithImpl(this._self, this._then);

  final _AmenityModel _self;
  final $Res Function(_AmenityModel) _then;

/// Create a copy of AmenityModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? icon = null,}) {
  return _then(_AmenityModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
