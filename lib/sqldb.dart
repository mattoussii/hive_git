
// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';


// class SqlDb{

// static Database? _db ;

// Future<Database?> get db  async {
//   if(_db == null ){
//     _db = await initialDb() ;
//     return _db ;
//   }else{
//   return _db ;
// }
// }

//   initialDb() async {
//     String databasepath = await getDatabasesPath() ;
//     String path = join(databasepath , 'mattoussi.db') ;
//     Database mydb = await openDatabase(path, onCreate: _onCreate ,
//      version: 6, onUpgrade: _onUpgrade) ;
//     return mydb ;
//   }


// _onUpgrade(Database db , int oldversion , int newversion) async {

//   print('_onUpgrade ************** ') ;
//   // await db.execute("ALTER TABLE notes ADD COLUMN date DATETIME ");


// }
// _onCreate( Database db , int version ) async {
//   Batch batch =db.batch() ;

//    batch.execute('''
//   create TABLE "notes" (
//     "id" INTEGER  NOT NULL PRIMARY KEY AUTOINCREMENT ,
//     "title"   TEXT NOT NULL ,
//     "note" TEXT NOT NULL ,
//     "date" DATETIME NOT NULL
//   ) 
//   ''');
  

//      batch.execute('''
//   create TABLE "gallery " (
//     "id" INTEGER  NOT NULL PRIMARY KEY AUTOINCREMENT ,
//     "title"   TEXT NOT NULL ,
//     "subtitle" TEXT NOT NULL  ,
//     "price" REAL NOT NULL ,
//     "image"  BLOB NOT NULL ,
//     "description" "subtitle" TEXT NOT NULL 
//   ) 
//   ''');

//  await batch.commit();





//   print('_onCreate ************** ') ;
// }

 
// readData(String sql) async {
//   Database? mydb = await db ;
//   List<Map> response = await  mydb!.rawQuery(sql);
//   return response ;
// }

// inserData(String sql) async {
//   Database? mydb = await db ;
//   int response = await  mydb!.rawInsert(sql);
//   return response ;
// }
// updateData(String sql) async {
//   Database? mydb = await db ;
//    int  response = await  mydb!.rawUpdate(sql);
//   return response ;
// }


// deleteData(String sql) async {
//   Database? mydb = await db ;
//   int response = await  mydb!.rawDelete(sql);
//   return response ;
// }



// deleteDataBase()async {

//     String databasepath = await getDatabasesPath() ;
//     String path = join(databasepath , 'mattoussi.db') ;
//     await deleteDatabase(path);

// }






// }