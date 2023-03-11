// ignore_for_file: camel_case_types, prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace, prefer_const_literals_to_create_immutables


import 'package:firebase_auth_app/constants.dart';

import 'package:flutter/material.dart';







class add extends StatefulWidget {
  const add({super.key});

  @override
  State<add> createState() => _addState();
}

class _addState extends State<add> {
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
              ),),

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
              ),),
              ElevatedButton(onPressed: (){
                showButtomSheet();
              },
              child:  Text('add image for note'),),


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