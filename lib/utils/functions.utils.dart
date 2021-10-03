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
