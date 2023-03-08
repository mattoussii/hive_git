// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, library_private_types_in_public_api

import 'package:firebase_auth_app/constants.dart';
import 'package:firebase_auth_app/screens/home_screen.dart';
import 'package:firebase_auth_app/screens/scanner_screen/first.dart';
import 'package:firebase_auth_app/screens/scanner_screen/second.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';





class Scanner extends StatefulWidget {
  const Scanner({super.key});

  @override
  _ScannerState createState() => _ScannerState();
}

class _ScannerState extends State<Scanner> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
                leading: IconButton(
        padding: EdgeInsets.only(right:kDefaultPadding ),
        icon: Icon(
          Icons.arrow_back,
          color: Colors.white,
          ),
        
        onPressed: (){
            Navigator.push( context,MaterialPageRoute(builder: (context) => HomeScreen() ), ); 
},
      ),


          backgroundColor: kPrimaryColor,
          bottom: const TabBar(
            tabs: [
              
              Tab(
                icon: Icon(
                  Icons.qr_code,
                  size: 40,
                  
                ),
                child: Text('create'),
              ),
              Tab(
                icon: Icon(
                  Icons.qr_code_scanner,
                  size: 40,
                  
                ),
                child: Text('scanne'),
              ),
            ],
          ),
          
      title: Text(
        ' Scanner',
        textAlign: TextAlign.left,
         style: GoogleFonts.robotoCondensed(
                    fontSize: 20,fontWeight: FontWeight.normal, color: Colors.black,
                  ),
       ),
        ),



        body: TabBarView(
          children: [
            First(),
            Second(),
          ],
        ),
      ),
    );
  }
}