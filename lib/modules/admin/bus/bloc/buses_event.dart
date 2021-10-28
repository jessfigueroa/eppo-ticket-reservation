part of 'buses_bloc.dart';

@immutable
abstract class BusesEvent {}

class OnBusDetail extends BusesEvent {
  final CollectionReference<Map<String, dynamic>> buses;
  OnBusDetail(this.buses);
}
