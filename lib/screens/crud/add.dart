// ignore_for_file: camel_case_types, prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, unused_import, unused_local_variable, use_build_context_synchronously, avoid_single_cascade_in_expression_statements, prefer_typing_uninitialized_variables, avoid_print, non_constant_identifier_names
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';






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
        )..show();}
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






  @override
  void initState() {
    getPositon();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('add note'),
      ),
      body : Container(child : Column(
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
              //add image front
              ElevatedButton(onPressed: (){
                showButtomSheet();
              },
              child:  Text('add image for note'),),
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
              //calcul distance entre deux place
              ElevatedButton(onPressed: () async{
                var distanceBetweeen =  Geolocator.distanceBetween(
                  22.352698, 24.236514, 36.215874, 40.235418) ;
                var DistanceKm = distanceBetweeen / 1000 ;
                print(DistanceKm) ;

              }, 
              child: Text('calcul distance')),
             
             
             
              ElevatedButton(onPressed: (){},
                           child:  Padding(
                             padding: const EdgeInsets.all(10),
                             child: Text('add note', 
                             style: Theme.of(context).textTheme.headlineMedium,),
                           ),
                           ),
          
          
            ],
          ))
        ],
      )),
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
                )),
            ),
                        InkWell(
              onTap: (){

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