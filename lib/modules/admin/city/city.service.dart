import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eppo/modules/admin/city/__city.dart';

class CityService {
  CityService() {
    print('Se creo el servicio City');
  }

  final CollectionReference _cityReference =
      FirebaseFirestore.instance.collection('cities');

  Stream<QuerySnapshot> get cities {
    return _cityReference.snapshots();
  }

  Future<void> save(CityModel city) async {
    await _cityReference.doc(city.uid).set(city.toJson());
  }
}
