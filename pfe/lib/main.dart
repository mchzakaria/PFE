import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pfe/pages/HomePage.dart';
import 'package:pfe/pages/signup.dart';
import 'pages/login.dart';
import 'pages/welcome.dart';


void main() async{
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  } catch (e) {
    print('Error initializing Firebase: $e');
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      // debugShowCheckedModeBanner: false,
      // home: StreamBuilder<User?>(
      //   stream: FirebaseAuth.instance.authStateChanges(),
      //   builder: (context, snapchot){
      //     if(snapchot.hasData){
      //       return const HomePage();
      //     }
      //     else {
      //       return const Login();
      //     }
      //   }
      // ),
      initialRoute: "/login",
      routes: {
        "/": (context)=> const Welcome(),
        "/login": (context)=> const Login(),
        "/signup": (context)=> const Signup(),
      },
    );
  }
}