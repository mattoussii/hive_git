// ignore_for_file: camel_case_types, prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_import

import 'package:firebase_auth_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class success extends StatefulWidget {
  const success({super.key});

  @override
  State<success> createState() => _successState();
}

class _successState extends State<success> {
  @override
  Widget build(BuildContext context) {
    return Stack(

      children: [
         Container(
                    decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/a.jpg"), // <-- BACKGROUND IMAGE
              fit: BoxFit.cover,
            ),
          ),
           child: Scaffold(
            backgroundColor: Colors.transparent ,
                 body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Center(
              child:  
              Text(
                "you are a menber now! you can  sign in",
                style: GoogleFonts.robotoCondensed(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  ),
                ), 
              ),
 
            SizedBox(height: 20,),  

              Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 85),
                      child: GestureDetector(
                        onTap: () {
                           Navigator.of(context).pushNamedAndRemoveUntil('login', (route) => false);
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration:  BoxDecoration(
                            color: Colors.yellow,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(child: Text(
                            'Login',
                            style: GoogleFonts.robotoCondensed(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                             ),
                            ),
                          ),
                        ),
                      ),
                    ),
                 ],)
               ),
         ), ]
    );
  }
}