part of '../__destination.dart';

class DestinationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DestinationBloc, DestinationState>(
      builder: (context, state) {
        print(state.cityName);
        return Scaffold(
          appBar: AppBar(
            title: Text('Destinos - ${state.cityName}'),
          ),
          body: DestinationBody(),
        );
      },
    );
  }
}

class DestinationBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final List<CityModel> cities = _getStaticCities();
    return BlocBuilder<DestinationBloc, DestinationState>(
      builder: (context, state) {
        return FutureBuilder(
          future: state.destinations!.get(),
          builder: (
            BuildContext context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot,
          ) {
            if (!snapshot.hasData)
              return Center(
                child: Text(_TEXT_NO_DATA),
              );
            final destinies = snapshot.data!.docs;
            if (destinies.length == 0)
              return Center(
                child: Text(_TEXT_NO_DATA),
              );
            return ListView.builder(
              itemCount: destinies.length,
              itemBuilder: (context, index) {
                final json = destinies[index].data();
                final destiny = Destination.fromJsonData(json);
                final travelTime = getCantidadYTiempo(destiny.travelTime! * 60);
                return ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, 'schedule_screen');
                  },
                  title: Text(destiny.name!.toUpperCase()),
                  subtitle: Text(
                    "${travelTime['cantidad']} ${travelTime['tiempo']} - S/. ${destiny.price}",
                  ),
                );
                // return Container(
                //   decoration: BoxDecoration(
                //       color: Color.fromRGBO(224, 181, 255, 1),
                //       borderRadius: BorderRadius.circular(20),
                //       boxShadow: [
                //         BoxShadow(
                //           color: Colors.grey.shade400,
                //           blurRadius: 1,
                //           spreadRadius: 2,
                //           offset: Offset(-0.5, 0.5),
                //         )
                //       ]),
                //   margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                //   padding: EdgeInsets.all(10),
                //   height: 80,
                //   width: getCurrentWidth(context, 0.5),
                //   child: Center(
                //     child: Text(
                //       destiny.name!,
                //       style: TextStyle(fontWeight: FontWeight.bold),
                //     ),
                //   ),
                // );
              },
            );
          },
        );
      },
    );
  }

  // _getStaticCities() {
  //   List<CityModel> cities = [
  //     CityModel(
  //       name: 'Piura',
  //       address: 'Anexo Andrés Avelino Cáceres, Piura 20001',
  //       latitude: "-5.182155497453376",
  //       longitude: "-80.64317018117018",
  //       status: true,
  //       destinations: getPiuraDestinations(),
  //     ),
  //     CityModel(
  //       name: 'Talara',
  //       address: 'Av Talara',
  //       latitude: "-5.182155497453376",
  //       longitude: "-80.64317018117018",
  //       status: true,
  //       destinations: getTalaraDestinations(),
  //     ),
  //     CityModel(
  //       name: 'Tumbes',
  //       address: 'Av Tumbes 123',
  //       latitude: "-5.182155497453376",
  //       longitude: "-80.64317018117018",
  //       status: true,
  //       destinations: getTumbesDestinations(),
  //     )
  //   ];
  //   return cities;
  // }

  // getPiuraDestinations() {
  //   final List<Destination> destinations = [
  //     Destination(
  //       name: 'Tumbes',
  //       price: 20,
  //       status: true,
  //       travelTime: 45,
  //     ),
  //     Destination(
  //       name: 'Mancora',
  //       status: true,
  //       travelTime: 45,
  //       price: 20,
  //     ),
  //     Destination(
  //       name: 'Los organos',
  //       status: true,
  //       travelTime: 45,
  //       price: 20,
  //     ),
  //     Destination(
  //       name: 'Talara',
  //       status: true,
  //       travelTime: 45,
  //       price: 20,
  //     ),
  //   ];
  //   return destinations;
  // }

  // getTalaraDestinations() {
  //   final List<Destination> destinations = [
  //     Destination(
  //       name: 'Tumbes',
  //       price: 20,
  //       status: true,
  //       travelTime: 45,
  //     ),
  //     Destination(
  //       name: 'Mancora',
  //       status: true,
  //       travelTime: 45,
  //       price: 20,
  //     ),
  //     Destination(
  //       name: 'Los organos',
  //       status: true,
  //       travelTime: 45,
  //       price: 20,
  //     ),
  //     Destination(
  //       name: 'Piura',
  //       status: true,
  //       travelTime: 45,
  //       price: 20,
  //     ),
  //   ];
  //   return destinations;
  // }

  // getTumbesDestinations() {
  //   final List<Destination> destinations = [
  //     Destination(
  //       name: 'Piura',
  //       price: 20,
  //       status: true,
  //       travelTime: 45,
  //     ),
  //     Destination(
  //       name: 'Mancora',
  //       status: true,
  //       travelTime: 45,
  //       price: 20,
  //     ),
  //     Destination(
  //       name: 'Los organos',
  //       status: true,
  //       travelTime: 45,
  //       price: 20,
  //     ),
  //     Destination(
  //       name: 'Talara',
  //       status: true,
  //       travelTime: 45,
  //       price: 20,
  //     ),
  //   ];
  //   return destinations;
  // }
}
