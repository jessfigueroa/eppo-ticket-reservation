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

getDay(DateTime localTime) {
  final day = localTime.weekday - 1;
  switch (day) {
    case 0:
      return 'Lunes ${localTime.day} de ${getMonth(localTime)} del ${localTime.year}';
    case 1:
      return 'Martes ${localTime.day} de ${getMonth(localTime)} del ${localTime.year}';
    case 2:
      return 'Miercoles ${localTime.day} de ${getMonth(localTime)} del ${localTime.year}';
    case 3:
      return 'Jueves ${localTime.day} de ${getMonth(localTime)} del ${localTime.year}';
    case 4:
      return 'Viernes ${localTime.day} de ${getMonth(localTime)} del ${localTime.year}';
    case 5:
      return 'Sabado ${localTime.day} de ${getMonth(localTime)} del ${localTime.year}';
    case 6:
      return 'Domingo ${localTime.day} de ${getMonth(localTime)} del ${localTime.year}';

    default:
      return 'No day';
  }
}

getMonth(DateTime localTime) {
  switch (localTime.month) {
    case 0:
      return 'Enero';
    case 1:
      return 'Febrero';
    case 2:
      return 'Marzo';
    case 3:
      return 'Abril';
    case 4:
      return 'Mayo';
    case 5:
      return 'Junio';
    case 6:
      return 'Julio';
    case 7:
      return 'Agosto';
    case 8:
      return 'Setiembre';
    case 9:
      return 'Octubre';
    case 10:
      return 'Noviembre';
    case 11:
      return 'Diciembre';
    default:
      return 'No month';
  }
}

getFecha(DateTime localTime) {
  return "${localTime.day}-${localTime.month}-${localTime.year}";
}

getHora(DateTime localTime) {
  String horaFinal = localTime.hour.toString();
  String minutosFinal = localTime.minute.toString();
  String time = "";

  switch (localTime.hour) {
    case 13:
      horaFinal = "01";
      time = "PM";
      break;
    case 14:
      horaFinal = "02";
      time = "PM";
      break;
    case 15:
      horaFinal = "03";
      time = "PM";
      break;
    case 16:
      horaFinal = "04";
      time = "PM";
      break;
    case 17:
      horaFinal = "05";
      time = "PM";
      break;
    case 18:
      horaFinal = "06";
      time = "PM";
      break;
    case 19:
      horaFinal = "07";
      time = "PM";
      break;
    case 20:
      horaFinal = "08";
      time = "PM";
      break;
    case 21:
      horaFinal = "09";
      time = "PM";
      break;
    case 22:
      horaFinal = "10";
      time = "PM";
      break;
    case 23:
      horaFinal = "11";
      time = "PM";
      break;
    case 00:
      horaFinal = "12";
      time = "PM";
      break;

    default:
      time = "AM";
      break;
  }
  if (minutosFinal.length == 1) {
    minutosFinal = "0$minutosFinal";
  }
  if (horaFinal.length == 1) {
    horaFinal = "0$horaFinal";
  }
  return "$horaFinal:$minutosFinal $time";
}
