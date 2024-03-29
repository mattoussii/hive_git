// ignore_for_file: camel_case_types,// prefer_const_constructors,//prefer_const_literals_to_create_immutables,//use_build_context_synchronously,// avoid_single_cascade_in_expression_statements, //prefer_typing_uninitialized_variables, avoid_print,// non_constant_identifier_names,// depend_on_referenced_packages,, depend_on_referenced_packages, unused_local_variable, prefer_const_constructors, avoid_unnecessary_containers, unnecessary_null_comparison, prefer_const_literals_to_create_immutables, use_build_context_synchronously, unused_import, unused_field, non_constant_identifier_names, prefer_final_fields, prefer_typing_uninitialized_variables 
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


class edit extends StatefulWidget {
  final visites ;
  const edit({super.key, this.visites, });
  @override
  State<edit> createState() => _editState();
}

class _editState extends State<edit> {

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
  // File ? _file ;
  // Future pickercamera() async{
  //   final myfile = await ImagePicker().pickImage(source: ImageSource.camera);
  //   setState(() {
  //     _file = File(myfile!.path);
  //   });
  // }
  // Future pickerGallery() async{
  //   final myfile = await ImagePicker().pickImage(source: ImageSource.gallery);
  //   setState(() {
  //     _file = File(myfile!.path);
  //   });
  // }


Crud _crud = Crud() ;
File? myfile ;
GlobalKey<FormState> formState =GlobalKey() ;
final TextEditingController content  = TextEditingController() ;
final TextEditingController title = TextEditingController() ;
final TextEditingController date = TextEditingController() ;

bool isloading =false ;

 EditVisites() async {
  if(formState.currentState!.validate()){
    isloading = true ;
    setState(() {});
    var response ;

    if(myfile == null){
    response = await _crud.postRequest(linkEditVisite, {
    "title"     : title.text,
    "content"   : content.text ,
    "date"      : date.text ,
    "id"        : widget.visites['visite_id'].toString() ,
    "imagename" : widget.visites['visite_image'].toString() ,

  });
    }else{
    response = await _crud.postRequestwithFile(linkEditVisite, {
    "title"     : title.text,
    "content"   : content.text ,
    "date"      : date.text ,
    "imagename" : widget.visites['visite_image'].toString() ,
    "id"        : widget.visites['visite_id'].toString() ,
  },myfile!);
    }


    isloading = false ;
    setState(() {  
    });
  if(response["status"] == "success"){
    Navigator.of(context).pushReplacementNamed('visite');
  }else{ 
  }
  }
 }

 @override
  void initState() {
    title.text = widget.visites['visite_title'];
    content.text = widget.visites['visite_content'];
    date.text = widget.visites['visite_date'];
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {    
    var time = DateTime.now() ;
    return Scaffold(
      appBar: AppBar(
        
      backgroundColor: kPrimaryColor,
      elevation: 0,
      title: Text(
        'modifier visite',
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
          child: ListView(
            children: [

                   //title  
                  TextFormField(
                      validator: (text){
                        if (text!.isEmpty){
                          return "this field can't be empty";
                        }
                        return null ;
                      },
                    controller: title,
                    maxLength: 30 ,
                    decoration: InputDecoration(
                    filled: true,
                    fillColor: kBackgroundColor,
                    labelText: 'titre de visite ',
                     iconColor: Colors.black,
                    prefixIcon: Icon(Icons.note_add , color:  Colors.green,)
                  ),
                  ),

                  //note
                  TextFormField(
                     validator: (text){
                        if (text!.isEmpty){
                          return "this field can't be empty";
                        }
                        return null ;
                      },
                    controller: content,
                      minLines: 1,
                      maxLines: 3,
                      maxLength: 200 ,
                      decoration: InputDecoration(
                    filled: true,
                    fillColor: kBackgroundColor,
                    labelText: ' note',
                     iconColor: Colors.black,
                    prefixIcon: Icon(Icons.note_add , color:  Colors.green,)
                  ),
                  ),

                  ///time
                  TextFormField(
                    validator: (text){
                        if (text!.isEmpty){
                          return "this field can't be empty";
                        }
                        return null ;
                      },
                    controller: date,
                    decoration: InputDecoration(
                    filled: true,
                    fillColor: kBackgroundColor,
                    labelText: '  date de creation ',
                     iconColor: Colors.black,
                    prefixIcon: Icon(Icons.calendar_today , color:  Colors.green,), 
                  ),
                  onTap: ()async {
                    DateTime? pickDate = await showDatePicker(
                      context: context, 
                      initialDate: DateTime.now(),
                       firstDate: DateTime(2000),
                        lastDate: DateTime(2100));
                    if(pickDate!= null){
                      setState(() {
                        date.text = DateFormat('yyyy-MM-dd').format(pickDate) ;
                      });
                    }    
                  } ,
                  ),                                 
                 
                  //add image and show location
                  // ElevatedButton(
                  //    child:  Text('add image for note'),
                  //    onPressed: (){ showButtomSheet();}, ),                
                  // Center(child: _file == null ? const Text('image not selected') : Image.file(_file!),),                                                        
                //                
                  //location(get latitude and longitude) button                            
                //   ElevatedButton(onPressed: () async {
                //     cl = await getLatAndLong()  ;
                //     print('latitude ${cl!.latitude}');
                //     print('longitude ${cl!.longitude}');             
                //     List<Placemark> placemarks = await 
                //     placemarkFromCoordinates(cl!.latitude,cl!.longitude);
                //     print(placemarks[0].subLocality);
                //   } , child: Text('show location') 
                //   ),

                  Container(height: 20,),

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
                   //add button
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 85),
                      child: GestureDetector(
                        onTap: () async {
                          await   EditVisites();
                        },
                        child: Container(
                          padding: EdgeInsets.all(16),
                          decoration:  BoxDecoration(
                            color: Colors.green[700],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(child: Text(
                            'modifier',
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