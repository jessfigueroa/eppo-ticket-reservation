part of 'destination_bloc.dart';

@immutable
class DestinationState {
  final CollectionReference<Map<String, dynamic>>? destinations;
  final String? cityName;

  DestinationState({
    this.destinations,
    this.cityName,
  });

  DestinationState copyWith({
    CollectionReference<Map<String, dynamic>>? destinations,
    String? cityName,
  }) =>
      DestinationState(
        destinations: destinations ?? this.destinations,
        cityName: cityName ?? this.cityName,
      );
}
