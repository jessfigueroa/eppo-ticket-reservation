import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;
// import 'package:mercadorista/bloc/login/login_bloc.dart';
// import 'package:mercadorista/global/enviroment.dart';
// import 'package:mercadorista/services/socket_servie.dart';
import 'package:meta/meta.dart';

part 'mi_ubicacion_event.dart';
part 'mi_ubicacion_state.dart';

class MiUbicacionBloc extends Bloc<MiUbicacionEvent, MiUbicacionState> {
  MiUbicacionBloc() : super(MiUbicacionState());
  StreamSubscription<Position>? _positionSubscription;

  void iniciarSeguimiento(String userUID) {
    print("iniciamos seguimiento");
    _positionSubscription = Geolocator.getPositionStream(
      desiredAccuracy: LocationAccuracy.high,
      distanceFilter: 10,
    ).listen((Position position) {
      print("Change");
      add(OnUbicacionCambio(position));
    }, onError: (e) {
      add(OnGpsDiscconect());
      print(_positionSubscription);
    });
  }

  void cancelarSeguimiento() {
    print("Cancelamos seguimiento");
    _positionSubscription?.cancel();
  }

  @override
  Stream<MiUbicacionState> mapEventToState(MiUbicacionEvent event) async* {
    if (event is OnUbicacionCambio) {
      yield state.copyWith(existeUbicacion: true, ubicacion: event.ubicacion);
    } else if (event is OnGpsDiscconect) {
      yield state.copyWith(existeUbicacion: false);
    }
  }
}
