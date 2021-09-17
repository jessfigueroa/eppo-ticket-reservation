part of 'city_bloc.dart';

@immutable
class CityState {
  Stream<QuerySnapshot>? citiesStream;
  CityState({this.citiesStream});

  CityState copyWith({Stream<QuerySnapshot>? citiesStream}) =>
      CityState(citiesStream: citiesStream);
}
