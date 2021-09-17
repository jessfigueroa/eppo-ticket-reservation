part of '__login.dart';

_goToRegisterScreen(BuildContext context) {
  Navigator.pushReplacementNamed(context, 'register_screen');
}

_onLoginHandle(BuildContext context, String email, String password) {
  final blocLogin = BlocProvider.of<AuthBloc>(context);
  blocLogin.add(OnEmailPassLogin(email, password));
}

_onLoginGoogleHandle(BuildContext context) {
  final blocLogin = BlocProvider.of<AuthBloc>(context);
  blocLogin.add(OnGoogleLogin());
}
