import 'package:json_annotation/json_annotation.dart';

part 'shoe_api_result.g.dart';

@JsonSerializable()
class ShoeApiResult {
  final LowestResellPrice? lowestResellPrice;
  final List<dynamic>? imageLinks;
  @JsonKey(name: '_id')
  final String? id;
  final String? shoeName;
  final String? brand;
  final String? silhoutte;
  final String? styleId;
  final String? make;
  final String? colorway;
  final int? retailPrice;
  final String? thumbnail;
  final String? releaseDate;
  final String? description;
  final String? urlKey;
  final ResellLinks? resellLinks;
  final int? goatProductId;
  final bool? isFavorite;

  ShoeApiResult({
    this.lowestResellPrice,
    this.imageLinks,
    this.id,
    this.shoeName,
    this.brand,
    this.silhoutte,
    this.styleId,
    this.make,
    this.colorway,
    this.retailPrice,
    this.thumbnail,
    this.releaseDate,
    this.description,
    this.urlKey,
    this.resellLinks,
    this.goatProductId,
    this.isFavorite,
  });

  factory ShoeApiResult.fromJson(Map<String, dynamic> json) =>
      _$ShoeApiResultFromJson(json);

  Map<String, dynamic> toJson() => _$ShoeApiResultToJson(this);
}

@JsonSerializable()
class LowestResellPrice {
  final int? stockX;
  final int? flightClub;
  final int? goat;

  LowestResellPrice({
    this.stockX,
    this.flightClub,
    this.goat,
  });

  factory LowestResellPrice.fromJson(Map<String, dynamic> json) =>
      _$LowestResellPriceFromJson(json);

  Map<String, dynamic> toJson() => _$LowestResellPriceToJson(this);
}

@JsonSerializable()
class ResellLinks {
  final String? stockX;
  final String? flightClub;
  final String? goat;

  ResellLinks({
    this.stockX,
    this.flightClub,
    this.goat,
  });

  factory ResellLinks.fromJson(Map<String, dynamic> json) =>
      _$ResellLinksFromJson(json);

  Map<String, dynamic> toJson() => _$ResellLinksToJson(this);
}
