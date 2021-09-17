part of 'mi_ubicacion_bloc.dart';

@immutable
class MiUbicacionState {
  final bool siguiendo;
  final bool existeUbicacion;
  final Position? ubicacion;

  MiUbicacionState({
    this.siguiendo = true,
    this.existeUbicacion = false,
    this.ubicacion,
  });

  MiUbicacionState copyWith({
    bool? siguiendo,
    bool? existeUbicacion,
    Position? ubicacion,
  }) =>
      MiUbicacionState(
        siguiendo: siguiendo ?? this.siguiendo,
        existeUbicacion: existeUbicacion ?? this.existeUbicacion,
        ubicacion: ubicacion ?? this.ubicacion,
      );

  LatLng get ubicacionLatLng =>
      LatLng(this.ubicacion?.latitude ?? 0, this.ubicacion?.longitude ?? 0);
}
