part of '__payment.dart';

//########### constantes
const _TEXT_TITLE_SCREEN = 'Métodos de pago';
const _TEXT_NO_DATA = 'No hay métodos de pago registrados!';
const _TEXT_BTN_SAVE = 'Guardar';
//################# functions

_goToCreatePage(BuildContext context) {
  final paymentmethodBloc = BlocProvider.of<PaymentmethodBloc>(context);
  final payment = PaymentModel();
  paymentmethodBloc.add(OnCreateEditPayment(payment));
  Navigator.pushNamed(context, 'create_payment_screen');
}

_goToCreateOrEditPage(BuildContext context, PaymentModel payment) {
  final paymentmethodBloc = BlocProvider.of<PaymentmethodBloc>(context);
  paymentmethodBloc.add(OnCreateEditPayment(payment));
  Navigator.pushNamed(context, 'create_payment_screen');
}

_goToEditPayment(BuildContext context, PaymentModel payment) {
  final paymentmethodBloc = BlocProvider.of<PaymentmethodBloc>(context);
  paymentmethodBloc.add(OnCreateEditPayment(payment));
  Navigator.pushNamed(context, 'create_payment_screen');
}

_savePayment(
    BuildContext context, PaymentModel payment, FormSubmitTypeState state) {
  final paymentmethodBloc = BlocProvider.of<PaymentmethodBloc>(context);
  paymentmethodBloc.add(OnSavePayment(payment, state));
}
