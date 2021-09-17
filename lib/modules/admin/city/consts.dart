part of '__city.dart';

//########### constantes

const _TEXT_TITLE_SCREEN = 'Locales';
const _TEXT_NO_DATA = 'No hay locales registrados!';

//################# functions

_goToCreatePage(BuildContext context) {
  final cityBloc = BlocProvider.of<CityBloc>(context);
  final city = CityModel();
  cityBloc.add(OnCreateEditCity(city));
  Navigator.pushNamed(context, 'create_city_screen');
}

_goToEditeCity(BuildContext context, CityModel city) {
  final cityBloc = BlocProvider.of<CityBloc>(context);
  cityBloc.add(OnCreateEditCity(city));
  Navigator.pushNamed(context, 'create_city_screen');
}
