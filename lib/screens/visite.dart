// ignore_for_file: library_private_types_in_public_api, camel_case_types, prefer_const_constructors, avoid_print

import 'package:firebase_auth_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class visite extends StatefulWidget {
const visite({Key? key}) : super(key: key);

@override
_visiteState createState() => _visiteState();
}

class _visiteState extends State<visite> {
	
// Initial Selected Value
String? dropdownvalue ;

// List of items in our dropdown menu
var items = [	
	'Item 1',
	'Item 2',
	'Item 3',
	'Item 4',
	'Item 5',
];
bool check1 = false;
bool check2 = false;
bool check3 = false;
String? radio ;
@override
Widget build(BuildContext context) {
	return Scaffold(
  appBar: AppBar(
        
      backgroundColor: kPrimaryColor,
      elevation: 0,
      title: Text(
        'visite',
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
	body:  Padding(
      padding: const EdgeInsets.symmetric(vertical: 30 ,  horizontal: 10),
      child: Row(
     
     
        children: [
          Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              color: Color.fromARGB(255, 213, 212, 212),
              child: DropdownButton(
                      // Down Arrow Icon
                      icon: const Icon(
                        Icons.hive_rounded,
                        color: Colors.yellow,
                        ),	
                      
                      // Array list of items
                      items: items.map((String items) {
              return DropdownMenuItem(        
              value: items,
              child: Text(items),            
              );
                      }).toList(),
                       hint: Text("Choose an item",
                       textAlign: TextAlign.center,
                     style: GoogleFonts.robotoCondensed(
                  fontSize: 20,fontWeight: FontWeight.w100, color: Colors.black,
                ),),
                       value: dropdownvalue,
                      onChanged: (String? newValue) { setState(() { dropdownvalue = newValue ?? "";
              });
                      },
                      focusColor: Colors.red,
                      dropdownColor: Color.fromARGB(255, 241, 236, 236),
            style: GoogleFonts.robotoCondensed(
              fontSize: 20,fontWeight: FontWeight.w100, color: Colors.black,
                )),
            ),

            SizedBox(height: 40,),

            Text("choose item",
              style: GoogleFonts.robotoCondensed(
                            fontSize: 30,fontWeight: FontWeight.w100, color: Colors.black,
                          )),
            Row(
                    children: [
                      Text("item1",
                            style: GoogleFonts.robotoCondensed(
                            fontSize: 20,fontWeight: FontWeight.w100, color: Colors.black,
                          )),
                      Checkbox(value: check1, onChanged: (val){
                      setState(() {
                        check1 = val! ;
                      });
                      },),
                    ],
                  ),
            Row(
                    children: [
                      Text("item2",
                            style: GoogleFonts.robotoCondensed(
                            fontSize: 20,fontWeight: FontWeight.w100, color: Colors.black,
                          )),
                      Checkbox(value: check2, onChanged: (val){
                      setState(() {
                        check2 = val! ;
                      });
                      },),
                    ],
                  ),
            Row(
                    children: [
                      Text("item3",
                            style: GoogleFonts.robotoCondensed(
                            fontSize: 20,fontWeight: FontWeight.w100, color: Colors.black,
                          )),
                      Checkbox(value: check3, onChanged: (val){
                      setState(() {
                        check3 = val! ;
                      });
                      },),
                    ],
                  ), 
            SizedBox(height: 20,),
            Column( 
             children: [
              Text('choose  item',
               style: GoogleFonts.robotoCondensed(
                            fontSize: 30,fontWeight: FontWeight.w100, color: Colors.black,
                          )),
            Column(
              children: [
                
                Row(
                  children: [
                    Text("radio1"),
                    Radio( activeColor: Colors.green, value: "check1", groupValue: radio, onChanged: (check1){
                      setState(() {
                        radio=check1;
                      });
                    }),
                  ],
                ),
                
                Row(
                  children: [
                    Text("radio2"),
                    Radio(value: "check2", groupValue: radio, onChanged: (check2){
                      setState(() {
                        radio=check2;
                      });
                    }),
                  ],
                ),
                
                Row(
                  children: [
                    Text("radio3"),
                    Radio(value: "check3", groupValue: radio, onChanged: (check3){
                      setState(() {
                        radio=check3;
                      });
                    }),
                  ],
                ),
              ],
            ),     
             ],
          )   
                ],
            
                  ),
         
         
         
           
                ],
              ),
       
              
      
    ),
    
	);
}
}
