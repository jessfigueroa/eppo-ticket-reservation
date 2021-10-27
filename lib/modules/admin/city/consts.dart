part of '__city.dart';

//########### constantes

const _TEXT_TITLE_SCREEN = 'Locales';
const _TEXT_NO_DATA = 'No hay locales registrados!';
const _TEXT_BTN_SAVE = 'Guardar';
//################# functions

_goToCreatePage(BuildContext context) {
  final cityBloc = BlocProvider.of<CityBloc>(context);
  final city = CityModel();
  cityBloc.add(OnCreateEditCity(city));
  Navigator.pushNamed(context, 'create_city_screen');
}

_goToEditCity(BuildContext context, CityModel city) {
  final cityBloc = BlocProvider.of<CityBloc>(context);
  cityBloc.add(OnCreateEditCity(city));
  Navigator.pushNamed(context, 'create_city_screen');
}

_goToDestinationPage(
  BuildContext context,
  CollectionReference<Map<String, dynamic>> destinations,
  String cityName,
) {
  final destinyBloc = BlocProvider.of<DestinationBloc>(context);
  destinyBloc.add(OnDestinationDetail(destinations, cityName));
  print(destinations);
  print(cityName);
  Navigator.pushNamed(context, 'destination_screen');
}

_saveCity(BuildContext context, CityModel city, FormSubmitTypeState state) {
  final cityBloc = BlocProvider.of<CityBloc>(context);
  cityBloc.add(OnSaveCity(city, state));
}
