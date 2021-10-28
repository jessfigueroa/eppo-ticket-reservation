import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eppo/models/user.model.dart';
import 'package:eppo/modules/admin/bus/bloc/buses_bloc.dart';
import 'package:eppo/modules/admin/bus/bus.model.dart';
import 'package:eppo/utils/utils.dart';
import 'package:eppo/widgets/helpers/helpers.dart';
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
                return FutureBuilder(
                  future: bus.passengers!.get(),
                  builder: (
                    BuildContext context,
                    AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot,
                  ) {
                    if (snapshot.connectionState != ConnectionState.done) {
                      return Container(
                        height: getCurrentHeight(context, 0.9),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Container(
                                color: Colors.white,
                                width: 50,
                                height: 50,
                                child: CircularProgressIndicator(),
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                    final passengers = snapshot.data!.docs
                        .map((e) => UserEppo.fromFirabaseDocumentSnapshot(e))
                        .toList();

                    return Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                                children: getSeats(
                                  context,
                                  bus.leftSeats!,
                                  0,
                                  passengers,
                                ),
                              ),
                              Column(
                                children: getSeats(
                                  context,
                                  bus.rightSeats!,
                                  bus.leftSeats!,
                                  passengers,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    );
                  },
                );
              },
            );
          },
        );
      },
    );
  }

  getSeats(BuildContext context, int seatsRight, int desde,
      List<UserEppo> passengers) {
    // final
    final List<Widget> seatArray = [];
    for (var i = desde; i < seatsRight; i += 2) {
      List<UserEppo> pasajeroA =
          passengers.where((e) => e.seatNumber == i + 1).toList();
      List<UserEppo> pasajeroB =
          passengers.where((e) => e.seatNumber == i + 2).toList();

      bool asientoA = pasajeroA.length > 0;
      bool asientoB = pasajeroB.length > 0;

      seatArray.add(
        Row(
          children: [
            getCirculeSeat(
                context, asientoA, asientoA ? pasajeroA.first : null, i + 1),
            SizedBox(width: 5),
            getCirculeSeat(
                context, asientoB, asientoB ? pasajeroB.first : null, i + 2)
          ],
        ),
      );
      seatArray.add(
        SizedBox(height: 5),
      );
    }
    return seatArray;
  }

  showPassenger(BuildContext context, UserEppo userEppo) {
    showPassengerDialog(context, userEppo);
  }

  getCirculeSeat(BuildContext context, bool isSeatActive, UserEppo? passenger,
      int seatNumber) {
    return GestureDetector(
      onTap: passenger != null ? () => showPassenger(context, passenger) : null,
      child: Container(
        decoration: BoxDecoration(
          color: isSeatActive ? Colors.green : Colors.white,
          borderRadius: BorderRadius.circular(50),
        ),
        height: 50,
        width: 50,
        child: Center(child: Text("$seatNumber")),
      ),
    );
  }
}
