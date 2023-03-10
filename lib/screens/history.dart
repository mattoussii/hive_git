


// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, unnecessary_string_interpolations



import 'package:firebase_auth_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HistoryScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      backgroundColor: Color.fromARGB(255, 215, 222, 228),
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            showSearch(context: context, delegate: DataSearch());
          }, icon: Icon(Icons.search_rounded,color:  Colors.black,))
        ],
        
      backgroundColor: kPrimaryColor,
      elevation: 0,
      title: Text(
        'History',
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
       body:
       SafeArea(   
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('images/hive.png',
                height: 150,),
                SizedBox(height :10),
                Text(
                  'History',
                  style: GoogleFonts.robotoCondensed(
                    fontSize: 40,fontWeight: FontWeight.bold, color: Colors.black,
                  ),
                  ),
                  SizedBox(height: 50,),

                  Text(
                    'this page is not available at the moment :( ',
                     style: GoogleFonts.robotoCondensed(
                    fontSize: 18,fontWeight: FontWeight.bold, color: Colors.black,
                  ),
                  )
                  ],
                  )

    )
       )
       ),);
       

  }}

  class DataSearch extends SearchDelegate {
    List names =[
      'aymen', 'mattoussi', 'fvxcv', 'bvb<lkjg', 'sqfcxdfh', 'shfqc' ,'vsdgg','fgokyj' ,
      'zedscbgg',
    ];
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(onPressed: (){
        query = "" ;

      }, icon: Icon(Icons.close))
    ];
 
  }
  
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: (){
      close(context, null);
    }, icon: Icon(Icons.arrow_back));

 
  }
  
  @override
  Widget buildResults(BuildContext context) {
     return Text("$query");
 
  }
  
  @override
  Widget buildSuggestions(BuildContext context) {
    List filternames = names.where((element) => element.contains(query) )
    .toList()  ;
    return ListView.builder(
      itemCount : query == "" ?  names.length: filternames.length ,
      itemBuilder: (context , i){
        return InkWell(
          onTap: () {
            query = query == "" ?  names[i] : filternames[i] ;
            showResults(context);
          },
          child: Container(
            padding:  EdgeInsets.all(10),
            child: query == "" ?  Text(
              '${names[i]}',   
               style: TextStyle(fontSize: 20),
               ):
                Text(
              '${filternames[i]}',  
               style: TextStyle(fontSize: 20),) 
               
               ),
        ) ;

    });


  }

  }