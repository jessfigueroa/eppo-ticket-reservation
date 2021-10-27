part of 'destination_bloc.dart';

@immutable
abstract class DestinationEvent {}

class OnDestinationDetail extends DestinationEvent {
  final CollectionReference<Map<String, dynamic>> destinations;
  final String cityName;
  OnDestinationDetail(this.destinations, this.cityName);
}
