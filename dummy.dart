import 'package:attendance/firstpage.dart';
import 'package:flutter/material.dart';
import 'global.dart' as Gl;
class dummy extends StatefulWidget {
  @override
  _dummyState createState() => _dummyState();
}

class _dummyState extends State<dummy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("Attendance"),
      ),
      body:Column(children: [
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

        Row(
            children: [
              Text("TOTAL NUMBER OF DAYS ATTENDED:"),
              Text(Gl.count20.toString()),
            ],
          ),
       Row(
         children: [
           Text("total num of days:"),
           Text(Gl.totalcount.toString()),
         ],
       ),
        Row(
          children: [
            Text("Attendance Percentage: "),
            Text(((Gl.count20/Gl.totalcount)*100).toString()+"%"),
          ],
        ),
        MaterialButton(
            child: Text('Logout'),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => First()));
            })
      ]),
    );
  }
}
