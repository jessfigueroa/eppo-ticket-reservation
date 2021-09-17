part of 'mi_ubicacion_bloc.dart';

@immutable
abstract class MiUbicacionEvent {}

class OnUbicacionCambio extends MiUbicacionEvent {
  final Position ubicacion;
  OnUbicacionCambio(this.ubicacion);
}

class OnGpsDiscconect extends MiUbicacionEvent {}
