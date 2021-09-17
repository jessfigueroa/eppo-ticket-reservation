part of '__register.dart';

_goToLoginScreen(BuildContext context) {
  Navigator.pushReplacementNamed(context, 'login_screen');
}

_onRegisterHandle(BuildContext context, String email, String password) {
  final blocLogin = BlocProvider.of<AuthBloc>(context);
  blocLogin.add(OnRegister(email, password));
}

_onRegisterGoogleHandle(BuildContext context) {
  final blocLogin = BlocProvider.of<AuthBloc>(context);
  blocLogin.add(OnGoogleLogin(isLogin: false));
}
