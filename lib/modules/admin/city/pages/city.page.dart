part of '../__city.dart';

class CityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_TEXT_TITLE_SCREEN),
        ),
        body: _CityBody(),
        drawer: CustomDrawerView(),
        floatingActionButton: _CreateFloatingButton());
  }
}

class _CreateFloatingButton extends StatelessWidget {
  const _CreateFloatingButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => _goToCreatePage(context),
      child: Icon(Icons.add),
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
                child: Text(_TEXT_NO_DATA),
              );
            final documents = snapshot.data?.docs;
            return ListView.builder(
              itemCount: documents?.length ?? 0,
              itemBuilder: (context, index) {
                final cityDoc = documents?[index];
                final city = CityModel.fromFirestoreDocument(cityDoc);
                return ListTile(
                  onTap: () => _goToEditeCity(context, city),
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
