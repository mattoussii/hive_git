
// ignore_for_file: prefer_const_constructors_in_immutables, camel_case_types, prefer_const_constructors, sized_box_for_whitespace, use_key_in_widget_constructors, unused_import, unused_field, prefer_final_fields, non_constant_identifier_names, unused_local_variable, use_build_context_synchronously, dead_code

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth_app/components/CustumTxtForm.dart';
import 'package:firebase_auth_app/components/LinkAPI.dart';
import 'package:firebase_auth_app/components/valid.dart';
import 'package:firebase_auth_app/constants.dart';
import 'package:firebase_auth_app/crud.dart';
import 'package:firebase_auth_app/main.dart';
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


 Crud _crud = Crud();
 bool isloading = false ;

Login() async{
if(formstate.currentState!.validate()){
  isloading =true ;
  setState(() { });
  var response = await _crud.postRequest(linkLogin,{
    "email":email.text ,
    "password" :password.text,
   });
  isloading =false ;
  setState(() { });
if(response["status"] == "success"){
  sharedPref.setString("id", response['data']['id'].toString());
  sharedPref.setString("username", response['data']['username']);
  sharedPref.setString("password", response['data']['password']);
  Navigator.of(context).pushNamedAndRemoveUntil('home', (route) => false);
}else{
           AwesomeDialog(
            context: context,
            dialogType: DialogType.warning,
            animType: AnimType.rightSlide,
            body:  Text(
              'email or password are not valid' ,
              style: GoogleFonts.robotoCondensed(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
                ),
              ),
            btnOkOnPress: () {},
            ).show();
    }
  }
}

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
            child: isloading == true ?
            Center(child: CircularProgressIndicator())
             :ListView(
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
                      hint: 'e-mail', 
                      mycontroller: email,
                        valid: (val) { 
                          return validInput(val!, 5, 30) ;
                         },
                      ),

                     SizedBox(height: 10,),  

                    CustumTxtForm(
                      hint: 'mot de passe',
                      mycontroller: password,
                        valid: (val) { 
                          return validInput(val!, 3, 30) ;
                         },
                     ),
                    SizedBox(height: 20,),  

                     Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 85),
                      child: GestureDetector(
                        onTap: () async{
                          await Login() ;

                        },
                        child: Container(
                          padding: EdgeInsets.all(16),
                          decoration:  BoxDecoration(
                            color: Colors.green[700],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(child: Text(
                            'se connecter',
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
                          'Pas encore  membre ? ',
                           style: GoogleFonts.robotoCondensed(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,)       
                        ),
                        GestureDetector(
                          onTap:  (){Navigator.of(context).pushNamed("signup") ;},
                          child: Text(
                            "s'inscrire maintenant",
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