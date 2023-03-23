// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, library_private_types_in_public_api

import 'package:firebase_auth_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qr_bar_scanner/qr_bar_scanner_camera.dart';

class Second extends StatefulWidget {
  const Second({super.key});

  @override
  _SecondState createState() => _SecondState();
}

class _SecondState extends State<Second> {
  String? _qrInfo = 'Scan a QR/Bar code';
  bool camState = false;

  qrCallback(String? code) {
    setState(() {
      camState = false;
      _qrInfo = code;
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      camState = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      floatingActionButton: SizedBox.fromSize(
         size: Size(60, 60),
        child: ClipOval(
          child: MaterialButton(
           color:  Colors.amber,
            
            onPressed: () {
              if (camState == true) {
                setState(() {
                  camState = false;
                });
              } else {
                setState(() {
                  camState = true;
                });
              }
            },
             
            child: Icon(Icons.camera ,
            color:  Colors.black, ),
          ),
        ),
      ),
      body: camState
          ? Center(
              child: SizedBox(
                height: 1000,
                width: 500,
                child: QRBarScannerCamera(
                  onError: (context, error) => Text(
                    error.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.red),
                  ),
                  qrCodeCallback: (code) {
                    qrCallback(code);
                  },
                ),
              ),
            )
          : Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           
            children: [
               Image.asset(
                'icons/qr.png',),

               Text(
                "Code :" + _qrInfo!,
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ],
          ),
    );
  }
}