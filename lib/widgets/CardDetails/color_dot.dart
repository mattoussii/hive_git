// ignore_for_file: prefer_const_constructors, camel_case_types

import 'package:firebase_auth_app/constants.dart';
import 'package:flutter/material.dart';

class colorDot extends StatelessWidget {
  const colorDot({
    super.key, 
    required this.fillColor,
    this.isSelected = false,
  });

final Color fillColor ;
final bool isSelected ;


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: kDefaultPadding / 2.5),
      padding: EdgeInsets.all(3.0),
      height: 24,
      width: 24,
      decoration:  BoxDecoration(shape: BoxShape.circle,
      border: Border.all(color: isSelected ? kTextLightColor : Colors.transparent),),
      child: Container(
        decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: fillColor,
         ),
      ),
    );
  }
}
