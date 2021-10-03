part of '__payment.dart';

class PaymentModel {
  PaymentModel({
    this.name,
    this.status = true,
    this.uid,
    this.icon = 59268,
    this.colorA = '',
    this.colorB = '',
  });

  String? name;
  bool status;
  String? uid;
  int icon;
  String colorA;
  String colorB;

  factory PaymentModel.fromFirestoreDocument(
    QueryDocumentSnapshot<Object?>? doc,
  ) {
    final json = doc?.data() as Map<String, dynamic>;
    return PaymentModel(
        uid: doc?.id,
        name: json["name"],
        status: json["status"],
        icon: json["icon"],
        colorA: json['colorA'],
        colorB: json['colorB']);
  }

  Color get colorDataA => this.colorA.length > 0
      ? Color(int.parse(this.colorA.replaceAll("#", "0xff")))
      : Colors.grey;
  Color get colorDataB => this.colorB.length > 0
      ? Color(int.parse(this.colorB.replaceAll("#", "0xff")))
      : Colors.blueGrey;
  String get capitalName =>
      '${name?.substring(0, 1).toUpperCase()}${name?.substring(1)}';
  IconData get iconData => IconData(this.icon, fontFamily: 'MaterialIcons');
  bool get isNew => this.uid == null;
  String get statusName => this.status! ? 'ACTIVO' : 'INACTIVO';

  Map<String, dynamic> toJson() => {
        "colorA": colorA,
        "colorB": colorB,
        "icon": icon,
        "name": name,
        "status": status,
      };
}
