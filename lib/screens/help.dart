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


bool isloading =false ;
 AddContact() async {
  if(formState.currentState!.validate()){
 isloading = true ;
    var response = await _crud.postRequest(linkAddContact, {
    "name" :name.text,
    "email" :email.text,
    "feedback" :feedback.text,
    "id"     : sharedPref.getString("id"),
  } );
    
    setState(() {  
    });
  if(response["status"] == "success"){ 
    AwesomeDialog(
            context: context,
            dialogType: DialogType.success,
            animType: AnimType.rightSlide,
            body:  Text(
              " votre formulaire été envoyer ",
              style: GoogleFonts.robotoCondensed(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
                ),
              ),
            btnOkOnPress: () {},
            ).show();
      await Future.delayed(Duration(seconds: 3)) ;
      Navigator.of(context).pushReplacementNamed('help');
            
  }else{ 
      return AwesomeDialog(
            context: context,
            dialogType: DialogType.warning,
            animType: AnimType.rightSlide,
            body:  Text(
              " votre formulaire n'est pas envoyer ",
              style: GoogleFonts.robotoCondensed(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
                ),
              ),
            btnOkOnPress: () {},
            ).show();

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
    
     
      body: isloading == true ?
     Center( child: 
              Column(
                  children: [
              SizedBox(height: 150,),
              Center(
                child: Image.asset(
                  'icons/help.png',
                  height: 200,
                  width: 200,),
              ),
                SizedBox(height: 30,),
              Text(
                  "chargement ..." ,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold ,
                  color: Colors.blue
                ),
              ),
            ],
          ) 
       ) 
      : 
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
                  autovalidateMode: AutovalidateMode.onUserInteraction ,
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
                  autovalidateMode: AutovalidateMode.onUserInteraction ,
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
                  autovalidateMode: AutovalidateMode.onUserInteraction ,
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


}
}
