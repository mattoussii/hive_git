// ignore_for_file: camel_case_types, use_key_in_widget_constructors, avoid_unnecessary_containers, prefer_const_constructors_in_immutables, prefer_typing_uninitialized_variables, prefer_const_constructors, unused_local_variable, sized_box_for_whitespace, use_build_context_synchronously, unnecessary_this

import 'package:firebase_auth_app/constants.dart';
import 'package:firebase_auth_app/screens/crud/edit.dart';
import 'package:firebase_auth_app/sqldb.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class visiteScreen extends StatefulWidget {
  const visiteScreen({super.key});

  @override
  State<visiteScreen> createState() => _visiteScreenState();
}

class _visiteScreenState extends State<visiteScreen> {
  bool isLoading =true ;
  List notes = [

  ];

SqlDb sqlDb =SqlDb() ;

 Future  readData() async {
  List<Map> response =await sqlDb.readData("SELECT * FROM 'notes'");
  notes.addAll(response);
  isLoading =false ;
      if(this.mounted){
        setState(() {
          
        });
      
    }

}

 @override
 void initState() {
  readData() ;
   super.initState();
   
 }
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width ;
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
           
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: (){

               Navigator.of(context).pushNamed('add');

              }),
            body:
            isLoading == true ?
            Center(child: Text("loading..."))
            : Container(
              child: ListView(
                children: [      
                  TextButton(onPressed: ()async {
                  await sqlDb.deleteDataBase() ;

                }, child: Text('delete database')),    

              ListView.builder(
                    itemCount: notes.length,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context , i) {
                      return Card(child: ListTile(
                        leading: Image.asset('icons/history.png'),
                        title: Text('${notes[i]['title']}'),
                        subtitle: Text('${notes[i]['date']}'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [



                          IconButton(
                          onPressed: ()async {
                          int response = await sqlDb.deleteData(
                            "DELETE FROM notes WHERE id = ${notes[i]['id']}");
                          if(response > 0) {
                            notes.removeWhere((element) => element['id'] == notes[i]['id']);
                            setState(() {    
                            });   
                          }
                        }, icon: Icon(Icons.delete_rounded, color: Colors.red,)
                        ),


                           IconButton(onPressed: (){
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context)=> edit(
                                title: notes[i]['title'] ,
                                note: notes[i]['note'] ,
                                date: notes[i]['date'] ,
                                id: notes[i]['id'] , 
                              )),
                            );



                        },
                         icon: Icon(Icons.edit),
                          color: Colors.blue,)



                          ], 
                        )
                      

                      )
                      );  
                    },
                  ),
                
                ],
              ),
            )



               


    );
  }
}










class Listnotes extends StatelessWidget{
  final notes ;
   Listnotes({this.notes, })  ;
@override
Widget build(BuildContext context){
  return Card(
    child: Row(
      children: [
        Expanded(
          flex: 1,
          child: Image.asset("icons/history.png",
           fit: BoxFit.fill,
          
           )
           ),
        Expanded(
           flex: 3,
          child: ListTile(
            title: Text( "title") ,
            subtitle:  Text( "${notes['notes']}") ,
            // subtitle:ElevatedButton.icon( 
              
            //   icon: Icon(Icons.highlight_remove_rounded),
            //   label: Text('remove'), 
            //    onPressed: (){}, ),
               
            trailing: IconButton(onPressed: (){},
             icon: Icon(Icons.edit , color:  Colors.black,)),
              
            ),
        ),
      ],
    ),
  ) ;
}
}
