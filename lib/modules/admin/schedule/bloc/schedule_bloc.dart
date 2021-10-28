import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'schedule_event.dart';
part 'schedule_state.dart';

class ScheduleBloc extends Bloc<ScheduleEvent, ScheduleState> {
  ScheduleBloc() : super(ScheduleState());

  @override
  Stream<ScheduleState> mapEventToState(ScheduleEvent event) async* {
    if (event is OnScheduleDetail) {
      yield* _onDestinationDetail(event);
    }
  }

  Stream<ScheduleState> _onDestinationDetail(OnScheduleDetail event) async* {
    yield state.copyWith(
      schedules: event.schedules,
      cityName: event.cityName,
      destinyName: event.destinyName,
    );
  }
}
