// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shoe_api_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShoeApiResult _$ShoeApiResultFromJson(Map<String, dynamic> json) =>
    ShoeApiResult(
      lowestResellPrice: json['lowestResellPrice'] == null
          ? null
          : LowestResellPrice.fromJson(
              json['lowestResellPrice'] as Map<String, dynamic>),
      imageLinks: json['imageLinks'] as List<dynamic>?,
      id: json['_id'] as String?,
      shoeName: json['shoeName'] as String?,
      brand: json['brand'] as String?,
      silhoutte: json['silhoutte'] as String?,
      styleId: json['styleId'] as String?,
      make: json['make'] as String?,
      colorway: json['colorway'] as String?,
      retailPrice: json['retailPrice'] as int?,
      thumbnail: json['thumbnail'] as String?,
      releaseDate: json['releaseDate'] as String?,
      description: json['description'] as String?,
      urlKey: json['urlKey'] as String?,
      resellLinks: json['resellLinks'] == null
          ? null
          : ResellLinks.fromJson(json['resellLinks'] as Map<String, dynamic>),
      goatProductId: json['goatProductId'] as int?,
      isFavorite: json['isFavorite'] as bool?,
    );

Map<String, dynamic> _$ShoeApiResultToJson(ShoeApiResult instance) =>
    <String, dynamic>{
      'lowestResellPrice': instance.lowestResellPrice,
      'imageLinks': instance.imageLinks,
      '_id': instance.id,
      'shoeName': instance.shoeName,
      'brand': instance.brand,
      'silhoutte': instance.silhoutte,
      'styleId': instance.styleId,
      'make': instance.make,
      'colorway': instance.colorway,
      'retailPrice': instance.retailPrice,
      'thumbnail': instance.thumbnail,
      'releaseDate': instance.releaseDate,
      'description': instance.description,
      'urlKey': instance.urlKey,
      'resellLinks': instance.resellLinks,
      'goatProductId': instance.goatProductId,
      'isFavorite': instance.isFavorite,
    };

LowestResellPrice _$LowestResellPriceFromJson(Map<String, dynamic> json) =>
    LowestResellPrice(
      stockX: json['stockX'] as int?,
      flightClub: json['flightClub'] as int?,
      goat: json['goat'] as int?,
    );

Map<String, dynamic> _$LowestResellPriceToJson(LowestResellPrice instance) =>
    <String, dynamic>{
      'stockX': instance.stockX,
      'flightClub': instance.flightClub,
      'goat': instance.goat,
    };

ResellLinks _$ResellLinksFromJson(Map<String, dynamic> json) => ResellLinks(
      stockX: json['stockX'] as String?,
      flightClub: json['flightClub'] as String?,
      goat: json['goat'] as String?,
    );

Map<String, dynamic> _$ResellLinksToJson(ResellLinks instance) =>
    <String, dynamic>{
      'stockX': instance.stockX,
      'flightClub': instance.flightClub,
      'goat': instance.goat,
    };
