import 'package:cloud_firestore/cloud_firestore.dart';

class CityService {
  CityService() {
    print('Se creo el servicio City');
  }

  final CollectionReference _cityReference =
      FirebaseFirestore.instance.collection('cities');

  Stream<QuerySnapshot> get cities {
    return _cityReference.snapshots();
  }
}
