part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class OnGoogleLogin extends AuthEvent {
  final bool isLogin;
  OnGoogleLogin({this.isLogin = true});
}

class OnEmailPassLogin extends AuthEvent {
  final String email;
  final String password;
  OnEmailPassLogin(this.email, this.password);
}

class OnRegister extends AuthEvent {
  final String email;
  final String password;
  OnRegister(this.email, this.password);
}

class OnLogout extends AuthEvent {}
