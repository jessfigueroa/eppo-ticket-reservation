part of '__user.dart';

//########### constantes

const _TEXT_TITLE_SCREEN = 'Usuarios';
const _TEXT_NO_DATA = 'No hay usuarios registrados!';
const _TEXT_BTN_SAVE = 'Guardar';
//################# functions

_goToCreatePage(BuildContext context) {
  // final cityBloc = BlocProvider.of<CityBloc>(context);
  // final city = CityModel();
  // cityBloc.add(OnCreateEditCity(city));
  // Navigator.pushNamed(context, 'create_city_screen');
}

_goToEditUser(BuildContext context, UserEppo user) {
  final cityBloc = BlocProvider.of<UserBloc>(context);
  cityBloc.add(OnCreateEditUser(user));
  Navigator.pushNamed(context, 'create_user_screen');
}

_goToDetalleUser(BuildContext context, UserEppo user) {
  final cityBloc = BlocProvider.of<UserBloc>(context);
  cityBloc.add(OnCreateEditUser(user));
  Navigator.pushNamed(context, 'detalle_user_screen');
}

_saveUser(BuildContext context, UserEppo user, FormSubmitTypeState state) {
  final cityBloc = BlocProvider.of<UserBloc>(context);
  cityBloc.add(OnSaveUser(user, state));
}

_callUser(BuildContext context, String? number) async {
  if (number!.isNotEmpty) {
    bool? resp = await FlutterPhoneDirectCaller.callNumber(number);
  } else {
    showAlertOkIOS(context, 'Error',
        'Este usuario no tiene número de contacto registrado');
  }
}
