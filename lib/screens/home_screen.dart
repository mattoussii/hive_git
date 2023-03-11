


// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, avoid_single_cascade_in_expression_statements, prefer_const_literals_to_create_immutables,, unused_import 

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_app/constants.dart';

import 'package:firebase_auth_app/screens/visite.dart';
import 'package:firebase_auth_app/screens/history.dart';
import 'package:firebase_auth_app/screens/scanner_screen/scanner.dart';
import 'package:firebase_auth_app/screens/shop_home_screen.dart';
import 'package:firebase_auth_app/screens/gallery.dart';
import 'package:firebase_auth_app/screens/help.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
   
   return Stack( 
    // <-- STACK AS THE SCAFFOLD PARENT
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
      appBar: HomeAppBar(),
      backgroundColor: Colors.transparent,
      drawerScrimColor: kPrimaryColor.withOpacity(0.3),
      drawer:Drawer(
        
         child: ListView(
          
          padding: EdgeInsets.zero,
          children: [
            
                    DrawerHeader(
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                    
                    ),
                  child: Column(
                    children:  [
                      CircleAvatar(
                        radius: 42,
                        backgroundImage: AssetImage('images/a.jpg'),
                      ),
                      SizedBox(height: 10,),
                      Text('HELLO',
                        style: GoogleFonts.robotoCondensed(
                              fontSize: 15,fontWeight: FontWeight.bold, color: Colors.black,
                              ),
                      ),
                        Text(user.email!,
                        style: GoogleFonts.robotoCondensed(
                              fontSize: 15,fontWeight: FontWeight.normal, color: Colors.black,
                              ),
                      ),
                    ],
                  ),
                  
                  ),

                  ListTile(
                    title: const Text('shop screen'),
                    leading:  Icon(
                                  Icons.shop_2_outlined
                                ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context)=>ShopScreen()
                        ));
                      
                      
                    
                    },
                  ),
                  const Divider(color: kPrimaryColor),      
                  ListTile(
                    title: const Text('gallery'),
                    leading:  Icon(
                                  Icons.photo
                                ),
                    onTap: () {
                      
                                  Navigator.pop(context);
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context)=>Test()
                        ));
                      
                    },
                  ),
                  const Divider(color: kPrimaryColor),
                  ListTile(
                    title: const Text('Scanner'),
                    leading:  Icon(
                                  Icons.qr_code
                                ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context)=>Scanner()
                        ));
                      
                    },
                  ),
                  const Divider(color: kPrimaryColor),
                  ListTile(
                    title: const Text('visite'),
                    leading:  Icon(
                                  Icons.check
                                ),
                    onTap: () {
                        Navigator.pop(context);
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context)=>helpscreen()
                        ));
                      
                    },
                  ),
                  const Divider(color: kPrimaryColor),
                  ListTile(
                    title: const Text('historique'),
                    leading:  Icon(
                                  Icons.history
                                ),
                    
                    onTap: () {
                        Navigator.pop(context);
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context)=>HistoryScreen()
                        ));
                      
                    },
                  ),
                  const Divider(color: kPrimaryColor),
                  ListTile(
                    title: const Text('help'),
                    leading:  Icon(
                                  Icons.help
                                ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context)=>visiteScreen()
                        ));
                      
                    },
                  ),
                  const Divider(color: kPrimaryColor),
                    ListTile(
                    title: const Text('sign out '),
                    leading:  Icon(
                                  Icons.logout
                                ),
                    onTap: () {
                      FirebaseAuth.instance.signOut();
                    },
                  ),
                  const Divider(color: kPrimaryColor),
                      ],  
                        ),

      ),


      body:
       SingleChildScrollView(
         child: Column(            
          children: [
            const Text(
              'Hello, you\'re signed in',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold, 
                color: Colors.white,
                ), 
              
              
              ),
                  Text(
              user.email!,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold, 
                  color: Colors.white54,
                  ), 
              
              ),
             SizedBox(height: 75),
       // first row  pages shop and gallery 
            Row(
              children: [
                  Expanded(
              child: Container(
              alignment: Alignment.bottomCenter,
                margin: EdgeInsets.symmetric(
                  horizontal: kDefaultPadding,
                  vertical: kDefaultPadding ,
            ),
              child: SizedBox.fromSize(
                  size: Size(90, 90),
                  child: ClipOval(
                    
                    child: Material(
                      color: Colors.green,
                      child: InkWell(
                            splashColor: Colors.amber, 
       
                            onTap: () {  Navigator.push(context,
                                 MaterialPageRoute(builder: (context) =>ShopScreen() ),
                                    ); }, 
       
       
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(Icons.shop_2_rounded,
                                color: Colors.white,), // <-- Icon
                                Text("shop",
                                                          style: GoogleFonts.robotoCondensed(
                                              color: Colors.white54,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                                  )), // <-- Text
                ], ),  ), ), ),), ),),
            
                  Expanded(
              child: Container(
              alignment: Alignment.bottomCenter,
                margin: EdgeInsets.symmetric(
                  horizontal: kDefaultPadding,
                  vertical: kDefaultPadding ,
            ),
              child: SizedBox.fromSize(
                  size: Size(90, 90),
                  child: ClipOval(
                    child: Material(
                      color: Colors.green,
                      child: InkWell(
                            splashColor: Colors.amber, 
       
                            onTap: () {  Navigator.push(context,
                                 MaterialPageRoute(builder: (context) =>Test()),
                                    ); }, 
       
       
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(Icons.photo_camera,
                                color: Colors.white,), // <-- Icon
                                Text("gallery",
                                                          style: GoogleFonts.robotoCondensed(
                                              color: Colors.white54,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                                  )), // <-- Text
                ], ),  ), ), ),), ),),
              ],
            ),
        //second row scanner page and visite page
            Row(
              children: [
                  Expanded(
              child: Container(
              alignment: Alignment.bottomCenter,
                margin: EdgeInsets.symmetric(
                  horizontal: kDefaultPadding,
                  vertical: kDefaultPadding ,
            ),
              child: SizedBox.fromSize(
                  size: Size(90, 90),
                  child: ClipOval(
                    child: Material(
                      color: Colors.green,
                      child: InkWell(
                            splashColor: Colors.amber, 
       
                            onTap: () {  Navigator.push(context,
                                 MaterialPageRoute(builder: (context) =>Scanner() ),
                                    ); }, 
       
       
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(Icons.qr_code_2_rounded,
                                color: Colors.white,), // <-- Icon
                                Text("scanner",
                                                          style: GoogleFonts.robotoCondensed(
                                              color: Colors.white54,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                                  )), // <-- Text
                ], ),  ), ), ),), ),),
               // Expanded(
              //   child: Container(
              //     margin: EdgeInsets.symmetric(
              //     horizontal: kDefaultPadding,
              //     vertical: kDefaultPadding ,
              //   ),
              //     child: Container(
              //       height: 70,
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(30),
              //         color: Colors.green[600],
              //         boxShadow: const [
              //           BoxShadow(
              //             offset: Offset(0,15),
              //             blurRadius: 25, 
              //             color:  Colors.yellow,
              //           ),
              //         ]
              //       ),
              //                 child: MaterialButton(
              //                 onPressed: () {
              //                   Navigator.push(
              //                   context,
              //                     MaterialPageRoute(builder: (context) => QRcodeScreen()),
              //                       ); },
              //                 child: Text('scanner',
              //                   style: GoogleFonts.robotoCondensed(
              //                             color: Colors.white,
              //                             fontWeight: FontWeight.bold,
              //                             fontSize: 18,
              //                           ),  ),), ), ),
              // ),
                  Expanded(
                    child: Container(
                    alignment: Alignment.bottomCenter,
                      margin: EdgeInsets.symmetric(
                        horizontal: kDefaultPadding,
                        vertical: kDefaultPadding ,
                  ),
                    child: SizedBox.fromSize(
                        size: Size(90, 90),
                        child: ClipOval(
                          child: Material(
                            color: Colors.green,
                            child: InkWell(
                                  splashColor: Colors.amber, 
            
                                  onTap: () {  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) =>visiteScreen() ),
                                          ); }, 
            
            
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(Icons.note_add_rounded,
                                      color: Colors.white,), // <-- Icon
                                      Text("visite",
                                                                style: GoogleFonts.robotoCondensed(
                                                    color: Colors.white54,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18,
                                                        )), // <-- Text
                      ], ),  ), ), ),), ),),
              ],
            ), 
       //third row history page and help page        
            Row(
              children: [
                  Expanded(
              child: Container(
              alignment: Alignment.bottomCenter,
                margin: EdgeInsets.symmetric(
                  horizontal: kDefaultPadding,
                  vertical: kDefaultPadding ,
            ),
              child: SizedBox.fromSize(
                  size: Size(90, 90),
                  child: ClipOval(
                    child: Material(
                      color: Colors.green,
                      child: InkWell(
                            splashColor: Colors.amber, 
       
                            onTap: () {  Navigator.push(context,
                                 MaterialPageRoute(builder: (context) =>HistoryScreen() ),
                                    ); }, 
       
       
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(Icons.history,
                                color: Colors.white,), // <-- Icon
                                Text("history",
                                                          style: GoogleFonts.robotoCondensed(
                                              color: Colors.white54,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                                  )), // <-- Text
                ], ),  ), ), ),), ),),
                                    Expanded(
              child: Container(
              alignment: Alignment.bottomCenter,
                margin: EdgeInsets.symmetric(
                  horizontal: kDefaultPadding,
                  vertical: kDefaultPadding ,
            ),
              child: SizedBox.fromSize(
                  size: Size(90, 90),
                  child: ClipOval(
                    child: Material(
                      color: Colors.green,
                      child: InkWell(
                            splashColor: Colors.amber, 
       
                            onTap: () {  Navigator.push(context,
                                 MaterialPageRoute(builder: (context) =>helpscreen() ),
                                    ); }, 
       
       
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(Icons.help_rounded,
                                color: Colors.white,), // <-- Icon
                                Text("help ",
                                                          style: GoogleFonts.robotoCondensed(
                                              color: Colors.white54,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                                  )), // <-- Text
                ], ),  ), ), ),), ),),
        
            ],
            ),
       // last row  sign out button 
            SizedBox(height: 50),
            Row(
            children: [
         Expanded(
           child: Container(
           alignment: Alignment.bottomCenter,
            margin: EdgeInsets.symmetric(
              horizontal: kDefaultPadding,
              vertical: kDefaultPadding ,
            ),
              child: SizedBox.fromSize(
                  size: Size(90, 90),
                  child: ClipOval(
                    child: Material(
                      color: Colors.green,
                      child: InkWell(
                            splashColor: Colors.amber, 
                            onTap: () {FirebaseAuth.instance.signOut();}, 
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(Icons.logout_rounded,
                                color: Colors.white,), // <-- Icon
                                Text("log out",
                                                          style: GoogleFonts.robotoCondensed(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                                  )), // <-- Text
                              ],
                            ),
                      ),
                    ),
                  ),
       ),
             ),
             
         ),


],), ],),),), ] ); } 





   AppBar HomeAppBar() {
    return AppBar(
       backgroundColor: kPrimaryColor,
      elevation: 0,
      title: Text(
        'home',
         style: GoogleFonts.robotoCondensed(
                    fontSize: 20,fontWeight: FontWeight.normal, color: Colors.black,
                  ),),
      centerTitle: false,

    );
  }
}