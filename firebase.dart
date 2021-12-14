import 'package:attendance/facultylogin1.dart';
import 'package:attendance/studentlogin1.dart';
import 'package:flutter/material.dart';
import 'package:attendance/facultylogin.dart';
import 'package:attendance/firestore.dart';
import 'studentlogin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'global.dart' as Gl;

class Authenticate {
  final FirebaseAuth _firebaseAuth;
  Authenticate(this._firebaseAuth);
  Stream<User> get authStateChanges => _firebaseAuth.idTokenChanges();
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<String> signIn(
      {String email, String password, BuildContext context}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      print("signed in");
      FlutterFirestore().totalattcount();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Facaftlogin(),
        ),
      );
      return "success";
    } on FirebaseAuthException catch (e) {
      print(e.toString());
      return e.message;
    }
  }

  Future<String> stusignIn(
      {String email, String password, BuildContext context}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      print("signed in");
      FlutterFirestore().studentdetails();
      FlutterFirestore().totalattcount();
      FlutterFirestore().printcount();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Afstulog(),
        ),
      );
      return "success";
    } on FirebaseAuthException catch (e) {
      print(e.toString());
      return e.message;
    }
  }

  Future<String> signUp(
      {String email, String password, BuildContext context}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      FlutterFirestore().studentsetup();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Faclogin(),
        ),
      );
      return "success";
    } on FirebaseAuthException catch (e) {
      print(e.toString());
      return e.message;
    }
  }

  Future<String> stsignUp(
      {String name,
      String regnum,
      String branch,
      String email,
      String password,
      BuildContext context}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      FlutterFirestore().studentsetup();
      FlutterFirestore().studentpycharm();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Stdlogin(),
        ),
      );
      return "success";
    } on FirebaseAuthException catch (e) {
      print(e.toString());
      return e.message;
    }
  }
}
