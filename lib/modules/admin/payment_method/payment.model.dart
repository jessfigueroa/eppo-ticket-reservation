part of '__payment.dart';

class PaymentModel {
  PaymentModel({
    this.name,
    this.status,
    this.uid,
    this.icon,
    this.colorA,
    this.colorB,
  });

  String? name;
  bool? status;
  String? uid;
  IconData? icon;
  Color? colorA;
  Color? colorB;

  factory PaymentModel.fromFirestoreDocument(
    QueryDocumentSnapshot<Object?>? doc,
  ) {
    final json = doc?.data() as Map<String, dynamic>;
    return PaymentModel(
      uid: doc?.id,
      name: json["name"],
      status: json["status"],
      icon: IconData(
        json["icon"],
        fontFamily: 'MaterialIcons',
      ),
      colorA: Color(
        int.parse(
          json['colorA'].replaceAll("#", "0xff"),
        ),
      ),
      colorB: Color(
        int.parse(
          json['colorB'].replaceAll("#", "0xff"),
        ),
      ),
    );
  }
  String get capitalName {
    return '${name?.substring(0, 1).toUpperCase()}${name?.substring(1)}';
  }

  bool get isNew => this.uid == null;
  String get statusName => this.status! ? 'ACTIVO' : 'INACTIVO';

  Map<String, dynamic> toJson() => {
        "name": name,
        "status": status,
      };
}
