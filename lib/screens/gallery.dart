
// ignore_for_file: avoid_print, unused_local_variable, prefer_const_constructors
import 'package:firebase_auth_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class Gallery extends StatefulWidget {
  const Gallery({super.key});

  @override
  State<Gallery> createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
      backgroundColor: kPrimaryColor,
      elevation: 0,
      title: Text(
        'Galerie photos',
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
              
              
                floatingActionButton: FloatingActionButton(
                  
              child: Icon(Icons.photo_camera),
              onPressed: (){

               

              }),
      
      body:  Center(
                child: 
                    Column(
                  children: [
              SizedBox(height: 50,),
              Center(
                child: Image.asset(
                  'icons/beecam.png',
                  height: 200,
                  width: 200,),
              ),
                SizedBox(height: 30,),
              Text(
                  "il n'y a pas des photos" ,
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ],
          ) 
      ) 
    );
  }
}