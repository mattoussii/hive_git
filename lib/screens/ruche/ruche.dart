// ignore_for_file: camel_case_types, use_key_in_widget_constructors, avoid_unnecessary_containers, prefer_const_constructors_in_immutables, prefer_typing_uninitialized_variables, prefer_const_constructors, unused_local_variable, sized_box_for_whitespace, use_build_context_synchronously, unnecessary_this, prefer_const_literals_to_create_immutables, prefer_final_fields, curly_braces_in_flow_control_structures

import 'package:firebase_auth_app/components/LinkAPI.dart';
import 'package:firebase_auth_app/constants.dart';
import 'package:firebase_auth_app/crud.dart';
import 'package:firebase_auth_app/main.dart';
import 'package:firebase_auth_app/models/rucheModel.dart';
import 'package:firebase_auth_app/screens/home.dart';
import 'package:firebase_auth_app/screens/ruche/edit_ruche.dart';
import 'package:firebase_auth_app/screens/ruche/rucheCard.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class rucheScreen extends StatefulWidget {
  const rucheScreen({super.key});

  @override
  State<rucheScreen> createState() => _rucheScreenState();
}

class _rucheScreenState extends State<rucheScreen>{
  
  Crud _crud = Crud();

  getRuche() async {
    var response = await _crud.postRequest(linkViewRuche, {
      "id" : sharedPref.getString("id") ,
    });
    return response ;
  }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width ;
    return Scaffold(
      backgroundColor: kPrimaryColor,
      
            appBar: AppBar(
        
      backgroundColor: kPrimaryColor,
      elevation: 0,
      title: Text(
        'ruche',
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

               Navigator.of(context).pushNamed('add_ruche');

              }),
              
            body: 
            Stack(
              children: [
             Container(
                margin: EdgeInsets.only(top : 70),
                decoration:BoxDecoration(
                  color:kBackgroundColor, 
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  )
                ),
              ),
              

                ListView(
                  children: [
                    SizedBox(height: 80,),

                    FutureBuilder(
                      future:   getRuche(),
                      builder: (BuildContext context  , AsyncSnapshot snapshot){
                      if(snapshot.hasData){
                        if(snapshot.data["status"] == "failed" )
                        return Center(child: 
                           Column(
                                        children: [
                                    SizedBox(height: 50,),
                                    Center(
                                      child: Image.asset(
                                        'images/bee.png',
                                        height: 200,
                                        width: 200,),
                                    ),
                                      SizedBox(height: 30,),
                                    Text(
                                        "il n'y a pas de ruche" ,
                                      style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.amber
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
                          return rucheCard(
                            onDelete: () async {
                              var response = await _crud.postRequest(linkDeleteRuche, {
                                 "id"        : snapshot.data['data'][i]['ruche_id'].toString(),
                                 "imagename" : snapshot.data['data'][i]['ruche_image'].toString(),
                              });
                              if(response["status"] == "success"){
                                Navigator.of(context).pushReplacementNamed('ruche');
                              }
                            },
                            onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>
                            edit_ruche(ruches: snapshot.data['data'][i] ,)));
                            },
                            rucheModel: RucheModel.fromJson(snapshot.data['data'][i]), 
                            
                            
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
                                        'images/bee.png',
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
                                        'images/bee.png',
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
                    }),
                    SizedBox(height: 80,),
                  ],
                ),
              ],
            )
            


               


    );
  }
}










