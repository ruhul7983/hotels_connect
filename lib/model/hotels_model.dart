import 'package:cloud_firestore/cloud_firestore.dart';

class Hotels {
  List<String>? image;
  String? hotelName;
  String? location;
  String? description;
  String? swimmingPool;
  String? wifi;
  String? restaurant;
  String? parking;
  String? elevator;
  String? fitnessCenter;
  String? s24open;
  String? postId;
  String? userId;
  String? rent;
  GeoPoint? geoLocation; // Use GeoPoint instead of GeoLocation

  Hotels({
    this.image,
    this.hotelName,
    this.location,
    this.description,
    this.swimmingPool,
    this.wifi,
    this.restaurant,
    this.parking,
    this.elevator,
    this.fitnessCenter,
    this.s24open,
    this.postId,
    this.userId,
    this.rent,
    this.geoLocation,
  });

  Hotels.fromJson(Map<String, dynamic> json) {
    image = json['image']?.cast<String>();
    hotelName = json['hotelName'];
    location = json['location'];
    description = json['description'];
    swimmingPool = json['swimmingPool'];
    wifi = json['wifi'];
    restaurant = json['restaurant'];
    parking = json['parking'];
    elevator = json['elevator'];
    fitnessCenter = json['fitnessCenter'];
    s24open = json['24open'];
    postId = json['postId'];
    userId = json['userId'];
    rent = json['rent'];

    // Update how you handle the 'geoLocation' field (should be GeoPoint, not Map)
    if (json['geoLocation'] != null) {
      geoLocation = json['geoLocation'];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['hotelName'] = this.hotelName;
    data['location'] = this.location;
    data['description'] = this.description;
    data['swimmingPool'] = this.swimmingPool;
    data['wifi'] = this.wifi;
    data['restaurant'] = this.restaurant;
    data['parking'] = this.parking;
    data['elevator'] = this.elevator;
    data['fitnessCenter'] = this.fitnessCenter;
    data['24open'] = this.s24open;
    data['postId'] = this.postId;
    data['userId'] = this.userId;
    data['rent'] = this.rent;

    if (geoLocation != null) {
      data['geoLocation'] = geoLocation;
    }

    return data;
  }
}

class GeoLocation {
  double? latitude;
  double? longitude;

  GeoLocation({this.latitude, this.longitude});

  GeoLocation.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    return data;
  }
}
