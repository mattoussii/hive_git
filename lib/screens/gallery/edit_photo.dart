// ignore_for_file: camel_case_types,// prefer_const_constructors,//prefer_const_literals_to_create_immutables,//use_build_context_synchronously,// avoid_single_cascade_in_expression_statements, //prefer_typing_uninitialized_variables, avoid_print,// non_constant_identifier_names,// depend_on_referenced_packages,, depend_on_referenced_packages, unused_local_variable, prefer_const_constructors, avoid_unnecessary_containers, unnecessary_null_comparison, prefer_const_literals_to_create_immutables, use_build_context_synchronously, unused_import, unused_field, non_constant_identifier_names, prefer_final_fields, sized_box_for_whitespace, empty_statements, curly_braces_in_flow_control_structures, prefer_typing_uninitialized_variables 
import 'dart:io';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth_app/components/CustumTxtForm.dart';
import 'package:firebase_auth_app/components/LinkAPI.dart';
import 'package:firebase_auth_app/components/valid.dart';
import 'package:firebase_auth_app/constants.dart';
import 'package:firebase_auth_app/crud.dart';
import 'package:firebase_auth_app/main.dart';
import 'package:firebase_auth_app/sqldb.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';



class edit_photo extends StatefulWidget {

  final photos ;
  const edit_photo({Key? key, this.photos}) : super(key: key);
  @override
  State<edit_photo> createState() => _edit_photoState();
}

class _edit_photoState extends State<edit_photo>  {


Crud _crud = Crud() ;
File? myfile ;
GlobalKey<FormState> formState =GlobalKey() ;
final TextEditingController detail = TextEditingController() ;


bool isloading =false ;

 Editphoto() async {
  if(formState.currentState!.validate()){
    isloading = true ;
    setState(() {});
    var response ;

    if(myfile == null){
    response = await _crud.postRequest(linkEditPhoto, {
    "detail"    : detail.text,
    "imagename" : widget.photos['photo_image'].toString() ,
    "id"        : widget.photos['photo_id'].toString() ,

  });
    }else{
    response = await _crud.postRequestwithFile(linkEditPhoto, {
    "detail"     : detail.text,
    "imagename" : widget.photos['photo_image'].toString() ,
    "id"        : widget.photos['photo_id'].toString() ,
  },myfile!);
    }


    isloading = false ;
    setState(() {  
    });
  if(response["status"] == "success"){
    Navigator.of(context).pushReplacementNamed('gallery');
  }else{ 
  }
  }
 }
  @override
  void initState() {
    detail.text = widget.photos['photo_detail'];

    super.initState();
  }
  
  
  @override
  Widget build(BuildContext context) {    

    return Scaffold(
      appBar: AppBar(
      backgroundColor: kPrimaryColor,
      elevation: 0,
      title: Text(
        'modifier image',
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
           Navigator.of(context).pushReplacementNamed('gallery');
        },
      ),

    ),
     
      body : isloading == true ? 
      Center(child: CircularProgressIndicator(),)
      : Container(
        padding: EdgeInsets.all(10),
        child: Form(
          
          key: formState,
            child: ListView(
              children: [
                       SizedBox(height: 200,), 
                       //title  
                      CustumTxtForm(
                        hint: "modifier les details",
                         mycontroller: detail, 
                         valid: (val){
                            return validInput(val!, 1, 30) ;
                         }),
                   
                       Container(height: 20,),    

                       // image button
                      
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
                              'modifier image',
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
                       //edit button
                       Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 85),
                        child: GestureDetector(
                          onTap: () async {
                            await   Editphoto();
                          },
                          child: Container(
                            padding: EdgeInsets.all(16),
                            decoration:  BoxDecoration(
                              color: Colors.green[700],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(child: Text(
                              'modifier ',
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