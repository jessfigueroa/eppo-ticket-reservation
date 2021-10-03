part of 'utils.dart';

getCurrentSize(BuildContext context) {
  return MediaQuery.of(context).size;
}

getCurrentHeight(BuildContext context, double? percentage) {
  percentage = percentage ?? 1.0;
  return MediaQuery.of(context).size.height * percentage;
}

getCurrentWidth(BuildContext context, double? percentage) {
  percentage = percentage ?? 1.0;
  return MediaQuery.of(context).size.width * percentage;
}

initEppoApp(BuildContext context) async {
// initEppoApp(BuildContext context, UserEppo user, String token) async {
  // final blocLogin = BlocProvider.of<AuthBloc>(context);

  // //Establecemos la sesión
  // if (!blocLogin.state.sesionEstablecida) {
  //   blocLogin.add(OnEstablecerSesion(user, token));
  // }

  //Inicializamos el menú
  final drawerBloc = BlocProvider.of<DrawerBloc>(context);
  final menu = obtenerMenuPorRol();
  drawerBloc.add(OnAddMenu(menu));

  //Inicializamos los firebase stream
  final cityBloc = BlocProvider.of<CityBloc>(context);
  cityBloc.add(OnSubscribeCities());

  final paymentBloc = BlocProvider.of<PaymentmethodBloc>(context);
  paymentBloc.add(OnSubscribePayments());

  final userBloc = BlocProvider.of<UserBloc>(context);
  userBloc.add(OnSubscribeUsers());

  // //Inicializamos los sockets
  // BlocProvider.of<SocketserverBloc>(context).add(
  //   OnInitConectionSocketServer(context),
  // );

  // //Iniciamos el seguimiento al GPS
  // final blocMiUbi = BlocProvider.of<MiUbicacionBloc>(context);
  // final blocUsuario = BlocProvider.of<UsuarioBloc>(context);
  // blocUsuario.onLoginSesion();
  // blocUsuario.onCrudUsuario();
  // blocMiUbi.iniciarSeguimiento(user.uid);

  // //Inicializamos los combosbox
  // inicializarCombos(context, user);

  //Navegamos a la pagina principal
  // Navigator.pushReplacement(
  //   context,
  //   navegarMapaFadeIn(context, PrincipalView()),
  // );

  //INICIALIZAMOS LOS HISTORIALES
  // BlocProvider.of<BusquedaBloc>(context).add(OnInicializarHistorial());
}

String getRolByKey(String key) {
  switch (key) {
    case 'ADMIN':
      return 'Administrador';
    case 'CLIENTE':
      return 'Cliente';
    default:
      return 'NO_ROL';
  }
}

Map<String, String> getCantidadYTiempo(int segundos) {
  int anyos = (segundos / 31104000).floor();
  int meses = (segundos / 2592000).floor();
  int semanas = (segundos / 604800).floor();
  int dias = (segundos / 86400).floor();
  int hour = (segundos / 3600).floor();
  int minute = ((segundos / 60) % 60).floor();
  if (segundos < 0) {
    return {"cantidad": "-", "tiempo": "Hace un momento"};
  }
  if (anyos > 0) {
    String term = anyos == 1 ? "Año" : "Años";
    return {"cantidad": "$anyos", "tiempo": "$term"};
    // return "${segundos < 0 ? "dentro de" : "hace"}  $anyos $term";
  } else {
    if (meses > 0) {
      String term = meses == 1 ? "Mes" : "Meses";
      return {"cantidad": "$meses", "tiempo": "$term"};
      // return "${segundos < 0 ? "dentro de" : "hace"}  $meses $term";
    } else {
      if (semanas > 0) {
        String term = semanas == 1 ? "Semana" : "Semanas";
        return {"cantidad": "$semanas", "tiempo": "$term"};
        // return "${segundos < 0 ? "dentro de" : "hace"}  $semanas $term";
      } else {
        if (dias > 0) {
          String term = dias == 1 ? "Día" : "Días";
          return {"cantidad": "$dias", "tiempo": "$term"};
          // return "${segundos < 0 ? "dentro de" : "hace"}  $dias $term";
        } else {
          if (hour > 0) {
            String term = hour == 1 ? "Hora" : "Horas";
            return {"cantidad": "$hour", "tiempo": "$term"};
            // return "${segundos < 0 ? "dentro de" : "hace"}  $hour $term";
          } else {
            if (minute > 0) {
              String term = minute == 1 ? "Minuto" : "Minutos";
              return {"cantidad": "$minute", "tiempo": "$term"};
              // return "${segundos < 0 ? "dentro de" : "hace"}  $minute $term";
            } else {
              return {"cantidad": "Hace un momento", "tiempo": "-"};
              // return "${segundos < 0 ? "dentro de" : "hace"}  un momento";
            }
          }
        }
      }
    }
  }
}
