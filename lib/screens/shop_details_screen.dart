
// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:firebase_auth_app/constants.dart';
import 'package:firebase_auth_app/models/product.dart';
import 'package:firebase_auth_app/widgets/details/details_body.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';




class DetailsScreen extends StatelessWidget {
    final Product product ;

  const DetailsScreen({super.key, required this.product});

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:kPrimaryColor,
      appBar: detailsAppBar(context),
      body:DetailsBody(product: product,),
    );
  }

  AppBar detailsAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: kPrimaryColor,
      elevation: 0,
      leading: IconButton(
        padding: EdgeInsets.only(right:kDefaultPadding ),
        icon: Icon(
          Icons.arrow_back,
          color: Colors.white,
          ),
        onPressed: (){
          Navigator.pop(context);
        },
      ),
      centerTitle: false,
      title: Text(
        'return',
         style: GoogleFonts.robotoCondensed(
                    fontSize: 20,fontWeight: FontWeight.bold, color: Colors.black,
                  ),
       ),

    );
  }
}