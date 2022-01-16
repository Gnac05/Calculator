// ignore_for_file: avoid_init_to_null, non_constant_identifier_names, avoid_function_literals_in_foreach_calls

import 'dart:io';
import 'package:gnac_caculator/model/equation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
String equationtable='Gnacequation';
class DatabaseEquationSD {
   Database? _database=null;

   
//   Future<Database?> get database async {
//     if (_database != null) {
//       return _database;
//     } else {
//       _database = await create();
//       return _database;
//     }
//   }

//   Future<Database> create() async {
//     Directory directory = await getApplicationDocumentsDirectory();
//     String database_directory = join(directory.path, 'gnac.db');
//     var bdd =
//         await openDatabase(database_directory, version: 1, onCreate: _onCreate);
//     return bdd;
//   }

//   Future _onCreate(Database db, int version) async {
//     await db.execute(
//         '''create table $equationtable (id integer primary key autoincrement not null, a text not null, b text not null,c text not null , date text )''');
//   }

//   //? Ecrire des données
//   Future addEquationSD(EquationSD equationSD) async {
//     Database? maDatabase = await database;
//     equationSD.id = await maDatabase!.insert(equationtable, equationSD.toMap());
//     return equationSD;
//   }

// // Lecture des données
//   Future<List<EquationSD>> getAllEquationSD() async {
//     Database? maDatabase = await database;
//     List<EquationSD> calculs = [];
//     List<Map<String, dynamic>> mesEquationSDs =
//         await maDatabase!.rawQuery('SELECT * FROM $equationtable');
//     mesEquationSDs.forEach((map) {
//       EquationSD calcul = EquationSD();
//       calcul.fromMap(map);
//       calculs.add(calcul);
//     });
//     return calculs;
//   }

  Future<Database?> get database async{
    if (_database!= null) {
      return _database;
    } else {
      _database= await create();
     return _database;
    }
  }

  Future<Database> create() async{
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path,'gnac_equation.db');
    return await openDatabase(path,version: 1,onCreate: (Database db,int version) async{
      await db.execute(
        '''
        create table $equationtable(
          id integer primary key autoincrement,
          a text not null,
          b text not null,
          c text not null,
          day text not null
        )
        '''
      );
    });
  }

 Future<EquationSD> addEquationSD(EquationSD equationSD) async{
   Database? myDatabase= await database;
   equationSD.id = await myDatabase?.insert(equationtable, equationSD.toMap());
   return equationSD;
 }

 Future<List<EquationSD>> getAllEquationSD() async{
   Database? myDatabase= await database;
   List<EquationSD> equationSD=[];
   List<Map<String,dynamic>> db_equationSD = await myDatabase!.rawQuery('SELECT * FROM $equationtable');
  db_equationSD.forEach((element) {
    EquationSD _equationSD=EquationSD();
    _equationSD.fromMap(element);
    equationSD.add(_equationSD);
  });
  return equationSD;
  //return db_equationSD.map((e) => EquationSD.fromMap(e)).toList();
 }

  Future deleteTable() async {
    Directory directory=await getApplicationDocumentsDirectory();
    String path= join(directory.path,'gnac_equation.db');
    deleteDatabase(path);
  }

}