import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase.dart';
import 'global.dart' as Gl;
import 'package:flutter/material.dart';

class FlutterFirestore {
  var count;
  var totalcount;
  Future<void> studentsetup() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference studentdetails =
        FirebaseFirestore.instance.collection("studentdetails");
    return studentdetails
        .doc(Gl.stdemail1)
        .set({
          'name': Gl.stdname1,
          'regnum': Gl.stdregister1,
          'branch': Gl.stdbranch1
        })
        .then((value) => print("user added"))
        .catchError((error) => print("failed to add user:$error"));
  }

  Future<String> studentdetails() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference studentdetails =
        FirebaseFirestore.instance.collection("studentdetails");
    studentdetails
        .doc(Gl.stdemail1)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      print("document exists on database");
      print(documentSnapshot.data());
      Gl.stdname1 = documentSnapshot.get('name');
      Gl.stdbranch1 = documentSnapshot.get('branch');
      Gl.stdregister1 = documentSnapshot.get('regnum');

      print(Gl.stdname1);
      print(Gl.stdbranch1);
      print(Gl.stdregister1);
    });
  }

  Future<void> totalattcount() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference date = FirebaseFirestore.instance.collection('date');
    var snapshot2 = await date.get();
    totalcount = snapshot2.size;
    print(totalcount);
    Gl.totalcount = this.totalcount;
  }


  Future<void> studentpycharm() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference Student =
        FirebaseFirestore.instance.collection("Student");
    return Student.doc(Gl.stdname1)
        .set({
          'name': Gl.stdname1,
          'rollnumber': Gl.stdname1,
          'count': 0,
        })
        .then((value) => print("user added"))
        .catchError((error) => print("failed to add user:$error"));
  }

  Future<void> printcount() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference student = FirebaseFirestore.instance.collection("Student");
    student.doc(Gl.stdname1).get().then((DocumentSnapshot document111) async {
     var snapshot = await student.doc(Gl.stdname1).collection(Gl.stdname1).get();
     this.count = snapshot.size;
     print(count);
     Gl.count20 = this.count;
     print(Gl.count20);
    });
  }
}
