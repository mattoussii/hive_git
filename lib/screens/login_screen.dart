


// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}
 
class _loginScreenState extends State<loginScreen> {
  final _emailController =TextEditingController();
  final _passwordController =TextEditingController();

  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword
    ( email: _emailController.text.trim(), 
    password: _passwordController.text.trim()) ;
  }


  void openSignupScreen(){
    Navigator.of(context).pushReplacementNamed('signupScreen');
  }










  @override

  void dispose(){
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('images/hive.png',
                height: 150,),
                SizedBox(height :10),
                Text(
                  'SIGN IN',
                  style: GoogleFonts.robotoCondensed(
                    fontSize: 40,fontWeight: FontWeight.bold, color: Colors.orange,
                  ),
                  ),
                                 
                  Text(
                    'welcome back nice to see you again',
                     style: GoogleFonts.robotoCondensed(
                    fontSize: 18,fontWeight: FontWeight.bold, color: Colors.amber[800],
                  ),
                  ),
                        
                  SizedBox(height: 50,),         
          
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                      decoration:BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person ,color: Colors.black,),
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
                      child: TextField(                       
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
                    padding: const EdgeInsets.symmetric(horizontal: 85),
                    child: GestureDetector(
                      onTap: signIn ,
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

                  SizedBox(height: 10),
          
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
                        onTap:  openSignupScreen,
                        child: Text(
                          'Sign up Now',
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
      

    )
      ],);
  }
  
}