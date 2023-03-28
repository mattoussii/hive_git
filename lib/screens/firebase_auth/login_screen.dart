


// // ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_new

// import 'package:awesome_dialog/awesome_dialog.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';



// class loginScreen extends StatefulWidget {
//   const loginScreen({super.key});

//   @override
//   State<loginScreen> createState() => _loginScreenState();
// }
 
// class _loginScreenState extends State<loginScreen> {
//   final _emailController =TextEditingController();
//   final _passwordController =TextEditingController();




//   Future signIn() async {

//      var formdata = formstate.currentState ;
//   if(formdata!.validate()){
//         await FirebaseAuth.instance.signInWithEmailAndPassword
//     ( email: _emailController.text.trim(), 
//     password: _passwordController.text.trim()) ;
//   }
//       else{
//              AwesomeDialog(
//             context: context,
//             dialogType: DialogType.warning,
//             animType: AnimType.rightSlide,
//             body:  Text('please add a valid account'),
//             btnOkOnPress: () {},
//             ).show();
//       }

//   }


//   void openSignupScreen(){
//     Navigator.of(context).pushReplacementNamed('signupScreen');
//   }





//   @override

//   void dispose(){
//     super.dispose();
//     _emailController.dispose();
//     _passwordController.dispose();
//   }
//   GlobalKey<FormState>  formstate  = new  GlobalKey<FormState>() ;
  

//   @override
//   Widget build(BuildContext context) {
//     return Stack( // <-- STACK AS THE SCAFFOLD PARENT
//       children: [
//         Container(
//           decoration: BoxDecoration(
//             image: DecorationImage(
//               image: AssetImage("images/b.jpg"), // <-- BACKGROUND IMAGE
//               fit: BoxFit.cover,
//             ),
//           ),
//         ),
//      Scaffold(
//       // backgroundColor: Colors.black,
//        backgroundColor: Colors.transparent,
//       body:

//        SafeArea(   
//         child: Center(
//           child: SingleChildScrollView(
//             child: Form(
               
//               key: formstate ,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Image.asset('images/hive.png',
//                   height: 150,),
//                   SizedBox(height :10),
//                   Text(
//                     'SIGN IN',
//                     style: GoogleFonts.robotoCondensed(
//                       fontSize: 40,fontWeight: FontWeight.bold, color: Colors.orange,
//                     ),
//                     ),
                                   
//                     Text(
//                       'welcome back nice to see you again',
//                        style: GoogleFonts.robotoCondensed(
//                       fontSize: 18,fontWeight: FontWeight.bold, color: Colors.amber[800],
//                     ),
//                     ),
                          
//                     SizedBox(height: 50,),         
                      
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 25),
//                       child: Container(
//                         decoration:BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         child: TextFormField(
//                           autovalidateMode: AutovalidateMode.onUserInteraction ,
//                           validator: (value) {
//                               if (value!.isEmpty) {
//                                 return 'Please enter your email address';
//                               } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
//                                 return 'Please enter a valid email address';
//                               }
//                               return null;
//                             },                         
//                           keyboardType: TextInputType.emailAddress,
//                           controller: _emailController,
//                           decoration: InputDecoration(
//                             prefixIcon: Icon(Icons.person ,color: Colors.black,),
//                              border: InputBorder.none,
//                              hintText: 'Email',
//                              ),
//                         ),
//                       ),
//                     ),
                       
//                     SizedBox(height: 20,),                     
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 25),
//                       child: Container(
//                         decoration:BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         child: TextFormField(  
//                           autovalidateMode: AutovalidateMode.onUserInteraction ,
//                            validator:(text){
//                             if(text!.length < 6){
//                               return "password min caractere 6" ;
//                             }
//                             return null ;
//                           },                     
//                           controller: _passwordController,
//                           obscureText: true,
//                           decoration: InputDecoration(
//                             prefixIcon: Icon(Icons.password_rounded ,color: Colors.black,),
//                              border: InputBorder.none,
//                              hintText: 'password',
//                              ),
//                         ),
//                       ),
//                     ),
                                         
//                     SizedBox(height: 10,),
                     
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 85),
//                       child: GestureDetector(
//                         onTap:  signIn ,
                        
//                         child: Container(
//                           padding: EdgeInsets.all(16),
//                           decoration:  BoxDecoration(
//                             color: Colors.green[700],
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                           child: Center(child: Text(
//                             'Sign in',
//                             style: GoogleFonts.robotoCondensed(
//                               color: Colors.white,
//                               fontWeight: FontWeight.bold,
//                               fontSize: 18,
//                             ),
                            
//                             ),
//                             ),
//                         ),
//                       ),
//                     ),
            
//                     SizedBox(height: 10),
                      
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           'Not yet a menber ? ',
//                            style: GoogleFonts.robotoCondensed(
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold,)
                          
//                         ),
                      
//                         GestureDetector(
//                           onTap:  openSignupScreen,
//                           child: Text(
//                             'Sign up Now',
//                               style: GoogleFonts.robotoCondensed(
//                               color: Colors.amber[900],
//                               fontWeight: FontWeight.bold,
//                               ),),
//                         )
//                       ],
//                     )
                      
                      
                      
                      
                      
                      
                      
                      
                      
                      
                      
                      
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
      

//     )
//       ],);
//   }
  
// }