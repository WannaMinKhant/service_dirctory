import 'package:service_directory/modules/town.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'dart:io' as io;

class DatabaseHelper{

  static Database? db;

  Future<List<Town>> getStates() async{
    io.Directory appDir = await getApplicationDocumentsDirectory();

    String dbPath = path.join(appDir.path,"town.db");

    print(dbPath);

    bool dbExisting = await io.File(dbPath).exists();

    print(dbExisting);

    if(dbExisting){

      ByteData data = await rootBundle.load(path.join("assets","town.db"));
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      await io.File(dbPath).writeAsBytes(bytes,flush: true);
    }

    db = await openDatabase(dbPath);
    if(db == null){
      throw " db is initiated initiate using [init(db)] function";
    }

    // final result = await db!.query(table);
    final result = await db!.rawQuery('SELECT DISTINCT state FROM townships_of_burma');
    // var resultMap = result[100];   SELECT DISTINCT
    // print(result.length);
    // print(resultMap);
    // return resultMap.isNotEmpty ? resultMap : null;
    return result.map((e) => Town.fromJson(e)).toList();
  }

  Future<List<Town>> getTownByState(String state) async{
    io.Directory appDir = await getApplicationDocumentsDirectory();

    String dbPath = path.join(appDir.path,"town.db");

    print(dbPath);

    bool dbExisting = await io.File(dbPath).exists();

    print(dbExisting);

    if(dbExisting){

      ByteData data = await rootBundle.load(path.join("assets","town.db"));
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      await io.File(dbPath).writeAsBytes(bytes,flush: true);
    }

    db = await openDatabase(dbPath);
    if(db == null){
      throw " db is initiated initiate using [init(db)] function";
    }

    final result = await db!.rawQuery("SELECT * FROM townships_of_burma WHERE state = '$state'");
    print(result.length);
    return result.map((e) => Town.fromJson(e)).toList();
  }
}