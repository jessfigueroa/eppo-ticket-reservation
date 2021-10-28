part of 'buses_bloc.dart';

@immutable
class BusesState {
  final CollectionReference<Map<String, dynamic>>? buses;

  BusesState({
    this.buses,
  });

  BusesState copyWith({
    CollectionReference<Map<String, dynamic>>? buses,
  }) =>
      BusesState(
        buses: buses ?? this.buses,
      );
}
