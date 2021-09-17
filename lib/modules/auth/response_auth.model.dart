import 'package:eppo/models/user.model.dart';

class AuthResponse {
  AuthResponse({
    this.exito = true,
    this.user,
    this.error,
  });

  bool exito;
  UserEppo? user;
  String? error;
}
