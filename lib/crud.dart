// ignore_for_file: empty_catches, unused_import, avoid_print, prefer_const_constructors

import 'package:http/http.dart' as http;
import 'dart:convert';

class Crud {

  getRequest(String url) async {
    
    try{
      var response =await http.get(Uri.parse(url) ) ;
      if(response.statusCode == 200){
        var responsebody =jsonDecode(response.body);
        return responsebody ;
      }else{
        print("erroe ${response.statusCode}");
      }
    }catch(e){
      print("error catch $e") ;
    }
  }

    postRequest(String url ,Map data) async {
      await Future.delayed(Duration(seconds: 1)) ;
    try{
      var response =await http.post(Uri.parse(url), body: data ) ;
      if(response.statusCode == 200){
        var responsebody =jsonDecode(response.body);
        return responsebody ;
      }else{
        print("erroe ${response.statusCode}");
      }
    }catch(e){
      print("error catch $e") ;
    }
  }
 
}