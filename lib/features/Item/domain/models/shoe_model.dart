import 'dart:convert';

import 'package:equatable/equatable.dart';

ShoeModel shoeModelFromJson(String str) => ShoeModel.fromJson(json.decode(str));

String shoeModelToJson(ShoeModel data) => json.encode(data.toJson());

class ShoeModel extends Equatable {
  const ShoeModel({
    required this.lowestResellPrice,
    required this.imageLinks,
    required this.id,
    required this.shoeName,
    required this.brand,
    required this.silhoutte,
    required this.styleId,
    required this.make,
    required this.colorway,
    required this.retailPrice,
    required this.thumbnail,
    required this.releaseDate,
    required this.description,
    required this.urlKey,
    required this.resellLinks,
    required this.goatProductId,
  });

  final LowestResellPrice lowestResellPrice;
  final List<dynamic> imageLinks;
  final String id;
  final String shoeName;
  final String brand;
  final String silhoutte;
  final String styleId;
  final String make;
  final String colorway;
  final int retailPrice;
  final String thumbnail;
  final DateTime releaseDate;
  final String description;
  final String urlKey;
  final ResellLinks resellLinks;
  final int goatProductId;

  factory ShoeModel.fromJson(Map<String, dynamic> json) => ShoeModel(
        lowestResellPrice:
            LowestResellPrice.fromJson(json["lowestResellPrice"]),
        imageLinks: List<dynamic>.from(json["imageLinks"].map((x) => x)),
        id: json["_id"],
        shoeName: json["shoeName"],
        brand: json["brand"],
        silhoutte: json["silhoutte"],
        styleId: json["styleID"],
        make: json["make"],
        colorway: json["colorway"],
        retailPrice: json["retailPrice"],
        thumbnail: json["thumbnail"],
        releaseDate: DateTime.parse(json["releaseDate"]),
        description: json["description"],
        urlKey: json["urlKey"],
        resellLinks: ResellLinks.fromJson(json["resellLinks"]),
        goatProductId: json["goatProductId"],
      );

  Map<String, dynamic> toJson() => {
        "lowestResellPrice": lowestResellPrice.toJson(),
        "imageLinks": List<dynamic>.from(imageLinks.map((x) => x)),
        "_id": id,
        "shoeName": shoeName,
        "brand": brand,
        "silhoutte": silhoutte,
        "styleID": styleId,
        "make": make,
        "colorway": colorway,
        "retailPrice": retailPrice,
        "thumbnail": thumbnail,
        "releaseDate":
            "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "description": description,
        "urlKey": urlKey,
        "resellLinks": resellLinks.toJson(),
        "goatProductId": goatProductId,
      };

  @override
  List<Object?> get props => [
        lowestResellPrice,
        imageLinks,
        id,
        shoeName,
        brand,
        silhoutte,
        styleId,
        make,
        colorway,
        retailPrice,
        thumbnail,
        releaseDate,
        description,
        urlKey,
        resellLinks,
        goatProductId,
      ];
}

class LowestResellPrice {
  LowestResellPrice({
    required this.stockX,
    required this.flightClub,
    required this.goat,
  });

  final int stockX;
  final int flightClub;
  final int goat;

  factory LowestResellPrice.fromJson(Map<String, dynamic> json) =>
      LowestResellPrice(
        stockX: json["stockX"],
        flightClub: json["flightClub"],
        goat: json["goat"],
      );

  Map<String, dynamic> toJson() => {
        "stockX": stockX,
        "flightClub": flightClub,
        "goat": goat,
      };
}

class ResellLinks {
  ResellLinks({
    required this.stockX,
    required this.flightClub,
    required this.goat,
  });

  final String stockX;
  final String flightClub;
  final String goat;

  factory ResellLinks.fromJson(Map<String, dynamic> json) => ResellLinks(
        stockX: json["stockX"],
        flightClub: json["flightClub"],
        goat: json["goat"],
      );

  Map<String, dynamic> toJson() => {
        "stockX": stockX,
        "flightClub": flightClub,
        "goat": goat,
      };
}
