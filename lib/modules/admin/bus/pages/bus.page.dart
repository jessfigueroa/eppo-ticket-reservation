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
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.grey,
                  ),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                        ),
                        child: Center(
                          child: Text('CABINA'),
                        ),
                        height: 120,
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: getLefteats(bus.leftSeats!),
                          ),
                          Column(
                            children:
                                getRigthSeats(bus.rightSeats!, bus.leftSeats!),
                          ),
                        ],
                      ),
                    ],
                  ),
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                );
              },
            );
          },
        );
      },
    );
  }

  getRigthSeats(int seatsRight, int desde) {
    // final
    final List<Widget> seatArray = [];
    for (var i = desde; i < seatsRight; i += 2) {
      seatArray.add(
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
              ),
              height: 50,
              width: 50,
              child: Center(child: Text("${i + 1}")),
            ),
            SizedBox(width: 5),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
              ),
              height: 50,
              width: 50,
              child: Center(child: Text("${i + 2}")),
            ),
          ],
        ),
      );
      seatArray.add(
        SizedBox(height: 5),
      );
    }
    return seatArray;
  }

  getLefteats(int seats) {
    final List<Widget> seatArray = [];
    for (var i = 0; i < seats; i += 2) {
      seatArray.add(
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
              ),
              height: 50,
              width: 50,
              child: Center(child: Text("${i + 1}")),
            ),
            SizedBox(width: 5),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
              ),
              height: 50,
              width: 50,
              child: Center(child: Text("${i + 2}")),
            ),
          ],
        ),
      );
      seatArray.add(SizedBox(height: 5));
    }
    return seatArray;
  }
}
