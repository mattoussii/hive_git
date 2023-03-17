
// ignore_for_file: avoid_print, unused_local_variable, prefer_const_constructors

import 'package:firebase_auth_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
//  import 'package:http/http.dart' as http ;
// import'package:firebase_storage/firebase_storage.dart';
import 'dart:convert';
import 'dart:io';



class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
     File ? _file ;
  Future pickercamera() async{
    final myfile = await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      _file = File(myfile!.path);
    });
  }

  Future upload() async {
    if(_file == null) return ;
    String base64 =base64Encode(_file!.readAsBytesSync()) ; 
    String imagename = _file!.path.split("/").last ;
    // var url = "http://10.0.2.2:8080/mobtech/upoadimage.php";
    // var data ={"imagename": imagename , "image64" : base64} ;
    // var reponse = await http.post(url ,body: data);
    
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
      backgroundColor: kPrimaryColor,
      elevation: 0,
      title: Text(
        'gallery',
         style: GoogleFonts.robotoCondensed(
                   fontSize: 20,fontWeight: FontWeight.normal, color: Colors.black,
                  ),),
      centerTitle: false,
         leading: IconButton(
        padding: EdgeInsets.only(right:kDefaultPadding ),
        icon: Icon(
          Icons.arrow_back,
          color: Colors.black,
          ),
        onPressed: (){
          Navigator.pop(context);
        },
      ),

    ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[


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
                            blurRadius: 20, 
                            color:  Colors.green,
                          ),
                        ]
                    ),
                    child: MaterialButton(
                      
                      onPressed: pickercamera,
                      child: Text(
                        "get image",
                           style: GoogleFonts.robotoCondensed(
                          fontSize: 20,fontWeight: FontWeight.normal, color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),


              Center(child: _file == null ? const Text('image not selected') : Image.file(_file!),),

              
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
                            blurRadius: 20, 
                            color:  Colors.green,
                          ),
                        ]
                    ),
                    child: MaterialButton(
                      
                      onPressed: upload,
                      child: Text(
                        "upload image",
                           style: GoogleFonts.robotoCondensed(
                          fontSize: 20,fontWeight: FontWeight.normal, color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
               



            ],
        ),
      )
    );
  }
}