// ignore_for_file: camel_case_types,// prefer_const_constructors,//prefer_const_literals_to_create_immutables,//use_build_context_synchronously,// avoid_single_cascade_in_expression_statements, //prefer_typing_uninitialized_variables, avoid_print,// non_constant_identifier_names,// depend_on_referenced_packages,, depend_on_referenced_packages, unused_local_variable, prefer_const_constructors, avoid_unnecessary_containers, unnecessary_null_comparison, prefer_const_literals_to_create_immutables, use_build_context_synchronously, unused_import, unused_field, prefer_typing_uninitialized_variables, prefer_const_constructors_in_immutables 
import 'dart:io';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth_app/constants.dart';
import 'package:firebase_auth_app/screens/visite.dart';
import 'package:firebase_auth_app/sqldb.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart'; // for date formatting



class edit extends StatefulWidget {
  final note; 
  final title ;
  final id ;
  final date ;
  
   edit({super.key, this.note, this.title, this.id, this.date,});


  @override
  State<edit> createState() => _editState();
}

class _editState extends State<edit> {

SqlDb sqlDb =SqlDb() ;

GlobalKey<FormState> formState =GlobalKey() ;

final TextEditingController note  = TextEditingController() ;
final TextEditingController title = TextEditingController() ;
final TextEditingController date = TextEditingController() ;



 @override
void initState() {
  note.text = widget.note ;
  title.text = widget.title ;
  date.text = widget.date ;
  
  super.initState();
  
}


  @override
  Widget build(BuildContext context) {    
    var time = DateTime.now() ;
    return Scaffold(
      appBar: AppBar(
        title:  Text('Edit note'),
      ),
      body : SingleChildScrollView(
        child: Container(child : Column(
          children: [

            Form(child: Column(
              children: [
                //title
                TextFormField(
                  controller: title,
                  maxLength: 30 ,
                  decoration: InputDecoration(
                  filled: true,
                  fillColor: kBackgroundColor,
                  labelText: 'nom de ruche ',
                   iconColor: Colors.black,
                  prefixIcon: Icon(Icons.edit , color:  Colors.green,)
                ),
                ),
                //note
                TextFormField(
                  controller: note,
                    minLines: 1,
                    maxLines: 3,
                    maxLength: 200 ,
                    decoration: InputDecoration(
                  filled: true,
                  fillColor: kBackgroundColor,
                  labelText: ' note',
                   iconColor: Colors.black,
                  prefixIcon: Icon(Icons.edit , color:  Colors.green,)
                ),
                ),
                ///time
                TextFormField(
                  controller: date,
                  decoration: InputDecoration(
                  filled: true,
                  fillColor: kBackgroundColor,
                  labelText: ' date de creation',
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
                      date.text = DateFormat('yyyy-mm-dd').format(pickDate) ;
                    });
                  }
                  
                } ,
                ),                     
             
                SizedBox(height: 50,),
                //edit note button
                
                ElevatedButton(onPressed: () async{
                 int response = await sqlDb.updateData(
                  '''
                   UPDATE notes SET 
                   note = "${note.text}" , 
                   title = "${title.text}" , 
                   date = "${date.text}" 
                   WHERE id = ${widget.id}
   
                  '''
                  ) ; 
                  if(response > 0){
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context)=>visiteScreen()),
                       (route) => false);
                  }
                 print('respons***********************');
                 print(response) ;       
                },
                child:  Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text( 'Edit note',) ,
                ),

                ),

  
              ],
            ))
          ],
        )),
      ),
    );
  }

}

