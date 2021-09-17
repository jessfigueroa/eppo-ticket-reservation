import 'package:firebase_auth/firebase_auth.dart';

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
  bool? userIsLogin;
  String? rol;

  factory UserEppo.fromFirabase(Map<String, dynamic> json) => UserEppo(
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
      );

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
      rol: 'CLIENTE');

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
      };
}
