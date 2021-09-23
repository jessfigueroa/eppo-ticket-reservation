part of 'city_bloc.dart';

@immutable
abstract class CityEvent {}

class OnSubscribeCities extends CityEvent {}

class OnCreateEditCity extends CityEvent {
  final CityModel city;
  OnCreateEditCity(this.city);
}

class OnSaveCity extends CityEvent {
  final CityModel city;
  final FormSubmitTypeState formSubmitTypeState;
  OnSaveCity(this.city, this.formSubmitTypeState);
}
