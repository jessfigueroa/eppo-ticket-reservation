part of 'city_bloc.dart';

@immutable
class CityState {
  Stream<QuerySnapshot>? citiesStream;
  CityModel? city;

  CityState({this.citiesStream, this.city});

  CityState copyWith({
    Stream<QuerySnapshot>? citiesStream,
    CityModel? city,
  }) =>
      CityState(
        citiesStream: citiesStream ?? this.citiesStream,
        city: city ?? this.city,
      );
}
