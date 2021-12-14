import 'package:attendance/facultylogin.dart';
import 'package:attendance/studentlogin.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class First extends StatefulWidget {
  @override
  _FirstState createState() => _FirstState();
}

class _FirstState extends State<First> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Attendance"),
      ),
    body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
              "assets/images/nblock.png",
          ),fit: BoxFit.fill
        )
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 80, 0, 0),
            child: Text("Attendance Portal Login",style: GoogleFonts.getFont('Lato',color: Colors.black87,fontSize: 30,fontWeight: FontWeight.bold),),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(25,20,20,60),
                child: ElevatedButton(
                    child: Text("Faculty"),
                    onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Faclogin()),
                  );}, ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(40,0,10,40),
                child: ElevatedButton(
                  child: Text("Student"),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Stdlogin()),
                    );}, ),
              )
            ],
          ),

        ],
      ),
    ),
    );
  }
}
