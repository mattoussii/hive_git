// ignore_for_file: unnecessary_string_interpolations

import 'package:firebase_auth_app/components/message.dart';

validInput( String val, int min , int max){

 if (val.length > max ){
  return "$msgInputmax $max " ;
 }
 
  if(val.isEmpty){
  return"$msgInputEmpty" ;
 }

  if (val.length < min ){
  return "$msgInputmin $min " ;
 }




}