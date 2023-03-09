// ignore_for_file: library_private_types_in_public_api, camel_case_types, prefer_const_constructors, avoid_print, unnecessary_new, non_constant_identifier_names, avoid_unnecessary_containers

import 'dart:ffi';

import 'package:firebase_auth_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/retry.dart';

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
// List of images
List images = [
  { 'url':'images/new/gallery.png'} ,
  {'url':'images/new/help.png'} ,
  { 'url':'images/new/history.png'} ,
  {'url':'images/new/locate.png'} , 
  {'url':'images/new/location.png'} ,
  {'url':'images/new/love.png'} ,
  {'url':'images/new/qr-code.png'} ,
  {'url':'images/new/qr-scan.png'} ,
  {'url':'images/new/qr.png'}, 
  {'url':'images/new/seek.png'} ,
  {'url':'images/new/shop.png'} ,
  {'url':'images/new/trade.png'} ,
  {'url':'images/new/where.png'} ,
];
bool check1 = false;
bool check2 = false;
bool check3 = false;
String? radio ;
bool notify = false;

  PageController? pc;


 @override
  initState(){
 pc = new PageController(initialPage: 1);
 super.initState();
}
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
	  body:  SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
       padding: const EdgeInsets.symmetric(vertical: 30 ,  horizontal: 10),
       child:
        Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
  
//dropDownMenu Buttons           
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
  
//checkbox buttons 
  
          Column(
            children:[
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
            ]
          ),          
          SizedBox(height: 20,),
  
//radio buttons
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
              ),             ],
          ),  
        ],
         ),   
          SizedBox(height: 20,),
// switch buttons   
          
  
          Column(
            children: [
              Text(" notifications",
                    style: GoogleFonts.robotoCondensed(
                    fontSize: 30,fontWeight: FontWeight.w100, color: Colors.black,
                            )),
               Switch(value: notify, onChanged: (val){
                  setState(() {
                    notify = val ;
                  });
                }),
            ],
          ),
          SizedBox(height: 20,),
  
// liste tile            
           Container(
             color:  Colors.red,
            child: ListTile(title:  Text("iphone14"),)),
           SizedBox(height: 20,),
//snackbar

           ElevatedButton(
        onPressed: () {
          final snackBar = SnackBar(
            behavior: SnackBarBehavior.floating,
            content: const Text('Yay! A SnackBar!'),
            duration:Duration(seconds:2),
            backgroundColor:  Colors.green,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            action: SnackBarAction(
              label: 'Undo', textColor: Colors.white,
              onPressed: () {
                print('undo');
              },
            ),
          );
          // Find the ScaffoldMessenger in the widget tree
          // and use it to show a SnackBar.
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: const Text('Show SnackBar'),
      ),
           SizedBox(height: 20,), 
//alertDialog   
           ElevatedButton(onPressed: (){
              showDialog(context: context, builder: (context){
                return AlertDialog(
                  actions: [
                    TextButton(onPressed: (){
                      Navigator.of(context).pop();
                    }, child: Text('OK')),

                    TextButton(onPressed: (){
                      Navigator.of(context).pop();
                    }, child: Text('cancel')),
                  ],

                  titlePadding: EdgeInsets.only(top: 20,left: 20),
                  contentPadding: EdgeInsets.all(20),
                  contentTextStyle: TextStyle( fontWeight: FontWeight.bold,  color: Colors.blue),
                  titleTextStyle: TextStyle( fontWeight: FontWeight.normal,  color: Colors.red),   
                  title: Text("title"),
                  content: Text("content content content"),
                );
              });
            },
             child: Text("show alert")),
           SizedBox(height: 20,), 
//listeview builder    
//exemple shop screen


//pageview builder           
            Column(
              children: [
                SizedBox(
                  height: 300,
                  child: PageView.builder(
                    controller:  pc ,
                    itemCount: images.length,
                    itemBuilder: (context, i){
                      return Image.asset(images[i]['url'], fit: BoxFit.fill,);
                    }

                    

                  ),
                ),
                ElevatedButton(onPressed: (){
pc!.animateToPage(0, duration: Duration(seconds: 1), curve: Curves.easeInOutCubicEmphasized);
                }, child: Text('return to first page  '))
              ],
            ),
            SizedBox(height: 20,), 
//Text Field
          Column(children: [
            TextFormField(         
               keyboardType: TextInputType.emailAddress,
               maxLines: 1,
              decoration: InputDecoration(
                
                enabled: true,
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(22),
                  borderSide: BorderSide(
                    color: Colors.red,
                    width: 3 ,                   
                  )
                ),

                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(22),
                  borderSide: BorderSide(
                    color: Colors.indigo,
                    width: 3 ,                   
                  )
                ),

                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(22),
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 3 ,                    
                  )
                ),

                hintText: "type your message...",
                hintStyle: TextStyle(color: Colors.blue),
                prefixIcon: Icon(Icons.text_fields),
                suffixIcon: Icon(Icons.send , color: Colors.blue,),
                icon: Icon(Icons.messenger_outline_rounded),
              ),
            ),
            SizedBox(height: 10,), 
            TextFormField(         
               keyboardType: TextInputType.emailAddress,
               obscureText: true,
               maxLines: 1,
              decoration: InputDecoration(
                
                enabled: true,
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(22),
                  borderSide: BorderSide(
                    color: Colors.red,
                    width: 3 ,                   
                  )
                ),

                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(22),
                  borderSide: BorderSide(
                    color: Colors.indigo,
                    width: 3 ,                   
                  )
                ),

                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(22),
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 3 ,                    
                  )
                ),

                hintText: "type your password...",
                hintStyle: TextStyle(color: Colors.blue),
                prefixIcon: Icon(Icons.text_fields),
                suffixIcon: Icon(Icons.hive_rounded , color: Colors.blue,),
                icon: Icon(Icons.password_rounded),
              ),
            )
          ],)
      
      
      
      
      
      ] ),
        
               
       
     ),
    ),
    
	);
}
}
