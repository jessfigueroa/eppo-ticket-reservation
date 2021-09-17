import 'package:eppo/models/user.model.dart';

class AuthResponse {
  AuthResponse({
    this.exito = true,
    this.user,
    // this.token,
    this.error,
  });

  bool exito;
  UserEppo? user;
  // String? token;
  String? error;
}
