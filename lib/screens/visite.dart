// ignore_for_file: camel_case_types, use_key_in_widget_constructors, avoid_unnecessary_containers, prefer_const_constructors_in_immutables, prefer_typing_uninitialized_variables, prefer_const_constructors, unused_local_variable, sized_box_for_whitespace

import 'package:firebase_auth_app/constants.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class visiteScreen extends StatefulWidget {
  const visiteScreen({super.key});

  @override
  State<visiteScreen> createState() => _visiteScreenState();
}

class _visiteScreenState extends State<visiteScreen> {

  List notes = [
    {
      "notes" : " note note note note note note note note note 1 " ,
      "images" : "shop.png" 
    },
        {
      "notes" : " note note note note note note note note note2 " ,
      "images" : "gallery.png" 
    },
        {
      "notes" : " note note note note note note note note note 3" ,
      "images" : "locate.png" 
    },
        {
      "notes" : " note note note note note note note note note 4" ,
      "images" : "seek.png" 
    },
        {
      "notes" : " note note note note note note note note note 5" ,
      "images" : "trade.png" 
    }
  ];


  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width ;
    return Scaffold(
            appBar: AppBar(
        
      backgroundColor: kPrimaryColor,
      elevation: 0,
      title: Text(
        'help',
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
        },
      ),

    ),
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: (){
               Navigator.of(context).pushNamed('add');
              }),
            body:
            Card(   
              
              child:  ListView.builder(

                itemCount: notes.length ,
                itemBuilder : ( context , i) {
                  return Dismissible(
                    key:  Key("$i") ,
                    child: Listnotes(
                    
                      notes: notes[i],
                      
                    ),
                  ) ;
                },
            ),
            ),
    );
  }
}

class Listnotes extends StatelessWidget{
  final notes ;
  
   Listnotes({this.notes, })  ;
@override
Widget build(BuildContext context){
  return Card(
    child: Row(
      children: [
        Expanded(
          flex: 1,
          child: Image.asset("icons/history.png",
           fit: BoxFit.fill,
          
           )),
        Expanded(
           flex: 3,
          child: ListTile(
            title: Text( "title") ,
            subtitle:  Text( "${notes['notes']}") ,
            // subtitle:ElevatedButton.icon( 
              
            //   icon: Icon(Icons.highlight_remove_rounded),
            //   label: Text('remove'), 
            //    onPressed: (){}, ),
               
            trailing: IconButton(onPressed: (){},
             icon: Icon(Icons.edit , color:  Colors.black,)),
              
            ),
        ),
      ],
    ),
  ) ;
}
}
