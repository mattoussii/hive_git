
// ignore_for_file: prefer_const_constructors_in_immutables, camel_case_types, prefer_const_constructors, sized_box_for_whitespace, non_constant_identifier_names, unused_field, prefer_final_fields, use_build_context_synchronously, avoid_print

import 'package:firebase_auth_app/components/CustumTxtForm.dart';
import 'package:firebase_auth_app/components/LinkAPI.dart';
import 'package:firebase_auth_app/constants.dart';
import 'package:firebase_auth_app/crud.dart';
import 'package:flutter/material.dart';


class signup extends StatefulWidget {
  signup({Key? key}) : super(key: key);
  @override
  State<signup> createState() => _signupState();
}
class _signupState extends State<signup> {

GlobalKey<FormState> formstate = GlobalKey() ;
Crud _crud = Crud();
bool isloading = false ;
TextEditingController username = TextEditingController() ;
TextEditingController email = TextEditingController() ;
TextEditingController password = TextEditingController() ;
 

 Signup()async{
    isloading = true ;
  setState((){});
  var response = await _crud.postRequest(linkSignup, {
    "username" : username.text ,
    "email" : email.text ,
    "password" : password.text ,
  });

  isloading = false ;
  setState((){});

  if (response["status"] == "success"){
    Navigator.of(context).pushNamedAndRemoveUntil("home", (route) => false);
  }else{
    print('sign up fail');
  }
 }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: isloading == true ? 
      Center(child: CircularProgressIndicator(color: Colors.green,))
      :Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            Form(
              key: formstate ,
              child: 
            Column(
              children: [
                Image.asset("images/bee.png", width: 200 ,height: 200,),
               
                CustumTxtForm(
                  hint: 'username',
                   mycontroller: username,),
               
                CustumTxtForm(
                  hint: 'email',
                   mycontroller: email,),
                
                CustumTxtForm(
                  hint: 'password',
                   mycontroller: password,),
              
                MaterialButton(
                  color: Colors.green,
                  textColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 10,horizontal: 70),
                  onPressed: () async {
                   await  Signup();
                  }, 
                child: Text('signup')),
              
                SizedBox(height: 10,),
                
                Container( height:40, width: 40,
                  child: InkWell
                  (child: Text('login'),
                  onTap: (){
                    Navigator.of(context).pushReplacementNamed("login") ;
                  },
                  ) ,
                )

              
              ],
      
            ))
          ],
        ),
      ),
    );
  }
}