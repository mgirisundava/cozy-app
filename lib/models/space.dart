import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class Space with ChangeNotifier {
  int? id;
  String? name;
  String? imageUrl;
  int? price;
  String? city;
  String? country;
  int? rating;
  String? address;
  String? phone;
  String? mapUrl;
  List? photos;
  int? numberOfKitchens;
  int? numberOfBedrooms;
  int? numberOfCupboards;
  bool isFavorite;

  Space({
    this.id,
    this.imageUrl,
    this.name,
    this.price,
    this.city,
    this.country,
    this.rating,
    this.numberOfBedrooms,
    this.numberOfCupboards,
    this.numberOfKitchens,
    this.address,
    this.mapUrl,
    this.phone,
    this.photos,
    this.isFavorite = false,
  });

  factory Space.fromJson(Map<String, dynamic> json) {
    return Space(
      id: json["id"],
      name: json["name"],
      city: json["city"],
      country: json["country"],
      imageUrl: json["image_url"],
      price: json["price"],
      rating: json["rating"],
      address: json["address"],
      phone: json["phone"],
      mapUrl: json["map_url"],
      photos: json["photos"],
      numberOfBedrooms: json["number_of_bedrooms"],
      numberOfKitchens: json["number_of_kitchens"],
      numberOfCupboards: json["number_of_cupboards"],
      isFavorite: false,
    );
  }
}
