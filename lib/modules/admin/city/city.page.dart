import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eppo/modules/admin/city/city.model.dart';
import 'package:eppo/widgets/widgets.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/city_bloc.dart';

class CityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Locales'),
      ),
      body: _CityBody(),
      drawer: CustomDrawerView(),
    );
  }
}

class _CityBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CityBloc, CityState>(
      builder: (context, state) {
        return StreamBuilder(
          stream: state.citiesStream,
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData)
              return Center(
                child: Text('No hay locales registrados!'),
              );
            final documents = snapshot.data?.docs;
            return ListView.builder(
              itemCount: documents?.length ?? 0,
              itemBuilder: (context, index) {
                final cityDoc = documents?[index];
                final city = CityModel.fromFirestoreDocument(cityDoc);
                return ListTile(
                  leading: Icon(Icons.public),
                  title: Text(city.capitalName),
                  subtitle: Text(city.address ?? ''),
                );
              },
            );
          },
        );
      },
    );
  }
}
