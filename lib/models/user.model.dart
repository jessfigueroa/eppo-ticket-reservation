import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UserEppo {
  UserEppo({
    this.name,
    this.uid,
    this.urlPhoto,
    this.phoneNumber,
    this.email,
    this.providerId,
    this.emailVerified,
    this.createAt,
    this.lastSignInTime,
    this.userIsLogin = false,
    this.rol,
    this.status = true,
  });

  String? name;
  String? uid;
  String? urlPhoto;
  String? phoneNumber;
  String? email;
  String? providerId;
  bool? emailVerified;
  DateTime? createAt;
  DateTime? lastSignInTime;
  bool userIsLogin;
  String? rol;
  bool status;

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
    );
  }
  factory UserEppo.fromGooglAuth(User json) => UserEppo(
        name: json.displayName,
        uid: json.uid,
        urlPhoto: json.photoURL,
        phoneNumber: json.phoneNumber,
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
      capitalName += e.substring(0, 1).toLowerCase() + e.substring(1);
    });
    return capitalName;
  }

  bool get isSvgExt => this.urlPhoto!.split('.').last == 'svg';

  Map<String, dynamic> toJson() => {
        "name": name,
        "uid": uid,
        "urlPhoto": urlPhoto,
        "phoneNumber": phoneNumber,
        "email": email,
        "providerId": providerId,
        "emailVerified": emailVerified,
        "createAt": createAt?.toIso8601String(),
        "lastSignInTime": lastSignInTime?.toIso8601String(),
        "rol": rol
      };
}
