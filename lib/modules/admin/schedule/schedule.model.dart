import 'package:cloud_firestore/cloud_firestore.dart';

class Schedule {
  Schedule({
    this.uid,
    this.datetime,
  });

  String? uid;
  DateTime? datetime;

  factory Schedule.fromFirestoreDocument(QueryDocumentSnapshot<Object?>? doc) {
    final json = doc?.data() as Map<String, dynamic>;
    return Schedule(
      uid: json["uid"],
      datetime: DateTime.parse(json["datetime"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "datetime": datetime!.toIso8601String(),
      };
}
