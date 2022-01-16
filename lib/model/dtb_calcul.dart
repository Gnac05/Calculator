// ignore_for_file: unused_field, non_constant_identifier_names, avoid_function_literals_in_foreach_calls

import 'dart:io';

import 'package:gnac_caculator/model/calcul.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
String calcultable='Gnaccalcul';
class DatabaseCalcul {
  // ignore: avoid_init_to_null
  Database? _database = null;

  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    } else {
      _database = await create();
      return _database;
    }
  }

  Future<Database> create() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String database_directory = join(directory.path, 'gnac.db');
    var bdd =
        await openDatabase(database_directory, version: 1, onCreate: _onCreate);
    return bdd;
  }

  Future _onCreate(Database db, int version) async {
    await db.execute(
        '''create table $calcultable (id integer primary key autoincrement not null, expression text not null, result text not null, date text )''');
  }

  //? Ecrire des données
  Future addCalcul(Calcul calcul) async {
    Database? maDatabase = await database;
    calcul.id = await maDatabase!.insert(calcultable, calcul.toMap());
    return calcul;
  }

  //? Suppression de donnée
  // Future deleteCalcul(var id, String table) async{
  //   Database? maDatabase = await database;
  //   return await maDatabase!.delete(table, where: 'id = ?', whereArgs: [id]);
  // }

  // Future deleteAll() async{
  //   Database? maDatabase = await database;
  //   return await maDatabase!.rawDelete('DELETE FROM $calcultable WHERE id = ?',['another id']);
  // }

  // Lecture des données
  Future<List<Calcul>> allCalcul() async {
    Database? maDatabase = await database;
    List<Calcul> calculs = [];
    List<Map<String, dynamic>> mesCalculs =
        await maDatabase!.rawQuery('SELECT * FROM $calcultable');
    mesCalculs.forEach((map) {
      Calcul calcul = Calcul();
      calcul.fromMap(map);
      calculs.add(calcul);
    });
    return calculs;
  }

  Future  deleteTable() async{
    Directory directory=await getApplicationDocumentsDirectory();
    String path= join(directory.path,'gnac.db');
   deleteDatabase(path);
 }
}
