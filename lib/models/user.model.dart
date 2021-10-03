import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:eppo/utils/utils.dart';

class UserEppo {
  UserEppo({
    this.name,
    this.uid,
    this.urlPhoto,
    this.phoneNumber = '',
    this.email,
    this.providerId,
    this.emailVerified,
    this.createAt,
    this.lastSignInTime,
    this.userIsLogin = false,
    this.rol,
    this.status = true,
    this.dni = '',
  });

  String? name;
  String? uid;
  String? urlPhoto;
  String phoneNumber;
  String? email;
  String? providerId;
  bool? emailVerified;
  DateTime? createAt;
  DateTime? lastSignInTime;
  bool userIsLogin;
  String? rol;
  bool status;
  String dni;

  factory UserEppo.fromFirabaseDocumentSnapshot(
      DocumentSnapshot<Object?>? doc) {
    return UserEppo.fromJson(doc);
  }
  factory UserEppo.fromFirabaseQueryDocumentSnapshot(
      QueryDocumentSnapshot<Object?>? doc) {
    return UserEppo.fromJson(doc);
  }
  factory UserEppo.fromJson(dynamic doc) {
    final json = doc?.data() as Map<String, dynamic>;
    return UserEppo(
      name: json['name'],
      uid: json["uid"],
      urlPhoto: json["urlPhoto"],
      phoneNumber: json["phoneNumber"],
      email: json["email"],
      providerId: json["providerId"],
      emailVerified: json["emailVerified"],
      createAt:
          json["createAt"] != null ? DateTime.parse(json["createAt"]) : null,
      lastSignInTime: json["lastSignInTime"] != null
          ? DateTime.parse(json["lastSignInTime"])
          : null,
      userIsLogin: true,
      rol: json["rol"],
      status: json["status"],
      dni: json['dni'],
    );
  }
  factory UserEppo.fromGooglAuth(User json) => UserEppo(
        name: json.displayName,
        uid: json.uid,
        urlPhoto: json.photoURL,
        phoneNumber: json.phoneNumber ?? '',
        email: json.email,
        providerId: json.providerData.first.providerId,
        emailVerified: json.emailVerified,
        createAt: json.metadata.creationTime,
        lastSignInTime: json.metadata.lastSignInTime,
        userIsLogin: true,
        rol: 'CLIENTE',
        status: true,
      );

  String get capitalName {
    final nameSplit = this.name!.split(' ');
    String capitalName = '';
    nameSplit.forEach((e) {
      capitalName += e.substring(0, 1).toUpperCase() + e.substring(1) + " ";
    });
    return capitalName;
  }

  bool get isNew => this.uid == null;

  Widget get photo => !this.isSvgExt
      ? Image.network(this.urlPhoto!)
      : SvgPicture.network(this.urlPhoto!);
  bool get isSvgExt => this.urlPhoto!.split('.').last == 'svg';

  String get numberPhone =>
      this.phoneNumber.isEmpty ? 'Sin número' : this.phoneNumber;

  Map<String, String> get tiempoRegistrado {
    final now = DateTime.now();
    final difference = now.difference(this.createAt!);
    return getCantidadYTiempo(difference.inSeconds);
  }

  String get dniString => this.dni.isNotEmpty ? this.dni : 'No registrado';
  String get uidReduce => this.uid!.substring(0, 8);
  Map<String, dynamic> toJson() => {
        "createAt": createAt?.toIso8601String(),
        "dni": dni,
        "email": email,
        "emailVerified": emailVerified,
        "lastSignInTime": lastSignInTime?.toIso8601String(),
        "name": name,
        "phoneNumber": phoneNumber,
        "providerId": providerId,
        "rol": rol,
        "status": status,
        "uid": uid,
        "urlPhoto": urlPhoto,
      };
}
