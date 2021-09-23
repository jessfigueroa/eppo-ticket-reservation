import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eppo/modules/admin/payment_method/__payment.dart';
import 'package:eppo/modules/admin/payment_method/payment.service.dart';
import 'package:eppo/states/form_submit_state.dart';
import 'package:eppo/states/submit_type.dart';
import 'package:meta/meta.dart';

part 'paymentmethod_event.dart';
part 'paymentmethod_state.dart';

class PaymentmethodBloc extends Bloc<PaymentmethodEvent, PaymentmethodState> {
  final paymentService = PaymentService();
  PaymentmethodBloc() : super(PaymentmethodState());

  @override
  Stream<PaymentmethodState> mapEventToState(PaymentmethodEvent event) async* {
    if (event is OnSubscribePayments) {
      yield* _onSunscribePayments(event);
    } else if (event is OnCreateEditPayment) {
      yield* _onCreateEditPayment(event);
    } else if (event is OnSavePayment) {
      yield* _onSavePayment(event);
    }
  }

  Stream<PaymentmethodState> _onSunscribePayments(
      OnSubscribePayments event) async* {
    yield state.copyWith(paymentStream: paymentService.payment);
  }

  Stream<PaymentmethodState> _onCreateEditPayment(
      OnCreateEditPayment event) async* {
    yield state.copyWith(payment: event.payment);
  }

  Stream<PaymentmethodState> _onSavePayment(OnSavePayment event) async* {
    yield state.copyWith(
      formSubmitState: Submitting(),
      formSubmitTypeState: event.state,
    );
    await paymentService.save(event.payment);
    yield state.copyWith(formSubmitState: SuccessSubmit());
  }
}
