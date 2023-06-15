
// ignore_for_file: prefer_const_constructors, file_names, unnecessary_string_interpolations

import 'package:firebase_auth_app/components/LinkAPI.dart';
import 'package:firebase_auth_app/constants.dart';
import 'package:firebase_auth_app/models/photoModel.dart';
import 'package:flutter/material.dart';

class CardPhoto extends StatelessWidget {
 final void Function()? ontap ;
 final PhotoModel  photomodel;

 final void Function()? onDelete ;
  const CardPhoto({super.key, 
  this.ontap, 
  this.onDelete, 
  required this.photomodel ,
  });

  @override
  Widget build(BuildContext context) {
    return    InkWell(
      onTap: ontap,
      child: Card(
        color: kBackgroundColor,
              child: Center(
                child: Column(
                  
                  children: [
                    SizedBox(height: 10,),
                      Image.network(
                      '$linkImageRoot/${photomodel.photo}',
                      width: 300,
                      height: 300,
                      fit: BoxFit.contain,
                      ),
                      
                  ListTile(
                    
                    trailing: Text('${photomodel.photoDetail}'),
                    ),

                    IconButton(onPressed: onDelete ,
                     icon: Icon(Icons.delete ,color: Colors.amber ,))
                      
                ],),
              ),
            ),
    );
  }
}