import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eppo/modules/admin/payment_method/__payment.dart';

class PaymentService {
  PaymentService() {
    log('Se creo el servicio Payment');
  }

  final CollectionReference _paymentReference =
      FirebaseFirestore.instance.collection('payment_methods');

  Stream<QuerySnapshot> get payment {
    return _paymentReference.snapshots();
  }

  Future<void> save(PaymentModel model) async {
    await _paymentReference.doc(model.uid).set(model.toJson());
  }
}
