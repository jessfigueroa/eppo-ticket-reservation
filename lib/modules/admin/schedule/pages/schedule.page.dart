import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eppo/modules/admin/bus/bloc/buses_bloc.dart';
import 'package:eppo/modules/admin/schedule/bloc/schedule_bloc.dart';
import 'package:eppo/modules/admin/schedule/schedule.model.dart';
import 'package:eppo/utils/utils.dart';
import 'package:eppo/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const _TEXT_NO_DATA = "No hay horarios registrados!";

class SchedulePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScheduleBloc, ScheduleState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('${state.cityName} - ${state.destinyName} (Horarios)'),
          ),
          body: _ScheduleBody(),
        );
      },
    );
  }
}

class _ScheduleBody extends StatelessWidget {
  const _ScheduleBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _headStyle = TextStyle(fontWeight: FontWeight.bold);
    return BlocBuilder<ScheduleBloc, ScheduleState>(
      builder: (context, state) {
        GetOptions options = GetOptions();
        return FutureBuilder(
          future: state.schedules!.orderBy('datetime', descending: false).get(),
          builder: (
            BuildContext context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot,
          ) {
            if (!snapshot.hasData)
              return Center(
                child: Text(_TEXT_NO_DATA),
              );
            final schedules = snapshot.data!.docs;
            if (schedules.length == 0)
              return Center(
                child: Text(_TEXT_NO_DATA),
              );
            return ListView.separated(
              separatorBuilder: (context, index) {
                return Container(
                  height: 0.1,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  color: Colors.black26,
                );
              },
              itemCount: schedules.length,
              itemBuilder: (context, index) {
                final schedule =
                    Schedule.fromFirestoreDocument(schedules[index]);
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text('Dia', style: _headStyle),
                          SizedBox(width: 5),
                          Text(':', style: _headStyle),
                          SizedBox(width: 5),
                          Text(getDay(schedule.datetime!)),
                          SizedBox(width: 2),
                        ],
                      ),
                      Row(
                        children: [
                          Text('Hora', style: _headStyle),
                          SizedBox(width: 5),
                          Text(':', style: _headStyle),
                          SizedBox(width: 5),
                          Text(getHora(schedule.datetime!))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          OutlinedButton(
                            onPressed: () => _goToBusScreen(context, schedule),
                            child: Text('Ver bus'),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
            );
          },
        );
      },
    );
  }

  _goToBusScreen(BuildContext context, Schedule schedule) {
    final busBloc = BlocProvider.of<BusesBloc>(context);
    busBloc.add(OnBusDetail(schedule.buses!));
    Navigator.pushNamed(context, 'buses_screen');
  }
}
