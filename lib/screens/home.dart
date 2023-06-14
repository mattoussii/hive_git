// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, avoid_single_cascade_in_expression_statements, prefer_const_literals_to_create_immutables,, unused_import, unused_field 
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_app/components/LinkAPI.dart';
import 'package:firebase_auth_app/constants.dart';
import 'package:firebase_auth_app/main.dart';
import 'package:firebase_auth_app/screens/Map.dart';
import 'package:firebase_auth_app/screens/ruche/ruche.dart';
import 'package:firebase_auth_app/screens/visite/visite.dart';
import 'package:firebase_auth_app/screens/historique/history.dart';
import 'package:firebase_auth_app/screens/scanner_screen/scanner.dart';
import 'package:firebase_auth_app/shop/shop_screens_body/shop_home_screen.dart';
import 'package:firebase_auth_app/screens/gallery/gallery.dart';
import 'package:firebase_auth_app/screens/help.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  //  final user = FirebaseAuth.instance.currentUser!;



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
                      Text('bonjour',
                        style: GoogleFonts.robotoCondensed(
                              fontSize: 15,fontWeight: FontWeight.bold, color: Colors.black,
                              ),
                      ),
                        Text(" bienvenue",
                        style: GoogleFonts.robotoCondensed(
                              fontSize: 15,fontWeight: FontWeight.normal, color: Colors.black,
                              ),
                        
                      ),
                    ],
                  ),
                  
                  ),

                  ListTile(
                    title: const Text('boutique'),
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
                    title: const Text('photos'),
                    leading:  Icon(
                                  Icons.photo
                                ),
                    onTap: () {
                      
                                  Navigator.pop(context);
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context)=>Gallery()
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
                    title: const Text('ruche'),
                    leading:  Icon(
                                  Icons.check
                                ),
                    onTap: () {
                        Navigator.pop(context);
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context)=>rucheScreen()
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
                    title: const Text('contact'),
                    leading:  Icon(
                                  Icons.help
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
                    title: const Text('carte'),
                    leading:  Icon(
                                  Icons.map_rounded
                                ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context)=>Map_screen()
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
              "bonjour, vous êtes connecté",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold, 
                color: Colors.white,
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
                                color: Colors.black,), // <-- Icon
                                Text("boutique",
                                                          style: GoogleFonts.robotoCondensed(
                                              color: Colors.black,
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
                                 MaterialPageRoute(builder: (context) =>Gallery()),
                                    ); }, 
       
       
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(Icons.photo_camera,
                                color: Colors.black,), // <-- Icon
                                Text("photos",
                                                          style: GoogleFonts.robotoCondensed(
                                              color: Colors.black,
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
                                color: Colors.black,), // <-- Icon
                                Text("scanner",
                                                          style: GoogleFonts.robotoCondensed(
                                              color: Colors.black,
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
                                      MaterialPageRoute(builder: (context) =>rucheScreen() ),
                                          ); }, 
            
            
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(Icons.hive_rounded,
                                      color: Colors.black,), // <-- Icon
                                      Text("ruche",
                                                                style: GoogleFonts.robotoCondensed(
                                                    color: Colors.black,
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
                                color: Colors.black,), // <-- Icon
                                Text("historique",
                                                          style: GoogleFonts.robotoCondensed(
                                              color: Colors.black,
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
                                color: Colors.black,), // <-- Icon
                                Text("contact ",
                                                          style: GoogleFonts.robotoCondensed(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                                  )), // <-- Text
                ], ),  ), ), ),), ),),
        
            ],
            ),

          
      //third row logout  and google map page        
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
                                      onTap: () {
                                        sharedPref.clear() ;
                                        Navigator.of(context).pushNamedAndRemoveUntil("map", (route) => false);
                                      }, 
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Icon(Icons.map_rounded,
                                          color: Colors.black,), // <-- Icon
                                          Text("carte",
                                           style: GoogleFonts.robotoCondensed(
                                            color: Colors.black,
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
                                      onTap: () {
                                        sharedPref.clear() ;
                                        Navigator.of(context).pushNamedAndRemoveUntil("login", (route) => false);
                                      }, 
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Icon(Icons.logout_rounded,
                                          color: Colors.black,), // <-- Icon
                                          Text("sign out",
                                                                    style: GoogleFonts.robotoCondensed(
                                                        color: Colors.black,
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
              
              
              
              
              ],
            ),

 ],),),), ] ); } 





   AppBar HomeAppBar() {
    return AppBar(
       backgroundColor: kPrimaryColor,
      elevation: 0,
      title: Text(
        "page d'accueil",
         style: GoogleFonts.robotoCondensed(
                    fontSize: 20,fontWeight: FontWeight.normal, color: Colors.black,
                  ),),
      centerTitle: false,

    );
  }
}