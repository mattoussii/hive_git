// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

import 'dart:io';

import 'package:barcode_widget/barcode_widget.dart';
import 'package:firebase_auth_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class First extends StatefulWidget {
  const First({super.key});

  @override
  _FirstState createState() => _FirstState();
}

class _FirstState extends State<First> {
  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();
  var code = '';
  File? file;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(
        
        child: SingleChildScrollView(
          child: Column(
            children: [
            
              Padding(
                padding: EdgeInsets.all(35),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(),
                     ),
                  child: TextFormField(
                    controller: title,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: ' Code ',
                               hintStyle: GoogleFonts.robotoCondensed(
                    fontSize: 20,fontWeight: FontWeight.w100, color: Colors.black,
                  ),
                    ),
                  ),
                ),
              ),
              




              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  
                                  margin: EdgeInsets.symmetric(
                  horizontal: kDefaultPadding*2,
                  vertical: kDefaultPadding*2 ,
                ),
                  child: Container(
                    decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                        color: kPrimaryColor,
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(0,15),
                            blurRadius: 50, 
                            color:  Colors.green,
                          ),
                        ]
                    ),
                    child: MaterialButton(
                      
                      onPressed: () {
                        setState(() {
                          code = title.text;
                        });
                      },
                      child: Text(
                        "Create",
                           style: GoogleFonts.robotoCondensed(
                          fontSize: 20,fontWeight: FontWeight.normal, color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),






              code == ''
                  ? Text('')
                  : BarcodeWidget(
                      barcode: Barcode.qrCode(
                        errorCorrectLevel: BarcodeQRCorrectionLevel.high,
                      ),
                      // ignore: unnecessary_string_interpolations
                      data: '$code',
                      width: 200,
                      height: 200,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}