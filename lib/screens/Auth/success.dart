// ignore_for_file: camel_case_types, prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_import

import 'package:firebase_auth_app/constants.dart';
import 'package:flutter/material.dart';

class success extends StatefulWidget {
  const success({super.key});

  @override
  State<success> createState() => _successState();
}

class _successState extends State<success> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Center(child: Text("you are a menber now! you can  sign in",
        style: TextStyle(fontSize: 20)),  
        ),
       MaterialButton(
        textColor: Colors.white,
        color: Colors.green,
        onPressed: (){
        Navigator.of(context).pushNamedAndRemoveUntil('login', (route) => false);
       },child: Text("login"),)
      ],)
    );
  }
}