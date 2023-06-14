// ignore_for_file: camel_case_types, use_key_in_widget_constructors, avoid_unnecessary_containers, prefer_const_constructors_in_immutables, prefer_typing_uninitialized_variables, prefer_const_constructors, unused_local_variable, sized_box_for_whitespace, use_build_context_synchronously, unnecessary_this, prefer_const_literals_to_create_immutables, prefer_final_fields, curly_braces_in_flow_control_structures, unused_import

import 'package:firebase_auth_app/components/LinkAPI.dart';
import 'package:firebase_auth_app/constants.dart';
import 'package:firebase_auth_app/crud.dart';
import 'package:firebase_auth_app/main.dart';
import 'package:firebase_auth_app/models/rucheModel.dart';
import 'package:firebase_auth_app/models/visiteModel.dart';
import 'package:firebase_auth_app/screens/home.dart';
import 'package:firebase_auth_app/screens/visite/edit.dart';
import 'package:firebase_auth_app/screens/visite/visiteCard.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class visiteScreen extends StatefulWidget {
  const visiteScreen({super.key});

  @override
  State<visiteScreen> createState() => _visiteScreenState();
}

class _visiteScreenState extends State<visiteScreen>{
  
  Crud _crud = Crud();

  getVisites() async {

    var response = await _crud.postRequest(linkViewVisite, {
     "rucheid": RucheModel.rucheid.toString(),


      
    });
    return response ;
  }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width ;
    return Scaffold(
            appBar: AppBar(
        
      backgroundColor: kPrimaryColor,
      elevation: 0,
      title: Text(
        'visite',
         style: GoogleFonts.robotoCondensed(
                   fontSize: 20,fontWeight: FontWeight.normal, color: Colors.black,
                  ),),
      centerTitle: false,
         leading: IconButton(
        padding: const EdgeInsets.only(right:kDefaultPadding ),
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.black,
          ),
        onPressed: (){
          Navigator.pop(context);
          Navigator.of(context).push(MaterialPageRoute(
          builder: (context)=>HomeScreen() 
          ));
        },
      ),

    ),
           
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.hive_rounded ,color: Colors.yellow,),
              onPressed: (){

               Navigator.of(context).pushNamed('add');

              }),
              
            body: ListView(
              children: [
                FutureBuilder(
                  future:   getVisites(),
                  builder: (BuildContext context  , AsyncSnapshot snapshot){
                  if(snapshot.hasData){
                    if(snapshot.data["status"] == "failed" )
                    
                    return Center(child: 
                       Column(
                                    children: [
                                SizedBox(height: 50,),
                                Center(
                                  child: Image.asset(
                                    'icons/visite.png',
                                    height: 200,
                                    width: 200,),
                                ),
                                  SizedBox(height: 30,),
                                Text(
                                    "tu n'as fait aucune visite" ,
                                  style: TextStyle(
                                    fontSize: 25,
                                  ),
                                ),
                              ],
                            ) 
                       ) ;
                    return ListView.builder(
                      itemCount: snapshot.data['data'].length ,
                      shrinkWrap: true ,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context , i){
                      return visiteCard(
                        onDelete: () async {
                          var response = await _crud.postRequest(linkDeleteVisite, {
                             "id"        : snapshot.data['data'][i]['visite_id'].toString(),
                             "imagename" : snapshot.data['data'][i]['visite_image'].toString(),
                          });
                          if(response["status"] == "success"){
                            Navigator.of(context).pushReplacementNamed('visite');
                          }
                        },
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>
                        edit(visites: snapshot.data['data'][i] ,)));
                        },
                        visiteModel: VisiteModel.fromJson(snapshot.data['data'][i]), 
                        
                        
                        );
                    }
                    );
                  }
                  if(snapshot.connectionState == ConnectionState.waiting){
                    return Center(child: 
                       Column(
                                    children: [
                                SizedBox(height: 150,),
                                Center(
                                  child: Image.asset(
                                    'icons/visite.png',
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
                  }
                  return  Center(child: 
                       Column(
                                    children: [
                                SizedBox(height: 150,),
                                Center(
                                  child: Image.asset(
                                    'icons/visite.png',
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

              ],
            )
            


               


    );
  }
}










