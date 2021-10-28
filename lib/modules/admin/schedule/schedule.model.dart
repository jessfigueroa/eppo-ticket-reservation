import 'package:cloud_firestore/cloud_firestore.dart';

class Schedule {
  Schedule({
    this.uid,
    this.datetime,
    this.buses,
  });

  String? uid;
  DateTime? datetime;
  CollectionReference<Map<String, dynamic>>? buses;

  factory Schedule.fromFirestoreDocument(QueryDocumentSnapshot<Object?>? doc) {
    final json = doc?.data() as Map<String, dynamic>;
    return Schedule(
      uid: doc!.id,
      datetime: (json["datetime"] as Timestamp).toDate(),
      buses: doc.reference.collection('buses'),
    );
  }

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "datetime": datetime!.toIso8601String(),
      };
}
