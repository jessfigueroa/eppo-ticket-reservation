import 'package:eppo/widgets/widgets.dart';
import 'package:flutter/material.dart';

class BusPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('Bus page'),
      ),
      drawer: CustomDrawerView(),
    );
  }
}
