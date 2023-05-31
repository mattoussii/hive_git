// ignore_for_file: file_names, camel_case_types, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, unnecessary_new, prefer_const_constructors
import 'package:firebase_auth_app/constants.dart';
import 'package:firebase_auth_app/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class Map_screen extends StatefulWidget {
  const Map_screen({super.key});

  @override
  State<Map_screen> createState() => _Map_screenState();
}

class _Map_screenState extends State<Map_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      backgroundColor: Color.fromARGB(255, 215, 222, 228),
      appBar: AppBar(
      backgroundColor: kPrimaryColor,
      elevation: 0,
      title: Text(
        'carte',
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
         
          Navigator.of(context).push(MaterialPageRoute(
          builder: (context)=>HomeScreen() 
          ));
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
                Image.asset('icons/location.png',
                height: 250,),
                
                SizedBox(height :10),
                Text(
                  'openStreetMap',
                  style: GoogleFonts.robotoCondensed(
                    fontSize: 40,fontWeight: FontWeight.bold, color: Colors.black,
                  ),
                  ),
                  SizedBox(height: 50,),

                  ],
                  )

    )
       )
       ),
       
       );
  }
}