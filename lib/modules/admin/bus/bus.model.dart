import 'package:cloud_firestore/cloud_firestore.dart';

class Bus {
  Bus({
    this.uid,
    this.leftSeats,
    this.rightSeats,
    this.status,
    this.passengers,
  });

  String? uid;
  int? leftSeats;
  int? rightSeats;
  bool? status;
  CollectionReference<Map<String, dynamic>>? passengers;

  factory Bus.fromFirestoreDoc(
    QueryDocumentSnapshot<Map<String, dynamic>> doc,
  ) {
    Map<String, dynamic> json = doc.data();
    return Bus(
      uid: doc.id,
      leftSeats: json["left_seats"],
      rightSeats: json["right_seats"],
      status: json["status"],
      passengers: doc.reference.collection('passengers'),
    );
  }
  Map<String, dynamic> toJson() => {
        "uid": uid,
        "left_seats": leftSeats,
        "right_seats": rightSeats,
        "status": status,
      };
}
