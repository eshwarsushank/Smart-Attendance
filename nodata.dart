import 'package:attendance/firstpage.dart';
//import 'package:/startpage.dart';
import 'package:flutter/material.dart';
class no extends StatefulWidget {

  @override
  _noState createState() => _noState();
}

class _noState extends State<no> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0,100,0,0),
              child: Text('NO DATA',style: TextStyle(color: Colors.red,fontSize: 50),),
            ),
            SizedBox(height: 40,width: 30),
            MaterialButton(
              color: Colors.teal[800],
              child: Text('Logout',style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold,color: Colors.white),),

              onPressed: (){
                Navigator.push(context,MaterialPageRoute(builder: (context)=> First()));
              },
            )
          ],
        ),
      ),


    );

  }
}