// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, unused_field, avoid_single_cascade_in_expression_statements, unrelated_type_equality_checks, unnecessary_new

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _emailController =TextEditingController();
  final _passwordController =TextEditingController();
  final _confirmpasswordController =TextEditingController();

  Future signUp() async {
  var formdata = formstate.currentState ;
    if(formdata!.validate()){
      if(passwordConfirmed()){
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(), 
          password: _passwordController.text.trim()
          );
          Navigator.of(context).pushNamed('/');
      }
    }
    else{
             AwesomeDialog(
            context: context,
            dialogType: DialogType.warning,
            animType: AnimType.rightSlide,
            body:  Text('add a valid account'),
            btnOkOnPress: () {},
            ).show();
      }
  }

  bool passwordConfirmed(){
    if (_passwordController.text.trim() ==
     _confirmpasswordController.text.trim()) {
      return true;
    }else{
      return false;
    }
  }


  void openSignupScreen(){
    Navigator.of(context).pushReplacementNamed('loginScreen'); 
  }


    GlobalKey<FormState>  formstate  = new  GlobalKey<FormState>() ;


  @override

  void dispose(){
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmpasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack( // <-- STACK AS THE SCAFFOLD PARENT
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
      // backgroundColor: Colors.black,
       backgroundColor: Colors.transparent,
      body:

  
      
       SafeArea(   
        child: Center(
          child: SingleChildScrollView(
            child: Form( 
             
              key: formstate ,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('images/hive.png',
                  height: 150,),
                  SizedBox(height :10),
                  Text(
                    'SIGN UP',
                    style: GoogleFonts.robotoCondensed(
                      fontSize: 40,fontWeight: FontWeight.bold, color: Colors.orange,
                    ),
                    ),
                             
                    Text(
                      'welcome ! Here you can sign up ',
                       style: GoogleFonts.robotoCondensed(
                      fontSize: 18,fontWeight: FontWeight.bold, color: Colors.amber[800],
                    ),
                    ),
                         
                    SizedBox(height: 50,),
            
            
                    
                    SizedBox(height: 10,),
            
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Container(
                        decoration:BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: TextFormField(
                           autovalidateMode: AutovalidateMode.onUserInteraction ,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter your email address';
                                    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                                      return 'Please enter a valid email address';
                                    }
                                    return null;
                                  },
                          keyboardType: TextInputType.emailAddress,
                          controller: _emailController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email_rounded ,color: Colors.black,),
                             border: InputBorder.none,
                             hintText: 'Email',
                             ),
                        ),
                      ),
                    ),
                    
                    SizedBox(height: 10,),
                     
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Container(
                        decoration:BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: TextFormField(
                           autovalidateMode: AutovalidateMode.onUserInteraction ,
                           validator:(text){
                            if(text!.length < 6){
                              return "password min caractere 6" ;
                            }
                            return null ;
                          }, 
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.password_rounded ,color: Colors.black,),
                             border: InputBorder.none,
                             hintText: 'password',
                             ),
                        ),
                      ),
                    ),
            
                    SizedBox(height: 10,),
            
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Container(
                        decoration:BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: TextFormField(
                           autovalidateMode: AutovalidateMode.onUserInteraction ,
                           validator:(text){
                            if(text!.length < 6){
                              return "password min caractere 6" ;
                            }
                            return null ;
                          }, 
                          
                          controller: _confirmpasswordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.password ,color: Colors.black,),
                             border: InputBorder.none,
                             hintText: 'confirm password',
                             ),
                        ),
                      ),
                    ),
            
                    SizedBox(height: 10,),
            
            
            
                    SizedBox(height: 10,),
                    
            
            
                    SizedBox(height: 10,),
                      
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 85),
                      child: GestureDetector(
                        onTap: signUp ,
                        child: Container(
                          padding: EdgeInsets.all(16),
                          decoration:  BoxDecoration(
                            color: Colors.green[700],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(child: Text(
                            'Sign up',
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
                  
                    SizedBox(height: 10),
            
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already a menber  ',
                           style: GoogleFonts.robotoCondensed(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,)
                          
                        ),
                      
                        GestureDetector(
                          onTap:  openSignupScreen,
                          child: Text(
                            'Sign in Here',
                              style: GoogleFonts.robotoCondensed(
                              color: Colors.amber[900],
                              fontWeight: FontWeight.bold,
                              ),),
                        )
                      ],
                    )
                      
                      
                      
                      
                      
                      
                      
                      
                      
                      
                      
                      
                ],
              ),
            ),
          ),
        ),
      ),
      

    )
      ],);
  }
  
}