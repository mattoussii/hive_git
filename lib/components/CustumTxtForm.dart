// ignore_for_file: prefer_const_constructors, file_names, non_constant_identifier_names, unused_import


import 'package:firebase_auth_app/constants.dart';
import 'package:flutter/material.dart';

class CustumTxtForm extends StatelessWidget {

  final String hint ;
  final String? Function(String?) valid ;
  final TextEditingController mycontroller ;

  const CustumTxtForm({super.key, required this.hint, required this.mycontroller, required this.valid});

  @override
  Widget build(BuildContext context) {
    return Padding(
       padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Container( 
      decoration:BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
        child: TextFormField(
        
          validator: valid ,
          controller:  mycontroller ,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 8,horizontal: 10),
             hintText: hint ,
             border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: Colors.black , width: 1)
            )
          )
        ),
      ),
    );
  }
}