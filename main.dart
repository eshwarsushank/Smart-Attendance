import 'package:attendance/firebase.dart';
import 'package:attendance/firstpage.dart';
import 'package:attendance/splash.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'firebase.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<Authenticate>(
          create: (_) => Authenticate(FirebaseAuth.instance),
        ),
        StreamProvider(
            create: (context) => context.read<Authenticate>().authStateChanges,
            initialData: null
        )
      ],

      child: MaterialApp(
        debugShowCheckedModeBanner: false,

        home: SplashScreen(),
      ),
    );
  }
}
