// ignore_for_file: camel_case_types,// prefer_const_constructors,//prefer_const_literals_to_create_immutables,//use_build_context_synchronously,// avoid_single_cascade_in_expression_statements, //prefer_typing_uninitialized_variables, avoid_print,// non_constant_identifier_names,// depend_on_referenced_packages,, depend_on_referenced_packages, unused_local_variable, prefer_const_constructors, avoid_unnecessary_containers, unnecessary_null_comparison, prefer_const_literals_to_create_immutables, use_build_context_synchronously 
import 'dart:io';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart'; // for date formatting
import 'package:http/http.dart' as http ;
import 'dart:convert';

class add extends StatefulWidget {
  const add({super.key});
  @override
  State<add> createState() => _addState();
}

class _addState extends State<add> {

   Position? cl ;

  Future getPositon() async {
    bool services ;
    LocationPermission per ;
     services = await Geolocator.isLocationServiceEnabled() ;

     if(services == false){
      AwesomeDialog(
        context: context ,
        title: "services",
        body: 
        Text('services not enable',
                 style: GoogleFonts.robotoCondensed(
                    fontSize: 20,fontWeight: FontWeight.normal, color: Colors.black,
                  ),                
              ),
        btnOkOnPress: () {},    
        ).show();}
   
    per = await Geolocator.checkPermission() ;

    if( per == LocationPermission.denied) {
      per = await Geolocator.requestPermission() ;
      if(per == LocationPermission.always ){
        getLatAndLong();
      }
    }
  }

  Future<Position> getLatAndLong() async {
    return await Geolocator.getCurrentPosition().then((value) =>  value);
  }

  final TextEditingController _date = TextEditingController() ;
 
  File ? _file ;
  Future pickercamera() async{
    final myfile = await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      _file = File(myfile!.path);
    });
  }
  
  Future pickerGallery() async{
    final myfile = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      _file = File(myfile!.path);
    });
  }


  List posts = [];
  Future getPost() async {
    String  url = "https://jsonplaceholder.typicode.com/posts" ;
    var response = await http.get(Uri.parse(url));
    var respnsebody = jsonDecode(response.body) ; 
    
  return respnsebody ;
  }
 
  
  @override
  void initState() {
    getPositon();
    getPost();
    super.initState();
  }  
  @override
  Widget build(BuildContext context) {    
    var time = DateTime.now() ;
    return Scaffold(
      appBar: AppBar(
        title:  Text('add note'),
      ),
      body : SingleChildScrollView(
        child: Container(child : Column(
          children: [
            Form(child: Column(
              children: [
                TextFormField(
                  maxLength: 30 ,
                  decoration: InputDecoration(
                  filled: true,
                  fillColor: kBackgroundColor,
                  labelText: 'title note',
                   iconColor: Colors.black,
                  prefixIcon: Icon(Icons.note_add , color:  Colors.green,)
                ),
                ),
                TextFormField(
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
                  controller: _date,
                  decoration: InputDecoration(
                  filled: true,
                  fillColor: kBackgroundColor,
                  labelText: ' select date',
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
                      _date.text = DateFormat('yyyy-mm-dd').format(pickDate) ;
                    });
                  }
                  
                } ,
                ),                     
                //add image front
                ElevatedButton(
                   child:  Text('add image for note'),
                   onPressed: (){ showButtomSheet();}, ),  
                Center(child: _file == null ? const Text('image not selected') : Image.file(_file!),),                                
               //location(get latitude and longitude) button                            
                ElevatedButton(onPressed: () async {
                  cl = await getLatAndLong()  ;
                  print('lat ${cl!.latitude}');
                  print('lat ${cl!.longitude}');             
                  List<Placemark> placemarks = await 
                  placemarkFromCoordinates(cl!.latitude,cl!.longitude);
                  print(placemarks[0].locality);
                }
                , child: Text('show location')             
                ),
                //add note button
                ElevatedButton(onPressed: (){},
                             child:  Padding(
                               padding: const EdgeInsets.all(10),
                               child: Text('add note', 
                               style: Theme.of(context).textTheme.headlineMedium,),
                             ),
                             ),
               
                //http
              // FutureBuilder(
              //     future:  getPost(),
              //     builder: (context , snapshot) {
              //       if(snapshot.hasData){
              //        return ListView.builder(
              //         itemCount: snapshot.data.length,
              //         itemBuilder: (context ,i){
              //           return Container(
              //             child: Text("${snapshot.data[i]["title"]}"),);
              //       });
              //       }
              //       return Text('no data found') ; } 
              //  ),

            
              ],
            ))
          ],
        )),
      ),
    );
  }


  showButtomSheet(){
    return showModalBottomSheet(context: context, builder: (context){
      return Container(
        padding: EdgeInsets.all(20),
        height: 170,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("please choose image",style:  TextStyle(  color:kPrimaryColor ,fontSize: 25,fontWeight: FontWeight.bold),),
            
            
            InkWell(
              onTap: (){
                pickerGallery() ;
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
            InkWell(
              onTap: (){
                pickercamera();

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
                )),
            ),
            
          ],
        )
      );
    }
    );
  }
}