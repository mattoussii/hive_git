// ignore_for_file: prefer_const_constructors, camel_case_types

import 'package:firebase_auth_app/constants.dart';
import 'package:flutter/material.dart';



class productImage extends StatelessWidget {
  const productImage({
    super.key,
    required this.size, 
    required this.image,
  });


 
  final String image ;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: kDefaultPadding),
      height: size.width*0.8,
      
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
        Container(
          height: size.width*0.7,
          width: size.width*0.7,
          decoration: BoxDecoration(
            color: Colors.amber[400],
            shape: BoxShape.circle,
          ),
        ),
        Image.asset(
        image,
        height: size.width*075,
        width: size.width*0.75,
        fit:BoxFit.cover,)
      ],)
    );
  }
}