import 'package:attendance/dummy.dart';
import 'package:attendance/firstpage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'global.dart' as Gl;
import 'firestore.dart';
import 'studentlogin.dart';

class Afstulog extends StatefulWidget {
  @override
  _AfstulogState createState() => _AfstulogState();
}

class _AfstulogState extends State<Afstulog> {
  CollectionReference aff1 = FirebaseFirestore.instance.collection("Student");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student Details"),
      ),
      body: Column(children: [
        Row(
          children: [Text("NAME:"), Text(Gl.stdname1)],
        ),
        Row(
          children: [Text("BRANCH:"), Text(Gl.stdbranch1)],
        ),

        Row(
          children: [
            Text("Year:"),
            Text("4"),
          ],
        ),
        Row(
          children: [
            Text("REGISTER NUMBER:"),
            Text(Gl.stdregister1),
          ],
        ),

        // Row(
        //     children: [
        //       Text("TOTAL NUMBER OF DAYS ATTENDED:"),
        //       Text(Gl.count20.toString()),
        //     ],
        //   ),
        //
        // Row(
        //   children: [
        //     Text("Attendance Percentage: "),
        //     Text(Gl.count20/Gl.totalcount*100),
        //   ],
        // ),
        MaterialButton(
            child: Text('show Attendance'),
            onPressed: () {
              FlutterFirestore().studentdetails();
              FlutterFirestore().totalattcount();
              FlutterFirestore().printcount();
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => dummy()));
            })
      ]),
    );
  }
}
