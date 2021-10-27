part of 'helpers.dart';

//******************MANEJO DE MENUS********* */
///*************************************** */
///*************************************** */

List<Menu> obtenerMenuPorRol() {
  List<Menu> menuLista = [
    //EL MENU DE AREA COMERCIAL YA ESTA TERMINADO
    // getMenuAreaComercial(expanded: true),
    getMenuConfiguraciones(expanded: true),
    // getMenuVentas(expanded: true)
  ];
  return menuLista;
}

Menu getMenuConfiguraciones({bool expanded = false}) {
  List<SubMenu> subMenus = [
    // SubMenu(
    //   ruta: BusPage(),
    //   icon: Icons.car_repair_outlined,
    //   texto: "Buses",
    //   rutaName: "buse_screen",
    //   roles: ["ADMIN"],
    // ),
    SubMenu(
      ruta: CityPage(),
      icon: Icons.public,
      texto: "Locales",
      rutaName: "citie_screen",
      roles: ["ADMIN"],
    ),
    // SubMenu(
    //   ruta: DestinationPage(),
    //   icon: Icons.map_outlined,
    //   texto: "Destinos",
    //   rutaName: "destination_screen",
    //   roles: ["ADMIN"],
    // ),
    SubMenu(
      ruta: PaymentPage(),
      icon: Icons.credit_card_outlined,
      texto: "Metodos de pago",
      rutaName: "payment_screen",
      roles: ["ADMIN"],
    ),
    // SubMenu(
    //   ruta: SchedulePage(),
    //   icon: Icons.schedule_outlined,
    //   texto: "Horarios",
    //   rutaName: "schedule_screen",
    //   roles: ["ADMIN"],
    // ),
    SubMenu(
      ruta: UserAdminPage(),
      icon: Icons.person_pin_circle,
      texto: "Usuarios",
      rutaName: "user_admin_screen",
      roles: ["ADMIN"],
    ),
  ];
  return Menu(
    texto: "Configuraciónes",
    subMenu: subMenus,
    expanded: expanded,
  );
}
