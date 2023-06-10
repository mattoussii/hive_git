// ignore_for_file: library_private_types_in_public_api, camel_case_types, prefer_const_constructors, avoid_print, unnecessary_new, non_constant_identifier_names, avoid_unnecessary_containers, avoid_types_as_parameter_names, unnecessary_string_interpolations, prefer_typing_uninitialized_variables, unused_import, unused_field, prefer_final_fields, use_build_context_synchronously
import 'package:firebase_auth_app/components/LinkAPI.dart';
import 'package:firebase_auth_app/components/valid.dart';
import 'package:firebase_auth_app/crud.dart';
import 'package:firebase_auth_app/main.dart';
import 'package:firebase_auth_app/screens/home.dart';
import 'package:firebase_auth_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:awesome_dialog/awesome_dialog.dart';




class helpscreen extends StatefulWidget {
const helpscreen({Key? key}) : super(key: key);
@override
_helpscreenState createState() => _helpscreenState();
}
class _helpscreenState extends State<helpscreen> {



Crud _crud = Crud() ;
GlobalKey<FormState> formState =GlobalKey() ;
final TextEditingController name  = TextEditingController() ;
final TextEditingController email = TextEditingController() ;
final TextEditingController feedback = TextEditingController() ;


nav(){
  Navigator.of(context).pushReplacementNamed('help');
}

 AddContact() async {
  if(formState.currentState!.validate()){

    var response = await _crud.postRequest(linkAddContact, {
    "name" :name.text,
    "email" :email.text,
    "feedback" :feedback.text,
    "id"     : sharedPref.getString("id"),
  } );
    
    setState(() {  
    });
  if(response["status"] == "success"){ 

      
            
  }else{ 
  }
  }
 }


@override
Widget build(BuildContext context) {
	return Scaffold( 
      backgroundColor: Color.fromARGB(255, 215, 222, 228),
     
      appBar: AppBar(
      backgroundColor: kPrimaryColor,
      elevation: 0,
      title: Text(
        'contact ',
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
         
          Navigator.of(context).push(MaterialPageRoute(
          builder: (context)=>HomeScreen() 
          ));
        },
      ),

    ),
    
     
      body: 
       Container(   
        padding: EdgeInsets.all(10),
        child: Form(
          key: formState,
          child: ListView(   
            children: [
              Image.asset('icons/help.png',
              height: 100,), 
              SizedBox(height :10),
              Center(
                child: Text(
                  'Entrez en contact avec moi !',
                  style: GoogleFonts.robotoCondensed(
                    fontSize: 20,fontWeight: FontWeight.bold, color: Colors.black,
                  ),
                  ),
              ),
              SizedBox(height: 50,),
           
        
              ////textfield name
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                 child: TextFormField( 
                   validator: (value) {
                    if (value!.isEmpty) {
                     return 'ce champ ne peut pas être vide';
                    }
                     return null; 
                   },
                  controller: name,       
                              keyboardType: TextInputType.text,
                            maxLines: 1,
                             decoration: InputDecoration(              
                                            
                          enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(22),
                          borderSide: BorderSide(
                            color: Colors.green,
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
                            hintText: "tapez votre nom...",
                            hintStyle: TextStyle(color: Colors.blue),
                            prefixIcon: Icon(Icons.person , color: Colors.green,),        
                                    ),         
                                  ),
               ),
           
              SizedBox(height :20), 
            
              ////textfield email
              Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 25),
                child: TextFormField(   
                    validator: (value) {
                    if (value!.isEmpty) {
                     return 'ce champ ne peut pas être vide';
                    }
                     return null; 
                   },
                  controller: email,       
                             keyboardType: TextInputType.emailAddress,
                            maxLines: 1,
                            decoration: InputDecoration(                     
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(22),
                  borderSide: BorderSide(
                    color: Colors.green,
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
                hintText: "tapez votre e-mail ...",
                hintStyle: TextStyle(color: Colors.blue),
                prefixIcon: Icon(Icons.email , color: Colors.green,),          
                            ),         
                          ),
              ),
             
              SizedBox(height :20),
             
              ////textfield feedback
              Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 25),
                child: TextFormField( 
                    validator: (value) {
                    if (value!.isEmpty) {
                     return 'ce champ ne peut pas être vide';
                    }
                     return null; 
                   }, 
                  controller: feedback,  
                    keyboardType: TextInputType.multiline,
                    minLines: 1, 
                    maxLines: 5,      
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
                    color: Colors.green,
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
                hintText: "tapez vos commentaires /suggestion / etc ..." , 
                
                hintStyle: TextStyle(color: Colors.blue),
                prefixIcon: Icon(Icons.comment , color: Colors.green,),  
                      
                            ),         
                          ),
              ),
               SizedBox(height :50),
              ////send button
              Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 85),
                    child: GestureDetector(
                      onTap: () async{
                       await  AddContact() ;
        
                      },
                      child: Container(
                        padding: EdgeInsets.all(16),
                        decoration:  BoxDecoration(
                          color: Colors.green[700],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(child: Text(
                          'envoyer',
                          style: GoogleFonts.robotoCondensed(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                           ),
                          ),
                        ),
                      ),
                    ),
                  ),
                
                ],
                ),
        )
       ),
       
       );

  // Scaffold(
  //   backgroundColor:kBackgroundColor ,
  //   appBar: AppBar(
  //     actions: [
  //       IconButton(onPressed: (){      
  //       }, icon: Icon(Icons.search_rounded))
  //     ],  
  //     backgroundColor: kPrimaryColor,
  //     elevation: 0,
  //     title: Text(
  //       'help',
  //        style: GoogleFonts.robotoCondensed(
  //                  fontSize: 20,fontWeight: FontWeight.normal, color: Colors.black,
  //                 ),),
  //     centerTitle: false,
  //        leading: IconButton(
  //       padding: const EdgeInsets.only(right:kDefaultPadding ),
  //       icon: const Icon(
  //         Icons.arrow_back,
  //         color: Colors.black,
  //         ),
  //       onPressed: (){
  //         Navigator.pop(context);
  //       },
  //     ),
  //   ),
	//   body:  SingleChildScrollView(
  //     physics: BouncingScrollPhysics(),
//       child: Padding(
//        padding: const EdgeInsets.symmetric(vertical: 30 ,  horizontal: 10),
//        child:
//         Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [ 
// //dropDownMenu Buttons           
//           Container(
//             color: Color.fromARGB(255, 213, 212, 212),
//             child: DropdownButton(
//                     // Down Arrow Icon
//                     icon: const Icon(
//                       Icons.hive_rounded,
//                       color: Colors.yellow,
//                       ),	                  
//                     // Array list of items
//                     items: items.map((String items) {
//             return DropdownMenuItem(        
//             value: items,
//             child: Text(items),            
//             );
//                     }).toList(),
//                      hint: Text("Choose an item",
//                      textAlign: TextAlign.center,
//                    style: GoogleFonts.robotoCondensed(
//                 fontSize: 20,fontWeight: FontWeight.w100, color: Colors.black,
//               ),),
//                      value: dropdownvalue,
//                     onChanged: (String? newValue) { setState(() { dropdownvalue = newValue ?? "";
//             });
//                     },
//                     focusColor: Colors.red,
//                     dropdownColor: Color.fromARGB(255, 241, 236, 236),
//           style: GoogleFonts.robotoCondensed(
//             fontSize: 20,fontWeight: FontWeight.w100, color: Colors.black,
//               )),
//           ),         
//           SizedBox(height: 40,)
// //checkbox buttons 
//           Column(
//             children:[
//                 Text("choose item",
//                   style: GoogleFonts.robotoCondensed(
//                                 fontSize: 30,fontWeight: FontWeight.w100, color: Colors.black,
//                               )),
//                         Row(
//                           children: [
//                             Text("item1",
//                                   style: GoogleFonts.robotoCondensed(
//                                   fontSize: 20,fontWeight: FontWeight.w100, color: Colors.black,
//                                 )),
//                             Checkbox(value: check1, onChanged: (val){
//                             setState(() {
//                               check1 = val! ;
//                             });
//                             },),
//                           ],
//                         ),       
//            Row(
//                   children: [
//                     Text("item2",
//                           style: GoogleFonts.robotoCondensed(
//                           fontSize: 20,fontWeight: FontWeight.w100, color: Colors.black,
//                         )),
//                     Checkbox(value: check2, onChanged: (val){
//                     setState(() {
//                       check2 = val! ;
//                     });
//                     },),
//                   ],
//                 ),
//            Row(
//                   children: [
//                     Text("item3",
//                           style: GoogleFonts.robotoCondensed(
//                           fontSize: 20,fontWeight: FontWeight.w100, color: Colors.black,
//                         )),
//                     Checkbox(value: check3, onChanged: (val){
//                     setState(() {
//                       check3 = val! ;
//                     });
//                     },),
//                   ],
//                 ), 
//             ]
//           ),          
//           SizedBox(height: 20,),
// //radio buttons
//           Column( 
//            children: [
//             Text('choose  item',
//              style: GoogleFonts.robotoCondensed(
//                           fontSize: 30,fontWeight: FontWeight.w100, color: Colors.black,
//                         )),
//           Column(
//             children: [                
//               Row(
//                 children: [
//                   Text("radio1"),
//                   Radio( activeColor: Colors.green, value: "check1", groupValue: radio, onChanged: (check1){
//                     setState(() {
//                       radio=check1;
//                     });
//                   }),
//                 ],
//               ),               
//               Row(
//                 children: [
//                   Text("radio2"),
//                   Radio(value: "check2", groupValue: radio, onChanged: (check2){
//                     setState(() {
//                       radio=check2;
//                     });
//                   }),
//                 ],
//               ),               
//               Row(
//                 children: [
//                   Text("radio3"),
//                   Radio(value: "check3", groupValue: radio, onChanged: (check3){
//                     setState(() {
//                       radio=check3;
//                     });
//                   }),
//                 ],
//               ),             ],
//           ),  
//         ],
//          ),   
//           SizedBox(height: 20,),
// // switch buttons     
//           Column(
//             children: [
//               Text(" notifications",
//                     style: GoogleFonts.robotoCondensed(
//                     fontSize: 30,fontWeight: FontWeight.w100, color: Colors.black,
//                             )),
//                Switch(value: notify, onChanged: (val){
//                   setState(() {
//                     notify = val ;
//                   });
//                 }),
//             ],
//           ),
//           SizedBox(height: 20,),
// // liste tile            
//            Container(
//              color:  Colors.red,
//             child: ListTile(title:  Text("iphone14"),)),
//            SizedBox(height: 20,),
// //snackbar
//            ElevatedButton(
//         onPressed: () {
//           final snackBar = SnackBar(
//             behavior: SnackBarBehavior.floating,
//             content: const Text('Yay! A SnackBar!'),
//             duration:Duration(seconds:2),
//             backgroundColor:  Colors.green,
//             padding: EdgeInsets.all(10),
//             margin: EdgeInsets.all(10),
//             action: SnackBarAction(
//               label: 'Undo', textColor: Colors.white,
//               onPressed: () {
//                 print('undo');
//               },
//             ),
//           );
//           // Find the ScaffoldMessenger in the widget tree
//           // and use it to show a SnackBar.
//           ScaffoldMessenger.of(context).showSnackBar(snackBar);
//         },
//         child: const Text('Show SnackBar'),
//       ),
//            SizedBox(height: 20,), 
// //alertDialog   
//            ElevatedButton(onPressed: (){
//               showDialog(context: context, builder: (context){
//                 return AlertDialog(
//                   actions: [
//                     TextButton(onPressed: (){
//                       Navigator.of(context).pop();
//                     }, child: Text('OK')),
//                     TextButton(onPressed: (){
//                       Navigator.of(context).pop();
//                     }, child: Text('cancel')),
//                   ],
//                   titlePadding: EdgeInsets.only(top: 20,left: 20),
//                   contentPadding: EdgeInsets.all(20),
//                   contentTextStyle: TextStyle( fontWeight: FontWeight.bold,  color: Colors.blue),
//                   titleTextStyle: TextStyle( fontWeight: FontWeight.normal,  color: Colors.red),   
//                   title: Text("title"),
//                   content: Text("content content content"),
//                 );
//               });
//             },
//              child: Text("show alert")),
//            SizedBox(height: 20,), 
// //awsome dialoge 
// Column(children: [
//   ElevatedButton(onPressed: (){
//         AwesomeDialog(
//             context: context,
//             dialogType: DialogType.warning,
//             animType: AnimType.rightSlide,
//             title: 'hedhi khyr borjoulia',
//             body:  Text('Dialog bal bla bla bla .............'),
//             btnCancelOnPress: () {},
//             btnOkOnPress: () {},
//             ).show();
//   },
//    child: Text("show dailog bel fazet"))
// ],),
// //pageview builder           
//             Column(
//               children: [
//                 SizedBox(
//                   height: 300,
//                   child: PageView.builder(
//                     controller:  pc ,
//                     itemCount: images.length,
//                     itemBuilder: (context, i){
//                       return Image.asset(images[i]['url'], fit: BoxFit.fill,);
//                     }           
//                   ),
//                 ),
//                 ElevatedButton(onPressed: (){
// pc!.animateToPage(0, duration: Duration(seconds: 1), curve: Curves.easeInOutCubicEmphasized);
//                 }, child: Text('return to first page  '))
//               ],
//             ),
//             SizedBox(height: 20,), 
// //Text Field +form validator
//           Column(children: [
//             TextFormField(         
//                keyboardType: TextInputType.emailAddress,
//                maxLines: 1,
//               decoration: InputDecoration(               
//                 enabled: true,
//                 disabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(22),
//                   borderSide: BorderSide(
//                     color: Colors.red,
//                     width: 3 ,                   
//                   )
//                 ),       
//                 enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(22),
//                   borderSide: BorderSide(
//                     color: Colors.indigo,
//                     width: 3 ,                   
//                   )
//                 ),       
//                 focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(22),
//                   borderSide: BorderSide(
//                     color: Colors.black,
//                     width: 3 ,                    
//                   )
//                 ),         
//                 hintText: "type your message...",
//                 hintStyle: TextStyle(color: Colors.blue),
//                 prefixIcon: Icon(Icons.text_fields),
//                 suffixIcon: Icon(Icons.send , color: Colors.blue,),
//                 icon: Icon(Icons.messenger_outline_rounded),
//               ),
//             ),
//             SizedBox(height: 10,), 
//             TextFormField(         
//                keyboardType: TextInputType.emailAddress,
//                obscureText: true,
//                maxLines: 1,
//               decoration: InputDecoration(              
//                 enabled: true,
//                 disabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(22),
//                   borderSide: BorderSide(
//                     color: Colors.red,
//                     width: 3 ,                   
//                   )
//                 ),       
//                 enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(22),
//                   borderSide: BorderSide(
//                     color: Colors.indigo,
//                     width: 3 ,                   
//                   )
//                 ),       
//                 focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(22),
//                   borderSide: BorderSide(
//                     color: Colors.black,
//                     width: 3 ,                    
//                   )
//                 ),        
//                 hintText: "type your password...",
//                 hintStyle: TextStyle(color: Colors.blue),
//                 prefixIcon: Icon(Icons.text_fields),
//                 suffixIcon: Icon(Icons.hive_rounded , color: Colors.blue,),
//                 icon: Icon(Icons.password_rounded),          
//               ),         
//             ),  
//             Form(
//              autovalidateMode: AutovalidateMode.always ,
//               key: formState ,
//               child: Column(
//                 children: [
//                   TextFormField(
//                     onSaved: (text){
//                       username = text ;
//                     },
//                     validator: (text){
//                       if (text!.length < 5){
//                         return "minium 6 caractere";
//                       }
//                       if(text.length > 10 ){
//                         return "max caractere 10" ;
//                       }
//                       return null ;
//                     },
//                   ),
//                   TextFormField(
//                     onSaved: (text){
//                       phone = text ;
//                     },
//                     validator: (text){
//                       if (text!.length < 5){
//                         return "minium 6 caractere";
//                       }
//                       if(text.length > 10 ){
//                         return "max caractere 10" ;
//                       }
//                       return null ;
//                     },
//                   ),
//                   TextButton(onPressed:(){
//                     var formdata = formState.currentState;
//                         if (formdata == null || formdata.validate()) {
//                           formdata?.save();
//                           print('username : $username');
//                           print('phone : $phone');
//                         } else{
//                           print('not valid');
//                         }
//                   },
//                    child: Text('send'),
//                   )                           
//                 ],
//               ),
//             ) ,                                             
//              ],                      
//             ),
//       //slider    
//           Column(
//             children: [
//               Slider(
//                 min: 0,
//                 max: 100 ,
//                 value: _valslider ,
//                  onChanged: (val){
//                 setState(() {               
//                   _valslider = val ;
//                   print (_valslider);
//                 });
//               }),
//             ],
//           ),
//       //http 
//       //  ListView.builder(
//       //   itemCount: posts.length,
//       //   itemBuilder: (context , i){
//       //     return Text('${posts[i]['title']}');
//       //   }) ,
// //sqflite 
// ElevatedButton.icon(onPressed: () async {
//   int response = await slqdb.inserData("INSERT INTO 'notes'('note') values ('note two') ");
//   print(response) ;
// }, icon: Icon(Icons.add), label: Text("INSERT data")),
// ElevatedButton.icon(onPressed: () async{
//   List<Map> response = await slqdb.readData("SELECT *FROM 'notes'") ;
//   print(response);
// }, icon: Icon(Icons.read_more_rounded), label: Text("READ  data")),
// ElevatedButton.icon(onPressed: () async{
//    int  response = await slqdb.deleteData("DELETE FROM 'notes' WHERE id = 9 ") ;
//   print(response);
// }, icon: Icon(Icons.delete), label: Text("DELETE  data")), 
// ElevatedButton.icon(onPressed: () async{
//    int  response = await slqdb.updateData("UPDATE 'notes' SET 'note' ='note six' WHERE id = 1") ;
//   print(response);
// }, icon: Icon(Icons.update), label: Text("UPDATE  data")),   
//       ] ),       
//      ),
   // ),
    //);
}
}
