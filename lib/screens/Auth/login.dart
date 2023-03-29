
// ignore_for_file: prefer_const_constructors_in_immutables, camel_case_types, prefer_const_constructors, sized_box_for_whitespace, use_key_in_widget_constructors, unused_import

import 'package:firebase_auth_app/components/CustumTxtForm.dart';
import 'package:firebase_auth_app/components/valid.dart';
import 'package:firebase_auth_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class Login extends StatefulWidget {
  
  @override
  State<Login> createState() => _LoginState();
}
class _LoginState extends State<Login> {

GlobalKey<FormState> formstate = GlobalKey() ;
TextEditingController email = TextEditingController() ;
TextEditingController password = TextEditingController() ;
  @override
  Widget build(BuildContext context) {
    return Stack(
      
      children: [  
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/b.jpg"), // <-- BACKGROUND IMAGE
              fit: BoxFit.cover,
            ),
          ),
        ),

        Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          
          child: Center(
            child: ListView(
              children: [
                Form(
                  key: formstate ,
                  child: 
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 100,),                     
                    Image.asset("images/bee.png", width: 200 ,height: 200,),
                    
                    
                    CustumTxtForm(
                      hint: 'email', 
                      mycontroller: email,
                        valid: (val) { 
                          return validInput(val!, 3, 20) ;
                         },
                      ),

                     SizedBox(height: 10,),  

                    CustumTxtForm(
                      hint: 'password',
                      mycontroller: password,
                        valid: (val) { 
                          return validInput(val!, 10, 30) ;
                         },
                     ),
                    SizedBox(height: 20,),  

                     Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 85),
                      child: GestureDetector(
                        onTap: (){Navigator.of(context).pushNamed("home") ;},
                        child: Container(
                          padding: EdgeInsets.all(16),
                          decoration:  BoxDecoration(
                            color: Colors.green[700],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(child: Text(
                            'Sign in',
                            style: GoogleFonts.robotoCondensed(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                             ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 20,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Not yet a menber ? ',
                           style: GoogleFonts.robotoCondensed(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,)       
                        ),
                        GestureDetector(
                          onTap:  (){Navigator.of(context).pushNamed("signup") ;},
                          child: Text(
                            'Sign up Now',
                              style: GoogleFonts.robotoCondensed(
                              color: Colors.amber[900],
                              fontWeight: FontWeight.bold,
                              ),),
                        )
                      ],
                    ) ,
                    

                    

                  ],
                  
                ))
              ],
            ),
          ),
        ),
      ), ]
    );
  }
}