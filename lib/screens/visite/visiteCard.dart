// ignore_for_file: camel_case_types, prefer_const_constructors, unnecessary_string_interpolations, file_names


import 'package:flutter/material.dart';

class visiteCard extends StatelessWidget {
  final void Function()? onTap ;
    final String title ;
    final String date ;
    final void Function()? onDelete;
  const visiteCard({Key? key, this.onTap,
  required this.title, 
  required this.date, 
  this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
  
    return InkWell(
      onTap: onTap ,
      child: Card(
            child: ListTile(
            leading: Image.asset('icons/history.png'),
            title: Text('$title'),
            subtitle: Text('$date'),
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