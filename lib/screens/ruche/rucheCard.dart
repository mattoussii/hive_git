// ignore_for_file: camel_case_types, prefer_const_constructors, unnecessary_string_interpolations, file_names, unnecessary_brace_in_string_interps, unused_import


import 'package:firebase_auth_app/components/LinkAPI.dart';
import 'package:firebase_auth_app/constants.dart';
import 'package:firebase_auth_app/models/rucheModel.dart';
import 'package:flutter/material.dart';

class rucheCard extends StatelessWidget {
  final void Function()? onTap ;
    final RucheModel rucheModel;
    final void Function()? onDelete;

  const rucheCard({
    Key? key,
    required this.onTap,
    required this.onDelete,
    required this.rucheModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
  
    return SingleChildScrollView(
      child: InkWell(
        onTap: onTap ,
        child: Padding(
          padding: const EdgeInsets.only(left: 10 ,right: 10 ,top: 5,bottom: 5),
          child: Container(           
                  height: 120,
                  decoration:BoxDecoration(
                    color: kBackgroundColor ,
                    borderRadius: BorderRadius.only(      
                      topRight: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                      
                    ),
                 boxShadow: const [
                    BoxShadow(
                      offset: Offset(0,15),
                      blurRadius: 30, 
                      color:  Color.fromARGB(66, 0, 0, 0),
                    ),
                  ]
                  ),
                 
                
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child:  Image.network(
                      '$linkImageRoot/${rucheModel.rucheImage}',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                      ),
                      
                  ),
                  
                  
                  Expanded(
                    flex: 2,
                    child: ListTile(
                    title: Text('${rucheModel.new_position}'),
                    subtitle: Text('${rucheModel.reference}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                      IconButton(
                    
                      onPressed:onDelete,
                  
                    icon: Icon(Icons.delete_rounded, color: Colors.red,)
                    ),
                        ], 
                      ) ,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );                 
  }
}