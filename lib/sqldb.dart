// ignore_for_file: unused_field, body_might_complete_normally_nullable, depend_on_referenced_packages, avoid_print

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


class SqlDb{


static Database? _db ;
Future<Database?> get db  async {
  if(_db == null ){
    _db = await initialDb() ;
    return _db ;
  }else{
  return _db ;
}

}
  initialDb() async {
    String databasepath = await getDatabasesPath() ;
    String path = join(databasepath , 'mattoussi.db') ;
    Database mydb = await openDatabase(path, onCreate: _onCreate) ;
    return mydb ;
  }


_onCreate( Database db , int version ) async {
  await db.execute('''
  create TABLE "notes" (
    id INTEGER AUTOINREMENT NOT NULL PRIMARY KEY ,
    notes TEXT NOT NULL
  ) 
  ''');

  print('create DATABASE') ;





  // await db.execute('''
  // create TABLE "product" (
  //   id INTEGER AUTOINREMENT NOT NULL PRIMARY KEY ,
  //   price  REAL ,
  //   title  TEXT NOT NULL ,
  //   subTitle  TEXT NOT NULL ,
  //   image  BLOB  ,
  //   description TEXT NOT NULL ,
  // ) 
  // ''');



}



}