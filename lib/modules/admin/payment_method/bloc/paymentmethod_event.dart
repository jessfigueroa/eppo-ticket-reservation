part of 'paymentmethod_bloc.dart';

@immutable
abstract class PaymentmethodEvent {}

class OnSubscribePayments extends PaymentmethodEvent {}

class OnCreateEditPayment extends PaymentmethodEvent {
  final PaymentModel payment;
  OnCreateEditPayment(this.payment);
}

class OnSavePayment extends PaymentmethodEvent {
  final PaymentModel payment;
  final FormSubmitTypeState state;
  OnSavePayment(this.payment, this.state);
}
