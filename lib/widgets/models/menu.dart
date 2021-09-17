part of 'models.dart';

class Menu {
  Menu({
    this.texto,
    this.expanded = false,
    List<SubMenu>? subMenu,
  }) : subMenu = subMenu ?? [];
  String? texto;
  List<SubMenu>? subMenu;
  bool expanded;
}

class SubMenu {
  Widget? ruta;
  IconData? icon;
  String? texto;
  String? rutaName;
  List<String> roles;

  SubMenu({
    this.ruta,
    this.icon,
    this.texto,
    this.rutaName,
    List<String>? roles,
  }) : roles = roles ?? ["ADMIN"];
}
