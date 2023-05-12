import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class SneakersApiModel {
  final LowestResellPrice? lowestResellPrice;
  final List<dynamic>? imageLinks;
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

  SneakersApiModel({
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
  });
}

class LowestResellPrice {
  final int? stockX;
  final int? goat;
  final int? flightClub;

  LowestResellPrice({
    this.stockX,
    this.goat,
    this.flightClub,
  });
}

class ResellLinks {
  final String? stockX;
  final String? goat;
  final String? flightClub;

  ResellLinks({
    this.stockX,
    this.goat,
    this.flightClub,
  });
}
