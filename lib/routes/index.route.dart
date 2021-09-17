import 'package:eppo/modules/admin/bus/bus.page.dart';
import 'package:eppo/modules/admin/city/__city.dart';
import 'package:eppo/modules/admin/destination/destination.page.dart';
import 'package:eppo/modules/admin/payment_method/pay_method.page.dart';
import 'package:eppo/modules/admin/schedule/schedule.page.dart';
import 'package:eppo/modules/admin/users/user.page.dart';
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
  'payment_screen': (_) => PaymentMethodPage(),
  'schedule_screen': (_) => SchedulePage(),
  'user_admin_screen': (_) => UserAdminPage(),
  'create_city_screen': (_) => CreateCityPage()
};
