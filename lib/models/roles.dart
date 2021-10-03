import 'package:flutter/cupertino.dart';

class RolModel {
  final String titulo;
  final String rol;
  final IconData icon;
  final Function onPress;

  RolModel({
    required this.titulo,
    required this.rol,
    required this.icon,
    required this.onPress,
  });
}
