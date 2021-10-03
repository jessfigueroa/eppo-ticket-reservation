part of '../__payment.dart';

class PaymentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_TEXT_TITLE_SCREEN),
      ),
      body: _PaymentBody(),
      drawer: CustomDrawerView(),
      floatingActionButton: _CreateFloatingButton(),
    );
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

class _PaymentBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentmethodBloc, PaymentmethodState>(
      builder: (context, state) {
        return StreamBuilder(
          stream: state.paymentStream,
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData)
              return Center(
                child: Text(_TEXT_NO_DATA),
              );
            final documents = snapshot.data?.docs;
            return ListView.builder(
              itemCount: documents?.length ?? 0,
              itemBuilder: (context, index) {
                final paymentDoc = documents?[index];
                final payment = PaymentModel.fromFirestoreDocument(paymentDoc);
                return FatButtonIcon(
                  payment.iconData,
                  payment.capitalName,
                  () => _goToEditPayment(context, payment),
                  color1: payment.colorDataA,
                  color2: payment.colorDataB,
                );
                // return ListTile(
                //   onTap: () => _goToEditPayment(context, payment),
                //   leading: Icon(payment.icon),
                //   title: Text(payment.capitalName),
                //   subtitle: Text(payment.statusName),
                // );
              },
            );
          },
        );
      },
    );
  }
}
