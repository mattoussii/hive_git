
// ignore_for_file: avoid_print, unused_local_variable, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_field, prefer_final_fields, empty_statements, curly_braces_in_flow_control_structures, use_build_context_synchronously
import 'package:firebase_auth_app/components/LinkAPI.dart';
import 'package:firebase_auth_app/constants.dart';
import 'package:firebase_auth_app/crud.dart';
import 'package:firebase_auth_app/main.dart';
import 'package:firebase_auth_app/models/photoModel.dart';
import 'package:firebase_auth_app/screens/gallery/CardPhoto.dart';
import 'package:firebase_auth_app/screens/gallery/edit_photo.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class Gallery extends StatefulWidget {
  const Gallery({super.key});

  @override
  State<Gallery> createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  
  Crud _crud = Crud();

  getPhotos() async {
    var response = await _crud.postRequest(linkViewPhoto,{
    "id" :sharedPref.getString('id')
    });
    return response ;
  }

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
          Navigator.of(context).pushReplacementNamed('home');
        },
      ),

    ),
      
      floatingActionButton: FloatingActionButton(      
              child: Icon(Icons.photo_camera),
           onPressed: (){
            Navigator.of(context).pushNamed('addp');
           }),
      
      body: 
     Container(
      padding: EdgeInsets.all(15),
       child: ListView(children: [

        FutureBuilder(

          future:   getPhotos() ,
          builder: (BuildContext context , AsyncSnapshot snapshot){
          if(snapshot.hasData){
            if(snapshot.data["status"] == "failed")
             return   Center(
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
                  color: Colors.green ,
                  fontWeight: FontWeight.bold
                ),
              ),
            ],
          ) ,
      ) ;
            
            return ListView.builder(
              itemCount:snapshot.data['data'].length ,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, i){
              return CardPhoto(

                 onDelete: () async {
                     var response = await _crud.postRequest(linkDeletePhoto, {
                     "id"        : snapshot.data['data'][i]['photo_id'].toString(),
                     "imagename" : snapshot.data['data'][i]['photo_image'].toString(),
                     });
                    if(response["status"] == "success"){
                     Navigator.of(context).pushReplacementNamed('gallery');
                       }
                  },

                ontap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: 
                  (context)=> edit_photo(
                    photos: snapshot.data['data'][i] ,
                  )));
                },
                photomodel: PhotoModel.fromJson(snapshot.data['data'][i])
                );
            });
          } 

         if(snapshot.connectionState == ConnectionState.waiting){
           return  Center(
                child: 
                    Column(
                  children: [
              SizedBox(height: 150,),
              Center(
                child: Image.asset(
                  'icons/beecam.png',
                  height: 200,
                  width: 200,),
              ),
                SizedBox(height: 30,),
              Text(
                  "chargement ... " ,
                  
                style: TextStyle(
                  color: Colors.green ,
                  fontWeight: FontWeight.bold
                  
                ),
              ),
            ],
          ) ,
      ) ;
         }
         return  Center(child: 
                       Column(
                                    children: [
                                SizedBox(height: 150,),
                                Center(
                                  child: Image.asset(
                                    'icons/beecam.png',
                                    height: 200,
                                    width: 200,),
                                ),
                                  SizedBox(height: 30,),
                                Text(
                                    "chargement ..." ,
                                  style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.green ,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                              ],
                            ) 
                       ) ;
        })
       ],),
     )

    );
  }
}