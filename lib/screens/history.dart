// ignore_for_file: camel_case_types, use_key_in_widget_constructors, avoid_unnecessary_containers, prefer_const_constructors_in_immutables, prefer_typing_uninitialized_variables, prefer_const_constructors, unused_local_variable, sized_box_for_whitespace, use_build_context_synchronously, unnecessary_this, prefer_const_literals_to_create_immutables, prefer_final_fields, curly_braces_in_flow_control_structures
import 'package:firebase_auth_app/components/LinkAPI.dart';
import 'package:firebase_auth_app/constants.dart';
import 'package:firebase_auth_app/crud.dart';
import 'package:firebase_auth_app/main.dart';
import 'package:firebase_auth_app/models/visiteModel.dart';
import 'package:firebase_auth_app/screens/history_card.dart';
import 'package:firebase_auth_app/screens/visite/edit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen>{
  
  Crud _crud = Crud();

  getVisites() async {
    var response = await _crud.postRequest(linkViewVisite, {
      "id" : sharedPref.getString("id") ,
    });
    return response ;
  }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width ;
    return Scaffold(
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
          
            body: ListView(
              children: [
                FutureBuilder(
                  future:   getVisites(),
                  builder: (BuildContext context  , AsyncSnapshot snapshot){
                  if(snapshot.hasData){
                    if(snapshot.data["status"] == "failed" )
                    return Center(
                      child: 
                                      Column(
                                    children: [
                                SizedBox(height: 50,),
                                Center(
                                  child: Image.asset(
                                    'icons/history.png',
                                    height: 200,
                                    width: 200,),
                                ),
                                  SizedBox(height: 30,),
                                Text(
                                    "il n'y a pas d'histoire" ,
                                  style: TextStyle(
                                    fontSize: 25,
                                  ),
                                ),
                              ],
                            ) 
                       ) ;
                    return ListView.builder(
                      itemCount: snapshot.data['data'].length ,
                      shrinkWrap: true ,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context , i){
                      return historyCard(
                        onDelete: () async {     
                            Navigator.of(context).pushReplacementNamed('history');                   
                        },
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>
                        edit(visites: snapshot.data['data'][i] ,)));
                        },
                        visiteModel: VisiteModel.fromJson(snapshot.data['data'][i]), 
                        
                        
                        );
                    }
                    );
                  }
                  if(snapshot.connectionState == ConnectionState.waiting){
                    return Center(child: CircularProgressIndicator());
                  }
                  return Center(child:  CircularProgressIndicator());
                })

              ],
            )
            


               


    );
  }
}














  class DataSearch extends SearchDelegate {
    List names =[
      'ruche 1', 'ruche 2', 'ruche 3',
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