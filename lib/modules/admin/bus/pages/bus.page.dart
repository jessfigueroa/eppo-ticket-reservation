import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eppo/modules/admin/bus/bloc/buses_bloc.dart';
import 'package:eppo/modules/admin/bus/bus.model.dart';
import 'package:eppo/utils/utils.dart';
import 'package:eppo/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const _TEXT_NO_DATA = 'No hay buses registrados para este viaje!';

class BusPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BusesBloc, BusesState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Bus'),
          ),
          body: _BusesBody(),
        );
      },
    );
  }
}

class _BusesBody extends StatelessWidget {
  const _BusesBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BusesBloc, BusesState>(
      builder: (context, state) {
        return FutureBuilder(
          future: state.buses!.get(),
          builder: (
            BuildContext context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot,
          ) {
            if (!snapshot.hasData)
              return Center(
                child: Text(_TEXT_NO_DATA),
              );
            final buses = snapshot.data!.docs;
            if (buses.length == 0)
              return Center(
                child: Text(_TEXT_NO_DATA),
              );
            return ListView.builder(
              itemCount: buses.length,
              itemBuilder: (context, index) {
                final bus = Bus.fromFirestoreDoc(buses[index]);
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.grey,
                  ),
                  child: Row(
                    children: [
                      getRigthSeats(bus.rightSeats!),
                      getLefteats(bus.leftSeats!),
                    ],
                  ),
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  height: getCurrentHeight(context, 0.8),
                );
              },
            );
          },
        );
      },
    );
  }

  getRigthSeats(int seats) {
    // final
    for (var i = 0; i < seats; i++) {
      print('Asiento ${i + 1}');
    }
    return Container();
  }

  getLefteats(int seats) {
    for (var i = 0; i < seats; i++) {
      print('Asiento ${i + 1}');
    }
    return Container();
  }
}
