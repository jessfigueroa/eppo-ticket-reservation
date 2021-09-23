part of 'city_bloc.dart';

@immutable
class CityState {
  final Stream<QuerySnapshot>? citiesStream;
  final CityModel? city;
  final FormSubmitState formSubmitState;
  final FormSubmitTypeState formSubmitTypeState;

  CityState(
      {this.citiesStream,
      this.city,
      FormSubmitState? formSubmitState,
      FormSubmitTypeState? formSubmitTypeState})
      : formSubmitState = formSubmitState ?? NoSubmit(),
        formSubmitTypeState = formSubmitTypeState ?? NoType();

  CityState copyWith({
    Stream<QuerySnapshot>? citiesStream,
    CityModel? city,
    FormSubmitState? formSubmitState,
    FormSubmitTypeState? formSubmitTypeState,
  }) =>
      CityState(
        citiesStream: citiesStream ?? this.citiesStream,
        city: city ?? this.city,
        formSubmitState: formSubmitState ?? this.formSubmitState,
        formSubmitTypeState: formSubmitTypeState ?? this.formSubmitTypeState,
      );
}
