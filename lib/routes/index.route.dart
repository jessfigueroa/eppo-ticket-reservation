import 'package:eppo/modules/admin/bus/bus.page.dart';
import 'package:eppo/modules/admin/city/__city.dart';
import 'package:eppo/modules/admin/destination/__destination.dart';
import 'package:eppo/modules/admin/payment_method/__payment.dart';
import 'package:eppo/modules/admin/schedule/pages/schedule.page.dart';
import 'package:eppo/modules/admin/user/__user.dart';
import 'package:eppo/modules/auth/login/__login.dart';
import 'package:eppo/modules/auth/register/__register.dart';
import 'package:eppo/modules/all_users/main.page.dart';
import 'package:flutter/cupertino.dart';

final Map<String, Widget Function(BuildContext)> routes = {
  'login_screen': (_) => LoginPage(),
  'register_screen': (_) => RegisterPage(),
  'main_screen': (_) => MainPage(),
  'buse_screen': (_) => BusPage(),
  'citie_screen': (_) => CityPage(),
  'destination_screen': (_) => DestinationPage(),
  'payment_screen': (_) => PaymentPage(),
  'schedule_screen': (_) => SchedulePage(),
  'user_admin_screen': (_) => UserAdminPage(),
  'create_city_screen': (_) => CreateCityPage(),
  'create_payment_screen': (_) => CreatePaymentPage(),
  'create_user_screen': (_) => CreateUserPage(),
  'detalle_user_screen': (_) => DetalleUserPage(),
};
