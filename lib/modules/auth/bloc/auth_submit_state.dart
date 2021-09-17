abstract class AuthSubmitState {}

class NoLogin extends AuthSubmitState {}

class LogginIn extends AuthSubmitState {}

class SuccessfullLogin extends AuthSubmitState {}

class ErrorLogin extends AuthSubmitState {
  final errorMsg;
  ErrorLogin(this.errorMsg);

  @override
  String toString() {
    return "$errorMsg";
  }
}
