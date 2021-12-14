import 'package:attendance/facultylogin2.dart';
import 'package:attendance/nodata.dart';
import 'package:flutter/material.dart';
import 'firestore.dart';
class Facaftlogin extends StatefulWidget {
  @override
  _FacaftloginState createState() => _FacaftloginState();
}

class _FacaftloginState extends State<Facaftlogin> {
  String dropdownvalue1 = "select";
  String dropdownvalue2 = "select";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar( backgroundColor: Colors.teal[800],
          title: Text("Select Class"),
        ),
        body: Card(
          color: Colors.teal[200],
            margin: EdgeInsets.all(20),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                        child: Text("Year"),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(85, 10, 80, 10),
                        child: Text("Branch"),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                      child: DropdownButton<String>(
                        value: dropdownvalue2,
                        icon: const Icon(Icons.arrow_drop_down_circle_rounded),
                        iconSize: 24,
                        elevation: 16,
                        style: const TextStyle(color: Colors.black),
                        underline: Container(
                          height: 2,
                          color: Colors.black,
                        ),
                        onChanged: (String newValue) {
                          setState(() {
                            dropdownvalue2 = newValue;
                          });
                        },
                        items: <String>[
                          'select',
                          '2017',
                          '2018',
                          '2019',
                          '2020'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(115, 0, 0, 0),
                      child: DropdownButton<String>(
                        value: dropdownvalue1,
                        icon: const Icon(Icons.arrow_drop_down_circle_rounded),
                        iconSize: 24,
                        elevation: 16,
                        style: const TextStyle(color: Colors.black),
                        underline: Container(
                          height: 2,
                          color: Colors.black,
                        ),
                        onChanged: (String newValue) {
                          setState(() {
                            dropdownvalue1 = newValue;
                          });
                        },
                        items: <String>['select', 'CSE', 'IT', 'ECE', 'EIE']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
                MaterialButton(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
                    child: Text("Search"),
                  ),
                   onPressed:(){
                    FlutterFirestore().totalattcount();
                    if(dropdownvalue1 == 'IT' && dropdownvalue2 == '2017'){
                     Navigator.push(context, MaterialPageRoute(builder: (context)=> Facaftlog2()));
                    }
                    else{
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> no() ));
                    }
                   } ,
                ),
              ],
            )
        )
    );;
  }
}
