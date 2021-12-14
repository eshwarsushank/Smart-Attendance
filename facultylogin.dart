import 'package:attendance/facultylogin1.dart';
import 'package:attendance/facultysignup.dart';
import 'package:attendance/firebase.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
class Faclogin extends StatefulWidget {
  @override
  _FacloginState createState() => _FacloginState();
}

class _FacloginState extends State<Faclogin> {
  TextEditingController facemail=TextEditingController();
  TextEditingController facpass = TextEditingController();
  @override

  void dispose()
  {
    facemail.dispose();
    facpass.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.teal[800],
        body: SingleChildScrollView(
          child: Center(child:
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20,100,20,20),

                child: Text(
                    "\t\t\t\t\t\t\t ADIKAVI NANNAYA UNIVERSITY \n UNIVERSITY COLLEGE OF ENGINEERING",
                    style: GoogleFonts.getFont('Lato',color: Colors.white,
                    fontSize:16,
                    fontWeight: FontWeight.bold
                    ),

                ),
              ),
              Image.asset("assets/images/aknulogo.png",height: MediaQuery.of(context).size.width/3.5,),
              Card(
                margin: EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Form(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0,10,0,0),
                          child: Text("Faculty Login"),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0,0,0),
                          child: TextFormField(
                            controller: facemail,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              labelText: "Email Address",prefixIcon: Icon(Icons.email_rounded),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: TextFormField(
                            obscureText: true,
                            controller: facpass,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                              labelText: "PassWord",
                              prefixIcon: Icon(Icons.vpn_key_rounded),
                            ),
                          ),
                        ),
                        FlatButton(child: Text("Login"),
                        onPressed:(){
                          context.read<Authenticate>().signIn(
                              email: facemail.text.trim(),
                          password: facpass.text.trim(),
                          context: context
                          );
                        }
                        ),
                        MaterialButton(color:Colors.teal,child: Text("SignUp",style: TextStyle(color: Colors.white),),
                              onPressed:() {

                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => Facsignup() ));
                              })],
                    ),

                  ),
                ),
              )
            ],
          ),

          ),
        )
    );
  }
}
