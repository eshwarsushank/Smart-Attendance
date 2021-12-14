import 'package:attendance/firebase.dart';
import 'package:attendance/studentlogin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'global.dart' as Gl;
class Stdsignup extends StatefulWidget {
  @override
  _StdsignupState createState() => _StdsignupState();
}

class _StdsignupState extends State<Stdsignup> {
  TextEditingController stdname1 = TextEditingController();
  TextEditingController stdemail1 = TextEditingController();
  TextEditingController stdreg1 = TextEditingController();
  TextEditingController stdbran1 = TextEditingController();
  TextEditingController stdpass1 = TextEditingController();
  @override
  void dispose() {
    stdname1.dispose();
    stdemail1.dispose();
    stdreg1.dispose();
    stdbran1.dispose();
    stdpass1.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF110632),
          title: Text('sign Up'),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: TextField(
                //obscureText: true,
                maxLength: 50,
                autofocus: true,
                controller: stdname1,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  labelText: 'Full Name',
                ),
              ),
            ),
            TextField(
              //obscureText: true,
              maxLength: 50,
              autofocus: true,
              controller: stdemail1,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                labelText: 'Email Id',
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            TextField(
              //obscureText: true,
              maxLength: 20,
              autofocus: true,
              controller: stdreg1,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                labelText: 'Register Number',
              ),
            ),
            TextField(
              obscureText: true,
              maxLength: 20,
              autofocus: true,
              controller: stdbran1,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                labelText: 'Branch',
              ),
            ),
            TextField(
              obscureText: true,
              maxLength: 20,
              autofocus: true,
              controller: stdpass1,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                labelText: 'PassWord',
              ),
            ),
            MaterialButton(
              color: Color(0xFF110632),
              child: Text(
                "SignUp",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () {
              context.read<Authenticate>().stsignUp(
                name: stdname1.text.trim(),
                regnum: stdreg1.text.trim(),
                branch: stdbran1.text.trim(),
                email: stdemail1.text.trim(),
                password: stdpass1.text.trim(),
                context: context
                );
              Navigator.push(context, MaterialPageRoute(builder: (context)=> Stdlogin(),));
              Gl.stdemail1= stdemail1.text.trim();
              Gl.stdname1= stdname1.text.trim();
              Gl.stdregister1= stdreg1.text.trim();
              Gl.stdbranch1= stdbran1.text.trim();
              },
            )
          ]),
        ));
  }
}
