import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eppo/models/user.model.dart';

class UserService {
  UserService() {
    print('Se creo el servicio USer');
  }

  final CollectionReference _userReference =
      FirebaseFirestore.instance.collection('users');

  Stream<QuerySnapshot> get users {
    return _userReference.snapshots();
  }

  Future<void> save(UserEppo user) async {
    await _userReference.doc(user.uid).set(user.toJson());
  }
}
