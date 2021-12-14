import 'package:attendance/firebase.dart';
import 'package:attendance/firestore.dart';
import 'package:attendance/studentlogin1.dart';
import 'package:attendance/studentsignup.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'global.dart' as Gl;
import 'package:provider/provider.dart';

class Stdlogin extends StatefulWidget {
  @override
  _StdloginState createState() => _StdloginState();
}

class _StdloginState extends State<Stdlogin> {
  TextEditingController stdemail = TextEditingController();
  TextEditingController stdpass = TextEditingController();
  @override
  void dispose() {
    stdemail.dispose();
    stdpass.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF110632),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 100, 20, 20),
                  child: Text(
                    "\t\t\t\t\t\t\t ADIKAVI NANNAYA UNIVERSITY \n UNIVERSITY COLLEGE OF ENGINEERING",
                    style: GoogleFonts.getFont('Lato',
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Image.asset(
                  "assets/images/aknulogo.png",
                  height: MediaQuery.of(context).size.width / 3.5,
                ),
                Card(
                  margin: EdgeInsets.all(20),
                  child: SingleChildScrollView(
                    child: Form(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: Text("Student Login"),
                          ),
                          TextFormField(
                            controller: stdemail,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              labelText: "Email Address",
                              prefixIcon: Icon(Icons.email_rounded),
                            ),
                          ),
                          TextFormField(
                            obscureText: true,
                            controller: stdpass,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                              labelText: "PassWord",
                              prefixIcon: Icon(Icons.vpn_key_rounded),
                            ),
                          ),
                          TextButton(
                              child: Text("Login"),
                              onPressed: () {
                                Gl.stdemail1 = stdemail.text;
                                context.read<Authenticate>().stusignIn(
                                      email: stdemail.text.trim(),
                                      password: stdpass.text.trim(),
                                      context: context,
                                    );
                                FlutterFirestore().studentdetails();
                                FlutterFirestore().totalattcount();
                                FlutterFirestore().printcount();
                              }),
                          MaterialButton(
                              color: Color(0xFF110632),
                              child: Text(
                                "SignUp",
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () {
                                Gl.stdemail1 = stdemail.text.trim();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Stdsignup()));
                              })
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
