
// ignore_for_file: prefer_const_constructors_in_immutables, camel_case_types, prefer_const_constructors, sized_box_for_whitespace, use_key_in_widget_constructors

import 'package:firebase_auth_app/components/CustumTxtForm.dart';
import 'package:firebase_auth_app/components/valid.dart';
import 'package:firebase_auth_app/constants.dart';
import 'package:flutter/material.dart';


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
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            Form(
              key: formstate ,
              child: 
            Column(
              children: [
                Image.asset("images/bee.png", width: 200 ,height: 200,),
                CustumTxtForm(hint: 'email', 
                mycontroller: email,
                    valid: (val) { 
                      return validInput(val!, 3, 20) ;
                     },
                  ),
                CustumTxtForm(hint: 'password',
                 mycontroller: password,
                    valid: (val) { 
                      return validInput(val!, 10, 30) ;
                     },
                 ),
                MaterialButton(
                  color: Colors.green,
                  textColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 10,horizontal: 70),
                  onPressed: (){
                    Navigator.of(context).pushNamed("home") ;
                }, child: Text('login')),
                SizedBox(height: 10,),
                
                Container( height:30,
                  child: InkWell
                  (child: Text('Sign up'),
                  onTap: (){
                    Navigator.of(context).pushNamed("signup") ;
                  },
                  ) ,
                ),
              ],
      
            ))
          ],
        ),
      ),
    );
  }
}