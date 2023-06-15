// ignore_for_file: camel_case_types, prefer_const_constructors, unnecessary_string_interpolations, file_names, unnecessary_brace_in_string_interps


import 'package:firebase_auth_app/constants.dart';
import 'package:firebase_auth_app/models/visiteModel.dart';
import 'package:flutter/material.dart';

class historyCard extends StatelessWidget {
  final void Function()? onTap ;
    final VisiteModel visiteModel;
    final void Function()? onDelete;

  const historyCard({
    Key? key,
    required this.onTap,
    required this.visiteModel,  
    required this.onDelete,
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
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                      
                    ),
                 boxShadow: const [
                    BoxShadow(
                      offset: Offset(0,15),
                      blurRadius: 30, 
                      color:  Color.fromARGB(66, 161, 156, 156),
                    ),
                  ]
                  ),
                 
                
            child: Card(
              
                  color: kBackgroundColor,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [

                        Expanded(
                          flex: 2,
                          child: ListTile(
                          title: Text('${visiteModel.title}'),
                          subtitle: Text('${visiteModel.date}'),
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
                  )
                ),
          ),
        ),
      ),
    );                 
  }
}