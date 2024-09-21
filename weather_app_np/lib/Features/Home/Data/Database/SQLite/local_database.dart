import 'dart:async';

// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SQLDB {
  static Database? _db;
  final int _dbVersion = 1;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await initializeDB();
      return _db;
    } else {
      return _db;
    }
  }

  initializeDB() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, "mainDatabase.db");
    Database myDB =
        await openDatabase(path, version: _dbVersion, onCreate: _onCreate);
    return myDB;
  }

  _onCreate(Database db, int version) async {
    await db.execute("""
  CREATE TABLE weatherTable(
  "City Name" TEXT,
  "Weather Degree" INTEGER,
  "Weather Status" TEXT,
  "Weather Desc" TEXT,
  "Weather Icon" TEXT, -- null is not a valid type, use TEXT or other data type
  "Humidity" INTEGER,
  "Sunrise" TEXT,
  "Sunset" TEXT,
  "Pressure" INTEGER,
  "Wind" INTEGER
  )
  """);
  }

  Future<List<Map>> readData() async {
    Database? mydb = await db;
    List<Map> response = await mydb!.rawQuery("SELECT * FROM 'weatherTable'");
    return response;
  }

  insertData(
      String cityName,
      int degree,
      String status,
      String desc,
      int humidity,
      String sunrise,
      String sunset,
      int pressure,
      int wind) async {
    Database? mydb = await db;
    int response = await mydb!.rawInsert('''
    INSERT INTO weatherTable (
      "City Name", "Weather Degree", "Weather Status", "Weather Desc", 
      "Humidity", "Sunrise", "Sunset", "Pressure", "Wind"
    ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)
  ''', [
      cityName,
      degree,
      status,
      desc,
      humidity,
      sunrise,
      sunset,
      pressure,
      wind
    ]);
    return response;
  }
}
