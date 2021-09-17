import 'package:eppo/modules/auth/login/__login.dart';
import 'package:eppo/modules/auth/register/__register.dart';
import 'package:eppo/modules/all_users/main.page.dart';
import 'package:flutter/cupertino.dart';

final Map<String, Widget Function(BuildContext)> routes = {
  'login_screen': (_) => LoginPage(),
  'register_screen': (_) => RegisterPage(),
  'main_screen': (_) => MainPage(),
};
