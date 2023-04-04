// ignore_for_file: camel_case_types, prefer_const_constructors, unnecessary_string_interpolations, file_names


import 'package:firebase_auth_app/models/visiteModel.dart';
import 'package:flutter/material.dart';

class visiteCard extends StatelessWidget {
  final void Function()? onTap ;
    final VisiteModel visiteModel;
    final void Function()? onDelete;

  const visiteCard({
    Key? key, this.onTap,
    required this.visiteModel,  
    this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
  
    return InkWell(
      onTap: onTap ,
      child: Card(
            child: ListTile(
            leading: Image.asset('icons/history.png'),
            title: Text('${visiteModel.visiteTitle}'),
            subtitle: Text('${visiteModel.visiteDate}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
              IconButton(
              onPressed:onDelete,

            icon: Icon(Icons.delete_rounded, color: Colors.red,)
            ),
                ], 
              ) ,
            )
          ),
    );                 
  }
}