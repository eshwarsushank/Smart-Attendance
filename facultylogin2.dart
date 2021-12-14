import 'package:attendance/firestore.dart';
import 'package:attendance/firstpage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'global.dart' as Gl;

class Facaftlog2 extends StatefulWidget {
  Facaftlog2({Key key}) : super(key: key);
  @override
  _Facaftlog2State createState() => _Facaftlog2State();
}

class _Facaftlog2State extends State<Facaftlog2> {
  CollectionReference aff = FirebaseFirestore.instance.collection("Student");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Class Attendance"),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
                stream: aff.snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: Text('Loading..'),
                    );
                  }
                  return ListView(
                    children: snapshot.data.docs.map((aff) {
                      return Center(
                        child: ListTile(
                          title: Column(
                            children: [
                              Text("NAME : "+aff['name']),
                              Text("RollNumber: "+aff['rollnumber']),
                              Text("No of Days Attended : "+aff['count'].toString()),
                              Text("Percent : "+(aff['count']/Gl.totalcount*100).toString()),
                              Text("_____________________________________"),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  );
                }),
          ),
          MaterialButton(color: Colors.teal[800],
              child: Text("LOGOUT",style: TextStyle(color: Colors.white),),
              onPressed:(){ Navigator.push(context, MaterialPageRoute(builder: (context)=>First()) );}
          )],
      ),
    );
  }
}
