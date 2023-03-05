
// ignore_for_file: unused_import, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth_app/constants.dart';
import 'package:firebase_auth_app/screens/auth.dart';
import 'package:firebase_auth_app/screens/home_screen.dart';
import 'package:firebase_auth_app/screens/login_screen.dart';
import 'package:firebase_auth_app/screens/signup_screen.dart';
import 'package:firebase_auth_app/widgets/home/home_body.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      theme: ThemeData(
         primarySwatch: Colors.green,
         
         primaryColor:  kPrimaryColor,
         ),
     





      routes: {
        '/':(context) => Auth(),
        'loginScreen':(context) => loginScreen() ,
        'homeScreen':(context) => HomeScreen() ,
        'signupScreen':(context) => SignUpScreen() ,
      }






            // localizationsDelegates:[
      //   GlobalCupertinoLocalizations.delegate,
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
       
      // ],

      // supportedLocales: [Locale("ar","AE")],
      // locale: Locale("ar","AE"),




    );
  }
}


