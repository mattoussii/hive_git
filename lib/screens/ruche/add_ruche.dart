// ignore_for_file: camel_case_types,// prefer_const_constructors,//prefer_const_literals_to_create_immutables,//use_build_context_synchronously,// avoid_single_cascade_in_expression_statements, //prefer_typing_uninitialized_variables, avoid_print,// non_constant_identifier_names,// depend_on_referenced_packages,, depend_on_referenced_packages, unused_local_variable, prefer_const_constructors, avoid_unnecessary_containers, unnecessary_null_comparison, prefer_const_literals_to_create_immutables, use_build_context_synchronously, unused_import, unused_field, non_constant_identifier_names, prefer_final_fields, sized_box_for_whitespace, empty_statements, curly_braces_in_flow_control_structures 
import 'dart:io';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth_app/components/LinkAPI.dart';
import 'package:firebase_auth_app/constants.dart';
import 'package:firebase_auth_app/crud.dart';
import 'package:firebase_auth_app/main.dart';
import 'package:firebase_auth_app/screens/visite/visite.dart';
import 'package:firebase_auth_app/sqldb.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart'; // for date formatting


class add_ruche extends StatefulWidget {
  const add_ruche({Key? key}) : super(key: key);
  @override
  State<add_ruche> createState() => _add_rucheState();
}

class _add_rucheState extends State<add_ruche>  {

   //Position? cl ;
  // Future getPositon() async {
  //   bool services ;
  //   LocationPermission per ;
  //    services = await Geolocator.isLocationServiceEnabled() ;
  //    if(services == false){
  //     AwesomeDialog(
  //       context: context ,
  //       title: "services",
  //       body: 
  //       Text('services not enable',
  //                style: GoogleFonts.robotoCondensed(
  //                   fontSize: 20,fontWeight: FontWeight.normal, color: Colors.black,
  //                 ),                
  //             ),
  //       btnOkOnPress: () {},    
  //       ).show();}
  //   per = await Geolocator.checkPermission() ;
  //   if( per == LocationPermission.denied) {
  //     per = await Geolocator.requestPermission() ;
  //     if(per == LocationPermission.always ){
  //       getLatAndLong();
  //     }
  //   }
  // }
  // Future<Position> getLatAndLong() async {
  //   return await Geolocator.getCurrentPosition().then((value) =>  value);
  // }
  



Crud _crud = Crud() ;

File? myfile ;

GlobalKey<FormState> formState =GlobalKey() ;
final TextEditingController reference  = TextEditingController() ;
final TextEditingController nb_cadre = TextEditingController() ;
final TextEditingController new_position = TextEditingController() ;
final TextEditingController old_position = TextEditingController() ;

bool isloading =false ;

 AddRuche() async {
  if(myfile == null ) 
  return AwesomeDialog(
            context: context,
            dialogType: DialogType.warning,
            animType: AnimType.rightSlide,
            body:  Text(
              'veuillez ajouter une photo ' ,
              style: GoogleFonts.robotoCondensed(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
                ),
              ),
            btnOkOnPress: () {},
            ).show(); 

  if(formState.currentState!.validate()){
    isloading = true ;
    setState(() {
    });
    var response = await _crud.postRequestwithFile(linkAddRuche, {
    "reference"     : reference.text,
    "nb_cadre"      : nb_cadre.text ,
    "new_position"  : new_position.text ,
    "old_position"  : old_position.text ,
    "id"      : sharedPref.getString("id"),
  }, myfile! );
    isloading = false ;
    setState(() {  
    });
  if(response["status"] == "success"){
    Navigator.of(context).pushReplacementNamed('ruche');
  }else{ 
  }
  }
 }
  
  
  @override
  Widget build(BuildContext context) {    
    return Scaffold(
      appBar: AppBar(
        
      backgroundColor: kPrimaryColor,
      elevation: 0,
      title: Text(
        'ajouter ruche',
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
      
      body : isloading == true ? 
      Center(child: CircularProgressIndicator(),)
      : Container(
        padding: EdgeInsets.all(10),
        child: Form(
          
          key: formState,
          child:  ListView(
            children: [
                  
                  Container(height: 20,),
                  //reference 
                  TextFormField(
                      validator: (text){
                        if (text!.isEmpty){
                          return "ce champ ne peut pas être vide";
                        }
                        return null ;
                      },
                    controller: reference,   
                    decoration: InputDecoration(
                    filled: true,
                    fillColor: kBackgroundColor,
                    labelText: 'reference de la ruche ',
                     iconColor: Colors.black,
                    prefixIcon: Icon(Icons.note_add , color:  Colors.green,)
                  ),
                  ),
                  
                  Container(height: 20,),
                  //nb_cadre
                  TextFormField(
                    keyboardType: TextInputType.number,
                     validator: (text){
                        if (text!.isEmpty){
                          return "ce champ ne peut pas être vide";
                        }
                        return null ;
                      },
                    controller: nb_cadre,
                      decoration: InputDecoration(
                    filled: true,
                    fillColor: kBackgroundColor,
                    labelText: ' nombre de cadre',
                     iconColor: Colors.black,
                    prefixIcon: Icon(Icons.note_add , color:  Colors.green,)
                  ),
                  ),
                   
                   
                   Container(height: 20,),
                  //new_position
                  TextFormField(
                     validator: (text){
                        if (text!.isEmpty){
                          return "ce champ ne peut pas être vide";
                        }
                        return null ;
                      },
                    controller: new_position,
                      decoration: InputDecoration(
                    filled: true,
                    fillColor: kBackgroundColor,
                    labelText: 'nouvelle emplacement de la ruche',
                     iconColor: Colors.black,
                    prefixIcon: Icon(Icons.note_add , color:  Colors.green,)
                  ),
                  ),
                  
                  Container(height: 20,),
                  //old_position
                  TextFormField(
                     validator: (text){
                        if (text!.isEmpty){
                          return "ce champ ne peut pas être vide";
                        }
                        return null ;
                      },
                    controller: old_position,
                      decoration: InputDecoration(
                    filled: true,
                    fillColor: kBackgroundColor,
                    labelText: 'ancien emplacement de la ruche',
                     iconColor: Colors.black,
                    prefixIcon: Icon(Icons.note_add , color:  Colors.green,)
                  ),
                  ),              
                
                  Container(height: 20,),
                
                 //image
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 85),
                      child: GestureDetector(
                        
                        onTap: ()  {
                         showButtomSheet();
                        },
                        child: Container(
                          padding: EdgeInsets.all(16),
                          decoration:  BoxDecoration(
                            color: myfile == null ? Colors.black :Colors.green[700],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(child: Text(
                            'ajouter image',
                            style: GoogleFonts.robotoCondensed(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                             ),
                            ),
                          ),
                        ),
                      ),
                    ),
                 
                  Container(height: 20,),
                  
                  //add button
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 85),
                      child: GestureDetector(
                        onTap: () async {
                          await   AddRuche();
                        },
                        child: Container(
                          padding: EdgeInsets.all(16),
                          decoration:  BoxDecoration(
                            color: Colors.green[700],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(child: Text(
                            'ajouter ruche ',
                            style: GoogleFonts.robotoCondensed(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                             ),
                            ),
                          ),
                        ),
                      ),
                    ),

            ],
          ),
        ),
      )
    );
  }


  showButtomSheet(){
    return showModalBottomSheet(context: context, builder: (context){
      return Container(
        padding: EdgeInsets.all(20),
        height: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Text("please choose image",style:  TextStyle(  color:kPrimaryColor ,fontSize: 25,fontWeight: FontWeight.bold),)),         
            SizedBox(height: 20,) ,
            Container(
              color: kBackgroundColor,
              child: InkWell(
                onTap: ()async {
                
                XFile? xFile = await ImagePicker().pickImage(
                  source: ImageSource.gallery);
                  Navigator.of(context).pop();
                  myfile = File(xFile!.path) ;
                  setState(() {
                    
                  });
                 
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Icon(Icons.photo),
                      SizedBox(width: 20,),
                      Text("from gallery" ,style: TextStyle( fontSize: 20,fontWeight: FontWeight.normal), ),
                    ],
                  )
                  ),          
              ),
            ),
            SizedBox(height: 8,) ,
            Container(
              color: kBackgroundColor,
              child: InkWell(
                onTap: () async { 
                  XFile? xFile = await ImagePicker().pickImage(
                    source: ImageSource.camera);
                    Navigator.of(context).pop();
                    myfile = File(xFile!.path) ;
                    setState(() {
                      
                    });
                  
                  
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Icon(Icons.camera_alt),
                      SizedBox(width: 20,),
                      Text("from camera", style: TextStyle(fontSize: 20,fontWeight: FontWeight.normal), ),
                    ],
                  )
                  ),
              ),
            ),         
          ],
        )
      );
    }
    );
  }
}