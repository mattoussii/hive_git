


// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, camel_case_types

import 'package:firebase_auth_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class helpScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      backgroundColor: Colors.blue[400],
      appBar: AppBar(
        
      backgroundColor: Colors.white,
      elevation: 0,
      title: Text(
        'help',
         style: GoogleFonts.robotoCondensed(
                   fontSize: 20,fontWeight: FontWeight.normal, color: Colors.black,
                  ),),
      centerTitle: false,
         leading: IconButton(
        padding: const EdgeInsets.only(right:kDefaultPadding ),
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.black,
          ),
        onPressed: (){
          Navigator.pop(context);
        },
      ),

    ),
       body:
       SafeArea(   
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('images/hive.png',
                height: 150,),
                SizedBox(height :10),
                Text(
                  'help',
                  style: GoogleFonts.robotoCondensed(
                    fontSize: 40,fontWeight: FontWeight.bold, color: Colors.black,
                  ),
                  ),
                  SizedBox(height: 50,),

                  Text(
                    'this page is not available at the moment :( ',
                     style: GoogleFonts.robotoCondensed(
                    fontSize: 18,fontWeight: FontWeight.bold, color: Colors.black,
                  ),
                  )
                  ],
                  )

    )
       )
       ),);
       

  }}