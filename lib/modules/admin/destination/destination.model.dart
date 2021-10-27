import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eppo/modules/admin/schedule/schedule.model.dart';

class Destination {
  Destination({
    this.uid,
    this.name,
    this.price,
    this.status,
    this.travelTime,
    List<Schedule>? schedules,
  }) : this.schedules = schedules ?? [];

  String? uid;
  String? name;
  int? price;
  bool? status;
  int? travelTime;
  List<Schedule> schedules;

  factory Destination.fromJsonData(Map<String, dynamic> json) {
    return Destination(
      uid: json["uid"],
      name: json["name"],
      price: json["price"],
      status: json["status"],
      travelTime: json["travel_time"],
      // schedules: List<Schedule>.from(
      //   json["schedules"].map((x) => Schedule.fromFirestoreDocument(x)),
      // ),
    );
  }
  Map<String, dynamic> toJson() => {
        "uid": uid,
        "name": name,
        "price": price,
        "status": status,
        "travel_time": travelTime,
        "schedules": List<dynamic>.from(schedules.map((x) => x.toJson())),
      };
}
