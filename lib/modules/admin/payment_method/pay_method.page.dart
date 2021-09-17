import 'package:eppo/widgets/widgets.dart';
import 'package:flutter/material.dart';

class PaymentMethodPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('Hola Payment Method'),
      ),
      drawer: CustomDrawerView(),
    );
  }
}
