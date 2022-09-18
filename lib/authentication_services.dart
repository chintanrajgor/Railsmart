import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:railsmart/ggsignin.dart';

import 'booktrain.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth;
  AuthenticationService(this._firebaseAuth);
  final _authorityRef = FirebaseFirestore.instance.collection('authority');
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();
  late var username = 'temp';
  Future<String?> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<String?> signIn(
      {required String email, required String password}) async {
    try {
      final usercred = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      print(usercred);
      final user = usercred.user?.uid;
      //print(user);
      final authority = await _authorityRef.doc(user).get();
      //print(authority);
      final priv = authority.get('priviledge');
      print(priv);
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<String?> signup(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);

      return "Signed up Successfully.";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }
}
