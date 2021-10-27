import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eppo/modules/admin/destination/destination.model.dart';
import 'package:meta/meta.dart';

part 'destination_event.dart';
part 'destination_state.dart';

class DestinationBloc extends Bloc<DestinationEvent, DestinationState> {
  DestinationBloc() : super(DestinationState());

  @override
  Stream<DestinationState> mapEventToState(DestinationEvent event) async* {
    if (event is OnDestinationDetail) {
      yield* _onDestinationDetail(event);
    }
  }

  Stream<DestinationState> _onDestinationDetail(
      OnDestinationDetail event) async* {
    yield state.copyWith(
        destinations: event.destinations, cityName: event.cityName);
  }
}
