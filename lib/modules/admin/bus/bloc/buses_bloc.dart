import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'buses_event.dart';
part 'buses_state.dart';

class BusesBloc extends Bloc<BusesEvent, BusesState> {
  BusesBloc() : super(BusesState());

  @override
  Stream<BusesState> mapEventToState(BusesEvent event) async* {
    if (event is OnBusDetail) {
      yield* _onBusDetail(event);
    }
  }

  Stream<BusesState> _onBusDetail(OnBusDetail event) async* {
    yield state.copyWith(buses: event.buses);
  }
}
