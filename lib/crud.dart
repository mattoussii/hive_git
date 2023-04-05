
// ignore_for_file: avoid_print, prefer_const_constructors, depend_on_referenced_packages

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:path/path.dart';
import 'dart:io';

class Crud {

  getRequest(String url) async {
    try{
      var response =await http.get(Uri.parse(url) ) ;
      if(response.statusCode == 200){
        var responsebody = jsonDecode(response.body);
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
        var responsebody = jsonDecode(response.body);
        return responsebody ;
      }else{
        print("erroe ${response.statusCode}");
      }
    }catch(e){
      print("error catch $e") ;
    }
  }
 


   postRequestwithFile(String url , Map data , File file) async{
    var request =http.MultipartRequest("POST" , Uri.parse(url)) ;
    var length   = await file.length() ;
     var stream = http.ByteStream(file.openRead());
    var multipartFile =http.MultipartFile("file" , stream ,length ,
    filename: basename(file.path));
    request.files.add(multipartFile);
    //request dinamique title/content/date ...
    data.forEach((key, value) {
      request.fields[key] =value ;
    });
    var myrequest = await request.send() ;

    var response  = await http.Response.fromStream(myrequest) ;
    if(myrequest.statusCode == 200){
      return jsonDecode(response.body);
    }else{
      print('Error ${myrequest.statusCode}');
    }
   }



}