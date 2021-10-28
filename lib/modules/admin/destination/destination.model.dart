import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eppo/modules/admin/schedule/schedule.model.dart';

class Destination {
  Destination({
    this.uid,
    this.name,
    this.price,
    this.status,
    this.travelTime,
    this.schedules,
  });

  String? uid;
  String? name;
  int? price;
  bool? status;
  int? travelTime;
  CollectionReference<Map<String, dynamic>>? schedules;

  factory Destination.fromFirestoreDoc(
      QueryDocumentSnapshot<Map<String, dynamic>> doc) {
    Map<String, dynamic> json = doc.data();
    return Destination(
      uid: json["uid"],
      name: json["name"],
      price: json["price"],
      status: json["status"],
      travelTime: json["travel_time"],
      schedules: doc.reference.collection('schedules'),
    );
  }
  Map<String, dynamic> toJson() => {
        "uid": uid,
        "name": name,
        "price": price,
        "status": status,
        "travel_time": travelTime,
      };
}
