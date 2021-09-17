import 'package:cloud_firestore/cloud_firestore.dart';

class CityModel {
  CityModel({
    this.address,
    this.latitude,
    this.longitude,
    this.name,
    this.status,
  });

  String? address;
  String? latitude;
  String? longitude;
  String? name;
  bool? status;

  factory CityModel.fromFirestoreDocument(QueryDocumentSnapshot<Object?>? doc) {
    final json = doc?.data() as Map<String, dynamic>;
    return CityModel(
      address: json["address"],
      latitude: json["latitude"],
      longitude: json["longitude"],
      name: json["name"],
      status: json["status"],
    );
  }

  String get capitalName {
    return '${name?.substring(0, 1).toUpperCase()}${name?.substring(1)}';
  }

  String get coords {
    return '$latitude;$longitude';
  }

  Map<String, dynamic> toJson() => {
        "address": address,
        "latitude": latitude,
        "longitude": longitude,
        "name": name,
        "status": status,
      };
}
