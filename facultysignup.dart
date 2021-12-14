import 'package:attendance/facultylogin.dart';
import 'package:attendance/firebase.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'global.dart' as Gl;

class Facsignup extends StatefulWidget {
 // Facsignup({Key key}):super(key:key);
  @override
  _FacsignupState createState() => _FacsignupState();
}

class _FacsignupState extends State<Facsignup> {

  TextEditingController facname1 = TextEditingController();
  TextEditingController facemail1 = TextEditingController();
  TextEditingController facpass1 = TextEditingController();
  bool passwordvisibility = false;

  // final formkey = GlobalKey<FormState>();
  // final Scaffoldkey = GlobalKey<ScaffoldState>();
  @override
  void dispose() {
    facname1.dispose();
    facemail1.dispose();
    facpass1.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar( backgroundColor: Colors.teal[800],
          title: Text('sign Up'),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: TextField(
                    //obscureText: true,
                    maxLength: 50,
                    autofocus: true,
                    controller: facname1,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      labelText: 'Full Name',
                    ),
                  ),
                ),
                TextField(
                  //obscureText: true,
                  maxLength: 50,
                  autofocus: true,
                  controller: facemail1,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    labelText: 'Email Id',
                  ),
                ),

                TextField(
                  obscureText: true,
                  maxLength: 20,
                  autofocus: true,
                  controller: facpass1,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    labelText: 'PassWord',
                  ),
                ),
                MaterialButton(color: Colors.teal[800],
                  child: Text("SignUp",style: TextStyle(color:Colors.white,)),
                  onPressed: () {
                    context.read<Authenticate>().signUp(
                        email: facemail1.text.trim(),
                        password: facpass1.text.trim(),
                        context: context
                    );
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Faclogin(),));
                  },
                )
              ]
          ),
        )
    );
  }
}
