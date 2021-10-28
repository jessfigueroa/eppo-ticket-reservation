part of 'schedule_bloc.dart';

@immutable
abstract class ScheduleEvent {}

class OnScheduleDetail extends ScheduleEvent {
  final CollectionReference<Map<String, dynamic>> schedules;
  final String cityName;
  final String destinyName;
  OnScheduleDetail(this.schedules, this.cityName, this.destinyName);
}
