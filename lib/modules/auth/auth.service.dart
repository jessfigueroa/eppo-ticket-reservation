import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eppo/enums/enum.dart';
import 'package:eppo/models/user.model.dart';
import 'package:eppo/modules/auth/response_auth.model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_logs/flutter_logs.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore store = FirebaseFirestore.instance;
  GoogleSignIn googleSignIn = GoogleSignIn();
  CollectionReference get _userReference => store.collection('users');

  AuthService() {
    print('Se creó el servicio AutService');
  }

  Future<AuthResponse> createAccount(
    String email,
    String password,
  ) async {
    UserEppo loginUser = UserEppo();
    AuthResponse resp = AuthResponse(exito: true, error: '', user: loginUser);
    try {
      final authUser = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (authUser.user != null) {
        loginUser.uid = authUser.user?.uid;
        loginUser.email = email;
        loginUser.createAt = DateTime.now();
        loginUser.emailVerified = false;
        loginUser.lastSignInTime = DateTime.now();
        loginUser.providerId = 'firebase';
        loginUser.userIsLogin = true;
        loginUser.name = email.split('@')[0];
        loginUser.rol = 'CLIENTE';
        this._userReference.doc(loginUser.uid).set(loginUser.toJson());
      }
    } catch (e) {
      FlutterLogs.logError('AuthService', 'createAccount', e.toString());
      resp.error = e.toString();
      resp.exito = false;
    }
    return resp;
  }

  Future<AuthResponse> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    UserEppo loginUser;
    AuthResponse resp = AuthResponse(exito: true, error: '');
    try {
      final authResult = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final firebaseUser = authResult.user;
      if (firebaseUser != null) {
        final userDoc = await this._userReference.doc(firebaseUser.uid).get();
        loginUser = UserEppo.fromFirabaseDocumentSnapshot(userDoc);
      } else {
        loginUser = UserEppo(userIsLogin: false);
      }
    } catch (e) {
      FlutterLogs.logError(
        'AuthService',
        'signInWithEmailAndPassword',
        e.toString(),
      );
      loginUser = UserEppo(userIsLogin: false);
      resp.exito = false;
      resp.error = e.toString();
    }
    resp.user = loginUser;
    return resp;
  }

  logOut() async {
    if (await googleSignIn.isSignedIn()) {
      googleSignIn.disconnect();
    }
  }

  Future<AuthResponse> signInWithGoogle({bool isLogin = true}) async {
    UserEppo loginUser;
    AuthResponse resp = AuthResponse(exito: true, error: '');
    try {
      final googleUser = await googleSignIn.signIn();
      if (googleUser != null) {
        final googleAuth = await googleUser.authentication;
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        final authResult = await auth.signInWithCredential(credential);
        final firebaseUser = authResult.user;
        if (firebaseUser != null) {
          if (!await isUserRegistered(firebaseUser.uid)) {
            if (!isLogin) {
              loginUser = UserEppo.fromGooglAuth(firebaseUser);
              this._userReference.doc(loginUser.uid).set(loginUser.toJson());
            } else {
              loginUser = UserEppo(userIsLogin: false);
              resp.exito = false;
              resp.error = "No hay un usuario asociado a este GMAIL";
              googleSignIn.disconnect();
            }
          } else {
            final userDoc =
                await this._userReference.doc(firebaseUser.uid).get();
            loginUser = UserEppo.fromFirabaseDocumentSnapshot(userDoc);
          }
          resp.user = loginUser;
        }
      }
    } catch (e) {
      FlutterLogs.logError('AuthService', 'signInWithGoogle', e.toString());
      resp.exito = false;
      resp.error = e.toString();
    }
    return resp;
  }

  Future<bool> isUserRegistered(String uid) async {
    final getRef = await this._userReference.doc(uid).get();
    return getRef.exists;
  }
}
