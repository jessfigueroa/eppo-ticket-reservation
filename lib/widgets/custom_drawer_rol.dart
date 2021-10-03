part of 'widgets.dart';

//########################## LABELS FROM DRAWER VIEW SCREEN ##############################
const _TEXT_LOGOUT = 'Cerrar Sesión';
const _TEXT_VERSION = 'V. 0.1.0';

class CustomDrawerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Container(
          child: Column(
            children: [
              _HeaderWidget(),
              _MenuWidget(),
              _CerrarSesion(),
              Text(
                _TEXT_VERSION,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                  fontSize: 10,
                ),
              ),
              // _EstadoServidor(),
              SizedBox(height: 10)
            ],
          ),
        ),
      ),
    );
  }
}

class _HeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final usuario = BlocProvider.of<AuthBloc>(context).state.currentUser;
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 100,
          color: Theme.of(context).primaryColor,
        ),
        GestureDetector(
          // onTap: () => _tapMenuElement(
          //   context,
          //   PerfilUsuarioView(),
          //   "perfil_usuario_view",
          // ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 100),
                Container(
                  height: 50,
                  width: 50,
                  child: CircularImageAvatar(
                    usuario!.urlPhoto!,
                    isSvg: usuario.isSvgExt,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 10),
                    Container(
                      width: size.width * 0.5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            usuario.name ?? 'No Name',
                            // usuario.getNombreUsuario(),
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            usuario.email ?? 'No Email',
                            style:
                                TextStyle(color: Colors.white70, fontSize: 13),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _MenuWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final drawerBloc = BlocProvider.of<DrawerBloc>(context);

    // final menu = obtenerMenuPorRol(
    // drawerBloc.add(OnAddMenu(menu));

    return Expanded(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: BlocBuilder<DrawerBloc, DrawerState>(
          builder: (context, state) {
            return ExpansionPanelList(
              expansionCallback: (panelIndex, isExpanded) {
                drawerBloc.add(OnExpandItem(panelIndex));
              },
              children: [..._getMenuList(state.menu, context)],
            );
          },
        ),
      ),
    );
  }

  List<ExpansionPanel> _getMenuList(List<Menu> menu, BuildContext context) {
    final String usuarioRol =
        BlocProvider.of<AuthBloc>(context).state.currentUser?.rol ?? 'CLIENTE';
    return menu
        .map(
          (e) => ExpansionPanel(
            canTapOnHeader: true,
            headerBuilder: (context, isExpanded) {
              return ListTile(
                title: Text(e.texto ?? 'No Menú'),
              );
            },
            body: Column(
              children: [
                ...e.subMenu!.map((e) {
                  Widget submenu = Container();
                  bool matchRol = false;
                  e.roles.forEach((rol) {
                    if (!matchRol) {
                      switch (rol) {
                        case "ALL":
                          submenu = getMenuListTile(context, e);
                          matchRol = true;
                          break;
                        default:
                          if (usuarioRol == rol) {
                            submenu = getMenuListTile(context, e);
                            matchRol = true;
                            break;
                          }
                          submenu = Container();
                          break;
                      }
                    }
                  });
                  return submenu;
                }).toList()
              ],
            ),
            isExpanded: e.expanded,
          ),
        )
        .toList();
  }

  getMenuListTile(BuildContext context, SubMenu item) {
    return ListTile(
      title: Text(item.texto ?? 'No SubMenú'),
      leading: Icon(item.icon),
      trailing: Icon(
        Icons.keyboard_arrow_right,
        color: Colors.blue,
      ),
      onTap: () => _tapMenuElement(
        context,
        item.ruta ?? Container(),
        item.rutaName ?? 'no_route',
      ),
    );
  }
}

_tapMenuElement(BuildContext context, Widget page, String rutaName) {
  final currentRoute = ModalRoute.of(context)?.settings.name;
  print(currentRoute);
  Navigator.pop(context);
  if (currentRoute != rutaName) {
    Navigator.pushReplacement(
      context,
      navegarMapaFadeIn(context, page, rutaName: rutaName),
    );
  } else {
    print("es la misma ruta no cambia");
  }
}

class _CerrarSesion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: TextButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, 'login_screen');
          BlocProvider.of<AuthBloc>(context).add(OnLogout());
        },
        child: Text(
          "Cerrar Sesión",
          style: TextStyle(color: Colors.red),
        ),
      ),
    );
  }
}

// class _EstadoServidor extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<SocketserverBloc, SocketserverState>(
//       builder: (context, state) {
//         return Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               "Servidor:",
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black54,
//                 fontSize: 12,
//               ),
//             ),
//             SizedBox(width: 5),
//             state.conexion is Online
//                 ? Text(
//                     "Conectado",
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       color: Colors.green,
//                       fontSize: 12,
//                     ),
//                   )
//                 : Text(
//                     "desonectado",
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       color: Colors.red,
//                       fontSize: 12,
//                     ),
//                   ),
//           ],
//         );
//         // Container(
//         //   margin: EdgeInsets.only(right: 10),
//         //   child: state.conexion is Online
//         //       ? Icon(FontAwesomeIcons.checkCircle, color: Colors.green)
//         //       : state.conexion is Connecting
//         //           ? CupertinoActivityIndicator()
//         //           : Icon(Icons.offline_bolt, color: Colors.red),
//         // );
//       },
//     );
//   }
// }
