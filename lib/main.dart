
// ignore_for_file: unused_import, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth_app/constants.dart';
import 'package:firebase_auth_app/screens/Auth/login.dart';
import 'package:firebase_auth_app/screens/Auth/signup.dart';
import 'package:firebase_auth_app/screens/Auth/success.dart';
import 'package:firebase_auth_app/screens/Map.dart';

import 'package:firebase_auth_app/screens/firebase_auth/auth.dart';
import 'package:firebase_auth_app/screens/gallery/add_photo.dart';
import 'package:firebase_auth_app/screens/gallery/edit_photo.dart';
import 'package:firebase_auth_app/screens/gallery/gallery.dart';
import 'package:firebase_auth_app/screens/help.dart';
import 'package:firebase_auth_app/screens/historique/history.dart';
import 'package:firebase_auth_app/screens/ruche/add_ruche.dart';
import 'package:firebase_auth_app/screens/ruche/edit_ruche.dart';
import 'package:firebase_auth_app/screens/ruche/ruche.dart';
import 'package:firebase_auth_app/screens/visite/add.dart';
import 'package:firebase_auth_app/screens/home.dart';
import 'package:firebase_auth_app/screens/firebase_auth/login_screen.dart';
import 'package:firebase_auth_app/screens/firebase_auth/signup_screen.dart';
import 'package:firebase_auth_app/screens/visite/edit.dart';
import 'package:firebase_auth_app/screens/visite/visite.dart';
import 'package:firebase_auth_app/shop/shopWidgets/home_body.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences sharedPref ;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPref = await SharedPreferences.getInstance() ; 
  // await Firebase.initializeApp();
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
         textTheme: TextTheme(
          displayMedium: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.normal, 
          color: Colors.black,                
          )
         ),
         primaryColor:  kPrimaryColor,
         ),
     
      title: "Hive",
     
       initialRoute: sharedPref.getString("id") == null ? "login" : "home" ,
     
       routes: {
       'history':(context) => HistoryScreen(),
        'signup':(context) => signup(),
        'login':(context) => Login(),
        'home':(context) => HomeScreen() ,
        'success':(context) => success() ,
        
        'visite':(context) => visiteScreen() ,
        'add':(context) => add() ,
        'edit':(context) => edit() ,
       
        'map':(context) => Map_screen() ,
        'editp':(context) => edit_photo() ,
        'addp':(context) => add_photo() ,
       
        'gallery':(context) => Gallery() ,
        'help':(context) => helpscreen() ,
        
        'ruche':(context) => rucheScreen() ,
        'add_ruche':(context) => add_ruche() ,
        'edit_ruche':(context) => edit_ruche() ,



        

        
        // 'loginScreen':(context) => loginScreen() ,
        // 'signupScreen':(context) => SignUpScreen() ,
        
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


