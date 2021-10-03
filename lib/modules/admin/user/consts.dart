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

_goToEditUser(BuildContext context, UserEppo city) {
  // final cityBloc = BlocProvider.of<CityBloc>(context);
  // cityBloc.add(OnCreateEditCity(city));
  // Navigator.pushNamed(context, 'create_city_screen');
}

// _saveCity(BuildContext context, CityModel city, FormSubmitTypeState state) {
//   final cityBloc = BlocProvider.of<CityBloc>(context);
//   cityBloc.add(OnSaveCity(city, state));
// }

_callUser(BuildContext context, String? number) {
  if (number!.isEmpty) {
    log(number);
  } else {
    showAlertOkIOS(context, 'Error',
        'Este usuario no tiene número de contacto registrado');
  }
}
