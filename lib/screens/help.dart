// ignore_for_file: library_private_types_in_public_api, camel_case_types, prefer_const_constructors, avoid_print, unnecessary_new, non_constant_identifier_names, avoid_unnecessary_containers, avoid_types_as_parameter_names, unnecessary_string_interpolations, prefer_typing_uninitialized_variables, unused_import, unused_field
import 'package:firebase_auth_app/sqldb.dart';
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
  { 'url':'icons/gallery.png'} ,
  {'url':'icons/help.png'} ,
  { 'url':'icons/history.png'} ,
  {'url':'icons/locate.png'} , 
  {'url':'icons/location.png'} ,
  {'url':'icons/love.png'} ,
  {'url':'icons/qr-code.png'} ,
  {'url':'icons/qr-scan.png'} ,
  {'url':'icons/qr.png'}, 
  {'url':'icons/seek.png'} ,
  {'url':'icons/shop.png'} ,
  {'url':'icons/trade.png'} ,
  {'url':'icons/where.png'} ,
];
bool check1 = false;
bool check2 = false;
bool check3 = false;
String? radio ;
bool notify = false;
PageController? pc;
GlobalKey<FormState> formState = new GlobalKey<FormState>();
var username ;
var phone ;


  List posts = [];
  // Future getPost() async {
  //   var  url = "https://jsonplaceholder.typicode.com/posts" ;
    
  //   var response = await http.get(Uri.parse(url));
  //   var respnsebody = jsonDecode(response.body);
    
  //   setState(() {
  //     posts.addAll(respnsebody) ;
  //   });
  //   print(posts) ;
  // }

// var _valslider = 10.0 ;
 @override
initState(){
  pc = new PageController(initialPage: 10);
  super.initState();
  // getPost();
}




SqlDb slqdb = SqlDb() ;




@override
Widget build(BuildContext context) {
	return Scaffold(
    backgroundColor:kBackgroundColor ,
    appBar: AppBar(
      actions: [
        IconButton(onPressed: (){
          
        }, icon: Icon(Icons.search_rounded))
      ],  
      backgroundColor: kPrimaryColor,
      elevation: 0,
      title: Text(
        'help',
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
//           SizedBox(height: 40,),
  
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
    ),
    
	);
}
}
