part of 'schedule_bloc.dart';

@immutable
class ScheduleState {
  final CollectionReference<Map<String, dynamic>>? schedules;
  final String cityName;
  final String destinyName;

  ScheduleState({
    this.schedules,
    this.cityName = '',
    this.destinyName = '',
  });

  ScheduleState copyWith({
    CollectionReference<Map<String, dynamic>>? schedules,
    String? cityName,
    String? destinyName,
  }) =>
      ScheduleState(
        schedules: schedules ?? this.schedules,
        cityName: cityName ?? this.cityName,
        destinyName: destinyName ?? this.destinyName,
      );
}
