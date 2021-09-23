part of 'paymentmethod_bloc.dart';

@immutable
class PaymentmethodState {
  final Stream<QuerySnapshot>? paymentStream;
  final PaymentModel? payment;
  final FormSubmitState formSubmitState;
  final FormSubmitTypeState formSubmitTypeState;

  PaymentmethodState({
    this.paymentStream,
    this.payment,
    FormSubmitState? formSubmitState,
    FormSubmitTypeState? formSubmitTypeState,
  })  : formSubmitState = formSubmitState ?? NoSubmit(),
        formSubmitTypeState = formSubmitTypeState ?? NoType();

  PaymentmethodState copyWith({
    Stream<QuerySnapshot>? paymentStream,
    PaymentModel? payment,
    FormSubmitState? formSubmitState,
    FormSubmitTypeState? formSubmitTypeState,
  }) =>
      PaymentmethodState(
        paymentStream: paymentStream ?? this.paymentStream,
        payment: payment ?? this.payment,
        formSubmitState: formSubmitState ?? this.formSubmitState,
        formSubmitTypeState: formSubmitTypeState ?? this.formSubmitTypeState,
      );
}
