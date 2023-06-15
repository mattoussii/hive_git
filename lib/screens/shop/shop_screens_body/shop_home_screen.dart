// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, non_constant_identifier_names

import 'package:firebase_auth_app/constants.dart';
import 'package:firebase_auth_app/screens/shop/shopWidgets/home_body.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class ShopScreen extends  StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: HomeAppBar(),
      body:homeBody(),
    );
    
  }

  AppBar HomeAppBar() {
    return AppBar(
      backgroundColor: kPrimaryColor,
      elevation: 0,
      title: Text(
        'boutique',
         style: GoogleFonts.robotoCondensed(
                   fontSize: 20,fontWeight: FontWeight.normal, color: Colors.black,
                  ),),
      centerTitle: false,

    );
  }
}