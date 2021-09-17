part of '__city.dart';

class CityModel {
  CityModel({
    this.uid,
    this.address,
    this.latitude,
    this.longitude,
    this.name,
    this.status,
  });

  String? uid;
  String? address;
  String? latitude;
  String? longitude;
  String? name;
  bool? status;

  factory CityModel.fromFirestoreDocument(QueryDocumentSnapshot<Object?>? doc) {
    final json = doc?.data() as Map<String, dynamic>;
    return CityModel(
      uid: doc?.id,
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
    return '$this.latitude;$this.longitude';
  }

  LatLng getLatLng() {
    double lat = double.parse(this.latitude ?? '-5.185559740322096');
    double lng = double.parse(this.longitude ?? '-80.68122926814452');
    return LatLng(lat, lng);
  }

  bool get isNew => this.uid == null;

  Map<String, dynamic> toJson() => {
        "address": address,
        "latitude": latitude,
        "longitude": longitude,
        "name": name,
        "status": status,
      };
}
