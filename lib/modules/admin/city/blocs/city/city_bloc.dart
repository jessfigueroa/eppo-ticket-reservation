import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eppo/modules/admin/city/__city.dart';
import 'package:eppo/modules/admin/city/city.service.dart';
import 'package:eppo/states/form_submit_state.dart';
import 'package:eppo/states/submit_type.dart';
import 'package:meta/meta.dart';

part 'city_event.dart';
part 'city_state.dart';

class CityBloc extends Bloc<CityEvent, CityState> {
  final cityService = CityService();
  CityBloc() : super(CityState());

  @override
  Stream<CityState> mapEventToState(
    CityEvent event,
  ) async* {
    if (event is OnSubscribeCities) {
      yield* _onSunscribeCities(event);
    } else if (event is OnCreateEditCity) {
      yield* _onCreateEditCity(event);
    } else if (event is OnSaveCity) {
      yield* _onSaveCity(event);
    }
  }

  Stream<CityState> _onSunscribeCities(OnSubscribeCities event) async* {
    yield state.copyWith(citiesStream: cityService.cities);
  }

  Stream<CityState> _onCreateEditCity(OnCreateEditCity event) async* {
    yield state.copyWith(city: event.city);
  }

  Stream<CityState> _onSaveCity(OnSaveCity event) async* {
    yield state.copyWith(
      formSubmitState: Submitting(),
      formSubmitTypeState: event.formSubmitTypeState,
    );
    await cityService.save(event.city);
    yield state.copyWith(formSubmitState: SuccessSubmit());
  }
}
