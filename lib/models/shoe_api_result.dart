// ignore_for_file: public_member_api_docs, sort_constructors_first
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
  final int? qty;

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
    this.qty = 0,
  });

  factory ShoeApiResult.fromJson(Map<String, dynamic> json) =>
      _$ShoeApiResultFromJson(json);

  Map<String, dynamic> toJson() => _$ShoeApiResultToJson(this);

  ShoeApiResult copyWith({
    LowestResellPrice? lowestResellPrice,
    List<dynamic>? imageLinks,
    String? id,
    String? shoeName,
    String? brand,
    String? silhoutte,
    String? styleId,
    String? make,
    String? colorway,
    int? retailPrice,
    String? thumbnail,
    String? releaseDate,
    String? description,
    String? urlKey,
    ResellLinks? resellLinks,
    int? goatProductId,
    bool? isFavorite,
    int? qty,
  }) {
    return ShoeApiResult(
      lowestResellPrice: lowestResellPrice ?? this.lowestResellPrice,
      imageLinks: imageLinks ?? this.imageLinks,
      id: id ?? this.id,
      shoeName: shoeName ?? this.shoeName,
      brand: brand ?? this.brand,
      silhoutte: silhoutte ?? this.silhoutte,
      styleId: styleId ?? this.styleId,
      make: make ?? this.make,
      colorway: colorway ?? this.colorway,
      retailPrice: retailPrice ?? this.retailPrice,
      thumbnail: thumbnail ?? this.thumbnail,
      releaseDate: releaseDate ?? this.releaseDate,
      description: description ?? this.description,
      urlKey: urlKey ?? this.urlKey,
      resellLinks: resellLinks ?? this.resellLinks,
      goatProductId: goatProductId ?? this.goatProductId,
      isFavorite: isFavorite ?? this.isFavorite,
      qty: qty ?? this.qty,
    );
  }
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
