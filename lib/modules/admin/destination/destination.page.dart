import 'package:eppo/widgets/widgets.dart';
import 'package:flutter/material.dart';

class DestinationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('Hola destinatio'),
      ),
      drawer: CustomDrawerView(),
    );
  }
}
